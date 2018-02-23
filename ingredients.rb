require 'open-uri'
require 'nokogiri'

file      = File.open('ingredients.html')
html_doc  = Nokogiri::HTML(file)
#
# html_doc.search('.recipe-block').each do |e|
#   puts e.search('.recipe-title').text.strip
# #  puts e.at_css('.recipe-image img').attr('data-src')[2..-1]
# #  puts "https://www.jamieoliver.com" + e.at_css('a').attr('href')
# puts e.search('.time').text.strip
# puts e.search('.difficulty').text.strip
# end

html_doc.search('.ingred-list').each do |e|
    puts e.at_css.text.strip
end
