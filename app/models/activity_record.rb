class ActivityRecord < ActiveRecord::Base
	belongs_to :data, polymorphic: true
	belongs_to :time_range

	enum type_record:{sales: 0, views: 1, back_calls: 2, questions: 3}
	enum period: {today: 0, diary: 1}
end
