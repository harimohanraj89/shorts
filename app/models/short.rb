class Short < ActiveRecord::Base
  validates_presence_of :url, :short
  validates_uniqueness_of :url, :short
  before_validation :shorten

  def shorten
    self.short = Array.new(8) { valid_chars.sample }.join unless self.persisted?
  end

  def valid_chars
    [
      ('A'..'Z').to_a,
      ('a'..'z').to_a,
      ('0'..'9').to_a
    ].flatten
  end
end
