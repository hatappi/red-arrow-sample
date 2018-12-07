require 'csv'
require 'arrow'
require 'time'
require 'ccsv'

%w(10000 100000 250000 500000 1000000).each do |n|
  puts ">>>>>>>>>>>>> #{n}行"

  csv_path = "data/#{n}.csv"

  s = Time.now
  CSV.foreach(csv_path) { |row| row }
  puts "CSVでの読み込み #{Time.now - s} s"

  s = Time.now
  Ccsv.foreach(csv_path) { |row| row }
  puts "CSVでの読み込み #{Time.now - s} s"

  s = Time.now
  Arrow::Table.load(csv_path)
  puts "Arrowでの読み込み #{Time.now - s} s"

  puts ""
end
