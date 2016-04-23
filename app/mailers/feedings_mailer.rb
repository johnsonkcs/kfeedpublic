class FeedingsMailer < ApplicationMailer
	default from: "kfeedteam@gmail.com"

	def notification_email(subscriber, feeding)
    @user = subscriber
    @feeding = feeding

    if @user.name.blank? || @feeding.user.name.blank?
    	if @user.name.blank? && @feeding.user.name.blank?
            mail(to: @user.email, subject: 'Hi ' + @user.email.to_s + '! ' + @feeding.user.email + ' has created a new feeding!')
        elsif @user.name.blank? && @feeding.user.name.blank? == false
        	mail(to: @user.email, subject: 'Hi ' + @user.email.to_s + '! ' + @feeding.user.name + ' has created a new feeding!')
        else
        	mail(to: @user.email, subject: 'Hi ' + @user.name.to_s + '! ' + @feeding.user.email + ' has created a new feeding!')
        end 			
    else
      mail(to: @user.email, subject: 'Hi ' + @user.name.to_s + '! ' + @feeding.user.name + ' has created a new feeding!')
    end
    end
end
