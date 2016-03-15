
class DisplayList
  def initialize(list, completed)
    @list = list
    @completed = completed
  end

  def display_list
    puts "List o'stuff t'do!"
    @list.each_with_index do |x, y|
      puts "#{y+1}. #{x}"
    end
  end
end
