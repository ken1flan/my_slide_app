json.array!(@slides) do |slide|
  json.extract! slide, :id, :title, :image_url, :description, :body, :user_id, :published
  json.url slide_url(slide, format: :json)
end
