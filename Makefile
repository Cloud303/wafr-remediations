

@PHONY: serve
serve:
	@echo "Starting docs server locally..."
	cd docs && bundle exec jekyll serve --watch