chai      = require('chai')
expect    = chai.expect
should    = chai.should()
sinon     = require('sinon')
sinonChai = require('sinon-chai')

chai.use(sinonChai)

swig_cli = 'lib/swig-cli.coffee'
fs = require "fs"
exec = require('child_process').exec

test_output = 'test-output-file.html'
test_json = 'tmp-test.json'
test_tmpl = 'index-test-template.html'

describe "Integration test with nice params", () ->
  before (done) ->
    fs.writeFileSync test_tmpl, "<!DOCTYPE html><html><body>{{ one }}</body></html>"
    fs.writeFileSync test_json, JSON.stringify({one: 11111})
    done()
  after (done) ->
    fs.unlinkSync test_tmpl
    fs.unlinkSync test_json
    fs.unlinkSync test_output
    done()

  it "run command with -f option and template", (done) ->
    command = "coffee #{swig_cli} -f #{test_json} #{test_tmpl}"
    exec command, (err, stdout, stderr) ->
      should.not.exist(err)
      stdout.should.include('11111')
      done()

  it "run command with all options and template", (done) ->
    command = "coffee #{swig_cli} -f #{test_json} -o #{test_output} #{test_tmpl}"
    exec command, (err, stdout, stderr) ->
      should.not.exist(err)
      fs.readFile test_output, (err, data) ->
        should.not.exist(err)
        data = String data
        data.should.include('11111')
        done()

describe "Integration test with bad params", () ->
  before (done) ->
    fs.writeFileSync test_tmpl, "<!DOCTYPE html><html><body>{{ one }}</body></html>"
    fs.writeFileSync test_json, JSON.stringify({one: 11111})
    done()
  after (done) ->
    fs.unlinkSync test_tmpl
    fs.unlinkSync test_json
    done()

  it "run command without template", (done) ->
    command = "coffee #{swig_cli} -f #{test_json}"
    exec command, (err, stdout, stderr) ->
      should.exist(err)
      err = String err
      err.should.include 'Error: you must specify template file!'
      done()