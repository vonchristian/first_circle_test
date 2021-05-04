# README

This assessment is created with Ruby 3 and Rails 6.1.

## Database creation and initialization
Seed files are created to populate initial data for testing purposes
  ```properties
rails db:create db:migrate db:seed
```


### How to run the test suite with RSpec

```properties
rspec spec/
```
## Design Considerations
The code was designed to record computed discount amounts instead of subtracting it from the regular price of products.
Considering that a storefront needs this data to:
* Generate reports for total discount given to customers
* Record sales discount entry for accounting purposes.
* Needed data to come up with the Cost of Goods Sold in order for the store front to know their income for a processed order.

### Discount Rules
The following models area created to represent the different discounting rules.
#### **Bulk Discount**
  Enable bulk discount rules for products. When customers reach a certain minimum purchase quantity, a bulk discount rule will effect on their purchase.

  To run the test for this rule:
  ```properties
rspec spec/services/checkout/discounts/apply_bulk_discount_spec.rb
```

#### **Freebie**
 A free item can be bundled to a product during a purchase.

 To run the test for this rule:
  ```properties
rspec spec/services/checkout/discounts/apply_freebie_spec.rb
```

#### **X for Y Discount**
 Example. 3 for 2 deal on Apple TVs.

 To run the test for this rule:
  ```properties
rspec spec/services/checkout/discounts/apply_x_for_y_discount_spec.rb
```
