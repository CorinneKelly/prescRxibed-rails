class SymptomLog < ApplicationRecord
	belongs_to :symptom
	has_many :symptom_log_images
end