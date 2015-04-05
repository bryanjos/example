var gulp = require('gulp');
var sass = require('gulp-sass');
var babel = require('gulp-babel');
var concat = require('gulp-concat');
var spawn = require("gulp-spawn");
var sourcemaps = require('gulp-sourcemaps');
var plumber = require('gulp-plumber');
var rename = require('gulp-rename');

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

gulp.task('build-exjs', function() {
  gulp.src(exjsSrc)
  .pipe(plumber())
  .pipe(spawn({ cmd: '/usr/local/ex2js/bin/ex2js', args: ["-st"] }))
  .pipe(babel({sourceMap: false, modules:'system'}))
  .pipe(rename({extname: '.js'}))
  .pipe(gulp.dest(jsDest));
});

gulp.task('build-elixir-lib', function() {
  gulp.src("/usr/local/ex2js/elixir.js")
  .pipe(babel({sourceMap: false}))
  .pipe(gulp.dest(jsDest));
});

gulp.task('build-js', function() {
  gulp.src(jsSrc)
      .pipe(plumber())
      .pipe(babel({sourceMap: false, modules:'system'}))
      .pipe(rename({extname: '.js'}))
      .pipe(gulp.dest(jsDest));
});

gulp.task('build', ['build-elixir-lib', 'build-exjs', 'build-js', 'build-sass']);


gulp.task('watch', ['build'], function() {
  gulp.watch([exjsSrc, jsSrc, cssSrc], ['build']).on('change', reportChange);
});


gulp.task('default', ['build']);