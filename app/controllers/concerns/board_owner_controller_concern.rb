#Ensure user has access to the board and sets the `@board` variable in the controller
module BoardOwnerControllerConcern
  extend ActiveSupport::Concern

  #Ensure user has access to the board and sets the `@board` variable in the controller
  def ensure_board
    board_id = params[:board_id] || params[:id]
    @board = nil
    if !board_id.nil?
      @board = Board.find_by_id(board_id)
    else
      render status: :bad_request
    end
    if (@board)
      @user_board = UserBoard.where(user_id: @user.id, board_id: board_id).first
      if (@user_board.nil?)
        render status: :forbidden
      end
    else
      render status: :not_found
    end
  end

end