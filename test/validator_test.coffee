chai      = require('chai')
expect    = chai.expect
should    = chai.should()
sinon     = require('sinon')
sinonChai = require('sinon-chai')

chai.use(sinonChai)

swig_cli = require('../lib/swig-cli.coffee')
fs = require "fs"

describe "Test Validator with nice commands", () ->
  before (done) ->
    fs.writeFileSync 'tmp.json', JSON.stringify({one: 1})
    fs.writeFileSync 'index.html', "<!DOCTYPE html><html><body>{{ one }}</body></html>"
    done()
  after (done) ->
    fs.unlinkSync 'tmp.json'
    fs.unlinkSync 'index.html'
    done()

  it "nice command with all options and template file", ->
    argv =
      f : 'tmp.json'
      o : 'test-test.html'
      _ : ['index.html']
    validator = require "../lib/validate_command"
    result = validator argv
    result.should.be.equal(true)

  it "nice command without output file", ->
    argv =
      f : 'tmp.json'
      _ : ['index.html']
    validator = require "../lib/validate_command"
    result = validator argv
    result.should.be.equal(true)

  it "nice command with only template file", ->
    argv =
      _ : ['index.html']
    validator = require "../lib/validate_command"
    result = validator argv
    result.should.be.equal(true)

describe "Test Validator with bad commands", () ->
  before (done) ->
    fs.writeFileSync 'tmp.json', "{one:1}"
    fs.writeFileSync 'index.html', "<!DOCTYPE html><html><body>{{ one }}</body></html>"
    done()
  after (done) ->
    fs.unlinkSync 'tmp.json'
    fs.unlinkSync 'index.html'
    done()

  it "command without params at all", ->
    argv =
      _ : []
    validator = require "../lib/validate_command"
    result = validator argv
    result.should.be.equal(false)

  it "command without template", ->
    argv =
      f : 'tmp.json'
      o : 'test-test.html'
      _ : []
    validator = require "../lib/validate_command"
    result = validator argv
    result.should.be.equal(false)

  it "command with non existing input file", ->
    argv =
      f : 'non-exists-tmp.json'
      _ : ['index.html']
    validator = require "../lib/validate_command"
    result = validator argv
    result.should.be.equal(false)

  it "command with non existing template file", ->
    argv =
      f : 'tmp.json'
      _ : ['non-exists-index.html']
    validator = require "../lib/validate_command"
    result = validator argv
    result.should.be.equal(false)

  it "command with non existing template and input files", ->
    argv =
      f : 'non-exists-tmp.json'
      _ : ['non-exists-index.html']
    validator = require "../lib/validate_command"
    result = validator argv
    result.should.be.equal(false)