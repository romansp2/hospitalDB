class StaffsController < ApplicationController
  def index
    @staffs = Staff.all
  end

  def new
    @page_title = "Добавление сотрудника"
    @staff = Staff.new
    @hospitals = Hospital.all
  end



  def create
    @staff = Staff.new(staff_params)
    hospital_ids = params[:hospitals_staffs]
    if @staff.save
      if hospital_ids != nil
      hospital_ids.each do |hospital_id|
        @staff.hospitals << Hospital.find_by(id:hospital_id)
        flash[:notice] = "Сотрудник добавлен"
        redirect_to staffs_index_path
      end
      else
      flash[:notice] = "Сотрудник добавлен"
      redirect_to staffs_index_path
      end

    else
      flash[:alert] = @staff.errors.full_messages
      redirect_to staffs_new_path
    end

  end

  def destroy
    @staff = Staff.find(params[:id])
    @staff.destroy
    flash[:notice] = "Сотрудник удален"
    redirect_to staffs_index_path
  end

  def edit
    @staff = Staff.find(params[:id])
    @hospitals = Hospital.all - @staff.hospitals

  end

  def update
    @staff = Staff.find(params[:id])
    hospital_ids = params[:hospitals_staffs]
    if @staff.update(staff_params)
      if hospital_ids != nil
        hospital_ids.each do |hospital_id|
          @staff.hospitals << Hospital.find_by(id:hospital_id)
          flash[:notice] = "Информация изменена"
          redirect_to staffs_index_path
          end
        else
      flash[:notice] = "Информация о сотруднике изменена"
      redirect_to staff_path(@staff)
      end
    else
      flash[:alert] = @staff.errors.full_messages
      redirect_to edit_staff_path
      end


  end

  def show
    @staff = Staff.find(params[:id])
    @hospitals = @staff.hospitals
  end
  private

  def staff_params
      params.require(:staff).permit(:sname, :bday, :position)

    end

end
