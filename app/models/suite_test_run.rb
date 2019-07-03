class SuiteTestRun < ApplicationRecord
  belongs_to :user
  belongs_to :project

  has_many :test

  enum status: [ :failed, :successed ]
end
