class EventFile < ActiveRecord::Base
  belongs_to :config_pack
  attr_accessible :content, :name

  validates :content, presence: true
  validates :name,    presence: true
end
