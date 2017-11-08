class AddTimestampsToLoan < ActiveRecord::Migration[5.1]
  def change
    add_column :loans, :created_at, :datetime, null: false
    add_column :loans, :updated_at, :datetime, null: false
  end
end
