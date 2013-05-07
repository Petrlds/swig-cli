fs = require "fs"
path = require "path"
constants = require "./constants"

writeStdout = (data, callback) ->
  console.log " ======== compiled template ======= "
  console.log data
  console.log " =============== end =============="
  callback null

writeFile = (data, output, callback) ->
  fs.writeFile path.resolve(output), data, (err) ->
    if err then return callback err
    callback null

module.exports = (data, output, callback) ->
  if output is constants.STDOUT
    writeStdout data, callback
  else
    writeFile data, output, callback
