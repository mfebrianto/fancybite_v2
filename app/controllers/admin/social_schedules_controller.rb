class Admin::SocialSchedulesController < Admin::AdminController

  def show
    @social = Social.find(params[:id])
  end

  def edit
    @social = Social.find(params[:id])
  end

  def create
    @social = Social.find(params[:social_id])
    params[:social_schedules].each do |k,v|
      schedule = @social.social_schedules.select{|schedule| schedule.day == k.to_s}.first
      schedule.update_attributes(time: v)
    end

    render action: 'show'
  end

end