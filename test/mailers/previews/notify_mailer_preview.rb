# Preview all emails at http://localhost:3000/rails/mailers/notify_mailer
class NotifyMailerPreview < ActionMailer::Preview

  def notify_follow
    user = User.first
    other_user = User.second
    NotifyMailer.notify_follow(user, other_user)
  end

end
