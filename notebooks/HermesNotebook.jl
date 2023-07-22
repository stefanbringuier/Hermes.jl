### A Pluto.jl notebook ###
# v0.19.27

#> [frontmatter]
#> Author = "Stefan Bringuier"
#> title = "HermesNotebook.jl"
#> date = "2023-07-21"
#> tags = ["AI", "Coding-Assistant"]
#> description = "Example using the Hermes in Pluto.jl"

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ a0c02846-c177-41ea-931c-a2df7de90de0
# ╠═╡ show_logs = false
begin
    import Pkg
    # activate a temporary environment
    Pkg.activate(mktempdir())
    Pkg.add([
        Pkg.PackageSpec(url="https://github.com/stefanbringuier/Hermes.jl.git"),
		Pkg.PackageSpec("PlutoUI"),
		Pkg.PackageSpec("Plots"),
    ])
end

# ╔═╡ 2b091d31-d5cc-4dcd-99d1-5571480b6190
begin
	using PlutoUI
	using Hermes
end

# ╔═╡ 70de9c18-6ee1-48fe-8edc-b5034463f4c6
md"""
## Configure Hermes
!!! help
    Add `Hermes.jl` and need to add any other packages you may specify for `Hermes.jl` to use when generating code. `Hermes.jl` won't be able to deploy `using` julia command.
"""

# ╔═╡ 7bb5124f-a2a8-4cc5-be56-8c45f7c8fa66
md"""
!!! note
    Below is just a PlutoUI widget
"""

# ╔═╡ 1cc4c78c-ac00-49ce-96fc-cfb9182d05c7
@bind openai confirm(
        PlutoUI.combine() do Child
            md"""
            OpenAI API Key: $(Child("apikey",PasswordField()))

            Model: $(Child("model",Select(["gpt-3.5-turbo","gpt-4"])))
            """
        end
    )

# ╔═╡ 856fa147-cfbc-4be1-8cdb-c47a552c14a0
md"""
!!! help
    Specify the model and apikey for OpenAI.
"""

# ╔═╡ 935e0a5a-c3e5-45be-b16b-8c583f37be7e
begin
	apikey = openai[1]
	model = openai[2]
	# Untested
	# @set_openai(apikey,model)
	Hermes.OPENAI = (apikey=apikey,model=model)
end;

# ╔═╡ 75d71b12-5744-471c-9476-e14f0e31f4b2
md"""
# Trying it out
"""

# ╔═╡ a9012db6-e5c6-4b52-83c3-a713f036de1e
md"""
Now using string generation mode!
"""

# ╔═╡ ff3425c2-7ed6-4b74-817c-2755cbe07c6a
hermes"Create a function that doubles a number. Call it `double`"

# ╔═╡ ab031d78-3e74-4432-ae76-fd3414ce058a
begin
"""
	double(x)

Double a number `x`.

# Arguments
- x::Number: The number to be doubled.

# Returns
- ::Number: The result of doubling `x`.
"""
function double(x)
    return 2*x
end
end

# ╔═╡ 883bf8f0-a7fa-406c-8209-07759f7ecef4
double(2.0)

# ╔═╡ f2b30219-6c54-4005-829b-0eb89006a964
md"""
Lets now how Hermes execute!
"""

# ╔═╡ 6f24c887-17d5-4813-8f02-e5098b755f2c
hermes_exe"Plot a sine function"

# ╔═╡ 79e0d3bc-5109-42e4-a2b1-c96995ca34a1
md"""
We can access the history of commands:
"""

# ╔═╡ ae8b3e30-8997-400f-88ef-476620398c91
HERMES_HISTORY

# ╔═╡ Cell order:
# ╟─70de9c18-6ee1-48fe-8edc-b5034463f4c6
# ╠═a0c02846-c177-41ea-931c-a2df7de90de0
# ╠═2b091d31-d5cc-4dcd-99d1-5571480b6190
# ╟─7bb5124f-a2a8-4cc5-be56-8c45f7c8fa66
# ╟─1cc4c78c-ac00-49ce-96fc-cfb9182d05c7
# ╟─856fa147-cfbc-4be1-8cdb-c47a552c14a0
# ╠═935e0a5a-c3e5-45be-b16b-8c583f37be7e
# ╟─75d71b12-5744-471c-9476-e14f0e31f4b2
# ╟─a9012db6-e5c6-4b52-83c3-a713f036de1e
# ╠═ff3425c2-7ed6-4b74-817c-2755cbe07c6a
# ╠═ab031d78-3e74-4432-ae76-fd3414ce058a
# ╠═883bf8f0-a7fa-406c-8209-07759f7ecef4
# ╟─f2b30219-6c54-4005-829b-0eb89006a964
# ╠═6f24c887-17d5-4813-8f02-e5098b755f2c
# ╟─79e0d3bc-5109-42e4-a2b1-c96995ca34a1
# ╠═ae8b3e30-8997-400f-88ef-476620398c91
