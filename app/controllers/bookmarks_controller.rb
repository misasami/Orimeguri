class BookmarksController < ApplicationController
    before_action :authenticate_user!

    def create
      @bookmark = current_user.bookmarks.build(bookmark_params)
      if @bookmark.save
        redirect_to @bookmark.bookmarkable, notice: 'ブックマークしました。'
      else
        redirect_to @bookmark.bookmarkable, alert: 'ブックマークできませんでした。'
      end
    end
  
    def destroy
      @bookmark = current_user.bookmarks.find(params[:id])
      @bookmark.destroy
      redirect_to @bookmark.bookmarkable, notice: 'ブックマークを削除しました。'
    end
  
    private
  
    def bookmark_params
      params.require(:bookmark).permit(:bookmarkable_type, :bookmarkable_id)
    end
   
end
