csv = ['product_id', 'sector_id', 'investor_id', 'dpd_percentage', 'overdue_percentage', 'foreclosed_percentage', 'disbursement_cancelled_percentage', 'consistency', 'avg_loan_amount'].to_csv
arr = []
VivColendingApi::Product.where_assoc_exists(:loans).find_each do |product|
  loans = product.loans
  days = (loans.last.created_at.to_date - loans.first.created_at.to_date).to_i + 1
  disbursed_loans = loans.where.not(disbursed_date: nil).count
  disbursement_cancelled_loans = loans.disbursement_cancelled_loans.count
  dpd_loans = loans.where(status: 'partner_settled').count # disbursed_loans
  overdue_loans = loans.joins(:repayment_schedules).where(repayment_schedules: { sub_state: 'overdue_settled' }).count # disbursed_loans
  foreclosed_loans = loans.joins(:repayment_schedules).where(repayment_schedules: { status: 'foreclosed' }).count # disbursed_loans
  loans_amount = loans.sum(:principal_amount)
  investor_id = product.agreements.first.alliance.investor_id
  arr << { product_id: product.id, sector_id: product.sector_id, investor_id: investor_id, dpd_percentage: dpd_loans/disbursed_loans.to_f, overdue_percentage: overdue_loans/disbursed_loans.to_f, foreclosed_percentage: foreclosed_loans/disbursed_loans.to_f, disbursement_cancelled_percentage: disbursement_cancelled_loans/disbursed_loans.to_f, consistency: loans.count/days.to_f, avg_loan_amount: loans_amount/loans.count.to_f }
end

arr.each do |ar|
  DataHackathonDataset.create!(ar)
end
