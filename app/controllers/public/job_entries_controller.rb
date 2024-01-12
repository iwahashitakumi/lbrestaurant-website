class Public::JobEntriesController < Public::ApplicationController
  def recruitment_info
    @job_entry = JobEntry.new
    @birth_date_options = birth_date_options
    @prefectures = Prefecture.all
  end
  
  def create
    @job_entry = JobEntry.new(job_entry_params)
    @birth_date_options = birth_date_options
    @prefectures = Prefecture.all
    begin
      if params[:back]
        render "recruitment_info"
      else
        @job_entry.save!
        redirect_to complete_job_entries_path
      end
    rescue
      render "recruitment_info"
    end
  end


  private

  def job_entry_params
    params.require(:job_entry).permit(:recruit_type, :name, :name_kana, :sex, :birth_date, :email, :phone_number, :prefecture_id, :city_name, :address)
  end

  def birth_date_options
    { start_year: (Time.zone.today - 60.year).year, end_year: (Time.zone.today - 16.year).year, prompt:"---", use_month_numbers: true }
  end
end
