.DEFAULT_GOAL := help

help: ## Show help message
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[$$()% 0-9a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

generate: ## build autogenerated (i18n + code files) files
	dart run intl_utils:generate && dart run build_runner build --delete-conflicting-outputs

generate_i18n: ## Build i18n files
	dart run intl_utils:generate

generate_code: ## build code files
	dart run build_runner build

format: ## Auto format code
	dart format lib/main.dart lib/src/