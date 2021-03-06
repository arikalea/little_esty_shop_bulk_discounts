class Invoice < ApplicationRecord
  validates_presence_of :status,
                        :customer_id

  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items

  enum status: [:cancelled, :in_progress, :complete]

  def total_revenue_before_discount
    invoice_items.sum("unit_price * quantity")
  end

  def total_revenue_after_discount
    invoice_items.sum(&:revenue)
  end
end
