# spec/scrapping_spec.rb

require_relative '../lib/crypto.rb'

RSpec.describe 'Scrapping Cryptocurrencies' do
  before(:all) do
    @crypto = scraping
  end

  it 'récupere les infos sur les cryptos' do
    expect(@crypto).not_to be_empty

    @crypto.each do |crypt|
      expect(crypt['nom']).not_to be_nil
      expect(crypt['prix']).not_to be_nil
    end
  end
end
