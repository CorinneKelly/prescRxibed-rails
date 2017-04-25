class Prescription < ApplicationRecord
  belongs_to :account
  has_one :schedule
  has_many :symptoms


end
