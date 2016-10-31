module StopwordsHelper

def url_permit_params(params)
	return params.permit(:word, :page, :word_order)
end

end
