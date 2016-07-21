ActiveAdmin.register Company do

permit_params :name, :email, :trade,:cnpj,:state_identification, :verify, :block

  form do |f|
    f.inputs 'Company' do
      f.input :name
      f.input :email
      f.input :trade
      f.input :cnpj
      f.input :state_identification
      f.input :verify
      f.input :block
    end
    f.actions
  end


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
      row :verify
      row :block
      row "Bill Document" do |m|
        if !m.bill_document_file_size.nil?
          span do
            # if !m.bill_document_content_type.start_with? "image"
              render(:partial => "bill_frame", :locals => {:company=>m})
            # else
            #   image_tag(m.bill_document.url(:small))
            # end
          end
        end
      end
      row "Cnpj Document" do |m|
        if !m.cnpj_document_file_size.nil?
          span do
            # if !m.cnpj_document_content_type.start_with? "image"
              render(:partial => "cnpj_frame", :locals => {:company=>m})
            # else
            #   image_tag(m.cnpj_document.url(:small))
            # end
          end
        end
      end
    end
  end

  filter :name
  filter :email
  filter :trade
  filter :cnpj
  filter :state_identification
  filter :area
  filter :phone
  filter :verify
  filter :block

end
