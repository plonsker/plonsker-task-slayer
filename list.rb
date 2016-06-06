require 'csv'
require_relative 'task'


class List

  attr_accessor :task_array

  def initialize
    @list_array = []
    filename = './source/todo.csv'

    CSV.foreach(filename) do |single_task|
      @list_array.push(Task.new(single_task[0]))
    end
  end

  def add_task(new_task)
     @list_array.push(Task.new("- #{new_task}"))

  end

  def delete_task_by_keyword(word)

    @list_array.delete_if{|task|
      task.task_text.downcase.include?(word)}

  end
  def delete_task_by_number(number)
    @list_array.delete_at(number.to_i)
  end

  def accomplish_task_by_keyword(word)
    @list_array.each do |task|
      if task.task_text.include?(word)
        task.accomplished
      end
    end
  end


  def accomplish_task_by_number(number)
    @list_array[number.to_i - 1].accomplished
  end

  def update_list_file
    CSV.open("./source/todo.csv", "wb") do |csv|
      @list_array.each do |task|
        csv << [task.task_text]
      end

    end
    end


  def to_s
    @list_array.each {|individual_task| individual_task}.join
  end


end
