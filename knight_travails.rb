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
		current = queue.shift

		#find all possible moves for the current position that have not already been visited
		possible_moves = possible_moves(current.position).select { |move| !visited.include?(move) }

		#if the current position's possible moves include the finishing position, add the finishing position to the current path
		if possible_moves.include?(finish)
			current.path << finish
			if current.path.size-1 == 1
				puts "You made it in #{current.path.size-1} moves!  Here's your path"
			else
				puts "You made it in #{current.path.size-1} moves!  Here's your path"
			end
			current.path.each { |pos| p pos }
			return
		end

		#If the finishing position is not in the current possible moves list, add each possible move to the queue and create a new GameBoard with an updated path
		possible_moves.each do |move|
			queue << GameBoard.new(move, (current.path + [move]))
			visited << move
		end
	end
end

		# create the possible moves for a given position on the board and remove invalid moves
		def possible moves(pos)
			changes = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [2, -1], [2, 1], [1, -2], [1, 2]]
			moves = []
			changes.each { |change| moves << [pos[0] + change[0], pos[1] + change[1]]}
			moves.select { |move| is_valid_position?(move) }

		end

		# valid position would appear on an 8x8 chess board
		def is_valid_position(pos)
			return (pos[0] > -1 && pos[0] < 8) && (pos[1] > -1) && pos[1] < 8) ? true : false
		end

		puts knight_moves([3, 3], [4, 3])