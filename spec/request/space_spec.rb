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
      expect(response.status).to eq(200)
    end 

    


    # Parse JSON response to ruby hash
    def json
      JSON.parse(response.body)
    end

    # def json_response(object, status = :ok)
    #   render json: object, status: status
    # end

  end 
end 



