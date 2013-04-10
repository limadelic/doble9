setting = (env_variable, default_value) ->
  process.env[env_variable] or default_value

global.settings =

  port: setting 'PORT', 3000
