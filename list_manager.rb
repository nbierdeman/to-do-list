module ListManager
  def add_to_do(task, notes=nil, location=nil, complete=false)
    list << ToDo.new(task, notes, location, complete)
    puts "#{task} added to #{self.name}!"
  end
  def remove_to_do(identifier)
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
  def find(identifier)
      list.collect do |to_do|
        to_do if to_do.values.include?(identifier)
      end.compact
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
