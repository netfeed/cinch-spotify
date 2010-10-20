require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "cinch-spotify"
    gem.summary = %Q{Spotify plugin for the Cinch IRC framework}
    gem.description = %Q{A spotify plugin for the Cinch IRC framework}
    gem.email = "victor.bergoo@gmail.com"
    gem.homepage = "http://github.com/netfeed/cinch-spotify"
    gem.authors = ["Victor Bergoo"]
    gem.add_dependency "cinch"
    gem.add_dependency "nokogiri"
    gem.add_dependency "httpclient"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

