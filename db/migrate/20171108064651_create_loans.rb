class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :return_status, default: 0
    end
  end
end
