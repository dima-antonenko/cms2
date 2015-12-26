class CreateTimeRanges < ActiveRecord::Migration
  def change
    create_table :time_ranges do |t|
     t.integer :time_0_4, default: 0
     t.integer :time_4_8, default: 0
     t.integer :time_8_12, default: 0
     t.integer :time_12_16, default: 0
     t.integer :time_16_20, default: 0
     t.integer :time_20_0, default: 0
     t.integer :total, default: 0
    end
  end
end
