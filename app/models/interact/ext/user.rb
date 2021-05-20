module Interact
  module Ext::User
    extend ActiveSupport::Concern

    included do
      has_many :stars, class_name: 'Interact::Star', dependent: :delete_all
    end

  end
end
