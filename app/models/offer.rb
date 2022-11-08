class Offer < ApplicationRecord
  belongs_to :camera
  belongs_to :user

  enum :status, { pending: 0, accepted: 1, declined: 2 }
end
