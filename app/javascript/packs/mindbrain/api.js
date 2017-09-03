import reqt from 'reqt'

const host = 'http://localhost:3000'

export default {
  host

  find() {
    return reqt.find(arguments).at(host)
  }
}
