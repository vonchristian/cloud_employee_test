
module RemoteUsers
  class Fetch < ActiveInteraction::Base
    string :remote_url, default: "https://dummyjson.com/users"
    integer :limit, default: 0
    integer :skip, default: 0

    def execute
      { users: users, total: total } if valid?
      # Add rescue errors and timeouts
    end

    private

    def response
      @response ||= Faraday.get(request_params)
    end

    def request_params
      "#{remote_url}?limit=#{limit}&&skip#{skip}"
    end

    def total
      JSON.parse(response.body).dig("total")
    end

    def users
      JSON.parse(response.body).dig('users').map { |user_data| user_data.deep_transform_keys! { |key| key.to_s.underscore }.deep_symbolize_keys! }
    end
  end
end
