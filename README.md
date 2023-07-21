# Hermes.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://stefanbringuier.github.io/Hermes.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://stefanbringuier.github.io/Hermes.jl/dev/)
[![Build Status](https://github.com/stefanbringuier/Hermes.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/stefanbringuier/Hermes.jl/actions/workflows/CI.yml?query=branch%3Amain)

> An inline AI messenger for Pluto.jl notebooks

Pluto was the god of the underworld and Hermes was the messenger amongst gods who brought Pluto the unfortunate souls.

## Usage

## Vision
The current implementation only provides returned messages within the executed cell. The returned messages can be either shown as formatted text (`@hermes`) or executed (`@hermes_exe`), but these are tied toth e runtime Pluto cell. What would be ideal is some javascript that would enable the macro calls to place markdown or julia code in a cell below the cell that makes the call request.

On another note, only OpenAI api interface is available, but this should be the case for a robust implementation.

## Contribution
More advance Julia and Javascript devs who can improve the design and functionality of this package are very much appreciated to contribute or fork.