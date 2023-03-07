# frozen_string_literal: true

require 'rails_helper'

describe Users::Archive do
  let!(:user) { create(:user, deleted_at: nil) }

  let(:run_service) { described_class.run(user: user) }

  describe 'update deleted_at' do
    before { run_service }

    it { expect(user.reload.deleted_at).to_not be_nil }
  end

  describe 'call archive email job' do
    it do
      Time.stub(:now).and_return(Time.mktime(2023,03,07,11,00,00).gmtime)

      expect(Users::ArchiveJob).to receive(:perform_in).with(30.minutes.from_now, user.id)

      run_service
    end
  end
end
