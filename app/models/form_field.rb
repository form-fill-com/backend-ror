class FormField < ApplicationRecord
  belongs_to :form

  has_many :response_values
end
