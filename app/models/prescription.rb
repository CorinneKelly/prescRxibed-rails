class Prescription < ApplicationRecord
  belongs_to :account
  has_one :schedule


end
