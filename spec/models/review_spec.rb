require 'rails_helper'

describe Review, type: :model do

  describe "relationships" do
    it {should belong_to(:user)}
    it {should belong_to(:book)}
  end

  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:rating)}
    it {should validate_presence_of(:review)}
  end

  describe "class methods" do
  end

  describe "instance methods" do
  end
end
