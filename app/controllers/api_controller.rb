class ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  def record_not_found(exception)
    render json: {error: exception.message}, status: 400
  end
end
