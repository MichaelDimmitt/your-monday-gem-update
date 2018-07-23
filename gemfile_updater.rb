class GemfileUpdater
  # leving as system because it will have the same overhead as bash script
  system("echo 'should never run before monday.sh'")

  def careful (whatToDoString)
    ## careful will log what it is to do string, stored in .temp/log.txt
    ## then store the current gemfile in the .temp directory
    ## if a gemfile exists it will store the diff from curr gemfile to next gemfile as a new file in .temp directory.
    puts "#{whatToDoString} was called"

  end
  def updateRailsCarefully
    puts 'update rails carefully reached'
    action="bundle update rails"
    careful(action)
    system(action)
  end
end
