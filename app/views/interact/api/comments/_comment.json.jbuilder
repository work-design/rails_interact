json.extract! comment,
              :id,
              :title,
              :content,
              :state,
              :score,
              :star_count,
              :created_at
if comment.user
  json.commenter comment.user, :id, :name, :avatar_url
end
if current_user
  json.liked comment.liked?(current_user.id)
end
json.liked_count comment.liked_count.to_i
