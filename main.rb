require 'rexml/document'
require_relative 'lib/question'
require_relative 'lib/xls_reader'

current_path = File.dirname(__FILE__)

questions_path = current_path + '/data/questions.xml'

abort 'Один из файлов не найден!' unless File.exist?(questions_path)

params_array = XLSReader.read_file(questions_path)

questions = []

params_array.each do |item|
  questions << Question.new(item)
end
questions.sort_by! { rand }
correct_answers = 0
current_index = 0

puts 'Мини-викторина. Ответьте на вопросы.'

questions.each do |question|
  puts
  puts question.show_question

  user_answer = STDIN.gets.strip.downcase

  if question.is_true?(user_answer)
    puts 'Верный ответ!'
    correct_answers += 1
  else
    puts 'Неправильно. Правильный ответ: ' + question.right_answer
  end

  current_index += 1
end

puts
puts "Правильных ответов: #{correct_answers} из #{questions.size}"
