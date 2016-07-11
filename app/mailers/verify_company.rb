class VerifyCompany < ApplicationMailer
	def send_verification_email(user,subject)
    @user = user
    mail :from => "verification@sjoobs.com",:to => user.email, :subject => subject
	end
end
