require 'rails_helper'

RSpec.describe User, type: :model do
    # subject(:user) do
    #     FactoryBot.build(:user, 
    #     username: "vegeta",
    #     password: "bulma")
    # end
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password_digest)}
    # it {should validate_presence_of(:session_token)}
    it {should validate_length_of(:password).is_at_least(5)}
  
    describe "uniqueness" do
        before :each do
            create(:user)
        end
        it {should validate_uniqueness_of(:username)}
        it {should validate_uniqueness_of(:session_token)}

    end

    describe "session_token" do 
        it "should assign a session_token if none is given" do 
            expect(FactoryBot.create(:user).session_token).not_to be_nil
        end

    end

    describe "is_password?" do 
        let!(:user) {create(:user)}
        context "with a valid password" do 
            it "should return true" do 
                expect(user.is_password?("bulma")).to be true
            end
        end
        context "with a invalid password" do 
            it "should return false" do 
                expect(user.is_password?("chichi")).to be false
            end
        end

    end

    describe "::find_by_credentials" do
        let!(:user) {create(:user)}
        # before :each do 
        #     username = user.username
        #     password = "bulma"
        # end
        context "with valid credentials" do 
            it "should return user" do 
                expect(User.find_by_credentials(user.username, 'bulma')).to eq(user)
            end
        end

        context "with invalid credentials" do 
            it "should return nil" do 
                expect(User.find_by_credentials(user.username, 'chichi')).to eq(nil)
            end
        end


    end

end