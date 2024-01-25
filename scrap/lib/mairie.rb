require 'nokogiri'
require 'open-uri'

URL = "https://annuaire-des-mairies.com/val-d-oise.html"

def perform
  list_url = get_townhall_urls.map { |x| "#{URL[0..30]}#{x.text[1..-1]}" }
  list_hash = []

  list_url.each do |townhall_url|
    list_hash << get_townhall_email(townhall_url)
  end

  puts "J'ai #{list_hash.length} mairies dans la liste."
  return list_hash
end

def get_townhall_email(townhall_url)
  return nil if townhall_url.nil? || townhall_url.empty?

  mail_hash = {}
  city_name = townhall_url[35..-6]
  
  list_mail = Nokogiri::HTML(open(townhall_url)).xpath("//*[contains(text(), '@')]")
  
  list_mail.each do |mail|
    mail_hash[city_name] = mail.text
  end

  if mail_hash.empty?
    puts "Echec : Pas trouvé pour #{city_name}"
  else
    puts "OK : Mail de la mairie de #{city_name}"
  end

  return mail_hash
end

def get_townhall_urls
  page = Nokogiri::HTML(open(URL)).xpath("//a[@class='lientxt']/@href")
  puts "Annuaire du Val d'Oise bien récupéré, extraction des URLs des mairies." if page.any?
  return page
end

perform
