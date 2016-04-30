json.array!(@companies) do |company|
  json.extract! company, :id, :name, :trade, :cnpj, :state_identification, :area, :email, :phone
  json.url company_url(company, format: :json)
end
