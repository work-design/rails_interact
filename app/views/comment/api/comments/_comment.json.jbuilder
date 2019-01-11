json.extract! comment,
              :id,
              :title,
              :content,
              :state,
              :score,
              :star_count,
              :created_at
if comment.commenter
  json.commenter comment.commenter, :id, :name, :avatar_url
end
if current_user
  json.liked comment.liked?(current_user.id)
end
json.liked_count comment.liked_count.to_i
