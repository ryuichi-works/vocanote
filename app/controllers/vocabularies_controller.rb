class VocabulariesController < ApplicationController
  def index
    @vocabularies = Vocabulary.all
  end

  def show
    @vocabulary = Vocabulary.find(params[:id])
  end

  def new
    @vocabulary = Vocabulary.new
  end

  def edit   
    @vocabulary = Vocabulary.find(params[:id])
  end

  def update
    vocabulary = Vocabulary.find(params[:id])
    vocabulary.update!(vocabulary_params)
    redirect_to vocabularies_url, notice: '単語情報を更新しました'
  end

  def create
    @vocabulary = Vocabulary.new(vocabulary_params)
    if @vocabulary.save
      redirect_to @vocabulary, notice: "word「#{@vocabulary.word}」を登録しました"
    else
      render :new
    end
  end

  def destroy
    vocabulary = Vocabulary.find(params[:id])
    vocabulary.destroy
    redirect_to vocabularies_url, notice: "#{vocabulary.word}を削除しました。"
  end

  private
    def vocabulary_params
      params.require(:vocabulary).permit(:word, :meaning, :comment)
    end
end
