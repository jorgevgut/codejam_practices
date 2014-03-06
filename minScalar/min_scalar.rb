filename = ARGV.first

file = File.open(filename)
out = File.open('result.out','w')

size = file.readline.chomp.to_i

puts "The # of cases is #{size}"

for i in (0..(size-1))
  n = file.readline.chomp.to_i
  v1 = file.readline.split.map(&:to_i)
  v2 = file.readline.split.map(&:to_i)
  result = 0
  
  v1 = v1.sort
  v2 = v2.sort.reverse
  out_r =""
  
  for j in (0..(n-1))
    result = result + v1[j]*v2[j]
    
  end
  out_r = "Case ##{i+1}: #{result}\n"
  out.write(out_r)
end
out.close
