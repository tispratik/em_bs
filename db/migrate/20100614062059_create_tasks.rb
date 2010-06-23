class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks, :force => true do |t|
      t.references :project       
      t.string :name
      t.integer :assign_to
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
