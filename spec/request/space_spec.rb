require 'rails_helper'

RSpec.describe 'spaces API', type: :request do 

  let!(:spaces) { create_list(:space, 10) }
  let(:space_id) { spaces.first.id }

  describe 'GET /v1/spaces' do 
    before(:each) do 
      get v1_spaces_url
    end 

    it 'returns spaces' do 
      expect(json).not_to be_empty
    end 
  end 


    # Parse JSON response to ruby hash
    def json
      JSON.parse(response.body)
    end

end 



