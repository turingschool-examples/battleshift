class UserService
  attr_reader :filter

  def initialize(filter = {})
    @filter = filter
  end

  def single_user_data
    get_json("/api/v1/users/#{filter[:id]}")
  end

  private

  def conn
    Faraday.new("http://localhost:3000") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
