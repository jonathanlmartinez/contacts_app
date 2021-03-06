class PagesController < ApplicationController
  
  def index
    if current_user 
      search = params[:search_input]

      if search 
        @contacts = current_user.contacts.where("title ILIKE ?", "%" + search_terms + "%")
      else 
        @contacts = current_user.contacts
      end 
      render "index.html.erb"
    else 
      redirect_to "/signup"
    end 
  end 

  def show
    @id = params[:id]
    @contact = Contact.find_by(id: @id)
     
    render "show.html.erb"
  end 

  def new 
    render "new.html.erb"
  end

  def create
    contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      user_id: current_user.id
    )
    contact.save

    redirect_to "/contacts/#{contact.id}"
  end 

  def edit 
    @id = params[:id]
    contact = Contact.find_by(id: @id)
    @first_name = contact.first_name
    @middle_name = contact.middle_name
    @last_name = contact.last_name
    @email = contact.email
    @phone_number = contact.phone_number
    render "edit.html.erb"
  end

  def update
    id = params[:id]
    contact = Contact.find_by(id: id)
    contact.first_name = params[:first_name]
    contact.middle_name = params[:middle_name]
    contact.last_name = params[:last_name]
    contact.email = params[:email]
    contact.phone_number = params[:phone_number]
    
    contact.save

    redirect_to "/contacts/#{id}"
  end 

  def destroy 
    id = params[:id]
    contact = Contact.find_by(id: id)
    contact.destroy
    render "destroy.html.erb"
  end 
end
