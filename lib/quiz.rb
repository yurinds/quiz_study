class Quiz
  attr_reader :questions, :question_index, :right_answers, :questions_size, :first_time

  def initialize(questions)
    @questions = questions.shuffle
    @question_index = 0
    @questions_size = @questions.size
    @right_answers = 0
  end

  def time_over?
    second_time = Time.now

    (second_time - @first_time).abs.to_i > current_question.time
  end

  def next_question
    @first_time = Time.now
    @questions[@question_index]
  end

  def quiz_complete?
    @questions_size == @question_index
  end

  def right_answer?(user_answer)
    answer_is_right = false
    if current_question.right_answer?(user_answer)
      @right_answers += 1
      answer_is_right = true
    end
    @question_index += 1

    answer_is_right
  end

  private

  def current_question
    @questions[@question_index]
  end
end
