const { src, dest } = require('gulp')
const xslt = require('gulp-xslt')
const rename = require('gulp-rename')

function defaultTask(cb) {
    cb();
}

function transform(cb) {

    cb();
}

exports.default = () => {
    return src('data/necrons-roster.xml')
        .pipe(xslt('src/roster.xsl', {}))
        .pipe(dest('build/'))
}
