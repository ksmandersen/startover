install:
	make clean \
	&& npm install \
	&& bower install \
	&& gem install bundler \
	&& bundle \
	&& make build \
	&& powder link

clean:
	rm -rf ./node_modules \
	&& rm -rf ./components \
	&& rm -rf ./public

update:
	npm update
	&& bundle update \
	&& bower update

build:
	gulp cleanbuild

release:
	gulp release

watch:
	gulp

open:
	powder open

deploy:
	make release \
	&& s3_website push \
