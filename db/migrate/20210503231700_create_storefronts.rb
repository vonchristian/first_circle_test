class CreateStorefronts < ActiveRecord::Migration[6.1]
  def change
    create_table :storefronts do |t|
      t.string :name

      t.timestamps
    end
  end
end
