class StoriesController < ApplicationController

    def index
        @stories = Story.all
    end

    def new
        @story = Story.new
    end

    def create
        @story = Story.new(story_params)
        if @story.save
            redirect_to "/stories/#{@story.id}"
        else
            render :new
        end
    end

    def edit
        @story = Story.find(params[:id])
    end

    def update
        @story = Story.find(params[:id])
        if @story.update(story_params)
            redirect_to "/stories/#{@story.id}"
        else
            render :edit
        end
    end

    def show
        @story = Story.find(params[:id])
    end

    def search
        @term = params[:term]
        @stories = Story.where("title LIKE ? OR category LIKE ?", "%#{@term}%", "%#{@term}%")
    end

    def upvote
        id = params[:id]
        if Story.increment_counter(:upvotes, id)
            redirect_to story_path(id)
        else
            render :index
        end
    end

    private

    def story_params
        params.require(:story).permit(
            :title,
            :link,
            :upvotes,
            :category)
    end

end