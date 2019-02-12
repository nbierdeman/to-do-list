require_relative 'to_do'
class ToDoList
  attr_accessor :name, :list
  def initialize(name="To-do")
    @name = name
    @list = []
  end
  def new(task, notes=nil, location=nil, complete=false)
    list << ToDo.new(task, notes, location, complete)
  end
end
