# frozen_string_literal: true

module Users
  class Archive < ActiveInteraction::Base
    object :user

    def execute
      update_deleted_at
      send_archive_email

      user
    end

    private

    def update_deleted_at
      user.update!(deleted_at: Time.zone.now)
    end

    def send_archive_email
      Users::ArchiveJob.perform_in(30.minutes.from_now, user.id)
    end
  end
end
