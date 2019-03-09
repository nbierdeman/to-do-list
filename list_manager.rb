module ListManager
  # add a to-do to an existing to-do list
  def add_to_do(task, notes=nil, location=nil, complete=false)
    list << ToDo.new(task, notes, location, complete)
    puts "'#{task}' added to '#{self.name}.'"
  end
  # remove a to-do from an existing to-do list
  def remove_to_do(identifier)
    removed = list.collect do |to_do|
      to_do if to_do.values.include?(identifier)
    end.compact
    removed.each { |to_do| puts "'#{to_do.task}' removed from '#{self.name}.'" }
    list.delete_if { |to_do| to_do.values.include?(identifier) }
  end
  # remove all to-dos from an existing to-do list
  def remove_all
    list.clear
    puts "All to-do's have been removed from '#{self.name}.'"
  end
  # mark a to-do complete (status=true) or incomplete (status=false)
  # based on an identifier (i.e. task, notes, location, complete, etc.)
  def mark_complete(identifier, status=true)
    complete = list.collect do |to_do|
      to_do if to_do.values.include?(identifier)
    end.compact
    complete.each do |to_do|
      if to_do.complete == false
        puts "'#{to_do.task}' marked as complete in '#{self.name}.'"
      else
        puts "'#{to_do.task}' marked as incomplete in '#{self.name}.'"
      end
    end
    list.each do |to_do|
      to_do.complete = status if to_do.values.include?(identifier)
    end
  end
  # print complete, incomplete, or all to-dos
  def print_list(complete=false, all=false)
    case all
    when false
      list.each do |to_do|
        if to_do.complete == complete
          puts "Task: #{to_do.task}"
          puts "Notes: #{to_do.notes}"
          puts "Location: #{to_do.location}"
          puts ""
        end
      end
    when true
      list.each do |to_do|
        puts "Task: #{to_do.task}"
        puts "Notes: #{to_do.notes}"
        puts "Location: #{to_do.location}"
        puts ""
      end
    end
  end
end
