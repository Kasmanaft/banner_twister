require 'rails_helper'

RSpec.describe BannersController, :type => :controller do

  describe "POST #incr_showing" do

    context "for valid banner" do
      before :each do
        @banner = FactoryGirl.create(:banner)
      end

      it "returns success true" do
        post :incr_showing, id: @banner.id
        expect(JSON.parse(response.body)["success"]).to eq(true)
      end

      it "returns show yes" do
        post :incr_showing, id: @banner.id
        expect(JSON.parse(response.body)["show"]).to eq("yes")
      end

      it "increases showed field" do
        showed = @banner.showed
        post :incr_showing, id: @banner.id

        @banner.reload
        expect(@banner.showed).to eq(showed + 1)
      end

      it "returns show no if showed >= max_showing" do
        @banner.max_showing = 1
        @banner.save

        post :incr_showing, id: @banner.id

        @banner.reload
        expect(JSON.parse(response.body)["show"]).to eq("no")
      end
    end

    context "for invalid banner" do
      it "returns success fale" do
        post :incr_showing, id: 1_000_000
        expect(JSON.parse(response.body)["success"]).to eq(false)
      end
    end
  end

  describe "POST #incr_clicks" do
    it "increases clicks field" do
      banner = FactoryGirl.create(:banner)
      clicks = banner.clicks

      post :incr_clicks, id: banner.id

      banner.reload
      expect(banner.clicks).to eq(clicks + 1)
    end
  end

end