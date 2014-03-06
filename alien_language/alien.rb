
# L lowercase letters, L tokens

# D words in the language, D lines follow

# N test cases, each on its OWN LINE, each has a pattern

# pattern consists of L tokens, all lowercase
# each token may be a group (abc)
#first LINE L,D,N

filename = ARGV.first
file = File.open(filename)
out = File.open("result.out",'w')
# L, D , N
numbers = file.readline.split.map(&:to_i)

L = numbers[0]
D = numbers[1]
N = numbers[2]

dictionary = []
for i in (0..(D-1)) 
    dictionary.push(file.readline.chomp)
end

#test cases

regex_dic = []
total=""
for i in (0..(N-1)) do 
  
  line = file.readline.chomp
  line = line.gsub(/[(]/,'[')
  line = line.gsub(/[)]/,']')
  match_counter = 0
  #iterate dictionary to find match
  regex = Regexp.new(line)
  for word in dictionary do
    if word=~regex
      match_counter+=1
    end
  end
  output = "Case ##{i+1}: #{match_counter}\n"  
  out.write(output)
end
out.close
