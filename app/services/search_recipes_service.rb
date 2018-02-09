require 'open-uri'
require 'nokogiri'

ingredient = 'soupe'
url = "http://www.marmiton.org/recettes/recherche.aspx?type=all&aqt=#{ingredient}"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.recipe-card__title').each do |element|
  Recipe.new(name: element.text.strip)
  puts element.text.strip
  # puts element.attribute('href').value
end
