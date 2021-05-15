class CreateInstruments < ActiveRecord::Migration[6.0]
  def change
    create_table :instruments do |t|
      t.string :name
      t.string :model
      t.string :type
      t.text :details
      t.integer :year
      t.float :rate
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
