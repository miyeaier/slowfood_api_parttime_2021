RSpec.describe 'GET /api/products', type: :request do

  subject { response }
  describe 'successfully' do

    let!(:products) { create_list(:product, 3) }
    before do
      get '/api/products'
    end

    it { is_expected.to have_http_status 200 }

    it 'is expected to return all products' do
      expect(response_json["products"].count).to eq 3
    end

    it 'is expected to return products names' do
      expect(response_json['products'].first['name']).to eq 'chicken wings'
    end

    it 'is expected to return a category' do
      expect(response_json['products'].first['category']).to eq 'starter'
    end

  end

  describe 'unsuccessfully' do
    describe 'when there are no products in the database' do

      before do
        get '/api/products'
      end

      it { is_expected.to have_http_status 422 }

      it 'is expected to return a message indicating that there are no products' do
        expect(response_json['message'])
       .to eq 'There are no products in the database.'
      end

    end
  end
end
