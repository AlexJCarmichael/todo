# After users start the program they should be
# able to add new todos.
# Users should be able to "mark" existing todos as complete.
# This means an "incomplete" todo and a
#"complete" todo should be visible different on the command line.

require_relative '../lib/completed_list.rb'
require_relative '../lib/to_do_list.rb'
require_relative '../lib/list_manager.rb'
require_relative '../lib/display_list.rb'
require_relative '../lib/console_input.rb'
require_relative '../lib/console_output.rb'
require_relative '../lib/io_adapter.rb'
require_relative '../lib/csv_output.rb'

list = ToDoList.new.list
input = ConsoleInput.new
output = ConsoleOutput.new
io = IOAdapter.new(input, output)
completed = CompletedList.new.comp_list
manager = ListManager.new(list, completed)
display = DisplayList.new(list, completed, io)
write = CSVOutput.new(list)


class ToDo
  def start(manager, display, io, write)
    ethos(io)
    loop do
      give_options(io)
      selection = io.gets.chomp
      case
      when selection == "1"
        puts "What is the task(s) you wish to add to the list? When you are finished type 0."
        task = io.gets.chomp
        until task == "0"
          manager.add_item(task)
          system('clear')
          puts "Reminder, type 0 to exit"
          display.display_list
          task = io.gets.chomp
        end
      when selection == "2"
        io.puts "What is the task that you wish to add to the list?"
        task = io.gets.chomp
        system('clear')
        manager.add_item(task)
        io.display.display_list
      when selection == "3"
        io.puts "What is the number of the task have you finished?"
        io.puts "An invalid input will erase the last item on the list."
        display.display_list
        remove = io.gets.chomp.to_i
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
        write.output_csv
      when selection == "7"
        system('clear')
         write.resume_list
         write.list.each do |add|
           manager.add_item(add)
         end
         display.display_list
      when selection == "8"
        system('clear')
        io.puts "G'day!"
        exit
      else
        io.puts "Please make a valid selection of 1-6."
      end
    end


  end

  def ethos(io)
    io.puts "This program allows the user to create, and add to, a to-do list."
  end

  def give_options(io)
    io.puts "What would you like to do?"
    io.puts "1. Create a list."
    io.puts "2. Add to a list."
    io.puts "3. Mark a task completed."
    io.puts "4. View list."
    io.puts "5. View completed list."
    io.puts "6. Save the to-do list as a file to resume later."
    io.puts "7. Resumes a saved to-do list."
    io.puts "8. Quit the program."

  end

end

ToDo.new.start(manager, display, io, write)
