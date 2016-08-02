require 'byebug'
class ContactsController < ApplicationController

  def index
    if params.has_key?(:user_id)
      @contacts = Contact.where(user_id: params[:user_id])
      @contact_shares = @contacts.map { |contact| contact.contact_shares  }
    else
      raise "Please enter a specific user id."
    end

    render json: @contacts.concat(@contact_shares)
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact
    else
      render json: @contact.errors.full_messages
    end
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render json: @contact
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors.full_messages
    end
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    if @contact.destroy
      render json: @contact
    else
      render json: @contact.errors.full_messages
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end

end
