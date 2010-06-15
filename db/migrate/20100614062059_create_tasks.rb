class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks, :force => true do |t|
      t.string :name
      t.text :description
      t.datetime :delivered_at
      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
