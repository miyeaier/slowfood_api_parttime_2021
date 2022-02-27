RSpec.describe "POST /api/orders", type: :request do
  let!(:product) { create(:product) }
  subject { response }
  before do
    post "/api/orders",
         params: { order: { product_id: product.id } }
         #@order = Order.all
  end

  it { is_expected.to have_http_status 201 }
  it "is expected to save order to database" do
    expect(Order.all).to_not eq nil
  end
 # it 'is expected to add a product to the order'
 # expect(@order.products).to include product

  it "is expected to return a message that the product was added to the order" do
    expect(response_json["message"]).to eq "#{product.name} has been added to your order"
  end

  describe "unsuccessful request with invalid product id" do
    before do
      post "/api/orders",
           params: {
             order: { product_id: "" }
           }
    end

    it "is expected to return product not found message" do
      expect(response_json["message"])
      .to eq 'we couldnot find the product you tried to add.' 

    end
  end
end
