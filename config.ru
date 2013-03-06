# https://gist.github.com/408193

require 'rack'
require 'rack/contrib'
require 'rack-rewrite'

use Rack::StaticCache, :urls => ['/static/css', '/static/js', '/static/images', '/js','/favicon.ico', '/fonts', '/lang.json', '/generate.html'], :root => "."
use Rack::ETag
use Rack::Rewrite do
  rewrite '/', '/index.html'
  rewrite %r{/(\?.*)?}, '/index.html$1'
end
run Rack::Directory.new('.')