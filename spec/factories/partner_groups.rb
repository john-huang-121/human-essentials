# == Schema Information
#
# Table name: partner_groups
#
#  id              :bigint           not null, primary key
#  deadline_day    :integer
#  name            :string
#  reminder_day    :integer
#  send_reminders  :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#

FactoryBot.define do
  factory :partner_group do
    sequence(:name) { |n| "Dont test this #{n}" }
    organization { Organization.try(:first) || create(:organization) }

    trait :without_deadlines do
      reminder_day { nil }
      deadline_day { nil }
    end
  end
end
