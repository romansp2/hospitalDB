class HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.all
  end

  def create
    @hospital = Hospital.new(hospital_params)
    
    if @hospital.save

      flash[:notice] = "Больница создана"

      redirect_to root_path
    else
      flash[:alert] = @hospital.errors.full_messages
      redirect_to hospitals_new_path
    end
  end

  def show
    @hospital = Hospital.find(params[:id])
    @staffs = @hospital.staffs
  end

  def destroy
    @hospital = Hospital.find(params[:id])
    @hospital.destroy
    flash[:notice] = "Больница удалена "
    redirect_to root_path
  end

  def new
  @page_title = 'Добавление больницы'
  @hospital = Hospital.new
  @staffs = Staff.all
  end

  def update
    @hospital = Hospital.find(params[:id])
    if @hospital.update(hospital_params)
      flash[:notice] = "Больница добавлена"
      redirect_to hospital_path(@hospital)
    else
      flash[:alert] = @hospital.errors.full_messages
      redirect_to edit_hospital_path(@hospital)
    end
  end

  def edit
    @hospital = Hospital.find(params[:id])
    @staff = Staff.all
  end

  private


  def hospital_params
    params.require(:hospital).permit(:num)
  end
end
