# frozen_string_literal: true

module Users
  class ArchiveJob
    include Sidekiq::Job

    def perform(id)
      user = User.find(id)
      #call mailer
    end
  end
end
