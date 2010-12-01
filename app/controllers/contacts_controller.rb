class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new params[:contact]

    @contact.save

    redirect_to root_path, :notice => 'Thank you for contacting Make a Scene, we will be emailing you soon!'
  end
end
