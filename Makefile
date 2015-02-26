install:
	make clean \
	&& npm install \
	&& gem install bundler \
	&& bundle install \
	&& bourbon install --path assets/css/vendor \
	&& neat install --path assets/css/vendor \
	&& make build \
	&& powder link

clean:
	rm -rf ./node_modules \
	&& rm -rf ./public \
	&& rm -rf ./tmp \
	&& rm -rf ./sass-cache

update:
	npm update
	&& bundle update \
	&& bourbon update --path assets/css/vendor \
	&& neat update --path assets/css/vendor \

build:
	gulp cleanbuild

watch:
	gulp

open:
	powder open