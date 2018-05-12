json.extract! recipe, :id, :name, :time, :season, :favorite, :type, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
