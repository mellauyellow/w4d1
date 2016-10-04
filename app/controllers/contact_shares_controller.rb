class ContactSharesController < ApplicationController
  def create
    contact_shares = ContactShare.new(user_params)

    if contact_shares.save
      render json: contact_shares
    else
      render(
      json: contact_shares.errors.full_messages, status: :unprocessable_entity
      )
    end

    # begin
    #   contact_shares.save
    # rescue RestClient::UnprocessableEntity
    #   retry
    # else
    #   render json: contact_shares
    # end
  end

  def destroy
    contact_shares = ContactShare.find(params[:id])
    contact_shares.destroy
    render :json contact_shares
  end

  private
  def user_params
    params[:contact_shares].permit(:contact_id, :user_id)
  end
end
