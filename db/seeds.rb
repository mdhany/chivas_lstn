# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



#Collector.create(email: 'melvin@cspmconsulting.com', password: 'cspm2014', password_confirmation: 'cspm2014')
#User.create(email: 'melvin@cspmconsulting.com', password: 'cspm2014', password_confirmation: 'cspm2014')

pass = 'chiva5cspm'
User.create!(email: 'melvin.dani7@gmail.com', password: pass, password_confirmation: pass)
User.create!(email: 'kheilydis@cspmconsulting.com', password: pass, password_confirmation: pass)


#LOAD CODES CHIVAS
Code.create(code: '000000', id: '100000')
require 'csv'
file = "db/codigosch.csv"
  CSV.foreach(file, col_sep: ';' ) do |row|
    Code.create(code: row[0], id: row[1], is_used?: false, chivas_code?: true)
  end