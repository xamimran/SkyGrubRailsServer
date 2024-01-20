# Registers a PartnerOrder model for administration in ActiveAdmin, allowing CRUD operations.
# Defines permitted parameters, index page columns and filters, and form inputs.
ActiveAdmin.register PartnerOrder do

  permit_params :order_id, :customer_review, :partner_status,
                :assigned_at, :responded_at, :pickup_at, :delivered_at,
                :notification_sent_at, :notification_response_due_by,
                :user_id

  index do
    selectable_column
    id_column
    column :order
    column :partner_status
    column :assigned_at
    column :delivered_at
    actions
  end

  filter :order
  filter :partner_status
  filter :assigned_at
  filter :delivered_at

  form do |f|
    f.inputs do
      f.input :order
      f.input :customer_review
      f.input :partner_status
      f.input :assigned_at
      f.input :responded_at
      f.input :pickup_at
      f.input :delivered_at
      f.input :notification_sent_at
      f.input :notification_response_due_by
    end
    f.actions
  end
end
