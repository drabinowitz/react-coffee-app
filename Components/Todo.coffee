React = require 'react'
PureRenderMixin = require 'react/lib/ReactComponentWithPureRenderMixin'

Todo = React.createClass
  mixins: [PureRenderMixin]

  propTypes:
    todo: React.PropTypes.object.isRequired
    handleEdit: React.PropTypes.func.isRequired
    handleRemove: React.PropTypes.func.isRequired

  getInitialState: -> editing: false
  componentWillReceiveProps: -> @setState editing: false
  showEdit: -> @setState editing: true
  handleRemove: (e) ->
    do e.preventDefault
    do e.stopPropagation
    @props.handleRemove @props.todo
  handleEdit: (e) ->
    do e.preventDefault
    do e.stopPropagation
    @props. handleEdit @props.todo, @refs.editInput.getDOMNode().value
  render: ->
    form = if @state.editing?
      <form onSubmit={@handleEdit}>
        <input ref='editInput' />
      </form>

    <div>
      <h3>{@props.todo.get 'text'}</h3>
      <button onClick={@handleRemove}>X</button>
      <button onClick={@showEdit}>Edit</button>
      {form}
    </div>

module.exports = Todo
