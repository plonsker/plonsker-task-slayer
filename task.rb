class Task
  attr_reader :task_text
  attr_accessor :accomplished

  def initialize(single_task)
    @task_text = single_task
    @accomplished = "[ ]"

  end

  def accomplished
    @accomplished = '[ x ]'
  end

  def accomplished?
    @accomplished == '[ x ]' ? true : false
  end

  def to_s
    if @accomplished == '[ x ]'
      "#{@accomplished} #{@task_text}\n"
    else
      "[ ] #{@task_text}\n"
    end
  end

end

