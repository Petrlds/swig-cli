fs = require "fs"
constants = require "./constants"

readJSON = (input_file, callback) ->
  try
    input_data = JSON.parse fs.readFileSync(input_file)
  catch err
    return callback err
  callback null, input_data

readStdin = (callback) ->
  input_data = null
  process.stdin.resume()
  process.stdin.setEncoding('utf8')
  process.stdin.on 'data', (chunk) ->
    try
      input_data = JSON.parse chunk
    catch err
      callback err

  process.stdin.on 'end', () ->
    callback null, input_data

readStdinChunked = (callback) ->
  input_stream = []
  input_data = null
  process.stdin.resume()
  process.stdin.setEncoding('utf8')
  process.stdin.on 'data', (chunk) ->
    input_stream.push new Buffer(chunk)

  process.stdin.on 'end', () ->
    input_buffer = Buffer.concat input_stream
    try
      input_data = JSON.parse input_buffer.toString()
    catch err
      return callback err
    callback null, input_data

module.exports = (input_file, callback) ->
  if input_file is constants.STDIN
#    readStdin(callback)
    readStdinChunked(callback)
  else
    readJSON(input_file, callback)