Immutable = require 'immutable'
assign = require 'object-assign'

todoConstants = require '../Constants/todoConstants'
appDispatcher = require '../appDispatcher'
EventEmitter = (require 'eventemitter').EventEmitter

todoStore = assign {}, EventEmitter.prototype,
  _todos:Immutable.OrderedMap()

  _id: 0

  emitChange: ->
    @emit 'CHANGE'

  addChangeListener: (callback) ->
    @addListener 'CHANGE', callback

  removeChangeListener: (callback) ->
    @removeListener 'CHANGE', callback

  getAll: ->
    @_todos

  getId: ->
    @_id++

  onAdd: (todo) ->
    id = do @getId
    @_todos = @_todos.set id, Immutable.Map
      id: id
      text: todo.text
    do @emitChange

  onEdit: (todo) ->
    @_todos = @_todos.set todo.get('id'), todo
    do @emitChange

  onRemove: (todo) ->
    @_todos = @_todos.delete todo.get 'id'
    do @emitChange

appDispatcher.register (payload) ->
  body = payload.action.body
  switch payload.action.type
    when todoConstants.ADD_TODO then todoStore.onAdd body
    when todoConstants.EDIT_TODO then todoStore.onEdit body
    when todoConstants.REMOVE_TODO then todoStore.onRemove body

module.exports = todoStore
