class BooksController < ApplicationController
  protect_from_forgery except: [:destroy]
  # 指定したアクションの前にset_bookメソッドを実行する（重複する記述がある場合に有効的）アクションの前後に実行する処理のことをフックという
  before_action :set_book, only: [:show, :destroy]



  def show
    # respond_toは、リクエストで指定されたフォーマットによって処理を分ける事ができるメソッド
    respond_to do |format|
      # books/:idとリクエストされたらbooks/show.html.erbをrenderする
      format.html
      # books/:id.jsonとリクエストされた時に、json形式でrnderする
      format.json
    end
  end

  def destroy
    @book.destroy
    respond_do do |format|
      format.html {redirect_to "/"}
      format.jaon {head :no_content}
    end
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end
  
  def set_books
    @books = Book.all
  end
end
