class ContactMailer < ActionMailer::Base
  default :from => "app@makeascene.tv"

  def contact_email(contact)
    @contact = contact

    mail(:to => "contact@makeascene.tv", :subject => "New Contact")
  end
end
