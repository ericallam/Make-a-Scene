class Contact < ActiveRecord::Base

  after_create :send_email

  private

  def send_email
    ContactMailer.contact_email(self).deliver
  end
end
