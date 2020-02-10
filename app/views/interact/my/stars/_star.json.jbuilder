json.extract! star,
              :id,
              :starred_type,
              :starred_id,
              :created_at
if star.starred
  json.starred star.starred, :id, :title
end
