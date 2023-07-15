class Lot < ApplicationRecord
  belongs_to :user
  has_many :logs

  def self.current_lots_names
    current_available_lots.map { |e| e.name }
  end

  def self.current_available_lots
    arrived_lots.where('lots.current_amount > 0')
  end

  def self.ordered_lots
    where('lots.status = 1')
  end

  def self.arrived_lots
    where('lots.status = 2')
  end

  def self.ordered_or_arrived_lots
    where('lots.status = 2 or lots.status = 1')
  end

  def self.to_csv
    attributes = %w[id status name pcc_id sku importer description price_per us_arrival sample_roasted_date density moisture bean_size item_size quantity_recieved kg_received current_amount invoice_number user_id created_at updated_at ico]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |lot|
        csv << attributes.map { |attr| lot.send(attr) }
      end
    end
  end

  def days_left
      days_since_arrival = (Date.today - self.created_at.to_date).to_i
      if self.current_amount <= 0
        return 0
      elsif self.current_amount == self.kg_received
        return Float::INFINITY
      else
        rate_of_decline = (self.kg_received - self.current_amount) / days_since_arrival.to_f
        days_to_empty = (self.current_amount / rate_of_decline).ceil
        return days_to_empty
      end
    end
    




end
