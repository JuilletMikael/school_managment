json.extract! person, :id, :username, :lastname, :firstname, :email, :phone_number, :address_id, :person_status_id, :type, :created_at, :updated_at
json.url person_url(person, format: :json)
