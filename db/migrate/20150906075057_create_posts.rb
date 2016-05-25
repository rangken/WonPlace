class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
			t.text :content
			t.string :hashtags

			# img
			t.string :img_file_name
			t.string :img_content_type
			t.integer :img_file_size
			t.datetime :img_updated_at
			# media
			t.string :media_file_name
			t.string :media_content_type
			t.integer :media_file_size
			t.datetime :media_updated_at

			t.references :user
			t.integer :spot_id
			t.boolean :open

      t.timestamps null: false
    end
  end
end
