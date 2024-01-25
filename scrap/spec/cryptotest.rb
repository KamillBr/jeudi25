require_relative '../lib/crypto.rb'

describe 'scraping' do
  it 'renvoie une array' do
      result = scraping
      expect(result).to be_an(Array)
      expect(result).to all(be_a(Hash))
    end

    it 'inclu Bitcoin' do
      result = scraping
      names = result.map(&:keys).flatten
      expect(names).to include('BTC')
    end
  
    it 'Ethereum dans array' do
      result = scraping
      names = result.map(&:keys).flatten
      expect(names).to include('ETH')
  end

end