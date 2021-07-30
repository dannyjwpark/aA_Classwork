require_relative "polytreenode.rb"

class KnightPathFinder
  attr_reader :node, :considered_positions

  def initialize(pos)
    @node = PolyTreeNode.new(pos)
    @considered_positions = [pos]
    # @queue = [pos]
  end

  # valid move:
  def self.valid_moves(pos)
    # pos : current position
    x , y = pos
    possible_pos = [
      [x+1, y+2]
      [x+1, y-2]
      [x-1, y+2]
      [x-1, y-2]
      [x+2, y+1]
      [x+2, y-1]
      [x-2, y+1]
      [x-2, y-1]
    ]

    grid = Array.new(8){Array.new(8)}
    (0...8).each do |x|
      (0...8).each do |y|
        grid.push([x,y])
      end
    end

    possible_pos.select {|position| grid.include?(position)}

  end

  def new_move_positions(pos)
    remaining_new_positions = []

    valid_pos = KnightPathFinger.valid_moves(pos)

     # filter out positions that are already in @considered_positions
    valid_pos.each do |position|
      if !@considered_positions.include?(position)
        remaining_new_positions.push (position)
      end
    end

    # @considered_positions << remaining new positions
    remaining_new_positions.each do |position|
      @considered_positions << position
    end

    # return remaining new positions
    return remaining_new_positions
  end


  def build_move_tree
   self.root_node = PolyTreeNode.new(start_pos)

    queue = [node]
    until queue.empty?
      current_node = queue.shift

      current_pos = current_node.value
      next_move_pos(current_pos).each do |next_pos|
        next_node = PolyTreeNode.new(next_pos)
        current_node.add_childe(next_node)
        queue << next_node
      end
    end
    
  end

  def find_path

    #
    .build_move_tree
  end

end















  # #8 possible moves
  # 0,0 -> 2,1
  # 0,0 -> 1,2
  # 0,0 => -2,1
  # 0,0 -> -1,-2
  # 0,0 -> 2,-1
  # 0,0 -> 1,-2
  # 0,0 => -2,1
  # 0,0 -> -1,2
