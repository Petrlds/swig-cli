#! /usr/bin/env coffee

async = require "async"

exports.run = () ->
  [input, output, template] = require("./define_command")()

  console.log " params : ", input, output, template

@run()