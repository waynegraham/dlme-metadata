require 'csv'
require 'mysql2'

client = Mysql2::Client.new(:host => "127.0.0.1", :username => "root", :database => 'met_museum', :password =>"root", :port => '8889')
rs = client.query("SELECT * FROM objects WHERE `Department` = 'Ancient Near Eastern Art'")
headers = results.fields

CSV.open('met_museum_records.csv', "wb") do |csv|
  rs.each() do |row|
     if rowCount == 0
       header = row.keys()
       csv << header
     end
    csvRow = Array.new()
    row.each() do |key, value|
      csvRow.push( value)
    end
     csv << csvRow
    rowCount = rowCount + 1
  end
end

# results.each(:as => :array) do |row|
  # puts row
# end
#
#
# SELECT * INTO OUTFILE '/Users/waynegraham/projects/dlme-metadata/museum/records/met_museum_records.csv'
# FIELDS TERMINATED BY ','
# OPTIONALLY ENCLOSED BY '"'
# LINES TERMINATED BY '\n'
# FROM objects
# WHERE `Department` = 'Ancient Near Eastern Art';

# query = "SELECT * FROM objects WHERE `Department` = 'Ancient Near Eastern Art'"
# client.query(query) do |row|
#   puts row.inspect
# end


# CSV.read('met_museum_records.csv').each do |row|
# # CSV.read('met_museum_records.csv',:encoding => 'windows-1251:utf-8').each do |row|
#   puts row
# end
