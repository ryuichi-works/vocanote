class VocabulariesController < ApplicationController
  def index
    @vocabularies = current_user.vocabularies.page(params[:page]).per(15)
  end

  def show
    @vocabulary = current_user.vocabularies.find(params[:id])
  end

  def new
    @vocabulary = Vocabulary.new
  end

  def edit   
    @vocabulary = current_user.vocabularies.find(params[:id])
  end

  def update
    vocabulary = current_user.vocabularies.find(params[:id])
    vocabulary.update!(vocabulary_params)
    redirect_to vocabularies_url, notice: '単語情報を更新しました'
  end

  def create
    # @vocabulary = Vocabulary.new(vocabulary_params)
    @vocabulary = current_user.vocabularies.new(vocabulary_params)
    if @vocabulary.save
      redirect_to @vocabulary, notice: "word「#{@vocabulary.word}」を登録しました"
    else
      render :new
    end
  end

  def destroy
    vocabulary = current_user.vocabularies.find(params[:id])
    vocabulary.destroy
    redirect_to vocabularies_url, notice: "#{vocabulary.word}を削除しました。"
  end

  private
    def vocabulary_params
      params.require(:vocabulary).permit(:word, :meaning, :comment)
    end
end
