require 'rails_helper'

RSpec.describe UserController, type: :controller do
    
    describe 'GET #new'do
        it "renders a new user template" do
            get :new
            expect(response).to render_template(:new)
        end
    end

    describe 'GET #index'do
        it "renders the index template" do
            get :index
            expect(response).to be_success
            expect(response).to render_template(:index)
        end
    end


    describe 'GET #show'do
        context "when user exists" do
            it "renders a show template" do
                user1=User.create!(username: "Capy1", password: "pw123456")
                # get :show, id: 1    
                get :show, id: user1.id
                expect(response).to render_template(:show)
            end
        end

        context "user does not exist" do 
            it "cannot render a show template" do
                begin
                    get :show, id: -1
                rescue
                    ActiveRecord:RecordNotFound
                end
            end

            expect(response).not_to render_template(:show) 
        end
    end
    
    describe 'POST #create'do
        let(:user_params) do {
            user: {
                username: 'capy',
                password: 'password'
            }
        }

        it "it renders a 'new' template" do
            post :create, params: user_params 
            expect(response).to render_template(:new)
        end
    end


end
