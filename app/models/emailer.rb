class Emailer < ActionMailer::Base
  def recommendation_expiration(recommendation)
    @subject = 'Your recommendation is about to expire'
    @recipients = recommendation.email
#    @recipients = 'molloy@gmail.com'
    @from = 'do-not-reply@420mac.com'
#    @bcc = ['molloy@gmail.com', 'h420mac@yahoo.com']
    @bcc = ['h420mac@yahoo.com']
    @return = 'do-not-reply@420mac.com'
    @recommendation = recommendation
  end
end
