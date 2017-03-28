class Parking < ApplicationRecord
  validates_presence_of :parking_type, :start_at
  validates_inclusion_of :parking_type, :in => ["guest","short-term","long-term"]

  validate :validate_end_at_with_amount

  def validate_end_at_with_amount
    if ( end_at.present? && amount.blank? )
      errors.add(:amount, "have end_at must have amount")
    end

    if ( end_at.blank? && amount.present? )
      errors.add(:end_at, "have amount must have end_at")
    end
  end

  def duration
    ( end_at - start_at) / 60
  end

  def calculate_amount
    if self.amount.blank? && self.start_at.present? && self.end_at.present?
      self.amount = 9888
    end
  end
end