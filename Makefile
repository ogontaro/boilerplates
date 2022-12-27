# ----------------- tasks -----------------
.PHONY: hello
hello: before-setup
	echo "hello world"

# ----------------- before setup -----------------
.PHONY: before-setup
before-setup:
	echo "before"
