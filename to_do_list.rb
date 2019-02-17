require_relative 'to_do'
class ToDoList
  attr_accessor :name, :list
  def initialize(name="To-do")
    @name = name
    @list = []
  end
  def add_item(task, notes=nil, location=nil, complete=false)
    list << ToDo.new(task, notes, location, complete)
  end
  def remove_item(identifier)
    list.delete_if { |to_do| to_do.values.include?(identifier) }
  end
  def remove_all
    list.clear
  end
  def mark_complete(identifier, status=true)
    list.each do |to_do|
      to_do.complete = status if to_do.values.include?(identifier)
    end
  end
end
