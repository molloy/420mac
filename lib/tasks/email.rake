require 'yaml'
require 'ostruct'

namespace :recommendation_expiration do
  desc "send email to expiring recommendations"
  AppConfig = OpenStruct.new(YAML.load_file(File.join(Rails.root, 'config', 'config.yml'))[Rails.env])

  task :first_notice => :environment do
    Recommendation.notify_expiring(Date.today + AppConfig.recommendation_expiring_in_first_notice)
    puts ActionMailer::Base.deliveries
  end

  task :second_notice => :environment do
    Recommendation.notify_expiring(Date.today + AppConfig.recommendation_expiring_in_second_notice)
    puts ActionMailer::Base.deliveries
  end

  task :final_notice => :environment do
    Recommendation.notify_expiring(Date.today + AppConfig.recommendation_expiring_in_final_notice)
    puts ActionMailer::Base.deliveries
  end
end