# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# CSVファイルを使用することを明示
require 'csv'

CSV.foreach('/mnt/c/workspace Ruby/smartcalorie ruby/smartcalorie/db/csv/grain_calorie.csv', headers: true) do |row|
    Calorie.create(
        name:     row['Name'],
        calorie:  row['Calorie']

    )
  end