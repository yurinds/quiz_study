require 'rexml/document'
require_relative 'lib/question'
require_relative 'lib/quiz'
require_relative 'lib/xml_reader'

current_path = File.dirname(__FILE__)

questions_path = current_path + '/data/questions.xml'

abort 'Один из файлов не найден!' unless File.exist?(questions_path)

params_array = XMLReader.read_file(questions_path)

questions = params_array.map { |item| Question.new(item) }

quiz = Quiz.new(questions)

puts 'Мини-викторина. Ответьте на вопросы.'

until quiz.quiz_complete?

  question = quiz.next_question

  puts
  puts question

  user_answer = ''
  until question.correct_tries.include?(user_answer)
    user_answer = STDIN.gets.strip
  end

  abort 'Время на ответ вышло! Викторина прервана!' if quiz.time_over?

  if quiz.right_answer?(user_answer.to_i)
    puts 'Верный ответ!'
  else
    puts 'Неправильно. Правильный ответ: ' + question.right_answer
  end
end

puts
puts "Правильных ответов: #{quiz.right_answers} из #{quiz.questions_size}"
