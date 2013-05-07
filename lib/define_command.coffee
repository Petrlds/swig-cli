optimist = require "optimist"
validate = require './validate_command'
constants = require './constants'

module.exports = () ->
  argv = optimist
    .usage("Usage: swig [options] <template>")
    .options(
      file:
        description: 'JSON file'
        alias: 'f'
        default: constants.STDIN
      output:
        description: 'Output file'
        alias: 'o'
        default: constants.STDOUT
    )
    .check (argv) ->
      validate argv
    .argv

  if argv.h or argv.help then optimist.showHelp()

  return [argv.f, argv.o, argv._[0]]
