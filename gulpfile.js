const { src, dest } = require('gulp')
const xslt = require('gulp-xslt')

function defaultTask(cb) {
    cb();
}

function transform(cb) {

    cb();
}

exports.default = function () {
    return src('data/necrons-roster.xml')
        .pipe(xslt('src/roster.xsl', {}))
        .pipe(dest('build/'))
}
