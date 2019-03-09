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
      # populate 'all_to_do_lists' array w/ all to-do lists
      ObjectSpace.each_object(self) do |instance|
        all_to_do_lists << instance
      end
      all_to_do_lists.each do |to_do_list|
        # populate 'found_list_names' array w/ list names that match 'identifier'
        found_list_names << to_do_list if to_do_list.name == identifier
        to_do_list.list.each do |to_do|
          # populate 'found_lists' array w/ to-do lists that match 'identifier'
          found_lists << to_do_list if to_do.values.include?(identifier)
          # populate 'found_to_dos' array of to-do's that match 'identifier'
          found_to_dos << to_do if to_do.values.include?(identifier)
        end
      end
      # output user message(s) based on results
      case identifier
      when found_list_names.each do |to_do_list|
        # output when a list name matches 'identifier'
        puts "A list named '#{identifier}' "\
        "was found." if to_do_list.name == identifier
        end
      when found_lists.each do |to_do_list|
        # output when any item within a list matches 'identifier'
        puts "An item matching '#{identifier}' "\
        "was found in a list named "\
        "'#{to_do_list.name}.'" if to_do_list.list.each do |to_do|
          to_do.values.include?(identifier)
          end
        end
      end
      # output when nothing is found
      puts "'#{identifier}' not found." if (found_list_names + found_lists + found_to_dos).count == 0
    end
  end
end
