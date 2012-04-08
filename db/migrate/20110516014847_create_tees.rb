class CreateTees < ActiveRecord::Migration
  def self.up
    create_table :tees do |t|
      t.integer :user_id
      t.string  :name
      t.string  :category
      t.text    :content

      t.timestamps
    end
      add_index :tees, :user_id
  end

  def self.down
    drop_table :tees
  end
end
