# The Amount class represents debit and credit amounts in the system.
#
# @abstract
#   An amount must be a subclass as either a debit or a credit to be saved to the database.
#
# @author Michael Bulat
class Amount < ActiveRecord::Base
  attr_accessible :plutus_account, :amount, :transaction

  belongs_to :transaction
  belongs_to :plutus_account

  validates_presence_of :type, :amount, :transaction, :plutus_account
end