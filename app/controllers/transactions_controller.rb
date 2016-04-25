class TransactionsController < ApplicationController
  def new
  end
    def create
      @card_info = params[:save_record]

    	@feeding = Feeding.find(params[:feeding_id])
    	@result = Braintree::Transaction.sale(
              amount: @feeding.price,
              payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
    	payment_record 
      redirect_to feeding_path(@feeding), notice: "Congraulations! Your transaction has been successfully processed!"
    else
      payment_record
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

  
  if @card_info == "1"
    # PaymentsController.create
     @payment = Payment.create(feeder_id: params[:feeder_id], braintree_id: @result.transaction.id, status: @result.transaction.status, last_4: @result.transaction.credit_card_details.last_4)
  else
       @payment = Payment.create(feeder_id: params[:feeder_id], braintree_id: @result.transaction.id, status: @result.transaction.status)
  end

end

def generate_client_token
    Braintree::ClientToken.generate
end

end
