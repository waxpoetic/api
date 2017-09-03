import React, { Component } from 'react'
import './header.css'
import logo from '../images/logo.svg'

export class Logo extends Component {
  render() {
    return (
      <img src={logo} alt="Mindbrain Music" />
    );
  }
}

export default class Header extends Component {
  render() {
    return (
      <header className="page-header catalog__header">
        {this.props.children}
      </header>
    );
  }
}
