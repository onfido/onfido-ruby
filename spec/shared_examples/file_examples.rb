# frozen_string_literal: true

RSpec.shared_examples_for "a valid file" do |expected_size|
  it "is not nil and has a size greater than 0" do
    expect(file).not_to be_nil
    expect(file.size).to be > 0
  end

  it "has the expected file size" do
    expect(file.size).to equal expected_size if expected_size
  end
end

RSpec.shared_examples_for "a file with signature" do |signature, offset, length|
  it "has a valid signature" do
    signature_to_check = String.new(signature, encoding: 'BINARY')

    File.open(file.path, 'rb') do |file_handler|
      file_handler.rewind
      content = file_handler.read(offset + length)
      expect(content[offset, length]).to eq(signature_to_check)
    end
  end
end

RSpec.shared_examples_for "a valid PNG file" do |expected_size|
  include_examples "a valid file", expected_size
  include_examples "a file with signature", "\x89PNG\r\n\x1A\n", 0, 8
end

RSpec.shared_examples_for "a valid PDF file" do |expected_size|
  include_examples "a valid file", expected_size
  include_examples "a file with signature", "%PDF-", 0, 5
end

RSpec.shared_examples_for "a valid JPEG file" do |expected_size|
  include_examples "a valid file", expected_size
  include_examples "a file with signature", "\xFF\xD8\xFF\xE0\x00\x10JF", 0, 8
end

RSpec.shared_examples_for "a valid MP4 file" do |expected_size|
  include_examples "a valid file", expected_size
  include_examples "a file with signature", "ftyp", 4, 4
end
