jsdom = require 'jsdom'

require 'mocha-sinon'

document = jsdom.jsdom('<html><body></body></html>')

beforeEach ->
  @document = document
  global.document = @document
  global.window = @document.parentWindow

afterEach ->
