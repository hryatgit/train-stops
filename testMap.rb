
def f1
  
  hash = { :a => 2, :b => 7 , :c => 12 }
  sum = 0  
  hash.keys().each { |key|  sum += hash[key] }
  sum
end

puts f1