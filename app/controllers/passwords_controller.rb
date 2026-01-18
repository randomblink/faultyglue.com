# frozen_string_literal: true

class PasswordsController < ApplicationController
  allow_unauthenticated_access only: %i[new create]
  def new
    # Shows the reset form (minimal placeholder)
  end

  def create
    email = params[:email].to_s.strip

    if email.present?
      flash.now[:notice] = "If an account exists for #{email}, reset instructions will be sent."
      render :new, status: :ok
    else
      flash.now[:alert] = "Please enter your email."
      render :new, status: :unprocessable_entity
    end
  end
end
