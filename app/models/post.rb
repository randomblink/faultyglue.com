# /Volumes/Storage/Projects/faultyglue.com/app/models/post.rb
# frozen_string_literal: true

class Post < ApplicationRecord
  has_rich_text :body

  STATUSES = %w[draft published].freeze

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :status, inclusion: { in: STATUSES }, allow_blank: false

  before_validation :ensure_slug
  before_validation :ensure_status

  scope :oldest_first, -> { order(created_at: :asc) }
  scope :newest_first, -> { order(created_at: :desc) }
  scope :published, -> { where(status: "published") }

  def published?
    status == "published"
  end

  private

  def ensure_status
    self.status = "draft" if status.blank?
  end

  def ensure_slug
    base = (slug.presence || title.to_s).to_s.parameterize
    self.slug = base if base.present?
  end
end
