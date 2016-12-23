class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
      t.integer :type
      t.integer :year
      t.string :school
      t.integer :rank

      t.timestamps
    end
  end
end
