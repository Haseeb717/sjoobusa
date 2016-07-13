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
      row "Bill Document" do |m|
        if !m.bill_document_file_size.nil?
          span do
            if !m.bill_document_content_type.start_with? "image"
              render(:partial => "bill_frame", :locals => {:company=>m})
            else
              image_tag(m.bill_document.url(), :width => 300, :height => 150)
            end
          end
        end
      end
      row "Cnpj Document" do |m|
        if !m.cnpj_document_file_size.nil?
          span do
            if !m.cnpj_document_content_type.start_with? "image"
              render(:partial => "cnpj_frame", :locals => {:company=>m})
            else
              image_tag(m.cnpj_document.url(), :width => 300, :height => 150)
            end
          end
        end
      end
	    row :phone
	    row :bill_document_file_name
	    row :cnpj_document_file_name
	    row :cnpj
	    row :verify
	    row :block
    end
  end


end
