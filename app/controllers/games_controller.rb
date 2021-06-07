class GamesController < ApplicationController

	def new
		@letters = Array.new(10) {('A'..'Z').to_a.sample }
	end

	def english_word?
		response = URI.open("https://wagon-dictionary.herokuapp.com/#{params[:word]}")
		json = JSON.parse(response.read)
		return json['found']
	end

	def include?
		@letters = params[:letters]
		params[:word].chars.all? { |letter| params[:word].count(letter) <= @letters.count(letter) }
	end

	def score
		if include?
			if english_word? 
				@sentence = "good job!"
			else 
				@sentence = "This is not an english english_word"
			end
		else 
		 	@sentence = "Sorry but no"
		end
	end
end
