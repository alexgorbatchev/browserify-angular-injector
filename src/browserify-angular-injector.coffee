path = require 'path'
through = require 'browserify-through'
angularInjector = require 'angular-injector'

module.exports = through
  filter: (filepath) ->
    path.extname(filepath) in ['.js', '.coffee']

  map: (filepath, data) ->
    angularInjector.annotate data
