class TestController < ApplicationController
  def show
    seed = Time.now.to_i / 10
    srand(seed)

    if stale? :etag => seed
      expires_in nil, 's-maxage' => 10.seconds,  :public => true
      render :text => Faker::Lorem.paragraphs(500)
    end
  end
end
