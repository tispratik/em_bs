class CreateWikis < ActiveRecord::Migration
  def self.up
    create_table :wikis, :force => true do |t|
      t.string :name
      t.text :description
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :wikis
  end
end
