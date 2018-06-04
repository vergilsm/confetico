class AdminController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin
  layout 'devise'

  def index
    @admins = Admin.all
  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to admin_path(@admin),
      notice: I18n.t('controllers.admin.created')
    else
      render :new
    end
  end

  def destroy
    @admin.destroy
    notify_admins(@admin)
  end

  private

  def notify_admins(admin)
    all_admins_emails = Admin.pluck(:email)

    all_admins_emails.each do |mail|
      AdminMailer.admin_destroyed(admin, mail).deliver
    end
  end

  def set_admin
    @admin = current_admin
  end

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end
