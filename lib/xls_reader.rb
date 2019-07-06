class XLSReader
  def self.read_file(path)
    file = File.new(path)
    doc  = REXML::Document.new(file)
    root = doc.root

    result_array = []

    root.each_element do |question|
      result_hash = {}
      result_hash['answers'] = []

      result_hash['time'] = question.attributes['time']

      question.each_element do |question_element|
        result_hash['title'] = question_element.text unless question_element.has_elements?
        question_element.each_element do |answer|
          result_hash['answers'] << answer.text
          result_hash['right_answer'] = answer.text if answer.attributes['right'] == 'true'
        end
      end

      result_array << result_hash
    end

    result_array
  end
end
