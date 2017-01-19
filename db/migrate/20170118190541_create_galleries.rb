class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galleries do |t|
      t.json :avatars
      t.integer :year

      t.timestamps
    end
  end
end
