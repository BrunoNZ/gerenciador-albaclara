namespace :sidekiq do

  desc "Reset sidekiq stats"
  task :reset_stats => :environment do
    Sidekiq::Stats.new.reset
  end

end
