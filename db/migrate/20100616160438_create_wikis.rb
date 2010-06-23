class CreateWikis < ActiveRecord::Migration
  def self.up
    create_table :wikis, :force => true do |t|
      t.references :project
      t.string :title
      t.timestamps
    end
  end

  def self.down
    drop_table :wikis
  end
end
