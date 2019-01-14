class Comment < ApplicationRecord
  include RailsInteractLike
  attribute :score, :float, default: 0
  attribute :liked_count, :integer, default: 0
  attribute :star_count, :integer, default: 0
  belongs_to :commentable, polymorphic: true
  belongs_to :commenter, class_name: 'User'
  has_many :attitudes, as: :attitudinal, dependent: :delete_all

  default_scope -> { order(id: :desc) }

  has_closure_tree
  before_validation :sync_commentable, if: -> { commentable_type.blank? && commentable_id.blank? }
  before_save :compute_score, if: -> { star_count_changed? }

  def sync_commentable
    if parent
      self.commentable_type = parent.commentable_type
      self.commentable_id = parent.commentable_id
    end
  end

  def compute_score
    self.score = self.star_count.to_i * 2
  end

end
