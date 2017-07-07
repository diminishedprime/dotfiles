import React from 'react'
import R from 'ramda'
import {
  connect,
} from 'react-redux'

import {
  hiPath,
  errorTextPath,
  userIdPath,
} from '../../redux/paths.js'
import ErrorBar from '../error-bar/error-bar.jsx'
import Counter from '../counter/counter.jsx'
import './app.css'

const App = ({hi, hasError, userId}) => (
  <div className="app">
    {hasError && <ErrorBar />}
    <div className="title">Best Counter</div>
    <div className="content">
      <div className="userId">UserId: {userId}</div>
      <Counter />
      {
        hi
          .map((text, idx) => (
            <div className="hi" key={idx}>{text}</div>
          ))
      }
    </div>
  </div>
)
const mapStateToProps = (state) => ({
  hi: R.view(hiPath, state),
  hasError: R.view(errorTextPath, state),
  userId: R.view(userIdPath, state),
})

export default connect(
  mapStateToProps
)(App)
