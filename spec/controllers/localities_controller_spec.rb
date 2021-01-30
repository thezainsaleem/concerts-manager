require 'rails_helper'

RSpec.describe Api::V1::LocalitiesController, type: :controller do

  context 'GET #index' do
    it 'returns 200' do
      get :index
      expect(response).to be_success

    end
  end

  context 'GET #show' do
    before(:all) do
      @locality = Locality.create({ name: "dummy", address: "dummy address" })
    end
    it 'returns user json for given user' do 
      get :show, params: { id: @locality.id }
      expect(response).to be_success
    end

  end


  context 'POST #create' do
    it 'returns user json for given user' do 
      post :create, params: { locality: {name: "dummy", address: "dummy address"} }
      expect(response).to be_success
    end
  end

  context 'POST #patch' do
    before(:all) do
      @locality = Locality.create({ name: "dummy", address: "dummy address" })
    end
    it 'returns user json for given user' do 
      patch :update, params: { id: @locality.id, locality: {name: "dummy", address: "dummy address"} }
      expect(response).to be_success
    end
  end

  context 'DELETE #destroy' do
    before(:all) do
      @locality = Locality.create({ name: "dummy", address: "dummy address" })
    end

    it 'returns user json for given user' do 
      delete :destroy, params: { id: @locality.id }
      expect(response).to be_success
    end
  end

end

