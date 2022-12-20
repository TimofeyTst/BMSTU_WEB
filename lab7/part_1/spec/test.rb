require_relative '../main'

RSpec.describe do
  it 'Should return text without changes if function repeats 2 times' do
    file_line_reverse 'input', 'reverse_text'
    file_line_reverse 'reverse_text', 'output'

    input = File.new('input.txt', 'r').read
    out = File.new('output.txt', 'r').read

    expect(input).to eq(out)
  end

  it 'Should return text without changes' do
    file_line_reverse 'input', 'reverse_text'
    file_line_reverse 'reverse_text', 'output'

    input = File.new('input.txt', 'r').read
    out = File.new('output.txt', 'r').read

    expect(input).to eq(out)
  end
end
