class TransactionsController < ApplicationController
  def new
  	gon.client_token = generate_client_token
  end
    def create
    	@Feeding = Feeding.find(params[:feeding_id])
    	@result = Braintree::Transaction.sale(
              amount: @Feeding.price,
              payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
    	payment_record 
      redirect_to feeding_path(@feeding), notice: "Congraulations! Your transaction has been successfully!"
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
      render :new
    end
  end

  private
  def generate_client_token
  Braintree::ClientToken.generate
end
def payment_record
	@payment = Payment.create(feeder_id: current_user.id, braintree_id: @result.transaction.id, status: @result.transaction.status, last_4: @result.transaction.credit_card_details.last_4)

end

end
