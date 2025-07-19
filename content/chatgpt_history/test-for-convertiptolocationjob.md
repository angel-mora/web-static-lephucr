---
title: Test for ConvertIpToLocationJob
tags:
- perform_later
- perform
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Test for ConvertIpToLocationJob

## ✅ TODOs
- [ ] Update spec

## 📌 Summary
Write a test for this job following all rails best practices

## 🧠 Full Chat


Write a test for this job following all rails best practices
class ConvertIpToLocationJob < ApplicationJob
  # sidekiq_options is required for version 6.0.7, we can remove this when Sidekiq upgrades beyond 6.3
  sidekiq_options queue: :default
  queue_as :default

  def perform(contact_us_detail)
    contact_us_detail.country = CountryFromIp.location_from_ip(contact_us_detail.ip_address)
    contact_us_detail.save!
    if contact_us_detail.user.present? && contact_us_detail.user.location_country_code.blank?
      # TODO: Update spec
      contact_us_detail.user.location_country_code = contact_us_detail.country
      contact_us_detail.user.save(validate: false)
    end
  rescue StandardError => e
    log_error_to_rollbar(exception: e)
  end
end




RSpec.describe ConvertIpToLocationJob, type: :job do
  describe "#perform_later" do
    let(:contact_us_detail) { create(:contact_us_detail) }
    let(:user) { create(:user) }

    it "updates the country for the contact_us_detail based on the ip address" do
      expect {
        ConvertIpToLocationJob.perform_later(contact_us_detail)
      }.to have_enqueued_job.with(contact_us_detail).on_queue("default")

      perform_enqueued_jobs do
        ConvertIpToLocationJob.perform_now(contact_us_detail)
      end

      expect(contact_us_detail.reload.country).not_to be_nil
    end

    it "updates the location country code for the user if the user is present and doesn't have a location country code" do
      contact_us_detail.update(user: user)

      expect {
        ConvertIpToLocationJob.perform_later(contact_us_detail)
      }.to have_enqueued_job.with(contact_us_detail).on_queue("default")

      perform_enqueued_jobs do
        ConvertIpToLocationJob.perform_now(contact_us_detail)
      end

      expect(user.reload.location_country_code).not_to be_nil
    end

    it "doesn't update the location country code for the user if the user already has a location country code" do
      user.update(location_country_code: "US")
      contact_us_detail.update(user: user)

      expect {
        ConvertIpToLocationJob.perform_later(contact_us_detail)
      }.to have_enqueued_job.with(contact_us_detail).on_queue("default")

      perform_enqueued_jobs do
        ConvertIpToLocationJob.perform_now(contact_us_detail)
      end

      expect(user.reload.location_country_code).to eq("US")
    end

    it "logs any exception to Rollbar" do
      allow(Rollbar).to receive(:error)

      expect {
        ConvertIpToLocationJob.perform_now(contact_us_detail)
      }.to raise_error(StandardError)

      expect(Rollbar).to have_received(:error)
    end
  end
end


Note: This test assumes the use of FactoryBot for creating test objects. You can replace it with any other testing library or create test objects manually.

Write a test for this job following all rails best practices:

class ConvertIpToLocationJob < ApplicationJob
  # sidekiq_options is required for version 6.0.7, we can remove this when Sidekiq upgrades beyond 6.3
  sidekiq_options queue: :default
  queue_as :default

  def perform(contact_us_detail)
    contact_us_detail.country = CountryFromIp.location_from_ip(contact_us_detail.ip_address)
    contact_us_detail.save!
    if contact_us_detail.user.present? && contact_us_detail.user.location_country_code.blank?
      # TODO: Update spec
      contact_us_detail.user.location_country_code = contact_us_detail.country
      contact_us_detail.user.save(validate: false)
    end
  rescue StandardError => e
    log_error_to_rollbar(exception: e)
  end
end




RSpec.describe ConvertIpToLocationJob, type: :job do
  describe '#perform' do
    let(:contact_us_detail) { create(:contact_us_detail, ip_address: '127.0.0.1', user: user) }
    let(:user) { create(:user, location_country_code: nil) }

    it 'updates the contact_us_detail country' do
      expect {
        described_class.perform_now(contact_us_detail)
      }.to change { contact_us_detail.reload.country }.from(nil).to('US')
    end

    context 'when user is present and location_country_code is blank' do
      it 'updates the user location_country_code' do
        expect {
          described_class.perform_now(contact_us_detail)
        }.to change { user.reload.location_country_code }.from(nil).to('US')
      end
    end

    context 'when an error is raised' do
      before do
        allow_any_instance_of(described_class).to receive(:log_error_to_rollbar)
      end

      it 'logs the error to Rollbar' do
        allow(CountryFromIp).to receive(:location_from_ip).and_raise(StandardError)

        expect {
          described_class.perform_now(contact_us_detail)
        }.to raise_error(StandardError)

        expect(described_class).to have_received(:log_error_to_rollbar)
      end
    end
  end
end