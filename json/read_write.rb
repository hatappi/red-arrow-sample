require 'csv'
require 'json'
require 'time'
require 'arrow'

[10000, 100000, 1000000, 10000000].each do |n|
  arr = n.times.to_a.map { |i| "test" }

  puts ">>>>>>>>>>>>> #{n}"

  s = Time.now
  File.open("data.json", 'w') do |f|
    JSON.dump(arr, f)
  end
  File.open("data.json") do |f|
    JSON.load(f)
  end
  puts "JSON: #{Time.now - s} s"
  File.delete("data.json")


  s = Time.now
  strings = Arrow::StringArray.new(arr)
  arrow_table = Arrow::Table.new("str" => strings)
  arrow_table.save("data.arrow")
  Arrow::Table.load("data.arrow")
  puts "Arrow: #{Time.now - s} s"
  File.delete("data.arrow")

  puts ""
end
