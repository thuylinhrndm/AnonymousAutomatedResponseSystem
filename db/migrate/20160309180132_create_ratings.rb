class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.integer :saved_link_id

      t.timestamps
    end
  end
end
