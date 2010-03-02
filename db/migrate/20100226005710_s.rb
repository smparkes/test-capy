class S < ActiveRecord::Migration
  def self.up
    add_column :hellos, :s, :string
  end

  def self.down
  end
end
