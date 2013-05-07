chai      = require('chai')
expect    = chai.expect
should    = chai.should()
sinon     = require('sinon')
sinonChai = require('sinon-chai')

chai.use(sinonChai)

swig_cli = require('../lib/swig-cli.coffee')
fs = require "fs"

describe "Test read_input with nice arguments", () ->
  before (done) ->
    fs.writeFileSync 'tmp.json', JSON.stringify({one: 1})
    done()
  after (done) ->
    fs.unlinkSync 'tmp.json'
    done()

  it "read correct JSON file", ->
    input_file = 'tmp.json'
    readInput = require "../lib/read_input"
    readInput input_file, (err, input_data) ->
      should.not.exist(err)
      input_data.should.have.property('one')

describe "Test read_input with bad arguments", () ->
  before (done) ->
    fs.writeFileSync 'bad.json', "{one:1"
    done()
  after (done) ->
    fs.unlinkSync 'bad.json'
    done()
  it "not correct json file", ->
    input_file = 'bad.json'
    readInput = require "../lib/read_input"
    readInput input_file, (err, input_data) ->
      console.log err
      should.exist(err)