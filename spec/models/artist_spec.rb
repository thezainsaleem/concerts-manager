require 'rails_helper'

RSpec.describe Artist, type: :model do
  let (:valid_artist_params) { { name: "dummy" } }
  context 'Validations' do 
    context 'name' do
      it 'is must be present' do 
        artist = Artist.new({
        })
        expect(artist).to_not be_valid
        artist.name = "Some name"
        expect(artist).to be_valid
      end

      it ' must not be greater than 254 characters' do
        name = (0...255).map { ('a'..'z').to_a[rand(26)] }.join
        artist = Artist.new({
          name: name
        })
        expect(artist).to_not be_valid
      end

      it 'is must be not be blank' do 
        artist = Artist.new({
          name: "",
        })
        expect(artist).to_not be_valid
      end
    end
  end

  context 'Creating new artist' do
    it 'should increase length of total by 1 ' do
      artists_count = Artist.count()
      Artist.create(valid_artist_params)
      expect(Artist.count).to eq(artists_count + 1)
    end
  end

  context 'Delete Artist' do
    before (:each) do
      @artist_to_destroy = Artist.create(valid_artist_params)
    end
    it 'should increase length of total by 1' do
      artists_count = Artist.count()
      @artist_to_destroy.destroy
      expect(Artist.count).to eq(artists_count - 1)
    end
  end

end
