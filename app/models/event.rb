class Event < ApplicationRecord
  validates_presence_of :name, :description

  has_many :attendees, :dependent => :destroy
  has_many :event_groupships
  has_many :groups, :through => :event_groupships
  belongs_to :category
  belongs_to :user
  has_one :location

  delegate :name , :to => :category , :prefix => true , :allow_nil => true
  delegate :name , :to => :location , :prefix => true , :allow_nil => true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def full_name=(full_name)
    name = full_name.split(" ")
    self.first_name = name.first
    self.last_name = name.second
  end
end
