class AddUserIdToCatRentalRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :cat_rental_requests, :user_id, :integer, index: true
  end
end
