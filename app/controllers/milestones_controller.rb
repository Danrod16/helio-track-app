class MilestonesController < ApplicationController

    def create
        @milestone = Milestone.new(milestone_params)
        @project = Project.find(params[:id])
        @milestone.project = @project
       if  @milestone.save!
        redirect_to root_path
       end
    end
end
