# frozen_string_literal: true

module RemoteUsers
  class FetchJob
    include Sidekiq::Job

    def perform(limit: nil, skip: nil)
      remaining = 0
      outcome = fetch_results(limit: limit, skip: skip)
      users_data = outcome.result[:users] if outcome.valid?
      total = outcome.result[:total] if outcome.valid?

      remaining += users_data.size

      while remaining <= total
        # fetch results
        create_users(users_data)
      end
    end

    def fetch_results(limit:, skip:)
      RemoteUsers::Fetch.run(limit: limit, skip: skip)
    end

    def create_users(users_data)
      Users::Create.run(users_data: users_data)
    end
  end
end
