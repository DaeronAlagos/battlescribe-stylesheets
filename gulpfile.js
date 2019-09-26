const { watch, series, src, dest } = require('gulp')
const browserSync = require('browser-sync').create()
const xslt = require('gulp-xslt')
const rename = require('gulp-rename')

function transform () {
    return src('data/necrons-roster.xml')
        .pipe(xslt('src/roster.xsl', {}))
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
    watch('src/roster.xsl', series(transform, htmlRename))
    watch('build/*.html').on('change', browserSync.reload)
}
