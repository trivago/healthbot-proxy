require 'rails_helper'

RSpec.describe ChecksController, type: :controller do


  describe "#ping" do
    let(:access_key) { create(:access_key, active: true) }
    let(:check) { create(:healthcheck) }

    context "with valid access key" do
      it "renders 200" do
        get :ping, params: { token: access_key.token, id: check.slug }

        expect(response.status).to eq(200)
      end

      it "pings the endpoints properly" do
        ep1 = create(:endpoint, healthcheck: check)
        p1  = create(:ping, endpoint: ep1, status: :success, response: "yep")
        allow(HealthcheckPinger).to receive(:ping) { p1 }

        get :ping, params: { token: access_key.token, id: check.slug }

        expect(HealthcheckPinger).to have_received(:ping).exactly(1).times
        expect(parsed_json_response.length).to eq(1)
        expect(parsed_json_response.first[:status]).to eq("success")
        expect(parsed_json_response.first[:response]).to eq("yep")
      end

      it "renders 404 if the check is not found" do
        get :ping, params: { token: access_key.token, id: "1" }

        expect(response.status).to eq(404)
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
