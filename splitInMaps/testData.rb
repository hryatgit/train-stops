def testData
  lng = 1000
  prtLog('all data (sets)', lng)
  data = Array.new
  (1..(lng)).each { |value|
    data << value
  }
  data
end