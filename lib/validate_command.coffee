errors = require './errors'
fs = require "fs"
constants = require './constants'

module.exports = (argv) ->
  template  = argv._[0]
  input     = argv.f

  if argv.h or argv.help then return true
  if not template then return errors.NO_TEMPLATE()

  if template and not fs.existsSync(template)
    return errors.TEMPLATE_NOT_FOUND(template)

  if input and input isnt constants.STDIN and not fs.existsSync(input)
    return errors.JSON_NOT_FOUND(input)

  return true