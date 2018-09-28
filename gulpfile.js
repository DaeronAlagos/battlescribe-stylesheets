var gulp = require('gulp');
var inject = require('gulp-inject');
var xslt = require('gulp-xslt');
var rename = require('gulp-rename');

gulp.task('inject-roster', function () {
	gulp.src('./src/command-roster.xsl')
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
})

gulp.task('xsl-roster', function() {
    gulp.src('./seekers-roster.xml')
        .pipe(xslt('./dist/command-roster.xsl', {}))
        .pipe(gulp.dest('./build/'));
});

gulp.task('rename-roster', function () {
	gulp.src('./build/seekers-roster.xml')
		.pipe(rename('seekers-roster.html'))
		.pipe(gulp.dest('./build'));
});
