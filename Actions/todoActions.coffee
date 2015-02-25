todoConstants = require '../Constants/todoConstants'
appDispatcher = require './appDispatcher'

module.exports =
  get: ->
    appDispatcher.dispatchViewAction
      type: todoConstants.GET_TODO

  add: (todo) ->
    appDispatcher.dispatchViewAction
      type: todoConstants.ADD_TODO
      body: todo

  edit: (todo) ->
    appDispatcher.dispatchViewAction
      type: todoConstants.EDIT_TODO
      body: todo

  remove: (todo) ->
    appDispatcher.dispatchViewAction
      type: todoConstants.EDIT_TODO
      body: todo
