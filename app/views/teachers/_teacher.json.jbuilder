json.extract! teacher, :id, :username, :lastname, :firstname, :email, :phone_number, :address_id, :person_status_id, :type, :iban, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
