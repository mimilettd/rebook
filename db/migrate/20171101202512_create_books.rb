class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.references :category, foreign_key: true
      t.references :publisher, foreign_key: true
      t.string :title
      t.string :subtitle
      t.string :author
      t.string :description
      t.string :ISBN
      t.string :image_url

      t.timestamps
    end
  end
end
