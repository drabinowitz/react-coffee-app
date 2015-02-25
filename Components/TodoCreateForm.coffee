React = require 'react'

TodoCreateForm = React.createClass
  propTypes:
    handleAdd: React.PropTypes.func.isRequired

  handleSubmit: (e) ->
    do e.preventDefault
    do e.stopPropagation
    @handleAdd text: @refs.addInput.getDOMNode().value

  render: ->
    <form onSubmit={@handleSubmit}>
      <input ref='addInput' />
    </form>

module.exports = TodoCreateForm
