module api

using OpenAI
using Dates

using ..Hermes: OPENAI, INSTRUCT

export HERMES_HISTORY
export @hermes, @hermes_str
export @hermes_exe, @hermes_exe_str


struct HermesCode
    str::String
    expr::Expr
end

const HERMES_HISTORY = Dict{String, HermesCode}();

"""
	hermes\"""YOUR CODE PROMPT\"""

## Notes
- If you ask for code that uses a non-standard library, you need to make sure you have it already loaded within your Pluto.jl notebook.
- Hermes tries to parse the returned code string, if it cannot the `expr` field of the `HermesCode` datatype is an empty expression.
"""
macro hermes_str(prompt)
	apikey = OPENAI[1]
	model = OPENAI[2]
	if !isempty(apikey)
		result = create_chat(
	    	apikey, 
	    	model,
	    	[Dict("role" => "user", "content"=> join([INSTRUCT,prompt],"\n\n"))]
	  	)
	else
		return "OpenAI API key is not set!"
	end
	response_str = result.response[:choices][begin][:message][:content]
	
	#Clean-up, because AI doesn't always listen!
	code_str = replace(response_str, r"julia\s*" => "")
    code_str = replace(code_str, r"(?<!\\)```(?s)(.*?)```(?!\S)" => s -> s[4:end-4])
	code_str = replace(code_str, r"^(?<!\\)`|(?<!\\)`$" => "")
    code_str = add_code_block(code_str) #"begin\n$code_str\nend;"
	
	# Valid Julia code?
	local code_parse
	try
		code_parse = Meta.parse(code_str)
	catch _
		@info "Returned code string could not be parsed. Please check!"
		code_parse = :()
	end
	hermes_code = HermesCode(code_str,code_parse)
	
	# Store the code in the global dictionary
    timestamp = Dates.format(now(), "yyyy-mm-dd HH:MM:SS")
	HERMES_HISTORY[timestamp] = hermes_code
	
	return hermes_code
end

macro hermes(prompt)
    :(@hermes_str $(prompt))
end

"""
    Execute the code returned by Hermes instead of just showing it.
"""
macro hermes_exe_str(prompt)
    hermes_code = eval(:(@hermes_str($(prompt))))
    esc(hermes_code.expr)
end

macro hermes_exe(prompt)
    :(@hermes_exe_str $(prompt))
end

end