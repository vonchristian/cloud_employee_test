# frozen_string_literal: true

module Users
  class CreateJob
    include Sidekiq::Job

    def perform(limit, skip)
      outcome = fetch_results(limit: limit, skip: skip)
      return unless outcome.valid? # handle errors

      create_users(outcome.result[:users])
    end

    def fetch_results(limit:, skip:)
      Users::Fetch.run(limit: limit, skip: skip)
    end

    def create_users(users_data)
      Users::Create.run(users_data: users_data)
    end
  end
end
