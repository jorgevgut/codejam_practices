#require 'tree'
filename = ARGV.first
file = File.open(filename)
out = File.open("result.out","w")

test_cases = file.readline.chomp.to_i

#Bad magician!
#VOlunteer cheaded!
for i in (0..(test_cases-1))

  result = ""

  first_q = file.readline.chomp.to_i #answer to first
  #then we need to capture first arrangement of cards 
  cards_original = []
  #four times
  cards_original.push(file.readline.chomp.split.map(&:to_i))
  cards_original.push(file.readline.chomp.split.map(&:to_i))
  cards_original.push(file.readline.chomp.split.map(&:to_i))
  cards_original.push(file.readline.chomp.split.map(&:to_i))

  #then the answer to the second question
  last_q = file.readline.chomp.to_i
  
  #then final cards arrangement
  cards_last = []
  cards_last.push(file.readline.chomp.split.map(&:to_i))
  cards_last.push(file.readline.chomp.split.map(&:to_i))
  cards_last.push(file.readline.chomp.split.map(&:to_i))
  cards_last.push(file.readline.chomp.split.map(&:to_i))
  
  #find result
  first_row = cards_original[first_q-1]
  last_row = cards_last[last_q-1]
  
  counter = 0 #counter of how many cards are consistant
  card = ""
  for j in first_row
    if last_row.include?(j)
      counter += 1
      card = j
    end  
  end
  
  if(counter == 1)
    result = card
  elsif counter == 0
    result = "Volunteer cheated!"
  else
    result = "Bad magician!"

  end
  out.write("Case ##{i+1}: #{result}\n")
  
end

file.close
out.close

