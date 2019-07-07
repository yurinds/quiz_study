class Question
  attr_reader :time, :title, :answers, :right_answer

  def initialize(params)
    @time = params['time'].to_i
    @title = params['title']
    @answers = params['answers']
    @right_answer = params['right_answer']
  end

  def is_true?(user_answer)
    @answers[user_answer - 1] == @right_answer
  end

  def correct_tries
    ('1'..@answers.size.to_s).to_a
  end

  def mix_answers
    @answers.sort_by! { rand }
  end

  def time_is_over?(first_time, second_time)
    (second_time - first_time).abs.to_i > @time
  end

  def show_question
    text = "#{title}\n\n"

    mix_answers
    @answers.each.with_index(1) do |answer, index|
      text += "#{index}. #{answer}\n"
    end

    text
  end
end
