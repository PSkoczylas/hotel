require 'rails_helper'

describe ClientsController do
  render_views
  
  let!(:user) { create(:user) }
  let!(:client1) { create(:client, phone_number: "32254521", first_name: "Antonina", last_name: "Sroka") }
  let!(:client2) { create(:client, phone_number: "34209884", first_name: "Gabriel", last_name: "Słowiński") }
  let!(:client3) { create(:client, phone_number: "34432884", first_name: "Gertruda", last_name: "Stolarski") }


  before(:each) do
    sign_in user
  end

  describe "GET #index" do
    it "respnds successfuly HTTP 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "loads all of the posts into @clients" do
      get :index 
      assigns(:clients).sort.should eq([client1, client2, client3].sort)
     # binding.pry
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
      delete :destroy, format: :html, params: { id: client2.id }
      response.status.should eq(302)
    end

    it "deletes given element" do
      get :index
      assigns(:clients).sort.should eq([client1, client2, client3].sort)
      delete :destroy, format: :html, params: { id: client1.id }
      get :index
      assigns(:clients).sort.should eq([client2, client3].sort)
    end
  end

  describe "GET #edit" do
    it "responds successfuly HTTP 200 status code" do
      get :edit, format: :html, params: { id: client3.id }
      response.status.should eq(200)
    end
  end
end
