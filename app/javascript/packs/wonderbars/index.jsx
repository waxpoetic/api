import React from 'react'
import ReactDOM from 'react-dom'
import App from './app'
import { registerServiceWorker } from '../mindbrain'

ReactDOM.render(<App />, document.getElementById('root'))
registerServiceWorker()
