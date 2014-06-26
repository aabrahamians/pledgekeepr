require 'spec_helper'

describe UsersController, type: :controller do
    let :valid_attributes do
        {
            name: "areg ",
            email: "areg@gmail.com",
            password: "123456",
            role:  "Admin",
            phone: "8186539981",
            quota: "1000"
        }
    end

    let :invalid_attributes do
        {
            name: "areg 	",
            email: "areg.com",
            password: "1234"
        }
    end

    describe "GET index" do
        let! :user1 do
            User.create! valid_attributes
        end

        before do
            get :index
        end

        it "should render the index page" do
            expect(response).to render_template :index
        end

        it "should succeed with status code 200" do
            expect(response.status).to eq(200) 
        end

        it "should render the set of users" do
            expect(assigns(:users)).to include(user1)
        end
    end

    describe "GET new" do
        before do
            get :new
        end

        it "should render the new_user/signup page" do
            expect(response).to render_template :new
        end

        it "should succeed with status code 200" do
            expect(response.status).to eq(200)
        end
    end
  




            
 end