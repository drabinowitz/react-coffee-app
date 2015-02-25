Immutable = require 'immutable'
assign = require 'object-assign'

todoConstants = require '../Constants/todoConstants'
appDispatcher = require '../appDispatcher'
EventEmitter = (require 'eventemitter').EventEmitter

todoStore = assign {}, EventEmitter.prototype,
  _todos:Immutable.List.of()
  emitChange: -> @emit 'CHANGE'
  addChangeListener: (callback) -> @addListener 'CHANGE', callback
  removeChangeListener: (callback) -> @removeListener 'CHANGE', callback
  getAll: -> @_todos
  getId: -> @_todos.size
  onAdd: (todo) ->
    @_todos = @_todos.push
      text: todo.text
      id: do @getId
    do @emitChange
  onEdit: (todo) ->
    @_todos = @_todos.set todo.id, todo
    do @emitChange
  onRemove: (todo) ->
    @_todos = @_todos.delete todo.id
    do @emitChange

appDispatcher.register (payload) ->
  body = payload.action.body
  switch payload.action.type
    when todoConstants.ADD_TODO then todoStore.onAdd body
    when todoConstants.EDIT_TODO then todoStore.onEdit body
    when todoConstants.REMOVE_TODO then todoStore.onRemove body

module.exports = todoStore
