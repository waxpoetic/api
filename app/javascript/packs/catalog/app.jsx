import React, { Component } from 'react'
import { BrowserRouter as Router, Route } from 'react-router-dom'
import Home from './pages/home'
import Navigation, { Link } from './components/navigation'
import Header from './components/header'

export default class App extends Component {
  render() {
    return (
      <Router>
        <div className="catalog">
          <Header>
            <Logo />
            <Navigation>
              <Link to='/artists'>Artists</Link>
              <Link to='/releases'>Releases</Link>
              <Link to='/events'>Events</Link>
              <Link to='/shop'>Shop</Link>
            </Navigation>
          </Header>
          <Route exact path='/' to={Home} />
        </div>
      </Router>
    );
  }
}
