require 'rails_helper'

RSpec.describe Locality, type: :model do
  context 'Validations' do 
    describe 'name' do
      it 'is must be present' do 
        locality = Locality.new({
          address: "dummy address"
        })
        expect(locality).to_not be_valid
        locality.name = "Some name"
        expect(locality).to be_valid
      end

      it ' must not be greater than 254 characters' do
        name = (0...255).map { ('a'..'z').to_a[rand(26)] }.join
        locality = Locality.new({
          name: name,
          address: "dummy address"
        })
        expect(locality).to_not be_valid
      end

      it 'is must be not be blank' do 
        locality = Locality.new({
          name: "",
          address: "address"
        })
        expect(locality).to_not be_valid
      end
    end

    describe 'address' do
      it 'is must be present' do 
        locality = Locality.new({
          name: "dummy"
        })
        expect(locality).to_not be_valid
        locality.address = "Some name"
        expect(locality).to be_valid
      end

      it 'is must be not be blank' do 
        locality = Locality.new({
          name: "dummy",
          address: ""
        })
        expect(locality).to_not be_valid
      end
    end
  end

  context 'Creating new locality' do
    let (:params) {
      {
        name: "dummy",
        address: "Dummy Address"
      }
    }
    it 'should increase length of total by 1 ' do
      locality_count = Locality.count()
      Locality.create(params)
      expect(Locality.count).to eq(locality_count + 1)
    end
  end
end
