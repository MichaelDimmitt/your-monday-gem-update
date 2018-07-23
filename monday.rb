# never let user input go into a system command
system(". monday.sh")
## the below command needs to change in the future
## probably get the name of the first branch and then pass it in here.
## or always create a new branch called monday-update
system("git checkout start-interacting-with-gems")
system("gem install bundler")
system("bundle install")
require_relative 'gemfile_updater.rb'

gem_manager = GemfileUpdater.new
gem_manager.updateRailsCarefully()
