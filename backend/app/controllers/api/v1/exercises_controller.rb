class Api::V1::ExercisesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show]

    def index
        @exercises = Exercise.all
    end

    def create
        @exercise = Exercise.create(exercise_params)
        render json: @exercise
    end

    private

    def exercise_params
        params.require(:exercise).permit(:exercise_id)
    end

end
