require 'rexml/document'

current_path = File.dirname(__FILE__)

questions_path = current_path + '/data/questions.xml'

abort 'Один из файлов не найден!' unless File.exist?(questions_path)

correct_answers = 0
current_index = 0

puts 'Мини-викторина. Ответьте на вопросы.'

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

require 'rexml/document'

current_path = File.dirname(__FILE__)

questions_path = current_path + '/data/questions.xml'

abort 'Один из файлов не найден!' unless File.exist?(questions_path)

file = File.new(questions_path)

doc = REXML::Document.new(file)

amount_by_day = {}

root = doc.root

root.each_element do |item|
  puts 'Находимся на самом верхнем уровне. Тут доступны минуты ' + item.attributes['minutes']

  item.each_element do |x|
    puts 'Уровень вопроса: ' unless x.has_elements?
    puts x.text unless x.has_elements?
    puts 'Уровень вариантов' if x.has_elements?
    x.each_element do |y|
      puts "#{y.text} #{y.attributes['right'] == 'true' ? 'ответ верный' : ''}"
    end
  end

  puts
end

#a.sort_by{ rand }