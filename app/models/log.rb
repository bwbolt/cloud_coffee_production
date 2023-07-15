class Log < ApplicationRecord
  belongs_to :lot
  has_many :blend_logs
  

  def self.todays_logs
    where(created_at: Date.today.all_day)
  end

  def self.to_csv 
    attributes = %w[id lot_id batches batch_size_kg total_roasted weight_out moisture_loss created_at updated_at]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |log|
        csv << attributes.map { |attr| log.send(attr) }
      end
    end
  end


end
