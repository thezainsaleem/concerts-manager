require 'rails_helper'

RSpec.describe Api::V1::ArtistsController, type: :controller do
  context 'GET #index' do
    it 'returns 200' do
      get :index
      expect(response).to be_success

    end
  end

  context 'GET #show' do
    before(:all) do
      @artist = Artist.create({ name: "dummy"})
    end
    it 'returns user json for given user' do 
      get :show, params: { id: @artist.id }
      expect(response).to be_success
    end

  end


  context 'POST #create' do
    it 'returns user json for given user' do 
      post :create, params: { artist: { name: "dummy" } }
      expect(response).to be_success
    end
  end

  context 'POST #patch' do
    before(:all) do
      @artist = Artist.create({ name: "dummy" })
    end
    it 'returns user json for given user' do 
      patch :update, params: { id: @artist.id, artist: {name: "dummy" } }
      expect(response).to be_success
    end
  end

  context 'DELETE #destroy' do
    before(:all) do
      @artist = Artist.create({ name: "dummy" })
    end

    it 'returns user json for given user' do 
      delete :destroy, params: { id: @artist.id }
      expect(response).to be_success
    end
  end
end
