class Project < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :tests
  has_many :suite_tests
  has_many :test_runs
  has_many :suite_test_runs
end