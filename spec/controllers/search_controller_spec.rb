require 'spec_helper'

describe SearchController do
	let(:teleporter) {FactoryGirl.create(:teleporter)}
	let(:teleporter2) {FactoryGirl.create(:teleporter)}
  	let(:departure) {FactoryGirl.create(:departure)}
  	let(:destination) {FactoryGirl.create(:destination)}
  	let(:teleport) {FactoryGirl.create(:teleport,teleporter: teleporter,departure: departure,destination: destination )}
  	

	describe  'GET #index' do
		before { get :index}
		it {should respond_with(200)}
		it "assign destinations" do
			destination = FactoryGirl.create(:destination)
			get :index
			expect(assigns(:destinations)).to eq([destination])
		end
		it "assign departures" do
			departure = FactoryGirl.create(:departure)
			get :index
			expect(assigns(:departures)).to eq([departure])
		end
	end
	describe  'POST #show' do
	
		it "assign results" do
			teleport = FactoryGirl.create(:teleport,teleporter: teleporter2,departure: departure,destination: destination )
			post :show, :search => [1 , 2 ]
			expect(assigns(:results)).to eq([teleport])
		end
	end
	describe  'POST #reserve' do
		before { post :reserve}
		it {should respond_with(200)}
	end
end



