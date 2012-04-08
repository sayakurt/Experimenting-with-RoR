class AddAttachmentDesignToTee < ActiveRecord::Migration
  def self.up
    add_column :tees, :design_file_name, :string
    add_column :tees, :design_content_type, :string
    add_column :tees, :design_file_size, :integer
    add_column :tees, :design_updated_at, :datetime
  end

  def self.down
    remove_column :tees, :design_file_name
    remove_column :tees, :design_content_type
    remove_column :tees, :design_file_size
    remove_column :tees, :design_updated_at
  end
end
