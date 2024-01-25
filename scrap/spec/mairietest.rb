require 'rspec'
require_relative '../lib/mairie.rb'

RSpec.describe 'Scrapping Mairies' do
  describe '#get_townhall_email' do
    it 'donne les emails depuis url' do
      townhall_url = 'https://annuaire-des-mairies.com/95/ableiges.html'
      email = get_townhall_email(townhall_url)
      expect(email).to be_a(Hash)
    end
  end

  describe '#perform' do
    it 'donne mon array avec nom de villes et emails' do
      expect { perform }.not_to raise_error
    end

    it 'donne les infos pour chaque ville' do
      townhalls_data = perform
      expect(townhalls_data).to be_an(Array)

      townhalls_data.each do |town_data|
        expect(town_data).to be_a(Hash)
        expect(town_data['city_name']).to be_a(String)
      end
    end

  end
end
