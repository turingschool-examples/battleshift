class UserService
  def initialize(id)
    @id = id
  end

  def user_data
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new
  end

  def response
    conn.get("http://localhost:3000/api/v1/users/#{@id}")
  end
end
