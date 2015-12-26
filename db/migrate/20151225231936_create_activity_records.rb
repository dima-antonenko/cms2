class CreateActivityRecords < ActiveRecord::Migration
  def change
    create_table :activity_records do |t|
      t.integer :time_range_id, index: true
      t.integer :data_id, index: true
      t.string  :data_type, index: true
      t.date    :date, index: true
      t.integer :type_record, index: true, default: 0
      t.integer :period, index: true, default: 0
    end
  end
end
