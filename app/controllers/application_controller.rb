class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'
  # add routes
  get '/bakeries' do
    # get all the bakeries from the database
    goods = Bakery.all
    # send them back as a JSON array
    goods.to_json
  end

  get '/bakeries/:id' do
    # get all the bakeries from the database
    goods = Bakery.find(params[:id])
    # send them back as a JSON array
    goods.to_json(include: :baked_goods)
  end
  
  get '/baked_goods/by_price' do
    # get all the bakeries from the database
    goods = BakedGood.order("price DESC")
    # send them back as a JSON array
    goods.to_json
  end

  get '/baked_goods/most_expensive' do
    # get all the bakeries from the database
    goods = BakedGood.order("price DESC").first
    # send them back as a JSON array
    goods.to_json
  end

end
