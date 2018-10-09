class GetUser 
  attr_reader :name, 
              :email
  
  def initialize(attributes)
    @name = attributes[:name]
    @email = attributes[:email]
  end
  
  def expected_user(id)
    conn = Faraday.new(:url => "http://localhost:3000" ) do |faraday| 
      response = conn.get("/api/vi/users/#{id}")
    end
    data = JSON.parse(response.body, symbolize_name: true)
  end
end 