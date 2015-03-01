React = require 'react'

todoActions = require '../Actions/todoActions'
todoStore = require '../Stores/todoStore'
TodoCreateForm = require './TodoCreateForm'
Todo = require './Todo'

TodoView = React.createClass
  getInitialState: ->
    todos: do todoStore.getAll

  listenerCallback: ->
    @setState do @getInitialState if do @isMounted

  componentDidMount: ->
    todoStore.addChangeListener @listenerCallback
    do todoActions.get

  componentWillUnmount: ->
    todoStore.removeChangeListener @listenerCallback

  addTodo: (todo) ->
    todoActions.add todo

  removeTodo: (todo) ->
    todoActions.remove todo

  editTodo: (todo, text) ->
    todoActions.edit todo.set 'text', text

  render: ->
    Todos = @state.todos.toArray().map (todo) => <Todo key={todo.get 'id'} todo={todo} handleRemove={@removeTodo} handleEdit={@editTodo} />

    <div>
      <h1>Todos</h1>
      <br />
      <TodoCreateForm handleAdd={@addTodo} />
      <br />
      <br />
      {Todos}
    </div>

module.exports = TodoView
