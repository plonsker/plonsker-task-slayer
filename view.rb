#This is the view that interacts with the user.
class View

  #User is greeted with the following message.

   #Here we will grab user input
  def get_user_input
    STDIN.gets.chomp
  end

  def greeting
    puts "Welcome to Task Slayer. Let's begin."
    puts
    puts "-------------------"
    puts
    puts "The following Symbols specify commands for navigating the program."
    puts "+: Add a task"
    puts "-: Delete a task"
    puts "*: Mark task as accomplished"
    puts "/: Exit Task Slayer"
    puts "=: View list"
    puts "help: display these options again"
    puts
    puts "-------------------"
    puts
  end

  def prompt
   puts "Specify action:"
 end



  #Here is what the program displays based on user input. This is dictated in the controller.
  def display(response_to_user)
    puts response_to_user
  end




end
