require 'trainLine'
require 'crosshubManager'
#########################
### MAIN
###
### purpose: analyze  and manage information about
### stops on train network. Train network consists 
### of two or more train lines, each represented by a line name.
### A train line has two or more stops, each represented by a stop name.
### Does one stop (stop name) belong to two or more different 
### train lines, then this stop is considered 
### to be a hub (cross point).
### UI functions:
###   list all train lines and stops on particular line
###   list all hubs (cross points), and belonging trains crossing this paticular hub
###   list hubs on a train route,
###   for each line list all connecting lines on particular hub on trains route
###
### To add, remove or modify a train line, edit 'trainLineAdmin.rb' file only. 
### 
#########################
puts [ 'Status:', Time.now].join(' ')
puts


def initAllTrainLines
  @allTrainLines = TrainLine.getAllLineNames.map { |lineName|
    TrainLine.new(lineName)
  }
end

def initAllCrosshubs
  @crossHubManager  = CrossHubManager.new @allTrainLines
end
### ##############################
def listAllTrainLines
  puts
  puts 'ALL TRAIN LINES'
  @allTrainLines.each { |l|
      puts [ l.getLineName.ljust(10), l.getAllStops.inspect ].join(':: ')
  }
end

def listAllTrainLinesOnCrossHub
  puts
  puts 'ALL HUBS (CROSS POINTS)'
  puts @crossHubManager.getAllHubNamesTrainLinesIncluded
end

def listAllLayOvers
  puts
  puts 'ALL LAY-OVER OPTIONS PER TRAIN LINE'
  puts @crossHubManager.listLayOverOptionsPerLine(@allTrainLines)
end

############## main ###############
# init
initAllTrainLines
initAllCrosshubs

# show results verify
listAllTrainLines
listAllTrainLinesOnCrossHub
listAllLayOvers

