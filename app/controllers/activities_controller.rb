class ActivitiesController < ApplicationController
    before_action :set_activity, only: [:show, :update, :destroy]

    def index
        @activities = Activity.all
        render json: @activities
    end

    def show
        render json: @activity
    end

    def create
        @activity = Activity.new(activity_params)

        if @activity.save
        render json: @activity, status: :created
        else
        render json: @activity.errors, status: :unprocessable_entity
        end
    end

    def update
        if @activity.update(activity_params)
        render json: @activity
        else
        render json: @activity.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @activity.destroy
        head :no_content
    end

    def upcoming
        @upcoming_activities = Activity.where('date >= ?', DateTime.now).order(date: :asc)
        render json: @upcoming_activities
    end

    def past
        @past_activities = Activity.where('date < ?', DateTime.now).order(date: :desc)
        render json: @past_activities
    end

    private

    def set_activity
        @activity = Activity.find(params[:id])
    end

    def activity_params
        params.require(:activity).permit(:name, :date,:ground.id)
    end
end
