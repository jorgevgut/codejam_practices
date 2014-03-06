filename = ARGV.first


#in the intersection functions line is to be an array of lines
#and ci is current number of intersections
def intersection(line,ci) 
  size = line.size
  n_int = ci #starts with 0 intersections
  if size == 1 then
    return n_int
  else
    cw = line.pop
    size = line.size
    for i in (0..(size -1))
      ew = line[i]
      if !((cw[0] <= ew[0] and cw[1] <= ew[1])  or  (cw[0] >= ew[0] and cw[1] >= ew[1])) 
      then
        n_int = n_int+1
      end
    end
  end
  return intersection(line,n_int)
end

file = File.open(filename)
out = File.open('result.out','w')

test_cases = file.readline.chomp.to_i

for i in (0..(test_cases-1))
          
  #get input
  n_of_lines = file.readline.chomp.to_i
  lines = Array.new
  for j in (0..(n_of_lines-1))
    lines.push(file.readline.split.map(&:to_i))
  end
  intersections = intersection(lines,0)
  
  str = "Case ##{i+1}: #{intersections} \n"
  #calculate number of intersections
  out.write(str)
          
end

out.close
