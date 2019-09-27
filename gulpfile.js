const { watch, series, src, dest, task } = require('gulp')
const browserSync = require('browser-sync').create()
const xslt = require('gulp-xslt')
const rename = require('gulp-rename')
const sass = require('gulp-sass')
const gulpInject = require('gulp-inject')
const autoprefixer = require('gulp-autoprefixer')

function scss () {
    return src('src/scss/*.scss')
        .pipe(sass().on('error', sass.logError))
        .pipe(autoprefixer())
        .pipe(dest('build/'))
}

function inject () {
    return src('src/base.xsl')
        .pipe(gulpInject(src(['build/style.css']), {
            starttag: '<!-- inject:{{path}} -->',
            relative: true,
            transform: (filePath, file) => {
                return file.contents.toString('utf8')
            }
        }))
        .pipe(gulpInject(src(['src/roster.xsl']), {
            starttag: '<!-- inject:{{path}} -->',
            relative: true,
            transform: (filePath, file) => {
                return file.contents.toString('utf8')
            }
        }))
        .pipe(gulpInject(src(['src/card.xsl']), {
            starttag: '<!-- inject:{{path}} -->',
            relative: true,
            transform: (filePath, file) => {
                return file.contents.toString('utf8')
            }
        }))
        .pipe(dest('build/'))
}

function xsltransform () {
    return src('data/necrons-roster.xml')
        .pipe(xslt('build/roster.xsl', {}))
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
    watch(['src/scss/*.scss', 'src/roster.xsl'], series(scss, inject, xsltransform, htmlRename))
    watch('build/*.html').on('change', browserSync.reload)
}
exports.scss = scss
exports.inject = inject
