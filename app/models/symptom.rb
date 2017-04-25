class Symptom < ApplicationRecord
	belongs_to :prescription
	has_many :symptom_logs

end