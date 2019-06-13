class Map < Struct.new(:mapNr, :dataSet)
  def initialize mapNr, dataSet
    @data = dataSet
    super
  end

  def getData
    @data
  end
  def getNr
    mapNr
  end
end