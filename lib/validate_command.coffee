errors = require './errors'
fs = require "fs"

module.exports = (argv) ->
#  console.log "validate command: ", argv
  template  = argv._[0]
  input     = argv.f

  if argv.h or argv.help then return true
  if not template then return errors.NO_TEMPLATE()

  if template and not fs.existsSync("#{process.cwd()}/#{template}") then return errors.TEMPLATE_NOT_FOUND(template)
  if input and not fs.existsSync("#{process.cwd()}/#{input}") then return errors.JSON_NOT_FOUND(input)

  return true