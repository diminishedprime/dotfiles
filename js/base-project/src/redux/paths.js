import R from 'ramda'

// Path arrays
const counter = ['counter']
const heartbeats = ['heartbeats']
const hi = ['hi']

const error = ['error']
const errorText = [...error, 'text']
const errorSeverity = [...error, 'severity']

const actionLog = ['actionLog']
const replaying = ['replaying']

// Paths
export const counterPath = R.lensPath(counter)

export const heartbeatsPath = R.lensPath(heartbeats)

export const hiPath = R.lensPath(hi)

export const errorPath = R.lensPath(error)
export const errorTextPath = R.lensPath(errorText)
export const errorSeverityPath = R.lensPath(errorSeverity)

export const actionLogPath = R.lensPath(actionLog)
export const replayingPath = R.lensPath(replaying)
