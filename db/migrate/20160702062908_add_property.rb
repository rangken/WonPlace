class AddProperty < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :key,   null: false
      t.string :value,   null: false
    end
  end
end
