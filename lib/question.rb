class Question
  attr_reader :time, :title, :answers, :right_answer

  def initialize(params)
    @time = params['time']
    @title = params['title']
    @answers = params['answers']
    @right_answer = params['right_answer']
  end

  def is_true?(_answer)
    answer = @right_answer
  end

  def show_question
    text = "#{title}\n\n"

    @answers.each.with_index(1) do |answer, index|
      text += "#{index}. #{answer}\n"
    end

    text
  end
end
