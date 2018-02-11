require 'open-uri'
require 'nokogiri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ingredient = 'soupe'
# url = "http://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=#{ingredient}"

# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)

# html_doc.search('.recipe-card__title').each do |element|
#   @recipe = Recipe.create(name: element.text.strip)
#   puts element.text.strip
# end

file      = File.open('jamie_vege.html')
html_doc  = Nokogiri::HTML(file)
#
# html_doc.search('.recipe-block').each do |e|
#   puts e.search('.recipe-title').text.strip
# #  puts e.at_css('.recipe-image img').attr('data-src')[2..-1]
# #  puts "https://www.jamieoliver.com" + e.at_css('a').attr('href')
# puts e.search('.time').text.strip
# puts e.search('.difficulty').text.strip
# end

html_doc.search('.recipe-block').each do |e|
  @recipe = Recipe.create(
    name: e.search('.recipe-title').text.strip,
    picture: e.at_css('.recipe-image img').attr('data-src')[2..-1],
    link: "https://www.jamieoliver.com" + e.at_css('a').attr('href'),
    difficulty: e.search('.difficulty').text.strip,
    time: e.search('.time').text.strip
  )
end
