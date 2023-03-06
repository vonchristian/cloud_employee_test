
module RemoteUsers
  class List < ActiveInteraction::Base
    string :remote_url, default: "https://dummyjson.com/users"

    def self.call
      obj = new
      obj.call
    end

    def call
      return transform_keys(response) if success?
      # Add rescue errors and timeouts
    end



    private

    def success?
      response.status == 200
    end

    def response
      @response ||= Faraday.get(remote_url)
    end

    def transform_keys(response)
      JSON.parse(response.body).dig('users').map { |user_data| user_data.deep_transform_keys! { |key| key.to_s.underscore }.deep_symbolize_keys! }
    end
  end
end
