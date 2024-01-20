class PartnerOrder < ApplicationRecord
  belongs_to :user
  belongs_to :partner
  belongs_to :order
  belongs_to :partner, class_name: 'User', foreign_key: 'partner_id'

  def self.ransackable_associations(auth_object = nil)
    %w[partner order]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[id partner_id order_id customer_review partner_status assigned_at responded_at pickup_at delivered_at notification_sent_at notification_response_due_by]
  end

end
