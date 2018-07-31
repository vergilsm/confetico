class AdminMailer < ApplicationMailer
  default from: 'confetico@confetico.herokuapp.com'

  def admin_destroyed(admin, email)
    @admin = admin
    mail to: email,
         subject: "Admin destroyed #{admin.email}",
         template_path: 'mailers/admin_mailer',
         template_name: 'admin_destroyed'
  end
end
