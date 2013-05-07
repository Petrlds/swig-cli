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
      cb null
  ], (err) ->
    if err then return console.log err
    console.log " - success - "

@run()