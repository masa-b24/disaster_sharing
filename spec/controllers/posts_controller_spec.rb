require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "#new" do
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
      end
          
      describe "#new" do
        it "responds successfully" do
          sign_in @user
          get :new
          expect(response).to be_successful
        end

        it "returns a 200 response" do
          sign_in @user
          get :new
          expect(response).to have_http_status "200"
        end
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        get :new
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        get :new
        expect(response).to redirect_to "/users/sign_in" 
      end  
    end
  end

  describe "#show" do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
        @post = FactoryBot.create(:post, user: @user)
      end

      it "responds successfully" do
        sign_in @user
        get :show, params: { id: @post.id }
        expect(response).to be_successful
      end 
    end
  end

  describe "#create" do
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
      end

      context "with valid attributes" do
        it "adds a post" do
          # post_params = FactoryBot.attributes_for(:post)
          post_params = FactoryBot.build(:post).attributes
          sign_in @user
          expect {
            post :create, params: { post: post_params }
          }.to change(@user.posts, :count).by(1)
        end
      end

      context "with invalid attributes" do
        it "does not add a post" do
          post_params = FactoryBot.build(:post, :invalid).attributes
          sign_in @user
          expect {
            post :create, params: { post: post_params }
          }.to_not change(@user.posts, :count)
        end
      end
    end
  end

  describe "#destroy" do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
        @post = FactoryBot.create(:post, user: @user)
      end

      it "deletes a post" do
        sign_in @user
        expect {
          delete :destroy, params: { id: @post.id }
        }.to change(@user.posts, :count).by(-1)
      end
    end

    context "as an unauthorized user" do
      before do
        @user = FactoryBot.create(:user)
        other_user = FactoryBot.create(:user)
        @post = FactoryBot.create(:post, user: other_user)
      end

      it "does not delete the post" do
        sign_in @user
        expect {
          delete :destroy, params: { id: @post.id }
        }.to_not change(Post, :count)
      end

      it "redirects to the dashboard" do
        sign_in @user
        delete :destroy, params: { id: @post.id }
        expect(response).to redirect_to root_path
      end
    end

    context "as a guest" do
      before do
        @post = FactoryBot.create(:post)
      end

      it "returns a 302 response" do
        delete :destroy, params: { id: @post.id }
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign-in page" do
        delete :destroy, params: { id: @post.id }
        expect(response).to redirect_to "/users/sign_in"
      end

      it "does not delete the post" do
        expect {
          delete :destroy, params: { id: @post.id }
        }.to_not change(Post, :count)
      end
    end
  end
end