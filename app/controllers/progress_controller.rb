class ProgressController < ApplicationController
    before_action :authenticate_user!

    def show
        enrollment = current_user.enrollments.find_by(video_id: params[:video_id])
        render json: { progress: enrollment&.progress || 0 }
    end

    def update
        enrollment = current_user.enrollments.find_by(video_id: params[:video_id])
        progress = params[:progress].to_f.clamp(0.0, 1.0)
        enrollment.update!(progress: params[:progress])
        head :no_content
    end

end