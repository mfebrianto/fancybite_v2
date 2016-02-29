class AdminNotificationMailer < ApplicationMailer
  layout 'mailer/admin_mailer'

  default from: 'notification@fancybite.com.au'

  def new_instagram_tag
    destination = 'michael febrianto <michaelfebrianto@gmail.com>'\
                  ',clairine felicia <clairinemichael@gmail.com>'
    mail(to: destination, subject: 'new instagram tag')
  end
end
