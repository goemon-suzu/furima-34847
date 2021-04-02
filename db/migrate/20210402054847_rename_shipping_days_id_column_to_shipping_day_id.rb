class RenameShippingDaysIdColumnToShippingDayId < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shipping_days_id, :shipping_day_id
  end
end
