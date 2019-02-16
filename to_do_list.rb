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
  def mark_complete(identifier)
    list.each do |to_do|
      to_do.complete = true if to_do.values.include?(identifier)
    end
  end
  def mark_incomplete(identifier)
    list.each do |to_do|
      to_do.complete = false if to_do.values.include?(identifier)
    end
  end
end
