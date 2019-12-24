json.extract! post, :id, :title, :body, :status, :posted_at, :reason, :rank, :summary, :created_at, :updated_at
json.url post_url(post, format: :json)
