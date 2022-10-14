class RegistrationsController < Devise::RegistrationsController
  def new
    @page_title = 'Register'
    super
  end

  protected

  def after_sign_up_path_for(*)
    root_path
  end
end
