Immutable = require 'immutable'
Todo = require '../Components/Todo'
React = require 'react'
TestUtils = require('react/addons').addons.TestUtils
assert = require('chai').assert

describe 'Todo', ->

  beforeEach ->
    @todo = Immutable.Map
      id: 0
      text: 'test'
    @handleEdit = do @sinon.stub
    @handleRemove = do @sinon.stub
    @container = @document.createElement 'div'
    @TodoEl = TestUtils.renderIntoDocument <Todo handleEdit={@handleEdit} handleRemove={@handleRemove} todo={@todo} />, @container

  describe 'rendering content', ->
    it 'renders the todo text', ->
      todoText = TestUtils.findRenderedDOMComponentWithTag(@TodoEl, 'h3')
      assert.equal todoText.getDOMNode().textContent, 'test'
