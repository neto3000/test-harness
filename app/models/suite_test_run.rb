class SuiteTestRun < ApplicationRecord
  belongs_to :user
  belongs_to :project

  has_many :test
end
