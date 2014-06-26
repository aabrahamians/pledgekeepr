require 'spec_helper'

describe SessionsController, type: :controller do
    
    describe "POST create" do
        describe "on successful signin"do
            before do
                @areg = User.create!(name: "areg", email: "areg@areg.com", password: "thisisit", password_confirmation: "thisisit", role: "admin", phone: "8186539981")
                post :create, session: { :email => @areg.email, :password => @areg.password }
            end

            it "should return that areg is valid" do
                expect(@areg).to be_valid
            end

            it "should return the user's email" do
                expect(assigns[:user]).to eq(@areg)
            end

            it "should authenticate the user with a proper email and password combination" do
                expect(session[:remember_token]).to eq(@areg.id)
            end

            it "should set the current user to be user that is logging in" do
                expect(assigns[:current_user]).to eq(@areg)
            end

            it "should redirect to the users' index page" do
                expect(response).to redirect_to users_path
            end
        end

        describe "on unsuccessful signin" do
            before do
                @areg = User.create!(name: "areg", email: "areg@areg.com", password: "thisishard", password_confirmation: "thisishard")
                @matt = User.create!(name: "Matt", email: "matt@matt.com", password: "easyeasy", password_confirmation: "easyeasy")
                post :create, session: { :email => @areg.email, :password => @matt.password }
            end
            
            it "should return areg as the user by his email" do
                expect(assigns[:user]).to eq(@areg)
            end

            it "should not authenticate areg as the user because he is using the wrong password" do
                expect(session[:remember_token]).to eq(nil)
            end

            it "should render the new sessions page" do
                expect(response).to render_template :new
            end
        end
    end
end