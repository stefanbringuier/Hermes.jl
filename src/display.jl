module display

using ..api: HermesCode

import Base
using HypertextLiteral: @htl

Base.show(io::IO, ::MIME"text/plain", h::HermesCode) = print(io, h.str)
Base.show(io::IO, ::MIME"text/html", h::HermesCode) = begin
	print(io, @htl("""
		<div style='border:1px solid lightgray; padding:10px; margin-bottom:10px;'>
			<pre id='codeblock'>
		  		<code class="language-julia">$(h.str)</code>
		  	</pre>
  			<button style='position: absolute; top: 15px; right: 20px; border: none; background-color: transparent; cursor: pointer; font-size: 1.2em;' onclick='window.copyToClipboard("$(escape_string(h.str))", this)'>📋</button>
		</div>
		<script 	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.2.0/highlight.min.js">
		hljs.highlightAll();
		</script>
		<script>
		window.copyToClipboard = function(text, element) {
    	var dummy = document.createElement("textarea");
    	document.body.appendChild(dummy);
    	dummy.value = text;
    	dummy.select();
    	document.execCommand("copy");
    	document.body.removeChild(dummy);
    	element.innerText = "Copied!";  // Change button text after copying
    	setTimeout(function(){ element.innerText = "📋"; }, 2000); // Change back to icon after 2 seconds
		}
		</script>
		""")
	)
end

end