class ApplicationController < ActionController::Base

  private

  def print_message(errors)
    messages = errors.messages.each.map{ |key,value|
      key.to_s + " " + value[0]
    }
    messages.join(", ")
  end

  def authenticate
    token = request.env["HTTP_SAHARA_TOKEN"]
    if token.nil? || token == ""
      render(
        json: {status: "error", message: "Authentication is required"},
	status: 400
      ) and return
    end
    @customer = Customer.find_by(token: token)
    if @customer.nil?
      render(
        json: {status: "error", message: "Customer is not unauthorized"},
	status: 401
      ) and return
    end
  end

  def admin_only
    unless @customer.role == "admin"
      render(
        json: {status: "error", message: "forbidden"},
	status: 403
      ) and return
    end
  end
       
end
