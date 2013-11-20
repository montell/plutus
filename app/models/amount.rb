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

  scope :newer_than, lambda {|query_date|
    where("created_at > '#{query_date.strftime('%Y-%m-%d %H:%M:%S')}'")
  }

  #scope :in_current_quarter, where("created_at >= #{Time.now.beginning_of_quarter.utc.strftime('%Y-%m-%d %H:%M:%S')}")

  def self.in_current_quarter
    current_time = Time.now
    where(:time_period => "#{current_time.year}-#{((current_time.month - 1) / 3) + 1}" )
  end

end