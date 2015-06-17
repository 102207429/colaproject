class Member < ActiveRecord::Base
	self.table_name="b01b1_memberno"
	query = <<-SQL
	Select company_no, count(activity_seq) as activity_count
	from b01a2_activity, b01b1_memberno
	where Service_Id='B10BF05-S2' and b01a2_activity.member_no=b01b1_memberno.member_no and activity_time>='2013-01-05 00:00:00'
	group by company_no
	order by count(activity_seq) desc
	limit 10
    SQL

    self.find_by_sql(query)
  end
end
