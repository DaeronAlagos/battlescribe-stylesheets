const { watch, series, src, dest, task } = require('gulp')
const browserSync = require('browser-sync').create()
const xslt = require('gulp-xslt')
const rename = require('gulp-rename')
const gulpSass = require('gulp-sass')
const gulpInject = require('gulp-inject')

function inject () {
    return src('src/roster.xsl')
        .pipe(gulpInject(src(['src/css/style.css']), {
            starttag: '<!-- inject:{{path}} -->',
            relative: true,
            transform: (filePath, file) => {
                return file.contents.toString('utf8')
            }
        }))
        .pipe(dest('./dist'))
}

function scss () {
    return src('src/scss/*.scss')
        .pipe(gulpSass().on('error', gulpSass.logError))
        .pipe(dest('src/css'))
}

function xsltransform () {
    return src('data/necrons-roster.xml')
        .pipe(xslt('dist/roster.xsl', {}))
        .pipe(dest('build/'))
}

function htmlRename () {
    return src('build/necrons-roster.xml')
        .pipe(rename('build/necrons-roster.html'))
        .pipe(dest('./'))
}

exports.default = () => {
    browserSync.init({
        server: {
            baseDir: './build',
            index: 'necrons-roster.html'
        }
    })
    watch('src/scss/*.scss', series(scss, inject, xsltransform, htmlRename))
    watch('src/roster.xsl', series(inject, xsltransform, htmlRename))
    watch('build/*.html').on('change', browserSync.reload)
}