class Account < ApplicationRecord
	has_many :prescriptions
	has_many :symptoms, through: :prescriptions

  def self.from_token(token)
    account_id = Auth.decode(token)["account_id"]
    Account.find(account_id)
  end

  def self.authenticate(googleId)
    account = Account.find_by(googleId: googleId)
  end
  
end
