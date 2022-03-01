RSpec.describe Order, type: :model do

  describe "Associations" do
    it { is_expected.to have_many :items }
    it { is_expected.to have_many(:products).through(:items) }
  end

  describe "Factory" do
    it "should have valid Factory" do
      expect(create(:order)).to be_valid
    end
  end
  
end
