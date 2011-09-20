class Recommendation < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :initials, :dob, :id_code, :start_dt, :end_dt

  def self.notify_expiring(date)
    @recommendations = Recommendation.find(:all, :conditions => ["email is NOT NULL and end_dt = ?", date])
    @recommendations.each do |recommendation|
      Emailer.deliver_recommendation_expiration(recommendation)
    end
  end
end
