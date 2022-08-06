class AddDataHackathonDataset < ActiveRecord::Migration[7.0]
  def change
    create_table :data_hackathon_dataset do |t|
      t.integer :product_id
      t.integer :sector_id
      t.string :investor_id
      t.float :dpd_percentage
      t.float :overdue_percentage
      t.float :foreclosed_percentage
      t.float :disbursement_cancelled_percentage
      t.float :consistency
      t.float :avg_loan_amount
      t.timestamps
    end
  end
end
