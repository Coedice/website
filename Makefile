build:
	@docker run --rm -v "$$PWD:/srv/jekyll" -p 8080:8080 -it jekyll/jekyll:latest /bin/sh -c " \
		rm -f Gemfile.lock; \
		bundle install; \
		bundle exec jekyll serve -H 0.0.0.0 -P 8080 \
	"
