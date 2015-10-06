var gulp = require('gulp');
//var sass = require('gulp-sass');
var babel = require('gulp-babel');
var concat = require('gulp-concat');
var spawn = require("gulp-spawn");
var sourcemaps = require('gulp-sourcemaps');
var plumber = require('gulp-plumber');
var rename = require('gulp-rename');
var cp = require('child_process');
var exec = require('child_process').exec;

var cssSrc = 'web/static/css/*.scss';
var cssDest = 'priv/static/css';

var jsSrc = 'web/static/js/**/*.js*';
var exjsSrc = 'web/static/exjs/**/*.exjs';
var jsDest = 'priv/static/js'


function reportChange(event){
  console.log('File ' + event.path + ' was ' + event.type + ', running tasks...');
}

gulp.task('build-sass', function() {
  gulp.src(cssSrc)
      .pipe(sass())
      .pipe(concat('app.css'))
      .pipe(gulp.dest(cssDest));
});

gulp.task('build-exjs', function(cb) {
  var ex2jsCommand = '/usr/local/ex2js/bin/ex2js "' + exjsSrc + '" -r "js" -o ' + '"web/static/js"';
  exec(ex2jsCommand, function (err, stdout, stderr) {
    cb(err);
  });
});

gulp.task('build-js', ['build-exjs'], function() {
  return gulp.src(jsSrc)
      .pipe(plumber())
      .pipe(babel({sourceMap: false, modules: 'system'}))
      .pipe(gulp.dest(jsDest));
});

gulp.task('build', ['build-js']);


gulp.task('watch', ['build'], function() {
  gulp.watch([exjsSrc, cssSrc], ['build']).on('change', reportChange);
});


gulp.task('default', ['build']);
