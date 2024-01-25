require 'nokogiri'
require 'open-uri'

def scraping
  
  url = 'https://coinmarketcap.com/all/views/all/'

  doc = Nokogiri::HTML(URI.open(url))

  crypto = []

  crypto_elements = doc.css('.cmc-table-row')

  crypto_elements.each do |crypto_element|
    crypto_info = {}

    crypto_nom = crypto_element.at_css('.cmc-table__column-name a')
    crypto_info['name'] = crypto_nom['title'].strip if crypto_nom

    crypto_prix = crypto_element.css('.cmc-table__cell--sort-by__price span').text.strip
    crypto_info['price'] = crypto_prix.gsub('$', '').gsub(',', '').to_f

    crypto << crypto_info

    puts "Crypto ajoutée : #{crypto_info['name']} - #{crypto_info['price']}"
  end

  puts "Résultat final :"
  puts crypto

end

scraping


#
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(URI.open("https://coinmarketcap.com/"))

 crypto_names = doc.xpath('//table/tbody')

crypto_names.search('tr').each do |row|
    puts row.text
    puts "\n"
 end

 # # //div/@title
 #name = row.at_xpath('.//td[3]').text 3eme célulle
 #price = row.at_xpath('.//td[4]').text 4eme célulle
 ##
##crypto_names.each do |nom|
##puts nom.title
##end
