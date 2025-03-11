# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception
  protect_from_forgery with: :exception

  # Enable request forgery protection
  protect_from_forgery with: :null_session

  # Handle exceptions gracefully
  rescue_from StandardError do |e|
    respond_to do |format|
      format.html { render plain: "Something went wrong", status: :internal_server_error }
      format.json { render json: { error: e.message }, status: :internal_server_error }
    end
  end

  # Add basic health check endpoint
  def health_check
    render json: { status: 'ok', timestamp: Time.current }
  end

  private

  # Helper method to handle API responses
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  # Helper method for error responses
  def error_response(message, status = :unprocessable_entity)
    render json: { error: message }, status: status
  end
end
