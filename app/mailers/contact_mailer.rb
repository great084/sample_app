class ContactMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def contact_send(contact_user)
      @contact_user = contact_user
      @url = 'https://sample-app-great084.c9users.io'
      mail(to: @contact_user.email, subject: 'Thanks to contact us')
  end
end
