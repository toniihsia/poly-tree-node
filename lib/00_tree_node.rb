class PolyTreeNode
  attr_reader :parent, :value
  attr_accessor :children

  def initialize(value)
    @parent = nil
    @value = value
    @children = []
  end

  def parent=(node)
    if @parent
      @parent.children.select! { |child| child != self }
    end
    @parent = node
    node.children << self unless node.nil?
  end

  # sets a parent for a node
  def add_child(child_node)
    child_node.parent=(self)
    @children << child_node unless @children.include?(child_node)
    # self in this case is the parent
    # when you add children to a parent you're not only adding children to parent
    #but also adding a parent to the child_node
  end

  def remove_child(child_node)
    raise "That child doesn't exist!" unless @children.include?(child_node)
    self.children.delete(child_node)
    child_node.parent=(nil)
  end
end
