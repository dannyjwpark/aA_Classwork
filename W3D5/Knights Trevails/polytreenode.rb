class PolyTreeNode
  attr_accessor :parent, :value, :children

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(parent_node)
    return if @parent == parent_node
    old_parent = @parent.clone

    if old_parent != nil
      old_parent.children.delete(self)
    end

    @parent = parent_node

    if parent_node != nil 
      @parent.children << self
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    if !child_node.nil? && !self.children.include?(child_node)
      raise_error
    end
    child_node.parent = nil
  end

  def dfs(target)
    return self if @value == target
    
    self.children.each do |child|
      search_result = child.dfs(target)
      if !search_result.nil?
        return search_result
      end
    end
    nil
  end

  def bfs(target)
    # FIFO
    queue = [self]

    until queue.empty?
      element = queue.shift
      p "element : #{element}"
      return element if element.value == target
      element.children.each do |child|
        queue << child if child != nil
      end
      # p "queue: #{queue}"
    end

    puts

  end

end
