require "./problem.rb"

filename = ARGV.first
outputname = "result.out"

line = ""

file = File.open(filename)
output = File.open(outputname,'w')

counter = 0
games = []
size = 0
matrix_count = 0
curr_game = []
file.each_line do 
  |l|
  if counter == 0
    size = l.to_i
  elsif matrix_count == 4
    matrix_count = 0
    games.push(curr_game)
    curr_game = []
  else
    temp = l.split(//)
    temp.delete("\n")
    curr_game.push(temp)
    matrix_count+=1
  end
  counter+=1
end
puts "Juegos"
print games[0][0]
gcount=0
games.each do
  |g|
  game = Tomek.new
  puts "Current game #{g}"
  
  game.setGame(g)

  res = game.getGameResult
  puts res
  line_res = "Case ##{gcount+1}: #{res}\n"
  output.write(line_res)
  gcount+=1
end

# game = Tomek.new
# game.setGame(gameData)
# puts game.getGameResult

output.close()
