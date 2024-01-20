# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'
require 'colorize'
require 'geocoder'
require 'awesome_print'


# Clear existing records
def clear_database
    models_to_clear = [
      OrderItemModifier, MenuItemModifier, ModifierOption, ItemPrice,
      OrderItem, MenuItem, Modifier,
      Order, PartnerOrder,
      User, Restaurant
    ]
    models_to_clear.each do |model|
      model.destroy_all
    end
  end

############ CLEARING DB ###################

# restaurant_data is an array of restaurant data objects used to seed the restaurants table.
# Each object contains an id, name, latitude, and longitude for a restaurant.
# This allows seeding the database with predefined restaurant records.

restaurant_data = [
  { id: 1, name: "Alberto’s", latitude: 45.319746487834, longitude: -111.267710168327, cuisine_type: "Mexican" },
  { id: 2, name: "Wrap Shack", latitude: 45.069721784971, longitude: -111.656607607791, cuisine_type: "Mexican" },
  { id: 3, name: "BYWOM", latitude: 45.259353869574, longitude: -111.313166815647, cuisine_type: "American" },
  { id: 4, name: "Milkies Pizza & Pub", latitude: 45.259353869574, longitude: -111.313166815647, cuisine_type: "Pizza" },
  { id: 5, name: "Hungry Moose Deli", latitude: 45.259353869574, longitude: -111.313166815647, cuisine_type: "Deli" },
  { id: 6, name: "The Rocks", latitude: 45.259353869574, longitude: -111.313166815647, cuisine_type: "American" },
  { id: 7, name: "Tips Up", latitude: 45.259353869574, longitude: -111.313166815647, cuisine_type: "American" },
  { id: 8, name: "Bloc3", latitude: 45.259353869574, longitude: -111.313166815647, cuisine_type: "American" },
  { id: 9, name: "Pinky G’s", latitude: 45.259353869574, longitude: -111.313166815647, cuisine_type: "Pizza" },
  { id: 10, name: "Ousel & Spur Pizza Co", latitude: 45.259353869574, longitude: -111.313166815647, cuisine_type: "Pizza" },
  { id: 11, name: "Thai Basil", latitude: 45.259353869574, longitude: -111.313166815647, cuisine_type: "Thai" },
  { id: 12, name: "Tres Toros Tacos & Taquilla", latitude: 45.259353869574, longitude: -111.313166815647, cuisine_type: "Mexican" },
  { id: 13, name: "Blue Buddha Sushi", latitude: 45.259353869574, longitude: -111.313166815647, cuisine_type: "Sushi" },
  { id: 14, name: "Caliber Coffee", latitude: 45.259353869574, longitude: -111.313166815647, cuisine_type: "Coffee" },
  { id: 15, name: "Blue Moon Bakery", latitude: 45.259353869574, longitude: -111.313166815647, cuisine_type: "Bakery" }
]

menu_item_data = [
  { id: 1, restaurant_id: 1, types_of_food: "Mexican", name: "Chicken Tikka", description: "Spicy grilled chicken" },
  { id: 2, restaurant_id: 2, types_of_food: "Mexican", name: "Beef Burrito", description: "Flour tortilla filled with beef" },
  { id: 3, restaurant_id: 3, types_of_food: "American", name: "Classic Burger", description: "Grilled beef patty with lettuce and tomato" },
  { id: 4, restaurant_id: 4, types_of_food: "Italian", name: "Margherita Pizza", description: "Pizza with tomatoes, mozzarella, and basil" },
  { id: 5, restaurant_id: 5, types_of_food: "American", name: "Club Sandwich", description: "Triple-layered sandwich with turkey, bacon, and lettuce" },
  { id: 6, restaurant_id: 6, types_of_food: "American", name: "BBQ Ribs", description: "Barbecue glazed pork ribs" },
  { id: 7, restaurant_id: 7, types_of_food: "American", name: "Buffalo Wings", description: "Spicy chicken wings with blue cheese dip" },
  { id: 8, restaurant_id: 8, types_of_food: "Italian", name: "Veggie Pizza", description: "Pizza topped with assorted vegetables" },
  { id: 9, restaurant_id: 9, types_of_food: "Italian", name: "Pepperoni Pizza", description: "Pizza with pepperoni and cheese" },
  { id: 10, restaurant_id: 10, types_of_food: "Italian", name: "Hawaiian Pizza", description: "Pizza with ham and pineapple" },
  { id: 11, restaurant_id: 11, types_of_food: "Thai", name: "Pad Thai", description: "Stir-fried rice noodle dish" },
  { id: 12, restaurant_id: 12, types_of_food: "Mexican", name: "Taco Salad", description: "Salad with taco toppings" },
  { id: 13, restaurant_id: 13, types_of_food: "Japanese", name: "California Roll", description: "Sushi roll with crab, avocado, and cucumber" },
  { id: 14, restaurant_id: 14, types_of_food: "Coffee", name: "Latte", description: "Coffee with steamed milk" },
  { id: 15, restaurant_id: 15, types_of_food: "French", name: "Chocolate Croissant", description: "Buttery croissant with chocolate filling" }
  # ... additional menu items
]


item_prices_data = [
  { id: 1, item_id: 1, base_price: 15.00 },
  { id: 2, item_id: 2, base_price: 12.00 },
  { id: 3, item_id: 3, base_price: 10.00 },
  { id: 4, item_id: 4, base_price: 14.00 },
  { id: 5, item_id: 5, base_price: 9.50 },
  { id: 6, item_id: 6, base_price: 18.00 },
  { id: 7, item_id: 7, base_price: 11.00 },
  { id: 8, item_id: 8, base_price: 13.00 },
  { id: 9, item_id: 9, base_price: 15.50 },
  { id: 10, item_id: 10, base_price: 16.00 },
  { id: 11, item_id: 11, base_price: 14.00 },
  { id: 12, item_id: 12, base_price: 10.00 },
  { id: 13, item_id: 13, base_price: 12.00 },
  { id: 14, item_id: 14, base_price: 4.00 },
  { id: 15, item_id: 15, base_price: 3.50 },
  { id: 16, item_id: 16, base_price: 13.00 },
  { id: 17, item_id: 17, base_price: 6.50 }
  # ... additional item prices
]


menu_item_modifiers_data = [
  { id: 1, menu_item_id: 1, modifier_id: 1, primary: true },
  { id: 2, menu_item_id: 1, modifier_id: 2, primary: false },
  { id: 3, menu_item_id: 2, modifier_id: 3, primary: true },
  { id: 4, menu_item_id: 2, modifier_id: 4, primary: false },
  { id: 5, menu_item_id: 3, modifier_id: 5, primary: true },
  { id: 6, menu_item_id: 4, modifier_id: 6, primary: true },
  { id: 7, menu_item_id: 5, modifier_id: 7, primary: false },
  { id: 8, menu_item_id: 6, modifier_id: 8, primary: true },
  { id: 9, menu_item_id: 7, modifier_id: 9, primary: true },
  { id: 10, menu_item_id: 8, modifier_id: 10, primary: false },
  { id: 11, menu_item_id: 9, modifier_id: 11, primary: true },
  { id: 12, menu_item_id: 10, modifier_id: 1, primary: false },
  { id: 13, menu_item_id: 11, modifier_id: 2, primary: true },
  { id: 14, menu_item_id: 12, modifier_id: 3, primary: false },
  { id: 15, menu_item_id: 13, modifier_id: 4, primary: true },
  { id: 16, menu_item_id: 14, modifier_id: 5, primary: false },
  { id: 17, menu_item_id: 15, modifier_id: 6, primary: true },
  { id: 18, menu_item_id: 16, modifier_id: 7, primary: false },
  { id: 19, menu_item_id: 17, modifier_id: 8, primary: false }
  # ... additional menu item modifiers
]

modifiers_data = [
  { id: 1, name: "Cheese" },
  { id: 2, name: "Sauce" },
  { id: 3, name: "Toppings" },
  { id: 4, name: "Crust" },
  { id: 5, name: "Protein" },
  { id: 6, name: "Veggies" },
  { id: 7, name: "Spices" },
  { id: 8, name: "Dressings" },
  { id: 9, name: "Size" },
  { id: 10, name: "Sweetness Level" }
]

modifier_options_data = [
  { id: 1, modifier_id: 1, name: "Extra Cheese", additional_price: 1.00 },
  { id: 2, modifier_id: 1, name: "Vegan Cheese", additional_price: 1.50 },
  { id: 3, modifier_id: 2, name: "Spicy Sauce", additional_price: 0.50 },
  { id: 4, modifier_id: 2, name: "Garlic Sauce", additional_price: 0.75 },
  { id: 5, modifier_id: 3, name: "Olives", additional_price: 0.50 },
  { id: 6, modifier_id: 3, name: "Mushrooms", additional_price: 0.75 },
  { id: 7, modifier_id: 4, name: "Thin Crust", additional_price: 0.00 },
  { id: 8, modifier_id: 4, name: "Stuffed Crust", additional_price: 1.50 },
  { id: 9, modifier_id: 5, name: "Grilled Chicken", additional_price: 2.00 },
  { id: 10, modifier_id: 5, name: "Tofu", additional_price: 1.75 },
  { id: 11, modifier_id: 6, name: "Bell Peppers", additional_price: 0.50 },
  { id: 12, modifier_id: 6, name: "Red Onion", additional_price: 0.50 },
  { id: 13, modifier_id: 7, name: "Oregano", additional_price: 0.25 },
  { id: 14, modifier_id: 7, name: "Chili Flakes", additional_price: 0.25 },
  { id: 15, modifier_id: 8, name: "Ranch", additional_price: 0.75 },
  { id: 16, modifier_id: 8, name: "Blue Cheese", additional_price: 0.75 },
  { id: 17, modifier_id: 9, name: "Small", additional_price: -1.00 },
  { id: 18, modifier_id: 9, name: "Large", additional_price: 1.50 },
  { id: 19, modifier_id: 10, name: "Less Sweet", additional_price: 0.00 },
  { id: 20, modifier_id: 10, name: "Extra Sweet", additional_price: 0.00 }
]

# --- SEEDING DATA ---

# --- Creating Users: ActiveAdmin:Admin, User.role ='customer', & User.role ='partner'  methods ---

# AdminUser setup for development environment
def create_admin_user
  AdminUser.find_or_create_by!(email: 'admin@example.com') do |admin|
    admin.password = 'password'
    admin.password_confirmation = 'password'
  end if Rails.env.development?
end

def create_admin_user_in_production
  AdminUser.find_or_create_by!(email: 'angelmelendez@onmail.com') do |admin|
    admin.password = 'passwordofpasswordsU1BYE'
    admin.password_confirmation = 'passwordofpasswordsU1BYE'
  end if Rails.env.production?
end

# Create sample customers with random coordinates near a restaurant
def create_sample_customers(restaurant_data)
  10.times.map do
    # Choose a sample restaurant data
    restaurant = restaurant_data.sample

    # Reduced range for more realistic nearby coordinates
    delta_lat = rand(-0.005..0.005) # Adjust this range to fine-tune the proximity
    delta_long = rand(-0.005..0.005)

    # Generate nearby coordinates
    latitude = restaurant[:latitude] + delta_lat
    longitude = restaurant[:longitude] + delta_long

    # Log the generated coordinates for clarity
    puts "Creating a customer near #{restaurant[:name]} at [#{latitude}, #{longitude}]".colorize(:light_blue)

    # Create the user
    User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      username: Faker::Internet.unique.username,
      email: Faker::Internet.unique.email,
      password_hash: 'encrypted_password',
      role: 'customer', # Customers are not partners
      status: 'unavailable', # Assuming customers are not available by default
      address: Faker::Address.full_address,
      phone: Faker::PhoneNumber.phone_number,
      latitude: latitude,
      longitude: longitude
    )
  end
end


# Create at least one sample partner with random coordinates near a restaurant
def create_sample_partners(restaurant_data)
  8.times.map do # Creating close a non-close partners
      # Choose a random restaurant data to ensure the partner is nearby a restaurant
      restaurant = restaurant_data.sample

      # Reduced range for more realistic nearby coordinates
      delta_lat = rand(-0.005..0.005) # Adjust this range to fine-tune the proximity
      delta_long = rand(-0.005..0.005)

      # Generate nearby coordinates
      latitude = restaurant[:latitude] + delta_lat
      longitude = restaurant[:longitude] + delta_long

      # Log the generated coordinates for clarity
      puts "Creating a partners near #{restaurant[:name]} at [#{latitude}, #{longitude}]".colorize(:light_blue)

      # Partner status options
      partner_statuses = ['active', 'inactive', 'on_break', 'sick']

      # Create sample partners with these coordinates
      User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        username: Faker::Internet.unique.username,
        email: Faker::Internet.unique.email,
        password_hash: 'encrypted_password',
        role: 'partner', # This user is marked as a partner
        status: partner_statuses.sample, # Randomly select a status
        address: Faker::Address.full_address,
        phone: Faker::PhoneNumber.phone_number,
        latitude: latitude,
        longitude: longitude
      )
      # Create sample partners without these coordinates
      User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        username: Faker::Internet.unique.username,
        email: Faker::Internet.unique.email,
        password_hash: 'encrypted_password',
        role: 'partner', # This user is marked as a partner
        status: partner_statuses.sample, # Randomly select a status
        address: Faker::Address.full_address,
        phone: Faker::PhoneNumber.phone_number,
        latitude: nil,
        longitude: nil
      )
    end
  end

# --- Seeding Predefined: restaurant_data, modifiers_data, modifier_options_data, & Modifier methods ---

def seed_predefined_restaurants(restaurant_data) #DEF's 3 down with prepended - seed_ are quazi-real perminent data -- Will need to figure out a better way to seed all real data, that's necessary and doesn't change much, unlike an Order for example that'll get status update changes, along with creating a PartnerAssignment at its final status change, through an OrdesAwaitingAssignment socket that'll listen for that change and assign Order to PartnerAssignment
  restaurant_data.each do |data|
    Restaurant.find_or_create_by!(id: data[:id]) do |restaurant|
      restaurant.name = data[:name]
      restaurant.latitude = data[:latitude]
      restaurant.longitude = data[:longitude]
      restaurant.cuisine_type = data[:cuisine_type]
      restaurant.address = Faker::Address.street_address
      restaurant.phone = Faker::PhoneNumber.phone_number
    end
  end
end

def seed_predefined_menu_items(menu_item_data)
  menu_item_data.each do |data|
    restaurant = Restaurant.find_by(id: data[:restaurant_id])
    MenuItem.create!(
      name: data[:name],
      description: data[:description],
      types_of_food: data[:types_of_food],
      restaurant: restaurant
    ) if restaurant
  end
end


# Create modifiers with options
def seed_modifiers_and_options(modifiers_data, modifier_options_data)
  modifiers_data.each do |mod_data|
    modifier = Modifier.find_or_create_by!(id: mod_data[:id], name: mod_data[:name])
  end

  modifier_options_data.each do |mod_option_data|
    modifier = Modifier.find(mod_option_data[:modifier_id])
    if modifier
      ModifierOption.find_or_create_by!(
        id: mod_option_data[:id],
        modifier: modifier,
        name: mod_option_data[:name],
        additional_price: mod_option_data[:additional_price]
      )
    end
  end
end

# Utility Methods
def calculate_delivery_fee(distance)
  return 0 unless distance
  base_fee = 2.00
  fee_per_km = 0.50
  variable_fee = distance / 1000 * fee_per_km
  base_fee + variable_fee
end

def calculate_distance(restaurant, customer)
    # Selecting a random non-partner user as customer
    non_partner_users = User.where(role: 'customer')
    customer = non_partner_users.sample

  # Selecting a random restaurant
  restaurant = Restaurant.all.sample

    # puts "Calculating distance between: restaurant [#{restaurant.latitude}, #{restaurant.longitude}] and Customer [#{customer.latitude}, #{customer.longitude}]"

    # Directly test with known coordinates (e.g., New York and Los Angeles)
    # test_distance = Geocoder::Calculations.distance_between([40.7128, -74.0060], [34.0522, -118.2437])
    # puts "Test Distance NY to LA: #{test_distance} km"

    return nil if [restaurant.latitude, restaurant.longitude, customer.latitude, customer.longitude].any?(&:nil?)

    distance = Geocoder::Calculations.distance_between([restaurant.latitude, restaurant.longitude],[customer.latitude, customer.longitude])

    # Log a warning if the distance is unusually large
  if distance > 50 # assuming 50 km is a threshold for unusual distance
    puts "Warning: Unusually large distance of #{distance} km for Order".colorize(:yellow)
  end

  puts "Calculated distance: #{distance} km for Restaurant [#{restaurant.latitude}, #{restaurant.longitude}], Customer [#{customer.latitude}, #{customer.longitude}]".colorize(:light_blue)

    distance
  end

# Constants
CANCELLATION_REASONS = ["Customer No-show", "Out of Stock", "Closed for Holiday"].freeze
ESTIMATED_WAIT_TIMES = [15, 30, 45, 60].freeze
STATUS_OPTIONS = ['restaurant_pending_approval', 'restaurant_approved', 'partner_pending_assignment', 'partner_assigned', 'delivered', 'canceled'].freeze

#### Non Complex VS Complex VVVVVVVVV
# This is the workflow from here out:


# Order Assignment Methods
def assign_order_to_partner(order)
  available_partners = User.where(role: 'partner', status: 'active')
  partners_with_distances = available_partners.map do |partner|
    distance = calculate_distance(order.restaurant, partner)
    [partner, distance]
  end
  sorted_partners = partners_with_distances.sort_by { |_, distance| distance }
  sorted_partners.each do |partner, _|
    create_partner_order(order, partner)
    return partner
  end
  nil # Return nil if no partner is assigned
end

  def assign_order_to_next_available_partner(order)
    available_partners = User.where(role: 'partner', status: 'active')
    partners_with_distances = available_partners.map do |partner|
      distance = calculate_distance(order.restaurant, partner)
      [partner, distance]
    end
    sorted_partners = partners_with_distances.sort_by { |_, distance| distance }
    sorted_partners.each do |partner, _|
      if [true, false].sample
        create_partner_order(order, partner)
        return partner
      end
    end
    nil
  end

  def create_partner_order(order, partner)

    # Validate partner exists
    if partner.nil?
      puts "No partner assigned for order #{order.id}"
      return
    end

    # Calculate delivery fee based on distance
    delivery_fee = calculate_delivery_fee(calculate_distance(order.restaurant, partner))

    # Create partner order
    if partner
    partner_order = PartnerOrder.create!(
      partner: partner,
      order: order,
      status: 'assigned',
      final_price: delivery_fee
    )
    end

    # Update order status
    order.update(status: 'partner_assigned')

    puts "Created partner order #{partner_order.id} for order #{order.id}"

    # Return created partner order
    partner_order

  end

  def create_partner_order(order, partner)
    PartnerOrder.create!(
      partner: partner,
      order: order,
      user_id: User.first.id
    )
  end

  def assign_closest_partner(order)
    available_partners = User.where(role: 'partner', status: 'active')
    closest_partner = available_partners.min_by { |partner| calculate_distance(order.restaurant, partner) }
    closest_partner
  end

  ### use these methods^^^^
  def seed_and_test_orders(restaurant_data)
    # Create customers and orders
    create_sample_customers(restaurant_data).each do |customer|
      order = Order.create!(
        user: customer,
        restaurant: Restaurant.all.sample,
        status: 'restaurant_pending_approval', # Initial status
        delivery_address: Faker::Address.street_address,
        total_price: rand(10..100)
      )
      add_random_items_to_order(order, order.restaurant)

      # Assign the order to a partner and update status to 'partner_assigned'
      partner = assign_order_to_partner(order)
      if partner
        create_partner_order(order, partner)
        order.update(status: 'partner_assigned')
        puts "Order ##{order.id} assigned to Partner ##{partner.id}"
      else
        puts "No partner assigned for Order ##{order.id}"
      end
    end
  end

  # Utility method to add random items to an order
  def add_random_items_to_order(order, restaurant)
    MenuItem.where(restaurant: restaurant).sample(5).each do |item|
      order.order_items.create!(menu_item: item, quantity: rand(1..3))
      puts "Added item #{item.name} to Order ##{order.id}"
    end
  end

  # Utility method to display order information
  def display_order_info(order, user)
    puts "\nOrder Information for Order ##{order.id}:"
    puts "Customer: #{user.username}"
    puts "Restaurant: #{order.restaurant.name}"
    puts "Status: #{order.status}"
    puts "Items:"
    order.order_items.each do |item|
      puts "- #{item.quantity} x #{item.menu_item.name}"
    end
  end


  # Call method to clear database.
  clear_database
  # Call methods to seed data
  create_admin_user
  create_sample_customers(restaurant_data)
  create_sample_partners(restaurant_data)
  seed_predefined_restaurants(restaurant_data)
  seed_predefined_menu_items(menu_item_data)
  seed_modifiers_and_options(menu_item_data, modifier_options_data)
  # Call LifeCycle
  seed_and_test_orders(restaurant_data)


  # Get a sample user, restaurant, and order for printing
    user = User.first
    restaurant = Restaurant.first
    order = Order.first
    partner_order = PartnerOrder.first
  ap user
  ap order.restaurant
  ap order
  ap order.order_items
  ap order.order_items.first.menu_item
  ap partner_order ## This is my problem, it's nil

## This script will populate your database with a variety of data for each model:

#- **Restaurants** with different names, addresses, phones, and cuisine types.
#- **Users** with various roles (customer, admin, partner), simulating different types of users in your system.
#- **Hours of Operations** for each restaurant for every day of the week.
#- **Menu Items** and their corresponding prices.
#- **Modifiers and Modifier Options**, representing the customization options for menu items.
#- **MenuItemModifiers** to link menu items with modifiers.
#- **Orders, OrderItems, and OrderItemModifiers** to represent the ordering process.
#- **PartnerOrders** to simulate orders handled by partners.
