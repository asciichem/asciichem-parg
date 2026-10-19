# frozen_string_literal: true

# Corpus parity harness (P1a): every fixture with an "input" and a
# "parses" expectation must accept/reject identically under the PARG
# artifact. Usage:
#   ruby scripts/corpus-parity.rb /path/to/asciichem-tests/corpus/fixtures
require "json"
require "parsanol"
require "parsanol/parg"

fixtures_dir = ARGV[0] || "/Users/mulgogi/src/asciichem/asciichem-tests/corpus/fixtures"
src = File.read(File.join(__dir__, "..", "grammar/asciichem.parg"))
doc = Parsanol::PARG::Frontend.parse(src)
compiled = Parsanol::PARG::Compiler.compile(doc)
artifact_path = "/tmp/asciichem-parg-parity.json"
File.write(artifact_path, JSON.generate(compiled.envelope))
artifact = Parsanol::PARG::Artifact.load(artifact_path)

total = 0
mismatches = []
Dir.glob(File.join(fixtures_dir, "*.json")).sort.each do |file|
  data = JSON.parse(File.read(file))
  items = data.is_a?(Array) ? data : [data]
  items.flatten.each do |fixture|
    next unless fixture.is_a?(Hash) && fixture["input"] && fixture.key?("parses")

    total += 1
    input = fixture["input"]
    expected = fixture["parses"]
    begin
      artifact.parse("formula", input)
      actual = true
    rescue StandardError
      actual = false
    end
    next if actual == expected

    mismatches << [fixture["id"] || File.basename(file), input, expected, actual]
  end
end

puts "checked: #{total}"
puts "mismatches: #{mismatches.length}"
mismatches.each do |id, input, expected, actual|
  puts "  #{id}: input=#{input.inspect} expected=#{expected} actual=#{actual}"
end
exit(mismatches.empty? ? 0 : 1)
