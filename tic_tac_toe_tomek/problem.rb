# Google Code Jam practice problem A QRound 2013
# Solution for the tic tac toe tomec

# gameData = [
#             ['X','X','X','T'],
#             ['.','X','.','.'],
#             ['O','O','X','.'],
#             ['.','.','.','X']
#            ]



class Tomek #class represents a Game
  
 
  def initialize()
    @empty = "."
    @p1 = "X"
    @p2 = "O"
    @neutral = "T"
    @result = "Game has not completed"  # Default value
    @game = []
    @winner = nil
  end

  def setGame(game)
    @game = game #set the game matrix
  end

  def getGameResult()
    
    # check X wise
    # 
    current_line = [nil,nil,nil,nil]
    #check top left to down right
    
    count = 0
    (0..3).each do 
      |i|
      current_line[count] = @game[i][count]
      count+=1
    end

    if(checkLine(current_line) == true)
      return who_won?(current_line)
    end

    # checo down left to right top
    count = 3
    (0..3).each do 
      |i|
      current_line[count] = @game[i][count]
      count-=1
    end

    if(checkLine(current_line) == true)
      return who_won?(current_line)
    end


    # check horizontal lines

    (0..3).each do
      |i|
      current_line = @game[i]
      if checkLine(current_line) == true
        return who_won?(current_line)
      end
    end

    # check vertical lines
    
    (0..3).each do
      |i|
      vert_line = []
      (0..3).each do 
        |j|
        vert_line.push( @game[j][i])
      end
      
      if checkLine(vert_line) == true
        return who_won?(vert_line)
      end
      
    end
    
    # No winner found, check is game is Draw or completed
    found_empty = false
    (0..3).each do |i|
      found_empty = (@game[i].count(@empty)>0)?true:false
      if found_empty == true
        break
      end
    end
    
    if found_empty == true
      return "Game has not completed"
    else
      return "Draw"
    end
    
  end
  
  
  #returns true if this line is a wining
  def checkLine(line)
    compact = line.uniq
    return (compact.include?(@empty)==false && (line.count(@p1)+line.count(@neutral)==4 || line.count(@p2)+line.count(@neutral)==4))?true:false;
  end

  #use online if you got a winning line
  def who_won?(line)
    for el in line
      if el!=@neutral
        return "#{el} won"
      end
    end
  end
  
  #for use only if game is still draw, looks if there are empty('.') squares
  def isCompleted?()
    for row in @game
      return (row.count(@empty)>0)?true:false
    end
  end
  
end

#Implementations

# game = Tomek.new
# game.setGame(gameData)
# puts game.getGameResult
