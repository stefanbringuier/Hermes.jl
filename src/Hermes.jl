module Hermes
using Reexport

include("instruct.jl")
include("ui.jl")
include("api.jl")
include("display.jl")
include("utils.jl")

global OPENAI = (apikey="",model="")
@reexport using .ui
@reexport using .api

end
