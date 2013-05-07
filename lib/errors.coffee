module.exports =
  NO_TEMPLATE: () ->
    console.error "Error: you must specify template file! "
    return false

  TEMPLATE_NOT_FOUND: (template) ->
    console.error "Error: there is no such template '#{template}'"
    return false

  JSON_NOT_FOUND: (input) ->
    console.error "Error: there is no such file '#{input}' "
    return false
