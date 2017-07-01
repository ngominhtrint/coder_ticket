class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :owner, class_name: 'User'
  has_many :ticket_types
  has_many :ticket

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def self.upcoming
    where("ends_at > ?", Time.now).published
  end

  def self.published
    where.not(published_at: nil)
  end

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
