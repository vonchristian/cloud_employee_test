# frozen_string_literal: true

module Users
  class Delete < ActiveInteraction::Base
    object :user

    def execute
      update_deleted_at
      send_account_deletion_email

      user
    end

    private

    def update_deleted_at
      user.update!(deleted_at: Time.zone.now)
    end

    def send_account_deletion_email
      Users::AccountDeletionEmailJob.perform_in(30.minutes.from_now, user.id)
    end
  end
end
