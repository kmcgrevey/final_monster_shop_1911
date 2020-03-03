class Discount < ApplicationRecord
	validates_presence_of :name, :percent_off, :bulk_minimum

  validates_numericality_of :percent_off, greater_than: 0, less_than_or_equal_to: 1

	# validates_numericality_of :percent_off, less_than_or_equal_to: 1
  #
  # :only_integer => true,

  belongs_to :merchant
end
