# never let user input go into a system command
system(". monday.sh")
require_relative 'gemfile_updater.rb'

gem_manager = GemfileUpdater.new
gem_manager.updateRailsCarefully()
