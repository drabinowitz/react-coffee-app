var gulp = require('gulp');
var shell = require('gulp-shell');

gulp.task('browserify', shell.task([
  'browserify ./App.coffee -o bundle.js'
]));

gulp.task('watchify', shell.task([
  'watchify -d ./App.coffee -o bundle.js -v'
]));
