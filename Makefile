
run: tailwind
	gleam run -m lustre/dev start
.PHONY: run

tailwind:
	gleam run -m tailwind/run
.PHONY: tailwind