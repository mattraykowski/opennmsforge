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

require 'spec_helper'

describe ConfigPack do
  pending "add some examples to (or delete) #{__FILE__}"
end
