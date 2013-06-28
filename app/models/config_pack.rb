# == Schema Information
#
# Table name: config_packs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  summary    :text
#  install    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  vendor     :string(255)
#  product    :string(255)
#

class ConfigPack < ActiveRecord::Base
  acts_as_commentable

  belongs_to :user
  has_many :event_files

  attr_accessible :install, :name, :summary, :vendor, :product, :updated_at, :created_at

  validates :user,    presence: true
  validates :name,    presence: true
  validates :summary, presence: true
  validates :vendor, presence: true
  validates :product, presence: true

  DIMENSIONS = ["pack_overall"]
  letsrate_rateable *DIMENSIONS

  DIMENSIONS.each do |dimension|
    has_one :"#{dimension}_average", :as => :cacheable, :class_name => "RatingCache", :dependent => :destroy, :conditions => {:dimension => dimension.to_s}
  end

  def is_owned_by?(user)
    self.user.id == user.id
  end
end
