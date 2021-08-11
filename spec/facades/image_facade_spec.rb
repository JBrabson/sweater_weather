require 'rails_helper'

describe 'ImageFacade' do
  it 'returns background object related to provided location', :vcr do
    location = 'bailey,co'
    image = ImageFacade.get_image(location)

    expect(image).to be_an_instance_of(Image)
    expect(image.id).to eq(nil)
    expect(image.image).to be_a(Hash)
    expect(image.image[:location]).to be_a(String)
    expect(image.image[:image_url]).to be_a(String)
    expect(image.image[:credit]).to be_a(Hash)
    expect(image.image[:credit][:source]).to be_an(String)
    expect(image.image[:credit][:author]).to be_an(String)
    expect(image.image[:credit][:portfolio_url]).to be_an(String)
    expect(image.image[:credit][:logo]).to be_an(String)

    expect(image.image[:location]).to eq(location)
    expect(image.image[:image_url]).to eq('https://images.unsplash.com/photo-1604566285363-85fd6a53f409?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNTIyNzl8MHwxfHJhbmRvbXx8fHx8fHx8fDE2Mjg2NjE5NDk&ixlib=rb-1.2.1&q=85')
    expect(image.image[:credit][:source]).to eq('https://unsplash.com')
    expect(image.image[:credit][:author]).to eq('Anna Seeley')
    expect(image.image[:credit][:portfolio_url]).to eq('https://api.unsplash.com/users/yeleannaes/portfolio')
    expect(image.image[:credit][:logo]).to eq('https://unsplash.com/blog/content/images/max/2560/1-ElwDA92icHLARE8v2HevvA.jpeg')
  end
end
