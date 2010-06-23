class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets, :force => true do |t|
      t.references :attachable, :polymorphic => true
      t.string :data_file_name
      t.string :data_content_type
      t.string :data_file_size
      t.string :orig_name
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
