class UserService 
  def initialize(filter = {})
    @filter = filter
  end
  
  def get_user
    get_json("/api/v1/users/#{@filter[:id]}")
  end
  
  def get_users 
    get_json("/api/v1/users")
  end
  
  private
    def conn 
      Faraday.new(url: "http://localhost:3000" ) do |faraday|
        faraday.adapter Faraday.default_adapter 
      end
    end
    
    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end 