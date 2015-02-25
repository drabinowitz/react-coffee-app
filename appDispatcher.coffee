assign = require 'object-assign'
appDispatcher = new (require 'flux').Dispatcher

appDispatcher.dispatchViewAction = (action) ->
  @dispatch
    action: action
    source: 'VIEW_ACTION'

module.exports = appDispatcher
