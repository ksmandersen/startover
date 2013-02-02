# https://gist.github.com/408193

require 'rack'
require 'rack/contrib'
require 'rack-rewrite'

use Rack::StaticCache, :urls => ['/images','/style/css', '/js','/favicon.ico', '/fonts'], :root => "."
use Rack::ETag
use Rack::Rewrite do
  rewrite '/', '/index.html'
end
run Rack::Directory.new('.')