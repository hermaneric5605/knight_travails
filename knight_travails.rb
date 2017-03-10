#create game board
class GameBoard
	attr_accessor :position, :path 
	def initalize(position, path)
		@position = position
		@path = path
	end
end

#knight's movements

def knight_moves(start, finish)
	return"You entered an invalid starting position" unless is_valid_position?(start)
	return "You entered an invalid ending position" unless is_valid_position?(finish)
	return "You're already on that position" if start == finish

	queue = [GameBoard.new(start, [start])]
	visited = [start]
	until queue.empty?
		#make the first GameBoard in the queue the current GameBoard
end