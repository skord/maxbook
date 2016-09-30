json.extract! person, :id, :name, :address, :city, :state, :avatar, :created_at, :updated_at
json.url person_url(person, format: :json)