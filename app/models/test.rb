class Test < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  belongs_to :project
end
