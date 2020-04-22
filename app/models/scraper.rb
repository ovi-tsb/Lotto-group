require 'nokogiri'
require 'open-uri'
# require 'pry'

# require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

url = "https://lottery.olg.ca/en-ca/lotto-games/lotto-max/about-lotto-max"
doc = Nokogiri::HTML(open(url))
top = doc.css('span.mw-headline')[0]&.text || '$0000'
# links = doc.css('.winning-number')[0]&.text || '$0000'

# puts links

# doc.css('.winning-number').each do |no| 
#   number = no.at_css(".number").text

#   puts "#{no}"
# end

# class Scraper
#   def scrape_city_urls
#     idaho_url = 'http://www.museumsusa.org/museums/?k=1271400%2cState%3aID%3bDirectoryID%3a200454'
#     html = open(idaho_url)
#     doc = Nokogiri::HTML(html)
#     # puts doc.css('#city').text

#     cities = doc.css('#city').css('.browseCategoryItem').css('a')
#     city_urls = []

#     cities.each do |city|
#       url = city.attribute('href').value
#       # binding.pry
#       city_urls << url
#     end
#     scrape_city_pages(city_urls)
#     # puts cities
#     # binding.pry

#   end

#   def scrape_city_pages(city_urls)
#     museums_list = []
    
#     city_urls.each do |city_url|
#       url = "http://www.museumsusa.org#{city_url}"
#       html = open(url)
#       doc = Nokogiri::HTML(html)

#       museums_list << doc.css('.itemGroup').css('.item').css('.basic')
#       # binding.pry
#       puts url
#     end
#     # binding.pry

#     # def create_museums(museums_list)
#     #   museums = []

#     #   museums_list.each do |museum|
#     #     name = museum.css('.source').css('a').text
#     #     location =  museum.css('.location').text.split(', ')
#     #     type =  museum.css('.type').text
#     #     desc = museum.css('.abstract').text

#     #     museum_info = {
#     #       name: name,
#     #       city: location[0],
#     #       state: location[1],
#     #       categories: type,
#     #       description: desc
#     #     }

#     #     museums << museum_info

#     #     # binding.pry
#     #   end
#     #   museums
#     # end
#   end

# end


# scrape = Scraper.new
# scrape.scrape_city_urls




