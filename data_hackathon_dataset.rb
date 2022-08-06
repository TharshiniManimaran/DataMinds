class DataHackathonDataset < ApplicationRecord
  self.table_name = 'data_hackathon_dataset'

  # investor_id = '617c05e245f5c137ad24a35d'
  def self.fetch_recommendations_for(investor_id)
    recommended_products = []
    recommended_sectors(investor_id).each do |sector, _data|
      recommended_products << top_products_of(DataHackathonDataset.where(sector_id: sector).where.not(investor_id: investor_id), 5)
    end
    recommended_products.flatten.pluck(:product_id, :sector_id)
  end

  def self.recommended_sectors(investor_id)
    interested_sectors = DataHackathonDataset.where(investor_id: investor_id).pluck(:sector_id)
    recommended = Hash.new(0)
    neighbor_investors = DataHackathonDataset.where(sector_id: interested_sectors).where.not(investor_id: investor_id).pluck(:investor_id)
    # for the neighbouring investors/ investors with similar interest
    neighbor_investors.each do |neighbour_investor_id|
      # find the movies this user and another user both liked
      own_sectors = DataHackathonDataset.where(investor_id: investor_id).pluck(:sector_id).uniq
      neighbour_sectors = DataHackathonDataset.where(investor_id: neighbour_investor_id).pluck(:sector_id).uniq
      common_sectors = own_sectors & neighbour_sectors
      uncommon_sectors = own_sectors - common_sectors
      # calculate the weight (recommendation rating)
      weight = common_sectors.size.to_f / own_sectors.size
      # add the extra sectors the other investor invested in
      uncommon_sectors.each do |sector|
        # put the movie along with the cumulative weight into hash
        recommended[sector] += weight
      end
    end

    # sort by weight in descending order
    recommended.sort_by { |_key, value| value }.reverse.page(1).per(5)
  end

  def self.top_products_of(scope, limit)
    scope.order('dpd_percentage ASC, consistency DESC, avg_loan_amount DESC, disbursement_cancelled_percentage ASC').limit(limit)
  end
end
