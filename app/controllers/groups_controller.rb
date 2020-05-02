class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :require_login
   
    def index
      @groups = Group.all.order("name ASC")
      @group = Group.all

      @invite = Invite.find_by_id(params[:id])
    end

    
    def show
    end

    
    def new
      @group = Group.new

      @games = Game.all.map{|c| [ c.name, c.id ] }
      @group.game_id = params[:game_id]

      @invite = Invite.new
    end

    
    def edit
    end

    
    def create
      @group = Group.new(group_params)
      @group.user_id = current_user.id
      
      # @games = Game.all.map{|c| [ c.name, c.id ] }
      @group.game_id = params[:game_id]


      # @game = Game.find(params[:game_id])
      # @game = Game.find(params[:id])
      # @game = Game.find(params[:id])
      
      # @group.game_id = @game.game_id
      # @group.game_id = @game.id
      # @group.game_id = Game.find(params[:id])

      # @group = @game.group.create(group_params)

      respond_to do |format|
        if @group.save
          format.html { redirect_to @group, notice: 'Game was successfully created.' }
          format.json { render :show, status: :created, location: @group }
        else
          format.html { render :new }
          format.json { render json: @group.errors, status: :unprocessable_entity }
        end
      end
    end

    
    def update
      respond_to do |format|
        if @group.update(group_params)
          format.html { redirect_to @group, notice: 'Game was successfully updated.' }
          format.json { render :show, status: :ok, location: @group }
        else
          format.html { render :edit }
          format.json { render json: @group.errors, status: :unprocessable_entity }
        end
      end
    end

    
    def destroy
      @group.destroy
      respond_to do |format|
        format.html { redirect_to groups_path, notice: 'Group was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    def new_comment
      @group = Group.find(params[:id])
      
      @user = current_user

      @game = @group.game_id
      
      CommentMailer.new_comment(@group, current_user, @game).deliver_now
      
      flash[:notice] = "Email has been sent."
      redirect_to group_path

    end

    private
      # Only allow a list of trusted parameters through.
      def group_params
        params.require(:group).permit(:name, :shares, :noofplays, :encore, :game_id, :private, :unique_identifier)
      end


      def set_group
        @group = Group.find(params[:id])
      end

      def require_login
        unless user_signed_in?
          flash[:error] = "You must be logged in to access this section"
          redirect_to new_user_session_path
        end
      end



end
