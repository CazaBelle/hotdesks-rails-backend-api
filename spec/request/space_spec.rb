require 'rails_helper'

RSpec.describe 'spaces API', type: :request do 

  let!(:spaces) { create_list(:space, 10) }
  let(:space_id) { spaces.first.id }
 
  describe 'GET /v1/spaces' do 
    before(:each) do 
      get v1_spaces_url, {}
    end 

    it 'returns spaces' do 
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end 

    it 'returns status code 200' do 
      expect(response).to have_http_status(200)
    end 
  end 

  describe 'GET /v1/spaces/:id' do 

    before(:each) do 
      get "/v1/spaces/#{space_id}", {}
    end 

    context 'when record exists' do 
      it 'returns the space' do 
        expect(json).not_to be_empty
        expect(response).to have_http_status(200)
      end
    end

    context "when record doesn't exist"  do 
      let(:space_id) { 11 }
      it 'returns status code 404' do 
        expect(response).to have_http_status(404)
      end 

      it 'returns a not found message' do 
        expect(response.body).to match("{\"message\":\"Couldn't find Space with 'id'=11\"}")
      end 
    end 
  end 

  describe 'POST /v1/spaces' do 
    let(:valid_attributes){ {name:"TestSpace", city: "London", address: "123 Test Street", postcode: "FooBar", price: 50} }
  
    context 'when the parameters are valid' do 
      before(:each) do 
        post "/v1/spaces", params: valid_attributes
      end 

        it 'creates a space' do 
          expect(json["data"]["name"]).to eq("TestSpace")
          expect(json["data"]["city"]).to eq("London")
          expect(json["data"]["address"]).to eq("123 Test Street")
          expect(response).to have_http_status(201)
        end 
      end
    end
      
    context 'when the parameters are invalid' do 
      before(:each) do 
        post "/v1/spaces", params: { name: "SecondTestName"}
      end

      it 'returns a status code 422' do 
        expect(response).to have_http_status(422)
      end 

      it 'returns Space not added message' do 
        expect(response.body).to match("{\"message\":\"Space not added\"}")
      end 
    end 

    describe 'PUT /v1/spaces/:id' do 

      before(:each) do 
        put "/v1/spaces/#{space_id}", params: {name: "NewName"}
      end 

      it 'updates the space' do 
        expect(response.body).to be_empty
        expect(response).to have_http_status(204)
      end 

    describe 'DELETE /v1/spaces/:id' do 

      before(:each) do 
        delete "/v1/spaces/#{space_id}"
      end 

      it 'deletes the space' do 
        expect(response).to have_http_status(204)
      end 
    end 

    end 


    # Parse JSON response to ruby hash
    def json
      JSON.parse(response.body)
    end
end 