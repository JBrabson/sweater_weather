class UnsplashService
  def self.location_image(location)
    response = conn.get("/photos/random?query=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.unsplash.com') do |faraday|
      faraday.params['client_id'] = ENV['SPLASH_KEY']
    end
  end
end
