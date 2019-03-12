require 'trainLineAdmin'
class TrainLine <Struct.new(:trainLineName, :stopList)
  include ValidTrainLines
  
  def initialize trainLineName
    super
    addStops
  end
  def self.getAllLineNames
    VALID_TRAIN_LINES
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
