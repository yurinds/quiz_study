class Quiz
  attr_reader :questions, :question_index, :right_answers, :questions_size, :is_first_question

  def initialize(questions)
    @questions = questions.shuffle
    @question_index = 0
    @questions_size = @questions.size
    @right_answers = 0
    @is_first_question = true
  end

  def time_over?(first_time, second_time)
    (second_time - first_time).abs.to_i > current_question.time
  end

  def current_question
    @questions[@question_index]
  end

  def quiz_complete?
    @questions_size == @question_index + 1
  end

  def is_first_question?
    @is_first_question
  end

  def next_question
    if is_first_question?
      @is_first_question = false
    else
      @question_index += 1
    end

    question = @questions[@question_index]

    question
  end

  def right_answer?(user_answer)
    if current_question.right_answer?(user_answer)
      @right_answers += 1
      return true
    end
    false
  end
end
