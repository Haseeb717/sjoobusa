ActiveAdmin.register Company do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  index do
    selectable_column
    column :name
    column :email
    column :trade
    column :cnpj
    column :state_identification
    column :bill_document_file_name
    column :cnpj_document_file_name
    column :cnpj
    column :verify
    column :block
    actions
  end

  show do
    attributes_table do
      row :name
	    row :email
	    row :trade
	    row :cnpj
	    row :state_identification
	    row :area
	    row :phone
	    row :bill_document_file_name
	    row :cnpj_document_file_name
	    row :cnpj
	    row :verify
	    row :block
    end
  end


end
