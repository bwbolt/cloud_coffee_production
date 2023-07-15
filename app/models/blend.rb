class Blend < ApplicationRecord
  belongs_to :user
  has_many :blend_logs

  def self.todays_blends
    where(created_at: Date.today.all_day)
  end

  def self.to_csv 
    attributes = %w[id name notes user_id]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |log|
        csv << attributes.map { |attr| log.send(attr) }
      end
    end
  end
end
