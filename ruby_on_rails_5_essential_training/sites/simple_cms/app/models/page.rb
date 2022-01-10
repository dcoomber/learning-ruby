class Page < ApplicationRecord
  # One-to-one association or one-to-many association
  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :admin_users
end
