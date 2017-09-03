import React, { Component } from 'react'
import { BrowserRouter as Router, Route } from 'react-router-dom'
import Navigation, { Link } from '../mindbrain/components/navigation'

export default class App extends Component {
  render() {
    return (
      <Router>
        <div className="wonderbars">
          <Navigation>
            <Link to='/music'>Music</Link>
            <Link to='/shows'>Shows</Link>
            <Link to='/media'>Media</Link>
            <Link to='/contact'>Contact</Link>
          </Navigation>
          <Route exact path='/' to={Home} />
        </div>
      </Router>
    );
  }
}
