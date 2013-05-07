#! /usr/bin/env coffee

async = require "async"

exports.run = () ->
  [input, output, template] = require("./define_command")()

  console.log " params : ", input, output, template

  async.waterfall [
    (cb) ->
      require("./read_input")(input, cb)
    (input_data, cb) ->
      console.log " input -data : ", input_data
      require("./compile_template")(input_data, template, cb)
    (output_data, cb) ->
      console.log " output_data : ", output_data
      cb null
  ], (err) ->
    if err then return console.log err
    console.log " - success - "

@run()