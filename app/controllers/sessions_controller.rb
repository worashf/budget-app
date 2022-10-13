class SessionsController < Devise::SessionsController
  def new
    @page_title = 'Welcome'
    super
  end

  protected

  def after_sign_up_path_for(*)
    root_path
  end
end
