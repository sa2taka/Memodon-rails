# config valid for current version and patch releases of Capistrano
lock '~> 3.11.0'



server "memodon.com", port: 10022, roles: [:app, :web, :db], primary: true
set :application,     "memodon"
set :repo_url,        "git@github.com:sa2taka/Memodon-rails"
set :user,            "deploy"
set :ssh_options,     {
  forward_agent: true,
  user: fetch(:user),
  keys: %w(~/.ssh/sakura_deploy_id_rsa)
}
set :puma_threads,    [4, 16]
set :puma_workers,    0
set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/var/www/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log,  "#{release_path}/log/puma.error.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :rbenv_type, :system
set :rbenv_ruby, "2.5.1"
set :linked_dirs, fetch(:linked_dirs, []).push(
  "log",
  "tmp/pids",
  "tmp/cache",
  "tmp/sockets",
  "vendor/bundle",
  "public/system",
  "public/uploads",
)
set :linked_files, fetch(:linked_files, []).push(
  "config/database.yml",
  "config/secrets.yml",
  "config/master.key"
)

# sidekiq
set :sidekiq_pid_path, -> { File.join(shared_path, "tmp", "pids", "sidekiq.pid") }
namespace :sidekiq do
  desc "sidekiq stop"
  task :stop do
    on roles(:app) do
      execute "kill -USR1 `cat #{fetch :sidekiq_pid_path}`; true"
    end
  end
  before "deploy:updated", "sidekiq:stop"

  desc "sidekiq kill"
  task :kill do
    on roles(:app) do
      execute "sudo kill -TERM `cat #{fetch :sidekiq_pid_path}`; true", raise_on_non_zero_exit: false
    end
  end
  after "deploy:finishing", "sidekiq:kill"

  desc "sidekiq start"
  task :start do
    on roles(:app) do
      execute "pushd /var/www/memodon/current/; bundle exec sidekiq -C config/sidekiq.yml --environment=production; popd"
    end
  end
  after "sidekiq:kill", "sidekiq:start"
end

namespace :puma do
  desc "Create Directories for Puma Pids and Socket"
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end
  before :start, :make_dirs
end

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc "Initial Deploy"
  task :initial do
    on roles(:app) do
      before "deploy:restart", "puma:start"
      invoke "deploy"
    end
  end

  desc "Restart application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke "puma:restart"
    end
  end

  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
end
