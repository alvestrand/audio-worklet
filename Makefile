index.html: index.bs
	curl https://api.csswg.org/bikeshed/ -F file=@index.bs -F force=1 > index.html

errors: errors.txt
	# Display errors if output not generated.
	grep -q "<html " errors.txt || cat errors.txt
	@echo ""

errors.txt: index.bs
	curl https://api.csswg.org/bikeshed/ -F file=@index.bs > errors.txt
