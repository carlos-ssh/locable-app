class ContactsController < ApplicationController
  before_action :set_contact, only: [:edit, :update, :destroy]
  
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.json {head :no_content}
        format.js
      else
        format.json { render json: @contact.errors.full_messages, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end
  
  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.json {head :no_content}
        format.js
      else
        format.json { render json: @contact.errors.full_messages, status: :unprocessable_entity }
        format.js { render :edit }
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.js
      format.json { head :no_content }
    end
  end
  
  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :business, :phone, :review_id)
  end
end