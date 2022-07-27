.ONESHELL:
.SHELL := /bin/bash
.DEFAULT_GOAL := help

# Silence output by default, use `VERBOSE=1 make <command>` to enable
ifndef VERBOSE
.SILENT:
endif

.PHONY: fmt
fmt: ## Format Rust source code.
	cargo fmt

.PHONY: start
start: ## Launch the operating system using QEMU.
	cargo run --quiet --target=x86-64-ros.json

.PHONY: build
build: ## Compile the operating system source code.
	cargo build --target=x86-64-ros.json

.PHONY: help
help:  ## Print this help menu.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		sed 's/Makefile://' | \
		sed 's/.*include\/.*\.mk://' | \
    grep -E -v "^deploy-(.*)-(.*)" | \
		sort -d | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
