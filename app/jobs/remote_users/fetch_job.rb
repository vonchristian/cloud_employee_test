# frozen_string_literal: true

module RemoteUsers
  class FetchJob
    include Sidekiq::Worker

    def perform(remote_url)
      response = RemoteUsers::Fetch.run(remote_url: remote_url)
      if response.success?
        Users::
    end
  end
end
