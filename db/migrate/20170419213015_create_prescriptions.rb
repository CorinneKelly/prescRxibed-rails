class CreatePrescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :prescriptions do |t|
      t.references :account, index: true, foreign_key: true
      t.string :name
      t.integer :dosage
      t.text :instructions
      t.integer :quantity
      t.string :units
      t.integer :refills, default: 0
      t.string :doctor

      t.timestamps
    end
  end
end
