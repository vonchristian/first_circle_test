class Cart < ApplicationRecord
  has_many :sales_line_items, dependent: :destroy
  has_many :products, through: :sales_line_items
  has_many :freebies, through: :products
  has_many :cart_discounts, dependent: :destroy
  has_many :sales_line_item_discounts, through: :sales_line_items
  def total_cost
    total_cost_without_discount -
    total_discount
  end

  def total_cost_without_discount
    sales_line_items.total_cost
  end

  def total_discount
    cart_discounts.total_cost +
    total_sales_line_item_discounts

  end
  def total_sales_line_item_discounts
    sales_line_items.total_discount
  end

  def scan(sku)
    product = Product.find_by(sku: sku)
    if product
      Checkout::Processor.process(product: product, cart: self)
    else
      puts "Product not found"
    end
    content
  end

  def content
    reload

    items = []
    items << "Items (#{sales_line_items.size})"
    sales_line_items.each do |item|
      items << ("#{item.product_name}, #{item.unit_cost}")
    end

    items << "****************"
    items << "Discounts"
    items << ""
    cart_discounts.each do |discount|
      items << ("#{discount.name}, #{discount.amount}")
    end

    sales_line_items.includes(:sales_line_item_discounts).each do |item|
      item.sales_line_item_discounts.each do |discount|
        items << ("#{discount.name}, #{discount.amount}")
      end
    end
    items << "****************"

    items << "Subtotal: #{total_cost_without_discount}"
    items << "Total Discount: #{total_discount}"
    items << "Total: #{total_cost}"


    puts items

  end
end
