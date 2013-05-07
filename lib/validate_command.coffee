errors = require './errors'
fs = require "fs"

module.exports = (argv) ->
#  console.log "validate command: ", argv
  template  = argv._[0]
  input     = argv.f

  if argv.h or argv.help then return true
  if not template then return errors.NO_TEMPLATE()

  if template
    if not fs.existsSync(template)
      if fs.existsSync("#{process.cwd()}/#{template}")
        argv._[0] = "#{process.cwd()}/#{template}"
      else
        return errors.TEMPLATE_NOT_FOUND(template)

  if input and input isnt 'stdin'
    if not fs.existsSync(input)
      if fs.existsSync("#{process.cwd()}/#{input}")
        argv.f = "#{process.cwd()}/#{input}"
        argv.file = "#{process.cwd()}/#{input}"
      else
        return errors.JSON_NOT_FOUND(input)
