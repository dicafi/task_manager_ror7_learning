# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :tasks, dependent: :restrict_with_error
end
