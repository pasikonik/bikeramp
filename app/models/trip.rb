class Trip < ApplicationRecord
  ADDRESS_FORMAT = /^\w+ \d+, \w+, \w+$/

  validates :start_address, :destination_address, :distance, :price, :date, presence: true
  validates :price, numericality: true

  validate :proper_addresses_format

  private

  def proper_addresses_format
    unless ADDRESS_FORMAT.match(start_address) &&
           ADDRESS_FORMAT.match(destination_address)
      errors.add(:addresses, 'must be in the valid format')
    end
  end
end
