require_relative 'to_do'
require_relative 'list_manager'
class ToDoList
  include ListManager
  attr_accessor :name, :list
  def initialize(name="To-Do")
    @name = name
    @list = []
  end
end
