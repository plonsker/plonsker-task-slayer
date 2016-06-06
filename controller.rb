require_relative 'view'
require_relative 'list'




class Controller
  attr_accessor :view, :list

  def initialize
    @view = View.new
    @list = List.new
    @view.greeting

    user_interface

  end



  def user_interface

    @view.display("")
    @view.prompt
    @view.display("")



    number_options = ["#", "number","num"]

  user_input = view.get_user_input

  #turn back into case statements

    until user_input == '/'
        if user_input == "+"
          @view.display("Add a task:")
          new_task = @view.get_user_input
          @list.add_task(new_task)
          @list.update_list_file
          @view.display("Task has been added to list.")
           # @view.display("")
          user_interface

        elsif user_input == "-"
          @view.display("Delete task by word or #?")
            user_input = view.get_user_input

            if user_input == "word"
              @view.display("Enter keyword:")
              word = @view.get_user_input
              @list.delete_task_by_keyword(word)
              @list.update_list_file
              @view.display("Task deleted.")
              user_interface

            elsif number_options.include?(user_input)
              @view.display("Enter number")
              number = @view.get_user_input
              @list.delete_task_by_number(number)
              @list.update_list_file
               @view.display("Task deleted")
              user_interface

            else
              @view.display("Task to delete not found! Specify another action please.")
              user_interface
            end

        elsif user_input == "*"
          @view.display("Complete task by word or #?")
            user_input = view.get_user_input

            if user_input == "word"
              @view.display("Enter keyword:")
              word = @view.get_user_input
              @list.accomplish_task_by_keyword(word)
              @list.update_list_file
              @view.display("Task completed.")
              user_interface

            elsif number_options.include?(user_input)
              @view.display("Enter number")
              number = @view.get_user_input
              @list.accomplish_task_by_number(number)
              @list.update_list_file
              @view.display("Task completed.")
              user_interface

            else
              @view.display("Task to mark as accomplished not found! Specify another action please.")
              user_interface
            end

          elsif user_input == "="
            @view.display(@list)
            user_interface

          elsif user_input == "help"
            Controller.new

          else
             @view.display("try again please.")
             user_interface
        end

        break

      end

  end

end


