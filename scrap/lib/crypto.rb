#def scraping
  
#  url = 'https://coinmarketcap.com/all/views/all/'

#  doc = Nokogiri::HTML(URI.open(url))

#  crypto = []

#  crypto_elements = doc.css('.cmc-table-row')

#  crypto_elements.each do |crypto_element|
#    crypto_info = {}

#    crypto_nom = crypto_element.at_css('.cmc-table__column-name a')
#    crypto_info['name'] = crypto_nom['title'].strip if crypto_nom

#    crypto_prix = crypto_element.css('.cmc-table__cell--sort-by__price span').text.strip
#    crypto_info['price'] = crypto_prix.gsub('$', '').gsub(',', '').to_f

#    crypto << crypto_info

#    puts "Crypto ajoutée : #{crypto_info['name']} - #{crypto_info['price']}"
#  end

#  puts "Résultat final :"
#  puts crypto

#end

#scraping


#test 2


#doc = Nokogiri::HTML(URI.open("https://coinmarketcap.com/"))

# crypto_names = doc.xpath('//table/tbody')
#crypto_names.search('tr').each do |row|
#    puts row.text
#    puts "\n"
# end

 # # //div/@title
 #name = row.at_xpath('.//td[3]').text 3eme célulle
 #price = row.at_xpath('.//td[4]').text 4eme célulle
 ##
##crypto_names.each do |nom|
##puts nom.title
##end

# test 3
require 'nokogiri'
require 'open-uri'

def scraping
  # On utilise Nokogiri pour analyser le contenu HTML de la page web
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

  # On extrait les noms des cryptomonnaies à partir du HTML analysé
  names = page.xpath('/html/body/div[1]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[2]/div/a[1]')
              .map { _1.text }

  # On extrait les prix des cryptomonnaies à partir du HTML analysé
  prices =  page.xpath('/html/body/div[1]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/div/a/span')
                .map { _1.text.slice(1..-1).delete(',').to_f }

  # On affiche un hash contenant les noms et les prix des cryptomonnaies
  puts names.zip(prices).map { |key, value| { key => value } }

  # On retourne le même hash contenant les noms et les prix des cryptomonnaies
  names.zip(prices).map { |key, value| { key => value } }
end

# On appelle la méthode scraping pour exécuter
scraping