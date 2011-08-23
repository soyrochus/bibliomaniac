
vows = require 'vows'
assert  = require 'assert'
jsonrpc = require '../jsonrpc'

jsonrpc1 =
  id: '122'
  method: 'meth'
  parameters: [1,10]

vows
  .describe('jsonrpc module')
  .addBatch
    'When object send by client is xml-rpc version 1':
      topic: -> jsonrpc1
      'then it will be processed by "jsonrpc1_handler"': (topic) ->
          assert.equal (jsonrpc.get_msg_handler topic), jsonrpc.jsonrpc1_handler
  .export module

