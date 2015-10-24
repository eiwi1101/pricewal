class PageView < ActiveRecord::Base
  scope :not_admin, -> { where.not("controller LIKE (?)", "%admin%") }
end
