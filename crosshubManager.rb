class CrossHubManager
  # purpose: analyze stop lists for all known trains
  # and create hub (: cross point) objects for common stops 
  def initialize allTrainLines
    # allTrainLines: list of objects representing all known train lines 
    @allHubs = Hash.new()
    allTrainLines.each { |trainLine|
      allTrainLines.each { |anotherTrainLine|
        next if trainLine.getLineName == anotherTrainLine.getLineName
        trainLine.getAllStops.each { |trainLineStop|
          anotherTrainLine.getAllStops.each { |anotherTrainLineStop|
            next unless trainLineStop == anotherTrainLineStop
            crossingLines = [ trainLine.getLineName, anotherTrainLine.getLineName ]
            (@allHubs[trainLineStop.to_sym] = CrossHub.new(trainLineStop, crossingLines)) and next if @allHubs[trainLineStop.to_sym].nil?
            @allHubs[trainLineStop.to_sym].addLines(crossingLines)
          }
        }
      }
    }
  end
  def getAllHubNamesTrainLinesIncluded
    # purpose: list all by instance managed hubs  (train line cross points),
    # also, list all train lines doing stop at respective hub
    @allHubs.keys.map { |key|
      [ key.to_s.ljust(10),
      @allHubs[key].getAllLines.inspect].join(':: ')
    }
  end
  def listLayOverOptionsPerLine knownTrainLines
    # knownTrainLines: list of train line objects supposed to be analyzed
    #
    # purpose: for each train line, list all hub stops this line is crossing,
    # also each hub stop, list all available connecting lines
    knownTrainLines.map { |trainLine|
      trainLineHubs = Array.new
      @allHubs.keys.map { |hubKey|
        hub = @allHubs[hubKey]
        next unless hub.getAllLines.include?(trainLine.getLineName)
        trainLineHubs << hub.getName
        otherTrains = hub.getAllLines.clone
        otherTrains.delete(trainLine.getLineName)
       [[ trainLine.getLineName, hub.getName].join(':').ljust(17), [otherTrains].join('|')].join(' => ')
      }
    }
  end
end

class CrossHub <Struct.new(:hubName, :trainList)
  # hubName:   train line stop name, common to two or more train lines (cross point)
  # trainList: trains, making stop at this hub (objects representing train lines)
  #
  # purpose: represent one train stop as common stop for (but not limited to) least two train lines
  def initialize hubName, trainList
    super
  end
  def addLines crossingLines
    crossingLines.each { |line|
      next if self.trainList.include?(line)
      self.trainList  << line
    }
  end
  def getAllLines
    trainList
  end
  def getName
    hubName
  end
end