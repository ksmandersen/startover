# Configuration variables.
# These are passed to the handelbar templates
config = {
	port: 9091,
	host: "localhost"
	production: false
	imgpath: "/images"
}

# Template data
# Change these where appropriate
site = {
	title: "Startover",
	description: "Startover is a boilerplate for developing static websites on your Mac. With Startover you don't have to start over!",
	keywords: "template,static,website,s3"
	url: "https://github.com/ksmandersen/startover",
	fb: {
		appName: "",
		appId: ""
	}
}

reload_script = '<script src="//{{ config.host }}:{{ config.port }}/livereload.js"></script>'

# This is the path gulp will output all
# generated and copied files to.
build_path = "./public"

# Suffix used for retina image assets
retina_suffix = "_2x"

# Paths used for input of generated files
paths = {
	# These files are copied directly into public/
	copyfile: "{downloads/*,favicon.ico,apple-touch-icon.png}",
	# Template handlebar files
	handlebars: "./{**/,}*.handlebars",
	# Sass files
	sass: "assets/css/{**/,}*.{scss,sass}",
	# Coffeescript files
	coffee: "assets/js/**/*.coffee",
	# Javascript files
	js: "assets/js/**/*.js",
	# Image files
	images: "assets/images/**/*.{jpg,png}"
}

# Includes

gulp = require 'gulp'
tap = require 'gulp-tap'
gutil = require 'gulp-util'
plumber = require 'gulp-plumber'
runSeqeuence = require 'run-sequence'
gif = require 'gulp-if'
order = require 'gulp-order'

rename = require 'gulp-rename'
fs = require 'fs'
clean = require 'gulp-rimraf'
copy = require 'gulp-copy'

handlebars = require 'gulp-compile-handlebars'
Handlebars = require 'handlebars'
htmlmin = require 'gulp-minify-html'

sass = require 'gulp-sass'

coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'

sourcemaps = require 'gulp-sourcemaps'

reload = require 'gulp-livereload'


retinaPath = (path) ->
	comps = path.split('.')
	"#{comps[0]}#{retina_suffix}.#{comps[1]}"

onError = (err) ->
	console.log err

isFile = (str) ->
	!str.match "\n" && fs.existsSync str

readPartial = (name) ->
	path = 'partials/' + name + '.handlebars'
	val = fs.readFileSync path, 'utf8' if isFile path

	val

# Delete all files in the output directory
gulp.task 'clean', (cb) ->
	gulp.src(build_path)
		.pipe(plumber { errorHandler: onError } )
		.pipe(clean { force: false, read: true } )

# Compile Coffesscript files, generate source maps and
# concat into app.js
gulp.task 'coffee', ->
	gulp.src(paths.coffee)
		.pipe(sourcemaps.init())
		.pipe(coffee({bare: true}))
		.pipe(concat('app.js'))
		.pipe(gif(config.production, uglify()))
		.pipe(sourcemaps.write('./maps'))
		.pipe(gulp.dest("#{build_path}/js"))
		.pipe(reload())

# Concatenate vendor javascript files and generate
# source map.
gulp.task 'jsvendor', ->
	gulp.src(paths.js)
		.pipe(sourcemaps.init())
		.pipe(order([
			'jquery.js'
		]))
		.pipe(concat('vendor.js'))
		.pipe(gif(config.production, uglify()))
		.pipe(sourcemaps.write('./maps'))
		.pipe(gulp.dest("#{build_path}/js/"))
		.pipe(reload())

# Process all script files
gulp.task 'scripts', ['coffee', 'jsvendor']

# Copy image files into /public/images
gulp.task 'images', ->
	gulp.src(paths.images)
		.pipe(plumber({
			errorHandler: onError
		}))
	.pipe(gulp.dest("#{build_path}/images"))
		.pipe(reload())

# Copy other static files into /public
gulp.task 'copy', ->
	gulp.src(paths.copyfile)
		.pipe(copy(build_path))

# Compile Sass into css
gulp.task 'sass', ->
	sass_paths = ['./assets/css/vendor/bourbon', './assets/css/vendor/neat']
	sass_config = { 
		includePaths:  sass_paths,
		imagePath: config.imgpath
	}

	if config.production
		sass_config['outputStyle'] = 'compressed'
		sass_config['sourceComments'] = false

	gulp.src(paths.sass)
		.pipe(plumber({ errorHandler: onError }))
		.pipe(sourcemaps.init())
		.pipe(sass(sass_config))
		.pipe(sourcemaps.write('./maps'))
		.pipe(gulp.dest("#{build_path}/css"))
		.pipe(reload())

# Compile handlebar files into html
gulp.task 'html', ->
	data = {
		config: config,
		site: site
	}

	template_data = {
		"index.handlebars": {
			title: "Home"
		}
	}

	options = {
		ignorePartials: true,
		partials: {
			reload: reload_script
			header: readPartial('header'),
			footer: readPartial('footer'),
		},
		helpers: {
			img: (path, retina = true, cls = null) ->
				rp = retinaPath(path)
				str = "<img src=\"#{config.imgpath}/#{path}\""
				str += " data-at2x=\"#{config.imgpath}/#{rp}\"" if retina
				str += " class=\"#{cls}\"" if typeof cls == 'string'
				str += ">"

				return str
		}
	}

	gulp.src([paths.handlebars, '!partials/*', "!node_modules/**/*"])
		.pipe(plumber({ errorHandler: onError }))
		.pipe(tap((file, t) ->
			relative = file.path.substring file.base.length, file.path.length
			data['template'] = template_data[relative]
		))
		.pipe(handlebars(data, options))
		.pipe(rename { extname: ".html" })
		.pipe(gif(config.production, htmlmin()))
		.pipe(gulp.dest(build_path))
		.pipe(reload())

# Continously compile everything and livereload changes
gulp.task 'watch', ->
	reload.listen(config.port)

	gulp.watch paths.copyfile, ['copy']
	gulp.watch paths.coffee, ['scripts']
	gulp.watch paths.js, ['scripts']
	gulp.watch paths.handlebars, ['html']
	gulp.watch paths.sass, ['sass']
	gulp.watch paths.images, ['images']

gulp.task 'set-production', ->
	config.production = true

gulp.task 'cleanbuild', ->
	runSeqeuence 'clean', 'build'

gulp.task 'build', ['html', 'sass', 'scripts', 'images', 'copy']
gulp.task 'release', ['set-production', 'cleanbuild']

gulp.task 'default', ['cleanbuild', 'watch']
