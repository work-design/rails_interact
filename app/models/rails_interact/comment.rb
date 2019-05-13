module RailsInteract::Comment
  extend ActiveSupport::Concern
  included do
    include RailsInteract::Like
  
    attribute :title, :string
    attribute :content, :string
    attribute :score, :float, default: 0
    attribute :liked_count, :integer, default: 0
    attribute :star_count, :integer, default: 0
  
    belongs_to :user
    belongs_to :commentable, polymorphic: true, counter_cache: true
  
    default_scope -> { order(id: :desc) }
  
    has_closure_tree
    before_validation :sync_commentable, if: -> { commentable_type.blank? && commentable_id.blank? }
    before_save :compute_score, if: -> { star_count_changed? }
    after_commit :sync_to_notification, on: [:create]
  
    delegate :name, to: :user, prefix: true
  
    acts_as_notify :default,
                   only: [:content],
                   methods: [:user_name]
  end
  
  def sync_commentable
    if parent
      self.commentable_type = parent.commentable_type
      self.commentable_id = parent.commentable_id
    end
  end

  def compute_score
    self.score = self.star_count.to_i * 2
  end

  def self.commentable_types
    self.unscoped.distinct(:commentable_type).pluck(:commentable_type)
  end

  def sync_to_notification
    to_notification(
      receiver: self.commentable.user,
      sender: self.user,
      linked: self.commentable,
      verbose: true
    )
  end

end
