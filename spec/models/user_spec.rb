# frozen_string_literal: true

describe User do
  describe '.active' do
    let!(:deleted_user) { create(:user, deleted_at: Time.zone.now) }
    let!(:active_user) { create(:user, deleted_at: nil) }

    it { expect(described_class.active).to include(active_user) }
    it { expect(described_class.active).to_not include(deleted_user) }
  end
end
