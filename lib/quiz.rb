class Quiz
  attr_reader :questions, :question_index, :right_answers, :questions_size

  def initialize(questions)
    @questions = questions
    @question_index = 0
    @questions_size = @questions.size
    @right_answers = 0
  end

  def mix_questions
    @questions.sort_by! { rand }
  end

  def quiz_complete?
    @questions_size == @question_index
  end

  def next_question
    question = @questions[@question_index]
    @question_index += 1
    question
  end

  def update_right_answers
    @right_answers += 1
  end
end
