class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one?(item_name)
    self.freebies.find_by(item_name: item_name) ? true : false
  end
  def give_away(dev, freebie)
    self.received_one?(freebie.item_name) ? freebie.update_attribute(:dev_id, dev.id) : nil
  end
end
