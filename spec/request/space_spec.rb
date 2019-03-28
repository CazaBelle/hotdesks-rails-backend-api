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

    # Parse JSON response to ruby hash
    def json
      JSON.parse(response.body)
    end

end 



