class AddNumOfRequestToTenant < ActiveRecord::Migration
  def change
    add_column :tenants, :num_of_requests, :integer
  end
end
