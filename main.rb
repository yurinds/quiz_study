require 'rexml/document'
require_relative 'lib/question'
require_relative 'lib/quiz'
require_relative 'lib/xls_reader'

current_path = File.dirname(__FILE__)

questions_path = current_path + '/data/questions.xml'

abort 'Один из файлов не найден!' unless File.exist?(questions_path)

params_array = XLSReader.read_file(questions_path)

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

  user_answer = STDIN.gets.strip.downcase

  if question.is_true?(user_answer)
    puts 'Верный ответ!'
    quiz.update_right_answers
  else
    puts 'Неправильно. Правильный ответ: ' + question.right_answer
  end
end

puts
puts "Правильных ответов: #{quiz.right_answers} из #{quiz.questions_size}"
