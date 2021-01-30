require 'rails_helper'

RSpec.describe Concert, type: :model do
  before(:all) do
    @locality = Locality.create({ name: "dummy", address: "dummy address" })
    @artist   = Artist.create({ name: "dummy" })
  end
  let (:valid_concert_params) {{ artist: @artist, locality: @locality, date: DateTime.now }}

  context 'Validations' do 
    context 'Artist' do
      it 'is must be present' do 
        concert = Concert.new({
          locality: @locality,
          date: DateTime.now.utc
        })
        expect(concert).to_not be_valid

        concert.artist = @artist
        expect(concert).to be_valid
      end
    end

    context 'Locality' do
      it 'is must be present' do 
        concert = Concert.new({
          artist: @artist,
          date: DateTime.now.utc
        })
        expect(concert).to_not be_valid

        concert.locality = @locality
        expect(concert).to be_valid
      end
    end

    context 'Date' do
      it 'is must be present' do 
        concert = Concert.new({
          artist: @artist,
          locality: @locality
        })
        expect(concert).to_not be_valid

        concert.date = DateTime.now
        expect(concert).to be_valid
      end
    end
  end

  context 'Creating new concert' do

    it 'should increase length of total by 1' do
      concerts_count = Concert.count()
      Concert.create(valid_concert_params)
      expect(Concert.count).to eq(concerts_count + 1)
    end

  end

  context 'Delete concert' do
    before (:each) do
      @concert_to_destroy = Concert.create(valid_concert_params)
    end
    it 'should increase length of total by 1' do
      concerts_count = Concert.count()
      @concert_to_destroy.destroy
      expect(Concert.count).to eq(concerts_count - 1)
    end
  end
end
