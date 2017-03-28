class CreateParkings < ActiveRecord::Migration[5.0]
  def change
    create_table :parkings do |t|
      t.string :parking_type #type: guest, short-term, long-term
      t.datetime :start_at #start time
      t.datetime :end_at #end time
      t.integer :amount #total amount
      t.integer :user_id, :index => true
      t.timestamps
    end
  end
end
