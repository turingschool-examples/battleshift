class FindUser
  
  def initialize(filter = {})
    @filter = filter
  end
  
  def expected_user
    conn = Faraday.new(url: "http://localhost:3000" ) do |faraday|
      faraday.adapter Faraday.default_adapter 
    end
    
    response = conn.get("/api/v1/users/#{@filter}")
    user_data = JSON.parse(response.body, symbolize_names: true)
    ResultUser.new(user_data)
  end
  
  def expected_users
    conn = Faraday.new(url: "http://localhost:3000" ) do |faraday|
      faraday.adapter Faraday.default_adapter 
    end
    
    response = conn.get("/api/v1/users")
    JSON.parse(response.body, symbolize_names: true).map do |user_data|
      ResultUser.new(user_data)
    end
  end
end 