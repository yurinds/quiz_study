require 'rexml/document'
require_relative 'lib/question'
require_relative 'lib/xls_reader'

current_path = File.dirname(__FILE__)

questions_path = current_path + '/data/questions.xml'

abort 'Один из файлов не найден!' unless File.exist?(questions_path)

correct_answers = 0
current_index = 0

puts 'Мини-викторина. Ответьте на вопросы.'

params_array = XLSReader.read_file(questions_path)

questions = []

params_array.each do |item|
  p item
  questions << Question.new(item)
end

questions.each do |item|
  puts item.show_question
end

# while current_index < questions.size
#  puts
#  puts questions[current_index]
#
#  user_answer = STDIN.gets.strip
#
#  correct_answer = answers[current_index].strip
#
#  if user_answer == correct_answer
#    puts 'Верный ответ!'
#    correct_answers += 1
#  else
#    puts 'Неправильно. Правильный ответ: ' + correct_answer
#  end
#
#  current_index += 1
# end
#
# puts
# puts "Правильных ответов: #{correct_answers} из #{questions.size}"

# a.sort_by{ rand }
