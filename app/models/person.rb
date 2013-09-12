class Person < ActiveRecord::Base

has_one :address
accepts_nested_attributes_for :address

  def name
    [first_name, last_name].join()
  end
end
