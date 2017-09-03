import React, { Component } from 'react'
import { NavLink } from 'react-router-dom'
import './navigation.css'

export class Link extends Component {
  get linkProps() {
    return {
      to: this.props.to,
      className: 'navigation__link',
      activeClassName: 'navigation__link--active',
    }
  }

  render() {
    return (
      <NavLink {...this.linkProps}>
       {this.props.children}
      </NavLink>
    );
  }
}

export default class Navigation extends Component {
  render() {
    return (
      <nav className="navigation">
        {this.props.children}
      </nav>
    );
  }
}
