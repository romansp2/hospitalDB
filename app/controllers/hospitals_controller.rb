class HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.all
  end

  def create
    @hospital = Hospital.new(hospital_params)
    staff_ids = params[:hospitals_staffs]
    if @hospital.save
        if staff_ids != nil
            staff_ids.each do |staff_id|
            @hospital.staffs << Staff.find_by(id:staff_id)
            flash[:notice] = "Больница создана"
            redirect_to root_path
            end
          else
        flash[:notice] = "Больница создана"
        redirect_to root_path
        end
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

  def lay_off
    @hospital = Hospital.find(params[:id])
    @hospital.staffs.delete(Staff.find(params[:staff_id]))
    @hospital.reload
    flash[:notice] = "Сотрудник исключен из больницы"
    redirect_back(fallback_location: root_path)
  end

  def update
    @hospital = Hospital.find(params[:id])
    staff_ids = params.require(:hospitals_staffs)
    if @hospital.update(hospital_params)
      if staff_ids != nil
      staff_ids.each do |staff_id|
        @hospital.staffs << Staff.find_by(id:staff_id)
        flash[:notice] = "Больница добавлена"
        redirect_to hospital_path(@hospital)
      end
      else
      flash[:notice] = "Больница добавлена"
      redirect_to hospital_path(@hospital)
      end
    else
      flash[:alert] = @hospital.errors.full_messages
      redirect_to edit_hospital_path(@hospital)
    end
  end

  def edit
    @hospital = Hospital.find(params[:id])
    @staffs = Staff.all - @hospital.staffs
  end



  private

  def hospital_params
    params.require(:hospital).permit(:num)
  end
end
