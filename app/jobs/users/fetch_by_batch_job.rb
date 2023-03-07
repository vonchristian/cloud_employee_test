# frozen_string_literal: true

module Users
  class FetchByBatchJob
    include Sidekiq::Job

    def perform(per_page)
      return if total.zero?

      skip = 0
      iteration_count = total / per_page
      iteration_count.times do
        create_users(skip: skip, limit: per_page)
        skip += per_page
      end
    end

    private

    def total
      @total ||= Users::Fetch.run.valid? ? Users::Fetch.run.result[:total] : 0
    end

    def create_users(limit:, skip:)
      Users::CreateJob.perform_async(limit, skip)
    end
  end
end
