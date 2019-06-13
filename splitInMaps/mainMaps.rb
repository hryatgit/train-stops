require_relative 'map'
require_relative 'testData'
require 'objspace'

def prtLog(msg, param1)
  sepStr = param1.nil? ? '' : ': '
  puts [ msg.rjust(28), param1.to_s.rjust(4) ].join(sepStr)
end

prtLog('Hello mainMaps', nil)

allDataSets    = testData
setsToProcess  = allDataSets.length
setsPerMap     = 120
map_mem_size   = (ObjectSpace.memsize_of(allDataSets) / setsToProcess) * setsPerMap
mapsNeeded     = setsToProcess / setsPerMap
remainingSets  = setsToProcess % setsPerMap
allMapObjects  = []
readPointer    = 0 

(0..(mapsNeeded - 1)).each { |i|
  dataSet = allDataSets[readPointer..(readPointer + setsPerMap - 1)]
  allMapObjects <<  Map.new(i, dataSet)
  readPointer += setsPerMap
}

if remainingSets > 0 then
  dataSet = allDataSets[readPointer..(readPointer + remainingSets - 1)]
  mapIdNumber = mapsNeeded
  allMapObjects <<  Map.new(mapIdNumber, dataSet)
end

prtLog('setsInMap', setsPerMap)
prtLog('number full maps', mapsNeeded)
prtLog('mapData mem size (bytes)', map_mem_size)
prtLog('+ 1 last map (setsInThisMap)', remainingSets) unless remainingSets == 0
  
allMapObjects.each { |map|
  prtLog([ ['mapNr', map.getNr ].join(': ') , '=> [', map.getData, ']' ].join(' '), nil)
}

