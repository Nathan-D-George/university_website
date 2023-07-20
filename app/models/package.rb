class Package < ApplicationRecord
  belongs_to :subject
  belongs_to :qualification
end
