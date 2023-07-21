
function add_code_block(code_str)
    lines = split(code_str, '\n')

    # Check if 'begin' is the first line and 'end' is the last line
    if strip(lines[1]) != "begin" || strip(last(lines)) != "end"
        # Add 'begin' to the first line and 'end' to the last line
        pushfirst!(lines, "begin")
        push!(lines, "end")
    end

    # Join the lines back together
    return join(lines, '\n')
end;

