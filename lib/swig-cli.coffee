#! /usr/bin/env coffee

async = require "async"

exports.run = () ->
  [input, output, template] = require("./define_command")()

  async.waterfall [
    (cb) ->
      require("./read_input")(input, cb)
    (input_data, cb) ->
      require("./compile_template")(input_data, template, cb)
    (output_data, cb) ->
      require("./write_output")(output_data, output, cb)
  ], (err) ->
    if err then return console.log err
    console.log " - success - "

@run()