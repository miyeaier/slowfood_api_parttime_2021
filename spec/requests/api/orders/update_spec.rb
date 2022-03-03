RSpec.describe "PUT/api/orders/" do
  let(:order) { create(:order) }
  let(:product_1) { create(:product) }
  let(:product_2) { create(:product) }
  subject { response }
  before do
    order.items.create(product: product_2)
    put "/api/orders/#{order.id}",
        params: { order: { product_id: product_1.id, amount: 2 } }
  end

  it { is_expected.to have_http_status 200 }

  it "is expected to recponed a message" do
    expect(response_json["message"]).to eq "you order is updated"
  end
end
