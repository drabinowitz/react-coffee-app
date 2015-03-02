var gulp = require('gulp');
var shell = require('gulp-shell');

gulp.task('browserify', shell.task([
  'browserify -d -t coffee-reactify --extension=".coffee" ./App.coffee -o bundle.js'
]));

gulp.task('watchify', shell.task([
  'watchify -d -t coffee-reactify --extension=".coffee" ./App.coffee -o bundle.js -v'
]));
