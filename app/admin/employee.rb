ActiveAdmin.register Employee do
	permit_params :name, :email, :phone,:cpf
end
