class ContactSharesController < ApplicationController
  def index
    render json: ContactShare.all
  end

  def create
    @contact = ContactShare.new(contact_share_params)

    if @contact.save
      render json: @contact
    else
      render json: @contact.errors.full_messages
    end
  end

  def show
    @contact = ContactShare.find_by(id: params[:id])
    render json: @contact
  end

  def update
    @contact = ContactShare.find_by(id: params[:id])
    if @contact.update(contact_share_params)
      render json: @contact
    else
      render json: @contact.errors.full_messages
    end
  end

  def destroy
    @contact = ContactShare.find_by(id: params[:id])
    if @contact.destroy
      render json: @contact
    else
      render json: @contact.errors.full_messages
    end
  end

  private
    def contact_share_params
      params.require(:contact_share).permit(:contact_id, :user_id)
    end
end
