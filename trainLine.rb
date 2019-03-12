require 'trainLineAdmin'
class TrainLine <Struct.new(:trainLineName, :stopList)
  include AvailableLines
  
  def initialize trainLineName
    super
    addStops
  end
  def self.getAllLineNames
    AVAILABLE_LINES
  end
  def addStops
    neededModuleTrainStops = Module.const_get(trainLineName)
    singleton_class.send(:include, neededModuleTrainStops)
    self.stopList = neededModuleTrainStops::STOPS
  end
  def getLineName
    trainLineName
  end
  def getAllStops
    stopList
  end
end
