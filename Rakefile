require 'rubygems'
require 'compass'

desc "Setup a new static site with Pow"
task :setup, :name do | t, args |
  puts "# Setting up new site..."
  puts args

  if !FileTest.directory?(ENV['HOME'] + "/.pow") then
    abort("# Aborted!\n#\n# You need to install Pow before setting up the site.\n# Run the Pow installtion command like so:\n# curl get.pow.cx | sh")
  end

  current_dir = Dir.getwd
  if args[:name] then
    project_name = args[:name]
  else
    project_name = File.basename(current_dir)
  end

  puts "# Installing virtual host with pow"
  if File.exists?(ENV['HOME'] +"/.pow/#{project_name}") then
    abort("# Aborted!\n#\n# A project with the name #{project_name} already exists!")
  end

  system "ln -s #{current_dir} " + ENV['HOME'] + "/.pow/#{project_name}"

  puts "# Setting up folder structure"
  Dir.mkdir("#{current_dir}/images") unless File.exists?("#{current_dir}/images")
  Dir.mkdir("#{current_dir}/fonts") unless File.exists?("#{current_dir}/fonts")

  puts "# Generating stylesheets"
  system "compass compile -e production"
end

desc "Generate a production ready website"
task :generate do
  puts "# Generating site..."
  system "compass compile -e production"
end

desc "Watch the site and regenerate when it changes"
task :watch do
  puts "# Starting to watch site for changes"

  compassID = Process.spawn("compass watch -e development")

  trap("INT") {
    Process.kill(9, compassID) rescue Errno::ESRCH
  }

  Process.wait(compassID)
end