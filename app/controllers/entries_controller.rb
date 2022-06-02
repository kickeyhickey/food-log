class EntriesController < ApplicationController
    before_action :set_entry, only: [:show, :edit, :update, :destroy]

    def index
        @entries = Entry.all
    end


    def new
        @entry = Entry.new
    end

    def create
        @entry = Entry.new(entry_params)
    end

    def edit
        @entry = Entry.find(params[:id])

        

    end

    private

    def set_entry
        @entry = Entry.find(params[:id])
    end

    def entry_params
        params.require(:entry).permit(:meal_type, :calories, :proteins, :carbohydrates, :fats)
    end

end
