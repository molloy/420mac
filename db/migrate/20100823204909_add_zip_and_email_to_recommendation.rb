class AddZipAndEmailToRecommendation < ActiveRecord::Migration
  def self.up
    add_column :recommendations, :zipcode, :string
    add_column :recommendations, :email, :string
  end

  def self.down
    remove_column :recommendations, :email
    remove_column :recommendations, :zipcode
  end
end
