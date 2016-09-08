class StatsController < ApplicationController
  
  def index
    @all_conditions = Information.all_conditions
    @data = params[:data].present? ? ( @all_conditions.include?(params[:data]) ? Information::all_data[params[:data]][:census_data] : Information::CENSUS_DATA ) : Information::CENSUS_DATA
  end
  
  
end
