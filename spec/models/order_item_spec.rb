RSpec.describe OrderItem, type: :model do
  
  describe "DB Table" do
    it { is_expected.to have_db_column :amount }
    it { is_expected.to have_db_column :product_id }
    it { is_expected.to have_db_column :order_id }
  end

  describe "Association" do
    it { is_expected.to belong_to(:order) }
    it { is_expected.to belong_to(:product) }
  end

end
