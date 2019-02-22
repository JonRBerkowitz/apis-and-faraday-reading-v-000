class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = 'LVJEVJ4BCTANBM5CY1FYBULOYBLIQXYHM4NM22HOTLVJCKAS'
      req.params['client_secret'] = '1GSGX0OQCLKOMYKISRAMFTGYPUSC00NGK1FJTB2WKSPO2QAY'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    render 'search'
  end
end
