class AddImages < ActiveRecord::Migration
  def change
    create_table :image_types do |t|
      t.string :name
      t.timestamps
    end

    create_table :images do |t|
      t.integer :position
      t.string :attribution
      t.string :name
      t.references :image_type
      t.references :imageable, polymorphic: true
      t.attachment :image
      t.timestamps
    end

    add_index :images, [:imageable_id, :imageable_type]
    add_index :images, :image_type_id
  end
end

