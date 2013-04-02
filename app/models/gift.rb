class Gift < ActiveRecord::Base

  belongs_to :list

  attr_accessible :description, :list_id, :name

end
