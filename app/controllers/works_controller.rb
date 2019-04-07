class WorksController < ApplicationController
  def index
    @works = Work.all.paginate(page: params[:page], per_page: 4)
  end

  def show
    @work = Work.find(params[:id])
  end
end
