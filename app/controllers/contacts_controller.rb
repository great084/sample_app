class ContactsController < ApplicationController

    def new
        @contact =Contact.new
        @user = current_user if signed_in?
    end

    def create
        #@contact = contacts.build(contact_params)
        @contact = Contact.new(contact_params)
        if @contact.save
            ContactMailer.contact_send(@contact).deliver
            flash[:success] = "Contact send!!"
            redirect_to root_url
            #render 'static_pages/home'
        else
            render 'contacts/new'
            #redirect_to root_url
        end
    end
 
  private

    def contact_params
      params.require(:contact).permit(:enquiry, :name, :email)
    end


end