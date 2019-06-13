puts 'Hello incrementIntAsArray'
puts 'INIT VALUES'
puts '========================='

allSamples = {
  :emptyArray    => [],           # invalide
  :minValueArray => [ 0 ],        # 0  
  :minLngArray   => [ 9 ],        # 9
  :randomAsArray => [ 1, 3, 6 ],  # 136
  :oneCurry      => [ 1, 3, 9 ],  # 139
  :twoCurry      => [ 1, 9, 9 ],  # 199
  :allCurry => [ 9, 9, 9 ] } # 999
  
def incrementIntAsArray arr
  i = arr.length-1; curry = arr.length
  while i >= 0 and curry > 0 do
    arr[i] += 1 and curry = 0  if curry  > 0
    arr[i]  = 0 and curry = 1  if arr[i] == 10
    i += (-1)
  end
  arr = ([1] + arr) if curry > 0
  arr
end

allSamples.keys.each { |k| 
  puts [ k.to_s.rjust(14), allSamples[k]].join(', ') 
}
 
puts '' 
puts 'INCREMENTED' 
puts '========================='
allSamples.keys.each { |k|
  puts [ 
    k.to_s.rjust(14), 
    incrementIntAsArray(allSamples[k])
  ].join(', ')
}
