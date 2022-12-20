# Дан текстовый файл F. Записать в перевернутом виде строки файла F в файл G.
# Порядок строк в файле G должен быть обратным по
# отношению к порядку строк исходного файла F.

def file_line_reverse(file_in_name = 'text', file_out_name = 'output')
  output = File.new("#{file_out_name}.txt", 'w')
  File.read("#{file_in_name}.txt").split("\n").reverse.map(&:reverse).each do |line|
    output << "#{line}\n"
  end
ensure
  output.close
end
