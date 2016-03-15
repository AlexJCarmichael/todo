# After users start the program they should be
# able to add new todos.
# Users should be able to "mark" existing todos as complete.
# This means an "incomplete" todo and a
#"complete" todo should be visible different on the command line.

require_relative '../lib/completed_list.rb'
require_relative '../lib/to_do_list.rb'
require_relative '../lib/list_manager.rb'

list = ToDoList.new
completed = CompletedList.new
manager = ListManager.new(list, completed)

class ToDo
  def start
    ethos
    give_options
    selection = gets.chomp
    # case selection


  end

  def ethos
    puts "This program allows the user to create, and add to, a to-do list."
  end

  def give_options
    puts "What would you like to do?"
    puts "1. Create a list."
    puts "2. Add to a list."
    puts "3. Mark a task completed."
    puts "4. Quit the program."

  end
end

ToDo.new.start
