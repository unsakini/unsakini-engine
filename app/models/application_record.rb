# Base application model

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
