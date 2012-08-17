class CreateNonSiteUsers < ActiveRecord::Migration
  def self.up
    create_table :non_site_users do |t|
      t.string :email, :null => false, :limit => 100
      t.integer :invitable_id, :null => false
      t.string :invitable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :non_site_users
  end
end
