
require 'csv'

class CSVOutput
  attr_accessor :list
  def initialize(list)
    @list = list
  end

  def output_csv
    CSV.open("to_do_resume.csv", "w+") do |csv|
      @list.each_with_index do |x, y|
        csv << ["#{y+1}.", " #{x}"]
      end
    end
  end

  def resume_list
    resume = []
    CSV.foreach('to_do_resume.csv') do |row|
      resume.push(row)
    end
    @list = resume.map{ |x,y| y.strip }
  end
end
