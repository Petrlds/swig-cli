fs = require "fs"

readJSON = (input_file, callback) ->
  try
    input_data = JSON.parse fs.readFileSync(input_file)
  catch err
    callback err
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


module.exports = (input_file, callback) ->
  console.log "read input: ", input_file
  if input_file is 'stdin'
    readStdin(callback)
  else
    readJSON(input_file, callback)