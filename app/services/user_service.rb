class UserService
  def initialize(id)
    @id = id
  end

  def user_data
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(:url => ENV["API_DOMAIN_NAME"]) do |faraday|
      faraday.adapter Faraday.default_adapter
    end 
  end

  def response
    conn.get("/api/v1/users/#{@id}")
  end
end
