class TestRun < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :suite_test_run

  has_many :test

  enum status: [ :failed, :successed ]
end
