require 'rails_helper'

# RSpec.describe Tab, type: :model do
#   let(:bar) { Bar.new }
#   let(:tab) { Tab.new }
#   let(:patron) { Patron.new }

#   describe "#throw_for_computer" do
#     context "when the game already has a computer throw" do
#       it "returns the computer throw" do
#         game.computer_throw = "paper"
#         expect(game.throw_for_computer).to eq "paper"
#       end
#     end

#     context "when the game does not have a computer throw" do
#       it "generates a throw" do
#         expect(game.throw_for_computer).to be_in Game::THROWS
#       end

#       it "sets the computer throw to the generated throw" do
#         expect(game.computer_throw).to be_nil
#         generated_computer_throw = game.throw_for_computer
#         expect(game.computer_throw).to eq generated_computer_throw
#       end
#     end
#   end

#   describe "#user_throw" do
#     describe "validations" do
#       it "is valid when it's rock" do
#         game.user_throw = 'rock'
#         game.valid?
#         expect(game.errors[:user_throw]).to be_empty
#       end

#       it "is valid when it's paper" do
#         game.user_throw = 'paper'
#         game.valid?
#         expect(game.errors[:user_throw]).to be_empty
#       end
#     end
#   end

# end
