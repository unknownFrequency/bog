json.array!(@photos) do |photo|
  json.extract! photo, :id, :itle, :image
  json.url photo_url(photo, format: :json)
end
