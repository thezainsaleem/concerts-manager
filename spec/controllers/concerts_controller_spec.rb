require 'rails_helper'

RSpec.describe Api::V1::ConcertsController, type: :controller do
  before(:all) do
    @locality = Locality.create({ name: "dummy", address: "dummy address" })
    @artist = Artist.create({ name: "dummy"})
  end
  context 'GET #index' do
    it 'returns 200' do
      get :index
      expect(response).to be_success

    end
  end

  context 'GET #show' do
    before(:all) do
      @concert = Concert.create({ artist: @artist, locality: @locality, date: DateTime.now })
    end
    it 'returns user json for given user' do 
      get :show, params: { id: @concert.id }
      expect(response).to be_success
    end

  end


  context 'POST #create' do
    it 'returns user json for given user' do 
      post :create, params: { concert: { artist: @artist, locality: @locality, date: DateTime.now } }
      expect(response).to be_success
    end
  end

  context 'POST #patch' do
    before(:all) do
      @concert = Concert.create({ artist: @artist, locality: @locality, date: DateTime.now })
    end
    it 'returns user json for given user' do 
      patch :update, params: { id: @concert.id, concert: { artist: @artist, locality: @locality, date: DateTime.now } }
      expect(response).to be_success
    end
  end

  context 'DELETE #destroy' do
    before(:all) do
      @concert = Concert.create({ artist: @artist, locality: @locality, date: DateTime.now })
    end

    it 'returns user json for given user' do 
      delete :destroy, params: { id: @concert.id }
      expect(response).to be_success
    end
  end
end
