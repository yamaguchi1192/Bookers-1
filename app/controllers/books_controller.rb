class BooksController < ApplicationController
  def show
  	@book = Book.find(params[:id])

  end

  def index
  	@book = Book.new
  	@books = Book.all
  end

 def create
        # ストロングパラメーターを使用
         @book = Book.new(list_params)
        # DBへ保存する
         if @book.save
        # トップ画面へリダイレクト
        flash[:notice] = "successfully"
        redirect_to book_path(@book.id)
        else
        	@books = Book.all
        	render 'index'
        end

    end

    def edit
    	@book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
      if @book.update(list_params)
        flash[:notice] = "successfully"
        redirect_to book_path(@book.id)
      else
          render 'edit'
     end

    end

    def destroy
    	 book = Book.find(params[:id]) #データ(レコード)を1件取得
        book.destroy #データ（レコード）を削除
        redirect_to books_path #List一覧画面へリダイレクト
    end

    private
    def list_params
        params.require(:book).permit(:title, :body)
    end
end
