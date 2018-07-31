class OrderMailer < ApplicationMailer
  default from: 'info_confetico@confetico.herokuapp.com'

  def created_order(order)
    @order = order
    mail to: @order.email,
         subject: 'Вы сделали заказ в confetico',
         template_path: 'mailers/order_mailer'
  end
end
