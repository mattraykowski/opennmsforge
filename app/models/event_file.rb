# == Schema Information
#
# Table name: event_files
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  content        :text
#  config_pack_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class EventFile < ActiveRecord::Base
  belongs_to :config_pack
  attr_accessible :content, :name

  validates :content, presence: true
  validates :name,    presence: true
end
