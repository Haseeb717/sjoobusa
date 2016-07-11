class AddPaperclipToCompany < ActiveRecord::Migration
  def change
  	add_attachment :companies, :bill_document 
  	add_attachment :companies, :cnpj_document
  end
end
