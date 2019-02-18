module ListManager
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
  def find(identifier)
      list.collect do |to_do|
        to_do if to_do.values.include?(identifier)
      end.compact
  end
  def print_list(status=false)
    printable = list.collect do |to_do|
      to_do if to_do.complete == status
    end.compact
    printable.each do |item|
      puts "Task: #{item.task}"
      puts "Notes: #{item.notes}"
      puts "Location: #{item.location}"
      puts ""
    end
  end
  def print_all
    list.each do |item|
      puts "Task: #{item.task}"
      puts "Notes: #{item.notes}"
      puts "Location: #{item.location}"
      puts ""
    end
  end
end
