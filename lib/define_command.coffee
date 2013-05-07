optimist = require "optimist"
validate = require './validate_command'

module.exports = () ->
  argv = optimist
    .usage("Usage: swig [options] <template>")
    .options(
      file:
        description: 'JSON file'
        alias: 'f'
        default: 'stdin'
      output:
        description: 'Output file'
        alias: 'o'
        default: 'stdout'
    )
    .check (argv) ->
      validate argv
    .argv

  if argv.h or argv.help then optimist.showHelp()

  return [argv.f, argv.o, argv._[0]]
