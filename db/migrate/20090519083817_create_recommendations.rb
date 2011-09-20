class CreateRecommendations < ActiveRecord::Migration
  def self.up
    create_table :recommendations do |t|
      t.string :first_name
      t.string :last_name
      t.string :initials
      t.date :dob
      t.string :id_code
      t.date :start_dt
      t.date :end_dt

      t.timestamps
    end
  end

  def self.down
    drop_table :recommendations
  end
end
