class NotifyMailer < ActionMailer::Base
  default from: 'noreply@example.com'

  def notify_follow(user, follower)
    @user = user
    @follower = follower
    mail to: user.email, subject: "You are followed"
  end

end
