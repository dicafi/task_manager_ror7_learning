# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :tasks, dependent: :restrict_with_error

  def related_tasks
    return '-' if tasks.empty?

    tasks.map(&:name).join(', ')
  end
end
