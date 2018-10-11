class UserService

  def initialize(id = nil)
   @id = id
  end

  def user_search
    get_json("/api/v1/users/#{@id}")
  end

  def users_search
    get_json("/api/v1/users")
  end

  def user_patch(email)
    conn.patch("/api/v1/users/#{@id}.params?email=#{email}")
  end

 private

    def conn
      Faraday.new(url: "http://localhost:3000/") do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end

    def get_json(url)
      JSON.parse(conn.get(url).body, symbolize_names: true)
    end


end
