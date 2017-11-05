class Tenant < ActiveRecord::Base
  before_create :generate_access_token
  before_create :set_expiration
  belongs_to :user

  def expired?
    Time.now >= self.expires_at
  end

  def self.total_requests
     Tenant.sum(:num_of_requests)
  end

  private

  def generate_access_token
    loop do
      self.access_token = SecureRandom.hex
      break unless self.class.exists?(access_token: access_token)
    end
  end

  def set_expiration
    self.expires_at = Time.now + 1.day
  end
end
