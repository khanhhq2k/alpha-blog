class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: {case_sensitive: false},
            length: {maximum: 20, minimum: 3}
end