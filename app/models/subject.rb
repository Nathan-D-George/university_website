class Subject < ApplicationRecord
  belongs_to :user
  belongs_to :qualification
end
