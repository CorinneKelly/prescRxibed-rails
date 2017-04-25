class CreateSymptoms < ActiveRecord::Migration[5.0]
  def change
    create_table :symptoms do |t|
    	t.integer :prescription_id
    	t.string :name
    end
  end
end
