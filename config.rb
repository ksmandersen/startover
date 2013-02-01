# Environment setup
project_type      = :stand_alone
environment       = :production
http_path         = "/"

output_style      = (environment == :production) ? :compressed : :expanded
line_comments     = false
preferred_syntax  = :scss
relative_assets   = false

# File locations
css_dir           = "style/css"
sass_dir          = "style/sass"
fonts_dir         = "fonts"
images_dir        = "images"
javascripts_dir   = "js"

# Run bless. See http://blesscss.com/
# on_stylesheet_saved do |filename|
#     system('blessc',filename,'-f')
# end

# For responsive grid sites use susy
#require "susy"