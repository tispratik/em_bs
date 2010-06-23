class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles, :force => true do |t|

      t.references :project

      t.string :title


      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
