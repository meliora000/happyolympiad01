class FixColumName < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :posts, :type, :genre
  end
end
