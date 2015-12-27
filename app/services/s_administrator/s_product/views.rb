module SAdministrator
  module SProduct
    class Views

      def initialize(product_id)
        @product_id = product_id
      end

      # общее количество продаж по дням

      def mount_total_labels
        ActivityRecord.where(data_id: @product_id, data_type: "Product", period: 1, type_record: 1).limit(15).map { |record| "#{record.date.mday}.#{record.date.mon}" }
      end

      def mount_total_series
        ActivityRecord.where(data_id: @product_id, data_type: "Product", period: 1, type_record: 1).limit(15).map { |record| record.time_range.total }
      end


      # количество продаж по времени (столбчатая)


      def mount_times_views_stolb
        returned_array = [0, 0, 0, 0, 0, 0]
        ActivityRecord.where(data_id: @product_id, data_type: "Product", period: 1, type_record: 1).limit(15).each do |record|
          time_range = record.time_range
          returned_array[0] += time_range.time_0_4
          returned_array[1] += time_range.time_4_8
          returned_array[2] += time_range.time_8_12
          returned_array[3] += time_range.time_12_16
          returned_array[4] += time_range.time_16_20
          returned_array[5] += time_range.time_20_0
        end
        returned_array
      end

      # количество продаж по времени (круговая)

      def mount_times_views_rounded
        returned_array = [["00:00 - 04:00", 0], ["04:00 - 08:00", 0], ["08:00 - 12:00", 0],["12:00 - 16:00", 0],["16:00 - 20:00", 0],["20:00 - 00:00", 0]]
        values = self.mount_times_views_stolb
        [0, 1, 2, 3, 4, 5].each do |i|
          returned_array[i][1] = values[i]
        end
        returned_array
      end

    end
  end
end
