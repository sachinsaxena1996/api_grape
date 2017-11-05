class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :name, null: false
      t.string :access_token, null: false
      t.datetime :expires_at
      t.integer :user_id
      t.boolean :active
      t.timestamps null: false
    end
    add_index :tenants, ['user_id'], name: 'index_tenants_on_user_id',
                unique: false
    add_index :tenants, ['access_token'], name: 'index_tenants_on_access_token',
                unique: true
  end
end
