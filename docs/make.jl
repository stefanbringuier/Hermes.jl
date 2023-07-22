using Hermes
using Documenter

DocMeta.setdocmeta!(Hermes, :DocTestSetup, :(using Hermes); recursive=true)

makedocs(;
    modules=[Hermes],
    authors="Stefan Bringuier <stefanbringuier@gmail.com> and contributors",
    repo="https://github.com/stefanbringuier/Hermes.jl/blob/{commit}{path}#{line}",
    sitename="Hermes.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://stefanbringuier.github.io/Hermes.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

ExampleFile = "resources/HermesNotebookRecording.html"
# Temporary work over to make example recording default index
html_path = joinpath(@__DIR__, ExampleFile)
index_path = joinpath(@__DIR__, "build", "index.html")
# Overwrite the index.html file with your specific HTML file
cp(html_path, index_path, force=true)

deploydocs(;
    repo="github.com/stefanbringuier/Hermes.jl",
    devbranch="main",
)
