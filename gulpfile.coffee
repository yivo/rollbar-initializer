gulp             = require('gulp')
concat           = require('gulp-concat')
coffee           = require('gulp-coffee')
replace          = require('gulp-replace')
fs               = require('fs')
rollbarSnippetJS = fs.readFileSync('./vendor/rollbar.snippet.min.js').toString('UTF-8')

gulp.task 'default', ['build', 'watch'], ->

gulp.task 'build', ->
  gulp.src('source/rollbar-initializer.coffee')
    .pipe replace(/[ ]+\/\* rollbar\.snippet\.js \*\//m, rollbarSnippetJS)
    .pipe gulp.dest('build')
    .pipe coffee()
    .pipe gulp.dest('build')

gulp.task 'watch', ->
  gulp.watch 'source/**/*', ['build']
