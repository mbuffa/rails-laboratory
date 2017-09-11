require 'rails_helper'

RSpec.describe Api::TestController, type: :controller do

  describe "GET #hello_world" do
    it "returns http success" do
      get :hello_world
      expect(response).to have_http_status(:success)
    end
  end

end
