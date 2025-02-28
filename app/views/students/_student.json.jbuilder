json.extract! student, :id, :username, :lastname, :firstname, :email, :phone_number, :address_id, :person_status_id, :type, :created_at, :updated_at
json.url student_url(student, format: :json)
