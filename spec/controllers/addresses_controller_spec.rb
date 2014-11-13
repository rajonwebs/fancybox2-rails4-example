require 'rails_helper'

describe AddressesController do
  before :each do
    @molly = create(:address)
    @george = create(:address, name: 'George')
  end

  describe 'GET index' do
    before :each do
      get :index
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'populates @addresses' do
      expect(assigns(:addresses)).to match_array([@molly, @george])
    end
    it 'renders the :index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Address' do
        expect do
          xhr :post, :create, address: attributes_for(:new_address)
        end.to change(Address, :count).by(1)
      end
    end
    describe 'with invalid params' do
      it 'does not save a new Address' do
        expect do
          xhr :post, :create, address: attributes_for(:invalid_address)
        end.to_not change(Address, :count)
      end
    end
  end

end
