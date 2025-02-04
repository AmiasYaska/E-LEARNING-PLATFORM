class EnrollmentsController < ApplicationController
    before_action :authenticate_user!

    def create
        @video = Video.find(params.expect(:video_id))
        current_user.enrollments.create(video: @video, progress: 0)
        redirect_to video_path(@video), notice: "Enrolled successfully", status: :see_other
    end

    def index
        @enrollments = current_user.enrollments.includes(:video)
    end

end