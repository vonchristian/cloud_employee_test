# frozen_string_literal: true

module Users
  class CreateJob
    include Sidekiq::Worker

    def perform(user_data:)
      Users::Create.run!(user_data: user_data)
    end
  end
end
