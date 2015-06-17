# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :db do
  desc "Cleanup the database by setting rows to deleted when older than xxx. Defaults to development database.  Set RAILS_ENV=[production, test, etc.] to override."
  task :cleanup => :environment do
    sql = <<-SQL
      Select company_no, count(activity_seq) as activity_count
      from b01a2_activity, b01b1_memberno
      where Service_Id='B10BF05-S2' and b01a2_activity.member_no=b01b1_memberno.member_no
      group by company_no
      order by count(activity_seq) desc
      limit 10
      
      Select company_no, count(activity_seq) as activity_count
      from b01a2_activity, b01b1_memberno
      where Service_Id='B10BF05-S2' and b01a2_activity.member_no=b01b1_memberno.member_no and activity_time>='2013-01-05 00:00:00'
      group by company_no
      order by count(activity_seq) desc
      limit 10
    SQL
    # used to connect active record to the database
    ActiveRecord::Base.establish_connection
    ActiveRecord::Base.connection.execute(sql)
  end
end
