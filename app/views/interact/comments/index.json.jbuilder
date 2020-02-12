json.comments @comments, partial: 'comment', as: :comment
json.partial! 'shared/pagination', items: @comments
