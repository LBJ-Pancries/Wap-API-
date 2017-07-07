class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def update_temp
    city = City.find(params[:id])

    response = RestClient.get "http://v.juhe.cn/weather/index",
                              :params => { :cityname => city.juhe_id, :key => "f1581cc1ae26f727867de8b87784ad74"}

    data = JSON.parse(response.body)

    city.update( :current_temp => data["result"]["sk"]["temp"] )

    redirect_to cities_path
  end
end
