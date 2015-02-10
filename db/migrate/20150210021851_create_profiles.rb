class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :city
      t.string :state
      t.text :description
      t.string :photo
      t.references :user, index: true
      t.string :premium

      t.timestamps null: false
    end
    add_foreign_key :profiles, :users
  end
end
