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

require 'spec_helper'

describe EventFile do
  pending "add some examples to (or delete) #{__FILE__}"
end
