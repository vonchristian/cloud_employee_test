class User < ApplicationRecord

  def self.active
    where(deleted_at: nil)
  end
end
