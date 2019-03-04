class Attitude < ApplicationRecord
  belongs_to :user
  belongs_to :attitudinal, polymorphic: true
  after_save :update_attitudinal_counter
  after_commit :sync_to_notification, on: [:create, :update]

  delegate :name, to: :user, prefix: true

  enum opinion: {
    liked: 'liked',
    disliked: 'disliked',
    like_canceled: 'like_canceled',
    dislike_canceled: 'dislike_canceled'
  }
  acts_as_notify :default,
                 only: [:opinion, :attitudinal_type],
                 methods: [:user_name, :attitudinal_type_i18n]

  def update_attitudinal_counter
    if attitudinal_id && self.saved_change_to_opinion?
      if self.attitudinal.respond_to?('liked_count')
        if self.liked?
          self.attitudinal.class.increment_counter('liked_count', attitudinal_id)
        elsif ['like_canceled', 'disliked'].include?(self.opinion)
          self.attitudinal.class.decrement_counter('liked_count', attitudinal_id)
        end
      end
      if self.attitudinal.respond_to?('disliked_count')
        if self.disliked?
          self.attitudinal.class.increment_counter('disliked_count', attitudinal_id)
        elsif ['dislike_canceled', 'liked'].include?(self.opinion)
          self.attitudinal.class.decrement_counter('disliked_count', attitudinal_id)
        end
      end
    end
    standby_attitudinal_counter
  end

  def standby_attitudinal_counter
    if self.saved_change_to_attitudinal_id? && attitudinal_id_before_last_save
      if self.opinion_before_last_save == 'liked' && self.attitudinal.respond_to?('liked_count')
        self.attitudinal.class.decrement_counter('liked_count', attitudinal_id_before_last_save)
      elsif self.opinion_before_last_save == 'disliked' && self.attitudinal.respond_to?('disliked_count')
        self.attitudinal.class.decrement_counter('disliked_count', attitudinal_id_before_last_save)
      end
    end
  end

  def sync_to_notification
    to_notification(
      receiver: self.attitudinal.user,
      sender: self.user,
      linked: self.attitudinal,
      verbose: true
    )
  end

end
