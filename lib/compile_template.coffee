swig = require "swig"
path = require "path"

module.exports = (data, template, callback) ->
  try
    tmpl = swig.compileFile path.resolve(template)
    output_data = tmpl.render data
  catch err
    return callback err

  callback null, output_data