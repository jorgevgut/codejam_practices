filename = ARGV.first
file = File.open(filename)

numbers = file.readline.split.map(&:to_i)
L = numbers[0]
D = numbers[1]
N = numbers[2]

dictionary = []

for i in (0..D-1) do

  dictionary.push(file.readline.chomp)

end


out = File.open("r.out","w")

for j in (0..N-1)
  line = file.readline.chomp
  line = line.gsub(/[(]/,"[") 
  line = line.gsub(/[)]/,"]")

  regex = Regexp.new line

  match = 0
  for word in dictionary do
    #word  - [asbp]alabra
    if word =~ regex
      match+=1
    end
  end
  output = "Case ##{j+1}: #{match}\n"
  out.write(output)

end
out.close
