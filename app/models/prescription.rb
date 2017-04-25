class Prescription < ApplicationRecord
  belongs_to :account
  has_one :schedule, dependent: :destroy
  has_many :symptoms, dependent: :destroy


end
