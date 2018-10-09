class UserSearchResult
  attr_reader :id
  
  def initialize(id)
    @id = id
  end
  
  def expected_users
    conn = Faraday.new(url: "http://localhost:3000" ) do |faraday|
      faraday.adapter Faraday.default_adapter 
    end
    
    response = conn.get("/api/v1/users/#{@id}")
    user_data = JSON.parse(response.body, symbolize_names: true)
    ExpectedUser.new(user_data)
  end
end 