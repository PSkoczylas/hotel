require 'rails_helper'

describe TermsController do
  render_views

  let!(:user) { create(:user) }
  let!(:term1) { create(:term, quantity_of_beds: 1) }
  let!(:term2) { create(:term, quantity_of_beds: 1) }

  before(:each) do
    sign_in user
  end

  describe "GET #index" do
    it "responds successfuly HTTP 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "loads all of the terms into @terms" do
      get :index
      assigns(:terms).sort.should eq([term1, term2].sort)
    end
  end

  describe "GET #new" do
    it "responds successfuly HTTP 200 status code" do
      get :new, format: :html
      response.status.should eq(200)
    end
  end

  describe "DELETE #destroy" do
    it "responds successfuly HTTP 200 status code" do
      delete :destroy, format: :html, params: { id: term1.id }
      response.status.should eq(302)
    end

    it "deletes given element" do
      get :index
      assigns(:terms).sort.should eq([term1, term2].sort)
      delete :destroy, format: :html, params: { id: term2.id }
      get :index
      assigns(:terms).sort.should eq([term1].sort)
    end
  end

  describe "GET #edit" do
    it "responds successfuly HTTP 200 status code" do
      get :edit, format: :html, params: { id: term2.id }
      response.status.should eq(200)
    end
  end
end
