module ListManager
  def add_to_do(task, notes=nil, location=nil, complete=false)
    list << ToDo.new(task, notes, location, complete)
    puts "'#{task}' added to '#{self.name}.'"
  end
  def remove_to_do(identifier)
    removed = list.collect do |to_do|
      to_do if to_do.values.include?(identifier)
    end.compact
    removed.each { |to_do| puts "'#{to_do.task}' removed from '#{self.name}.'" }
    list.delete_if { |to_do| to_do.values.include?(identifier) }
  end
  def remove_all
    list.clear
    puts "All to-do's have been removed from '#{self.name}.'"
  end
  def mark_complete(identifier, status=true)
    list.each do |to_do|
      to_do.complete = status if to_do.values.include?(identifier)
    end
    message = "Items matching '#{identifier.to_s}' in '#{self.name}' "\
              "have been marked as complete."
    puts message
  end
  def find(identifier)
      found = list.collect do |to_do|
        to_do if to_do.values.include?(identifier)
      end.compact
      found.each { |to_do| puts "'#{to_do.task}' found in '#{self.name}.'" }
  end
  def print_list(complete=false)
    list.each do |to_do|
      if to_do.complete == complete
        puts "Task: #{to_do.task}"
        puts "Notes: #{to_do.notes}"
        puts "Location: #{to_do.location}"
        puts ""
      end
    end
  end
  def print_all
    list.each do |to_do|
      puts "Task: #{to_do.task}"
      puts "Notes: #{to_do.notes}"
      puts "Location: #{to_do.location}"
      puts ""
    end
  end
end
