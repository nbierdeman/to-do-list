class ToDoList
  attr_accessor :name, :list
  def initialize(name="To-do")
    @name = name
    @list = []
  end
end
