class ResponseValue < ApplicationRecord
  belongs_to :form_response
  belongs_to :form_field
end
