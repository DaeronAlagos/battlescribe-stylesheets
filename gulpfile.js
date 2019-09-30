const { watch, series, src, dest, task } = require('gulp')
const args = require('yargs').argv
const browserSync = require('browser-sync').create()
const xslt = require('gulp-xslt')
const rename = require('gulp-rename')
const sass = require('gulp-sass')
const gulpInject = require('gulp-inject')
const autoprefixer = require('gulp-autoprefixer')

const fileName = args.bsfile

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
        .pipe(gulpInject(src(['src/campaign.xsl']), {
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
    return src(`data/${fileName}.xml`)
        .pipe(xslt('build/base.xsl', {}))
        .pipe(dest('build/'))
}

function htmlRename () {
    return src(`build/${fileName}.xml`)
        .pipe(rename(`build/${fileName}.html`))
        .pipe(dest('./'))
}

function copyResult () {
    return src('build/base.xsl')
        .pipe(rename('stylesheet.xsl'))
        .pipe(dest('dist'))
}

exports.default = () => {
    browserSync.init({
        server: {
            baseDir: './build',
            index: `${fileName}.html`
        },
        reloadDelay: 2000
    })
    watch(['src/scss/*.scss', 'src/*.xsl'], series(scss, inject, xsltransform, htmlRename, copyResult))
    watch('build/*.html').on('change', browserSync.reload)
}
exports.scss = scss
exports.inject = inject
exports.build = series(scss, inject, xsltransform, htmlRename, copyResult)
