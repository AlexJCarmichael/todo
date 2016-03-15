# After users start the program they should be
# able to add new todos.
# Users should be able to "mark" existing todos as complete.
# This means an "incomplete" todo and a
#"complete" todo should be visible different on the command line.

require_relative '../lib/completed_list.rb'
require_relative '../lib/to_do_list.rb'
require_relative '../lib/list_manager.rb'
require_relative '../lib/display_list.rb'

list = ToDoList.new.list
completed = CompletedList.new.comp_list
manager = ListManager.new(list, completed)
display = DisplayList.new(list, completed)

class ToDo
  def start(manager, display)
    ethos
    loop do
      give_options
      selection = gets.chomp
      case
      when selection == "1"
        puts "What is the task(s) you wish to add to the list? When you are finished type 0."
        task = gets.chomp
        until task == "0"
          manager.add_item(task)
          system('clear')
          puts "Reminder, type 0 to exit"
          display.display_list
          task = gets.chomp
        end
      when selection == "2"
        puts "What is the task that you wish to add to the list?"
        task = gets.chomp
        system('clear')
        manager.add_item(task)
        display.display_list
      when selection == "3"
        puts "What is the number of the task have you finished?"
        puts "An invalid input will erase the last item on the list."
        display.display_list
        remove = gets.chomp.to_i
        system('clear')
        manager.remove_item(remove)
        display.display_completed_list
      when selection == "4"
        system('clear')
        display.display_list
      when selection == "5"
        system('clear')
        display.display_completed_list
      when selection == "6"
        system('clear')
        puts "G'day!"
        exit
      else
        puts "Please make a valid selection of 1-6."
      end
    end


  end

  def ethos
    puts "This program allows the user to create, and add to, a to-do list."
  end

  def give_options
    puts "What would you like to do?"
    puts "1. Create a list."
    puts "2. Add to a list."
    puts "3. Mark a task completed."
    puts "4. View list."
    puts "5. View completed list."
    puts "6. Quit the program."

  end
end

ToDo.new.start(manager, display)
