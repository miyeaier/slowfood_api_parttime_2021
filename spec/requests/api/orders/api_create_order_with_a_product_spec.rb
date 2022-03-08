RSpec.describe "POST /api/orders", type: :request do
  let!(:product) { create(:product) }
  subject { response }

  describe "with valid params" do
    before do
      post "/api/orders",
           params: { order: { product_id: product.id, amount: 2 } }
      @order = Order.last
    end

    it { is_expected.to have_http_status 201 }

    it "is expected to save order to database" do
      expect(@order).to_not eq nil
    end

    it "is expected to associate order with an orderItem instance that points to a product" do
      expect(@order.items.first.product_id).to eq product.id
    end

    it "is expected to associate a product with the order" do
      expect(@order.products).to include product
    end

    it "is expected to add amount value to orderItem" do
      expect(@order.items.first.amount).to eq 2
    end

    it "is expected to return a message that the product was added to the order" do
      expect(response_json["message"]).to eq "#{product.name} has been added to your order."
    end
  end
  
  describe"without valid params" do
    before do
      post "/api/orders",
           params: { order: { product_id: product.id, amount: 2 } }
           headers:{}
    end
    it{ is_expected.to have_http_status 401}
  end 

    
  end
  describe "unsuccessful request with invalid product id" do
    before do
      post "/api/orders",
           params: {
             order: { product_id: "" },
           }
    end

    it { is_expected.to have_http_status 404 }

    it "is expected to return product not found message" do
      expect(response_json["message"]).to eq "we could not find the product you tried to add."
    end
  end
end
