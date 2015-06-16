class ProjectsController < ApplicationController
	def transaction
		@buy= Activity.where(Service_Id: 'B10BF05-S2').count(:activity_seq)
		@all= Activity.count(:activity_seq)
		@trans= Float(@buy)/@all
	end
	def sales
		
	end
end