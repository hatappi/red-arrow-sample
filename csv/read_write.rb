require 'arrow'
require 'fileutils'
require 'time'

%w(10000 100000 250000 500000 1000000).each do |n|
  puts ">>>>>>>>>>>>> #{n}行"

  csv_path = "data/#{n}.csv"

  s = Time.now
  arrow_table = Arrow::Table.load(csv_path)
  arrow_table.save("p-#{n}.parquet")
  puts "#{Time.now - s} s"

  puts ""
end

FileUtils.rm(Dir.glob("*.parquet"))
