var gulp = require('gulp');
var shell = require('gulp-shell');

gulp.task('browserify', shell.task([
  'browserify jsx/Router.js -o client/bundle.js'
]));

gulp.task('watchify', shell.task([
  'watchify -d jsx/Router.js -o client/bundle.js -v'
]));
