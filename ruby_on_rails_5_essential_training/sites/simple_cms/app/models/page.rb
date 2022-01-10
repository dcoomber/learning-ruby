class Page < ApplicationRecord

  # One-to-one association or one-to-many association
  belongs_to :subject

  has_many :sections

end
