class Account < ApplicationRecord
<<<<<<< HEAD
	has_many :prescriptions
	has_many :symptoms, through: :prescriptions
=======
  
>>>>>>> 354a62f50abb36c9eaf939c66e2fad2034cf5d34

  def self.from_token(token)
    account_id = Auth.decode(token)["account_id"]
    Account.find(account_id)
  end

  def self.authenticate(googleId)
    account = Account.find_by(googleId: googleId)
  end

end
