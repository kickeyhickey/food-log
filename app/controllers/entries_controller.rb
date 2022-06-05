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

        respond_to do |format|
            if @entry.save
                format.html { redirect_to @entry, notice: 'Entry was succesfully created.'}
                format.json { render :show, status: :created, location: @entry }
            else
                format.html { render :new }
                format.json { render json: @entry.errors, status: :unprocessable_entity }
            end
        end
    end

    def edit
    end

    def update
        respond_to do |format|
            if @entry.update(entry_params)
                format.html { redirect_to @entry, notice: 'Entry was successfully updated.'}
                format.json { render :show, status: :ok, location: @entry }
            else
                format.html { render :edit }
                format.json { render json: @entry.errors, status: :unprocessable_entity }
            end
        end
    end


    private

    def set_entry
        @entry = Entry.find(params[:id])
    end

    def entry_params
        params.require(:entry).permit(:meal_type, :calories, :proteins, :carbohydrates, :fats)
    end

end
