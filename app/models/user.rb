class User < ApplicationRecord
  has_many :projects
  has_many :tests
  has_many :suite_tests
  has_many :test_runs
  has_many :suite_test_runs

  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL }

  private

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

end