# Hermes.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://stefanbringuier.github.io/Hermes.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://stefanbringuier.github.io/Hermes.jl/dev/)
[![Build Status](https://github.com/stefanbringuier/Hermes.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/stefanbringuier/Hermes.jl/actions/workflows/CI.yml?query=branch%3Amain)


> An inline AI code messenger for Pluto.jl notebooks. 

This utility provides access to OpenAI models to have julia code generated via a prompt. Code can be returned as formatted text which can be copied or code can be executed.

#### Why Hermes
*Pluto, the god of the underworld, was informed by Hermes, the messenger among the gods, who brought forth to him those unfortunate souls.*

## Usage

[🎥 Example Recording](https://stefanbringuier.github.io/Hermes.jl)

```julia
using Hermes
Hermes.OPENAI(apikey="YOUR_KEY",model="GPT_MODEL")
hermes"""
I need a function for the square exponential kernel given two vectors. Name the function `sqe_kernel`
```

```julia
hermes"""
Define variables $x_i$ where $i \in {1,2,...,5}$ and assign them the values of their index
"""
```

## Issues
- At the moment the OpenAI details, i.e., model and API key, are stored in a global variable of type  `NamedTuple{(:apikey, :model), Tuple{String, String}}`  this isn't optimal, for a few reasons. Will need to come-up with an improved solution.
- Since this utility only provides an interface to OpenAI models without any other tooling (i.e., LangChain), a `Hermes.INSTRUCT` variable is used to guide the AI to focus only on Julia code for Pluto.jl cells. Therefore other inquires may be dubious. 
## Vision
The current implementation only provides returned messages within the executed cell. The returned messages can be either shown as formatted text (`@hermes`) or executed (`@hermes_exe`), but these are tied toth e runtime Pluto cell. What would be ideal is some javascript that would enable the macro calls to place markdown or julia code in a cell below the cell that makes the call request.

On another note, only OpenAI api interface is available, but this should be the case for a robust implementation.

## Contribution
More advance Julia and Javascript devs who can improve the design and functionality of this package are very much appreciated to contribute or fork.