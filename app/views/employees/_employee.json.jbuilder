json.extract! employee, :id, :iban, :person_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
