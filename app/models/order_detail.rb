# == Schema Information
#
# Table name: order_details
#
#  id            :integer          not null, primary key
#  count         :integer          not null
#  making_status :integer          not null
#  price         :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  item_id       :integer          not null
#  order_id      :integer          not null
#
class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to
end
