#module ui

using PlutoUI
using PlutoUI.BuiltinsNotebook: @bind
using Markdown

export @set_openai
export @settings_widget


const MODELS = ["gpt-3.5-turbo","gpt-3.5-turbo-16k","gpt-4","gpt-4-32k"]

global OPENAI = (apikey="", model="")

macro set_openai(apikey::String,model::String)
    return eval(:(global OPENAI = (apikey=$(apikey),model=$(model))))
end


macro settings_widget()
    quote
        @bind OPENAI confirm(
            PlutoUI.combine() do Child
                md"""
                OpenAI API Key: $(Child("apikey", PasswordField()))

                Model: $(Child("model", Select($MODELS)))
                """
            end
        )
    end
end


#end