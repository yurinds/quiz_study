class Question
  attr_reader :time, :title, :answers, :right_answer

  def initialize(params)
    @time = params['time'].to_i
    @title = params['title']
    @answers = params['answers'].shuffle
    @right_answer = params['right_answer']
  end

  def right_answer?(user_answer)
    @answers[user_answer - 1] == @right_answer
  end

  def correct_tries
    ('1'..@answers.size.to_s).to_a
  end

  def to_s
    text = "#{title} (на ответ #{@time} сек.)\n"

    @answers.each.with_index(1) do |answer, index|
      text += "#{index}. #{answer}\n"
    end

    text
  end
end
