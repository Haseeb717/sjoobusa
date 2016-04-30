json.array!(@employees) do |employee|
  json.extract! employee, :id, :cpf, :name, :email, :phone
  json.url employee_url(employee, format: :json)
end
