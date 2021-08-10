class Background
  attr_reader :image,
              :id

  def initialize(data, location)
    @id = nil
    @image = create_image(data, location)
  end

  def create_image(data, location)
    {
      location: location,
      image_url: data[:urls][:full],
      credit: create_credit(data[:user])
    }
  end

  def create_credit(data)
    {
      source: 'https://unsplash.com',
      author: data[:name],
      portfolio_url: data[:links][:portfolio],
      logo: 'https://unsplash.com/blog/content/images/max/2560/1-ElwDA92icHLARE8v2HevvA.jpeg'
    }
  end
end
