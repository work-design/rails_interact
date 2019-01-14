json.extract! star,
              :id,
              :starred_type,
              :starred_id,
              :created_at
json.starred star.starred, :id, :title
