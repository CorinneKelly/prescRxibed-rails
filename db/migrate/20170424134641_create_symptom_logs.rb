class CreateSymptomLogs < ActiveRecord::Migration[5.0]
  def change
  	create_table :symptom_logs do |t|
  		t.integer :symptom_id
  		t.integer :severity
  		t.text :description
  		t.jsonb :uploadedFiles
  		t.timestamps
  	end
  end
end
