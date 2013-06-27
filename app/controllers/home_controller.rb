class HomeController < ApplicationController
  def index
    @popular_packs = ConfigPack.joins(:pack_overall_average).order('rating_caches.avg DESC').limit(10)
    @recent_packs = ConfigPack.order(:updated_at).limit(10)
  end
end
