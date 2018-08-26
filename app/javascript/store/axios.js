import axios from 'axios'

const setToken = (params) => {
  const tags = document.getElementsByTagName("meta")
  tags.forEach((tag) => {
    if (tag.name === "csrf-token") {
      params.authenticity_token = tag.content
      return params
    }
  })
}

export default {
  get: (path, params = {}) => {
    return axios.get(path, { params })
  },
  post: (path, params = {}) => {
    return axios.post(path, setToken(params))
  },
  put: (path, params = {}) => {
    return axios.put(path, setToken(params))
  },
  delete: (path, params = {}) => {
    return axios.delete(path, { params: setToken(params) })
  },
}
