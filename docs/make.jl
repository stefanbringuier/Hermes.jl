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
        #"Home" => "index.md",
        "Home" => "resources/HermesNotebookRecording.html"
    ],
)

deploydocs(;
    repo="github.com/stefanbringuier/Hermes.jl",
    devbranch="main",
)
