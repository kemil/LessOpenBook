class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :fb_id
      t.string :profile_url
      t.string :email
      t.string :about
      t.string :message
      t.string :sex
      t.string :relationship_status
      t.string :birthday
      t.string :interested_in
      t.string :looking_for
      t.string :hometown
      t.string :current_city
      t.string :thumb_url
      t.string :religion
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
