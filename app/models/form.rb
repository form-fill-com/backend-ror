class Form < ApplicationRecord
  belongs_to :user

  has_many :form_fields
  has_many :form_responses

  validates :title, presence: true
end
