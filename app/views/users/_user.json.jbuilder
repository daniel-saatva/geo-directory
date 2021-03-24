json.extract! user, :id, :firstname, :lastname, :phone, :birth_date, :start_date, :linkedin_url, :created_at, :updated_at
json.url user_url(user, format: :json)
