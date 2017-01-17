class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galleries do |t|
      t.string :avatar
      t.integer :year

      t.timestamps
    end
  end
end
