require 'rexml/document'
require_relative 'lib/question'
require_relative 'lib/quiz'
require_relative 'lib/xml_reader'

current_path = File.dirname(__FILE__)

questions_path = current_path + '/data/questions.xml'

abort 'Один из файлов не найден!' unless File.exist?(questions_path)

params_array = XMLReader.read_file(questions_path)

questions = []

params_array.each do |item|
  questions << Question.new(item)
end

quiz = Quiz.new(questions)

puts 'Мини-викторина. Ответьте на вопросы.'

until quiz.quiz_complete?
  question = quiz.next_question

  puts
  puts question.show_question

  first_time = Time.now

  user_answer = ''
  until question.correct_tries.include?(user_answer)
    user_answer = STDIN.gets.strip.downcase
  end
  second_time = Time.now

  abort 'Время на ответ вышло! ' if question.time_is_over?(first_time, second_time)

  if question.this_is_right_answer?(user_answer.to_i)
    puts 'Верный ответ!'
    quiz.update_right_answers
  else
    puts 'Неправильно. Правильный ответ: ' + question.right_answer
  end
end

puts
puts "Правильных ответов: #{quiz.right_answers} из #{quiz.questions_size}"
