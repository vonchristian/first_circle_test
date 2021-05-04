# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ApplicationRecord.transaction do
  puts "Creating storefront..."
  storefront = Storefront.create!(name: "First Circle Store")
  puts "Initializing products..."
  ipd = Product.create!(sku: 'ipd', name: "Super Ipad", storefront: storefront)
  mbp = Product.create!(sku: 'mbp', name: "Macbook Pro", storefront: storefront)
  atv = Product.create!(sku: 'atv', name: "Apple TV", storefront: storefront)
  vga = Product.create!(sku: 'vga', name: "VGA Adapter", storefront: storefront)

  puts "Create pricings..."
  ipd.pricings.create!(amount: 549.99)
  mbp.pricings.create!(amount: 1399.99)
  atv.pricings.create!(amount: 109.50)
  vga.pricings.create!(amount: 30.00)
  puts "Creating discount rules..."

  puts "We're going to have a 3 for 2 deal on Apple TVs. For example, if you buy 3 Apple TVs, you will pay the price of 2 only"

  atv.x_for_y_discounts.create!(name: "3 for 2 deal on Apple TV", purchase_quantity: 3, discounted_quantity: 1, enabled: true)

  puts "the brand new Super iPad will have a bulk discount applied, where the price will drop to $499.99 each, if someone buys more than 4"

  ipd.bulk_discounts.create!(min_purchase_quantity: 4, discount_price: 499.99, enabled: true)

  puts "we will bundle in a free VGA adapter free of charge with every MacBook Pro sold"

  mbp.freebies.create!(freebie_product: vga, quantity: 1, enabled: true)

  puts "Seed files created successfully"
end
