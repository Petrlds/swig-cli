chai      = require('chai')
expect    = chai.expect
should    = chai.should()
sinon     = require('sinon')
sinonChai = require('sinon-chai')

chai.use(sinonChai)

swig_cli = require('../lib/swig-cli.coffee')
fs = require "fs"

describe "Test compile_template with bad arguments", () ->
  before (done) ->
    fs.writeFileSync 'index-test-template.html', "<!DOCTYPE html><html><body>{{ one.two.three }}</body></html>"
    done()
  after (done) ->
    fs.unlinkSync 'index-test-template.html'
    done()

  it "access to undefiend property", ->
    data = {one: 1}
    template = 'index-test-template.html'
    compileTemplate = require "../lib/compile_template"
    compileTemplate data, template, (err, output_data) ->
      should.not.exist(err)