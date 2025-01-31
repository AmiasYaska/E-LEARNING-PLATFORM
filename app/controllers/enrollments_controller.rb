class EnrollmentsController < ApplicationController
    before_action :authenticate_user!

    def create
        @video = Video.find(params.expect(:video_id))
        current_user.enrollments.create(video: @video)
        redirect_to video_path(@video), notice: "Enrolled successfully"
    end

end