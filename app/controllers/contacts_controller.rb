class ContactsController < ApplicationController
  def index
    @contacts = Contact.find_by(user_id: params[:user_id])
    render json: @contacts
  end

  def create
    contact = Contact.new(contact_params)

    if contact.save
      render json: contact
    else
      render(
      json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end

    # begin
    #   contact.save
    # rescue RestClient::UnprocessableEntity
    #   retry
    # else
    #   render json: contact
    # end
  end

  def show
    contact = Contact.find(params[:id])

    render json: contact
  end

  def update
    contact = Contact.find(params[:id])

    if contact.update(contact_params)
      render json: contact
    else
      render(
      json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy

    index
  end

  private
  def contact_params
    params[:contacts].permit(:name, :email, :user_id)
  end
end
