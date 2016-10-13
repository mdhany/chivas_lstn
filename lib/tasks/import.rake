require 'csv'

desc "Import codes from csv file"
task :import => :environment do

  file = "db/codigosch.csv"

  CSV.foreach(file, col_sep: ';' ) do |row|
    #puts "#{row[0]} y #{row[1]}"
    Code.create(code: row[0], id: row[1], is_used?: false)
  end

end