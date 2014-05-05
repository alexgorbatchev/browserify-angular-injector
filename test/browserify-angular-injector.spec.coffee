require 'coffee-errors'

chai = require 'chai'
browserify = require 'browserify'
# using compiled JavaScript file here to be sure module works
browserifyAngularInjector = require '../lib/browserify-angular-injector.js'

expect = chai.expect

describe 'browserify-angular-injector', ->
  results = null

  before (done) ->
    b = browserify extensions: '.coffee'
    b.transform browserifyAngularInjector
    b.add "#{__dirname}/fixtures/index.js"

    b.bundle (err, r) ->
      results = r
      done err

  it 'processed js file', -> expect(results).to.match /controller\('home', \['\$scope', '\$http'/
  it 'processed coffee file', -> expect(results).to.match /service\('foo', \['\$scope', '\$http'/
