class Admin::WorksController < Admin::BaseController
  before_action :set_work, only: [:edit, :update, :destroy]

  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    work = Work.create()
    redirect_to edit_admin_work_path(work.id)
  end

  def edit
  end

  def update
    @work.update(work_params)
    redirect_to admin_works_path
  end

  def destroy
    @work.destroy
    redirect_to admin_works_path
  end

  private
  def set_work
    @work = Work.find(params[:id])
  end

  def work_params
    params.require(:work).permit(:client, :content, :skill, :url, images_attributes: [:id, :image, :destroy])
  end
end
