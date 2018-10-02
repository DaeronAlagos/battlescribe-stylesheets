var { campaignName, matchedPlayName } = require('./src/names.js');

var gulp = require('gulp');
var inject = require('gulp-inject');
var xslt = require('gulp-xslt');
var rename = require('gulp-rename');
var gulpSequence = require('gulp-sequence')
var clean = require('gulp-clean');
var sass = require('gulp-sass');

gulp.task('clean-build', function () {
	return gulp.src('build', {read:false})
				.pipe(clean());
});

gulp.task('clean-dist', function () {
	return gulp.src('dist', {read:false})
				.pipe(clean());
});

gulp.task('sass', function () {
	return gulp.src('./src/sass/*.scss')
		.pipe(sass().on('error', sass.logError))
		.pipe(gulp.dest('./src/css'));
});

gulp.task('inject-campaign', function () {
	gulp.src('./src/campaign.xsl')
		.pipe(inject(gulp.src(['./src/css/common.css']), {
			starttag: '<!-- inject:src/css/common.css -->',
			relative: true,
			transform: function (filePath, file) {
		// return file contents as string
			return file.contents.toString('utf8')
		}}))
		.pipe(inject(gulp.src(['./src/card.xsl']), {
			starttag: '<!-- inject:src/card.xsl -->',
			relative: true,
			transform: function (filePath, file) {
		// return file contents as string
			return file.contents.toString('utf8')
		}}))
		.pipe(inject(gulp.src(['./src/roster.xsl']), {
			starttag: '<!-- inject:src/roster.xsl -->',
			relative: true,
			transform: function (filePath, file) {
		// return file contents as string
			return file.contents.toString('utf8')
		}}))
		.pipe(gulp.dest('./dist'));
});

gulp.task('xsl-campaign', function() {
    gulp.src(`./${campaignName}.xml`)
        .pipe(xslt('./dist/campaign.xsl', {}))
        .pipe(gulp.dest('./build/'));
});

gulp.task('rename-campaign', function () {
	gulp.src(`./build/${campaignName}.xml`)
		.pipe(rename(function (path) {
			path.dirname += '/';
			path.basename += '';
			path.extname = '.html';
		}))
		.pipe(gulp.dest('./build'));
})

gulp.task('inject-matched-play', function () {
	gulp.src('./src/matchedPlay.xsl')
		.pipe(inject(gulp.src(['./src/css/common.css']), {
			starttag: '<!-- inject:src/css/common.css -->',
			relative: true,
			transform: function (filePath, file) {
		// return file contents as string
			return file.contents.toString('utf8')
		}}))
		.pipe(inject(gulp.src(['./src/card.xsl']), {
			starttag: '<!-- inject:src/card.xsl -->',
			relative: true,
			transform: function (filePath, file) {
		// return file contents as string
			return file.contents.toString('utf8')
		}}))
		.pipe(gulp.dest('./dist'));
});

gulp.task('xsl-matched-play', function() {
    gulp.src(`./${matchedPlayName}.xml`)
        .pipe(xslt('./dist/matchedPlay.xsl', {}))
        .pipe(gulp.dest('./build/'));
});

gulp.task('rename-matched-play', function () {
	gulp.src(`./build/${matchedPlayName}.xml`)
		.pipe(rename(function (path) {
			path.dirname += '/';
			path.basename += '';
			path.extname = '.html';
		}))
		.pipe(gulp.dest('./build'));
})

gulp.task('sequence-roster', gulpSequence('inject-roster', 'xsl-roster', 'rename-roster'))
