require_relative '../lib/mairie2'

# Tests noms des mairies

describe 'Extraction des noms de mairies' do
  it 'renvoie le nom de la commune' do
    expect(get_townhall_name('http://annuaire-des-mairies.com/95/aincourt.html')).to eq('AINCOURT')
    expect(get_townhall_name('http://annuaire-des-mairies.com/95/pontoise.html')).to eq('PONTOISE')
  end
end

# Tests e-mail des mairies

describe 'Extraction des adresses e-mail des mairies' do
  it 'renvoie e-mail de la commune' do
    expect(get_townhall_email('http://annuaire-des-mairies.com/95/aincourt.html')).to eq('mairie.aincourt@wanadoo.fr')
    expect(get_townhall_email('http://annuaire-des-mairies.com/95/pontoise.html')).to eq('mairie@ville-pontoise.fr')
  end
end
