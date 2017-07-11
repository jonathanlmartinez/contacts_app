class PagesController < ApplicationController
  
  def index
    @contacts = Contact.all
    @first = Contact.find_by(id:1)
    @second = Contact.find_by(id:2)
    @third = Contact.find_by(id:3)
    render "index.html.erb"
  end 

  def show
    id = params[:id]
    contact = Contact.find_by(id: id)
    @first_name = contact.first_name
    @last_name = contact.last_name
    @email = contact.email
    @phone_number = contact.phone_number
    render "show.html.erb"
  end 

  def new 
    render "new.html.erb"
  end

  def create
    
    render "create.html.erb"
  end 

end
