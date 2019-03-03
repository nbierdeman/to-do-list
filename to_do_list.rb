require_relative 'to_do'
require_relative 'list_manager'
class ToDoList
  include ListManager
  attr_accessor :name, :list
  def initialize(name="To-Do")
    @name = name
    @list = []
  end
  class << self
    def find(identifier)
      all_to_do_lists = []
      found_list_names = []
      found_lists = []
      found_to_dos = []
      # create 'all_to_do_lists' array of all to-do lists
      ObjectSpace.each_object(self) do |instance|
        all_to_do_lists << instance
      end
      # create 'found_list_names' array of list names that match the identifier
      # create 'found_lists' array of to-do lists that match the identifier
      # create 'found_to_dos' array of to-do's that match the identifier
      all_to_do_lists.each do |to_do_list|
        found_list_names << to_do_list if to_do_list.name == identifier
        to_do_list.list.each do |to_do|
          found_lists << to_do_list if to_do.values.include?(identifier)
          found_to_dos << to_do if to_do.values.include?(identifier)
        end
      end
      # output user message
      if found_to_dos.any?
        found_to_dos.each do |to_do|
          puts "'#{to_do.task}' found in '#{found_lists[0].name}.'"
          found_lists.shift
        end
      else
        puts "No match found."
      end
    end
  end
end
