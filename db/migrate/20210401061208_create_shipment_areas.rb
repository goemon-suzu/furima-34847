class CreateShipmentAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :shipment_areas do |t|

      t.timestamps
    end
  end
end
