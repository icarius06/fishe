class CreateInitialSchema < ActiveRecord::Migration
  def up
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :cellnum,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      ## Rememberable
      t.datetime :remember_created_at
      ## Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.timestamps
    end

    create_table(:profiles) do |t|
      t.string  :fname,              :null => false, :default => ""
      t.string  :lname,              :null => false, :default => ""
      t.references :user
      t.timestamps
    end
    
    create_table (:catches) do |t|
      t.references :user
      t.timestamps
    end

    create_table (:catch_profiles) do |t|
      t.references :catch
      t.string :species
      t.decimal :quantity 
      t.timestamps
    end    
    
    create_table(:bids) do |t|
      t.decimal :price , :precision => 8, :scale => 2,:default=>0.00
	    t.integer :quantity,:default =>0
      t.references :user
	    t.string :species
      t.references :catch
      t.boolean :is_won
      t.timestamps
    end
	
    create_table(:locations) do |t|
      t.string :coordinates
      t.string :air_temp
      t.string :name
      t.references :user
      t.timestamps
    end
    
    create_table(:notifications) do |t|
      t.string :message
      t.references :user
      t.timestamps
    end

    create_table :active_admin_comments do |t|
      t.string :namespace
      t.text   :body
      t.string :resource_id,   null: false
      t.string :resource_type, null: false
      t.references :author, polymorphic: true
      t.timestamps
    end
    
    add_index :active_admin_comments, [:namespace]
    add_index :active_admin_comments, [:author_type, :author_id]
    add_index :active_admin_comments, [:resource_type, :resource_id]

    add_index :users, :cellnum,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    add_index :locations, :coordinates
    add_index :locations, :name
  end

  def down
    [:users,:notifications,:locations,:catches,:bids,:profiles,:active_admin_comments].each do |table|
      drop_table "#{table}"
    end
  end
end
