class Transaction < ApplicationRecord
  validates_presence_of :invoice_id,
                        :credit_card_number,
                        :result
  belongs_to :invoice
  has_many :customers, through: :invoice

  enum result: [:failed, :success]
end
