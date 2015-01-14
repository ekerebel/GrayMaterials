class AddMillTestReportToListings < ActiveRecord::Migration
  def change
    add_column :listings, :mill_test_report, :boolean
  end
end
