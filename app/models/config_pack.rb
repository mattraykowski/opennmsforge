class ConfigPack < ActiveRecord::Base
  belongs_to :user
  attr_accessible :install, :name, :summary

  validates :user,    presence: true
  validates :name,    presence: true
  validates :summary, presence: true

  def is_owned_by?(user)
    self.user.id == user.id
  end
end
