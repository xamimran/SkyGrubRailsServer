ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # User Partner Statistics
    columns do
      column do
        panel "User Partner Statistics" do
          if User.any?
            pie_chart User.group(:role).count, donut: true, colors: ["#031f50", "#e6347e"]
          else
            para "No user data available."
          end
        end
      end
    end

    # Second Row: Restaurant Statistics
    columns do
      column do
        panel "Restaurant Orders" do
          data = Restaurant.all.joins(:orders)
                            .select('restaurants.*, COUNT(orders.id) AS orders_count')
                            .group('restaurants.id')
                            .order('orders_count DESC')
                            .limit(5)
                            .map { |r| [r.name, r.orders_count] }.to_h
          bar_chart data
        end
      end

      column do
        panel "Top Restaurants by Orders" do
          restaurants = Restaurant.joins(:orders)
                                  .select('restaurants.*, COUNT(orders.id) AS orders_count')
                                  .group('restaurants.id')
                                  .order('orders_count DESC')
                                  .limit(5)
          table_for restaurants do
            column :name
            column :orders_count
          end
        end
      end
    end

# Additional Panel for Partner Performance with Order Counts and Delivery Fees
  columns do
    column do
      panel "Partner Performance" do
        status_to_filter = 'delivered'

        table_for User.joins(partner_orders: :order)
                      .where(users: { role: 'partner' }, partner_orders: { partner_status: status_to_filter })
                      .select(
                        "users.id, users.username, COUNT(partner_orders.id) AS completed_orders,
                        SUM(orders.delivery_fee) AS total_delivery_fees,
                        SUM(orders.tip_amount) AS total_tips,
                        AVG((julianday(partner_orders.delivered_at) - julianday(partner_orders.assigned_at)) * 86400.0) AS avg_delivery_time"
                      )
                      .group("users.id")
                      .order("completed_orders DESC") do
          column :username
          column("Completed Orders") { |user| user.completed_orders }
          column("Total Delivery Fees") { |user| number_to_currency(user.total_delivery_fees) }
          column("Total Tips") { |user| number_to_currency(user.total_tips) }
          column("Avg Delivery Time") { |user|
            user.avg_delivery_time ? number_with_precision(user.avg_delivery_time, precision: 2) : "N/A"
          }
        end
      end
    end
  end


# Helper method for most frequent customer
  controller do
    def most_frequent_customer_for(user, status)
      frequent_customer = user.partner_orders.where(partner_status: status)
                                            .group(:user_id)
                                            .order('COUNT(user_id) DESC')
                                            .first&.user
      frequent_customer.present? ? frequent_customer.username : "N/A"
    end
end






  # Third Row: Detailed User and Menu Item Stats
  columns do
    column do
      panel "Top 5 Users by Orders" do
        top_users = User.joins(:orders)
                        .select('users.*, COUNT(orders.id) as orders_count')
                        .group('users.id')
                        .order('orders_count DESC')
                        .limit(5)
        table_for top_users do
          column :first_name
          column("Orders Count") { |user| user.orders_count }
          column :role
          column :created_at
          column :updated_at
          column "Order Details" do |user|
            user.orders.limit(3).map { |order| "#{order.restaurant.name} - $#{order.total_price}" }.join(', ')
          end
        end
      end
    end

      column do
        panel "Menu Items by Restaurant" do
          table_for MenuItem.joins(:restaurant).group('restaurants.name') do
            column :name do |item|
              "#{item.name} - #{item.order_items.sum(:quantity)} orders"
            end
            column :restaurant
          end
        end
      end
    end

    # Fourth Row: Recent Order Details and Daily Order Status
    columns do
      column do
        panel "Recent Orders" do
          table_for Order.order('created_at desc').limit(10) do
            column :id
            column :user
            column :restaurant
            column :total_price
            column :created_at
          end
        end
      end

        column do
          panel "Recent Partner Orders" do
            table_for PartnerOrder.order('created_at desc').limit(10) do
              column :id
              column :partner
              column :order
              column :status
              column :created_at
            end
          end
        end

      column do
        panel "Daily Order Status" do
          today_orders = Order.where(created_at: Time.zone.today.all_day)
                              .or(Order.where(updated_at: Time.zone.today.all_day))
                              .group(:status)
                              .count
          pie_chart today_orders
        end
      end
    end

    # Fifth Row: Overall Order Stats
    panel "Order Stats" do
      stats_data = Order.group(:status).count
      bar_chart stats_data
    end
  end
end
