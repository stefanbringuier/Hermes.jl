module ui
using PlutoUI
using PlutoUI.BuiltinsNotebook: @bind
using Markdown



const MODELS = ["gpt-3.5-turbo","gpt-3.5-turbo-16k","gpt-4","gpt-4-32k"]

macro set_openai(apikey::String,model::String)
    return esc(:(global OPENAI = (apikey=$(apikey),model=$(model))))
end

function settings_widget()
    @bind OPENAI confirm(
        PlutoUI.combine() do Child
            md"""
            OpenAI API Key: $(Child("apikey",PasswordField()))

            Model: $(Child("model",Select(MODELS)))
            """
        end
    )
end

end