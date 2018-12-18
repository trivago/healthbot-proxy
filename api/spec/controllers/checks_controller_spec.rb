require 'rails_helper'

RSpec.describe ChecksController, type: :controller do


  describe "#ping" do
    let(:access_key) { create(:access_key, active: true) }
    let(:check) { create(:healthcheck) }

    context "with valid access key" do
      it "renders 200" do
        get :ping, params: { token: access_key.token, id: check.id }

        expect(response.status).to eq(200)
      end
    end

    context "without valid access key" do
      it "renders 401" do
        get :ping, params: { token: nil, id: check.id }

        expect(response.status).to eq(401)
      end
    end
  end
end
