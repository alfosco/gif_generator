# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
category_1 = Category.create(title: "Animals")
category_2 = Category.create(title: "Sports")
category_3 = Category.create(title: "Cartoons")

Gif.create(title: "hippo", image_path: "http://gph.is/2jeUScU", category_id: 1)
Gif.create(title: "gorilla", image_path: "http://gph.is/1L4YfXi", category_id: 1)

Gif.create(title: "slam dunk", image_path: "http://gph.is/2liTftp", category_id: 2)
Gif.create(title: "clutch", image_path: "http://gph.is/1UiVStL", category_id: 2)

Gif.create(title: "king of the hill", image_path: "http://gph.is/XLVlme", category_id: 3)
Gif.create(title: "scooby doo", image_path: "http://gph.is/VwAJfE", category_id: 3)
