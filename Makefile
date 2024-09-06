.PHONY: run

default: run

# include .env

# flavor=development/production build-number=777

flavor ?= development
base-dir ?= $(shell pwd)

ifeq ($(foo), production)
	dart-target = lib/main_production.dart
	web-arguments = --release
else
	dart-target = lib/main_development.dart
	web-arguments =
endif


format:
	dart format .

code-watch:
	dart run build_runner watch --delete-conflicting-outputs

code-build:
	dart run build_runner build --delete-conflicting-outputs

icons:
	dart run icon_font_generator:generator

splash:
	dart run flutter_native_splash:create

i18n:
	dart run slang

flutterfire:
	dart run flutterfire_cli:flutterfire configure \
  --platforms android,ios,macos \
  -p truely-application \
  -i com.truely.app \
  -m com.truely.desktop \
  -a com.truely.app \
  -o lib/src/config/firebase/firebase_production.dart && \
  dart run flutterfire_cli:flutterfire configure \
  --platforms android,ios,macos \
  -p truely-application \
  -i com.truely.app.dev \
  -m com.truely.desktop.dev \
  -a com.truely.app.dev \
  -o lib/src/config/firebase/firebase_development.dart

clean:
	flutter clean; dart pub get; dart run build_runner clean

install:
	dart get

install-packages:
	for f in ./packages/*; do cd $$f; dart pub get; cd ${base-dir}; done

code-build-packages:
	for f in ./packages/*; do cd $$f; dart run build_runner build --delete-conflicting-outputs; cd ${base-dir}; done

match:
	cd ios && \
  bundle config set --local path 'vendor/bundle' && \
	bundle install && \
  bundle exec fastlane match && \
  cd ..

build-android:
ifndef build-number
	@echo "Required build-number=[int] argument"
	@exit 1
endif
	cd android && \
	bundle config set --local path 'vendor/bundle' && \
	bundle install && \
	bundle exec fastlane ${flavor} build_number:${build-number} && \
	cd ..

build-ios:
ifndef build-number
	@echo "Required build-number=[int] argument"
	@exit 1
endif
	cd ios && \
	bundle config set --local path 'vendor/bundle' && \
	bundle install && \
  bundle exec fastlane ${flavor} build_number:${build-number} && \
	cd ..

build-dev:
ifndef build-number
	@echo "Required build-number=[int] argument"
	@exit 1
endif
	$(MAKE) build-ios flavor=development build-number=${build-number} && \
	$(MAKE) build-android flavor=development build-number=${build-number}

build-prod:
ifndef build-number
	@echo "Required build-number=[int] argument"
	@exit 1
endif
	$(MAKE) build-ios flavor=production build-number=${build-number} && \
	$(MAKE) build-android flavor=production build-number=${build-number}

build-all:
ifndef build-number
	@echo "Required build-number=[int] argument"
	@exit 1
endif
	$(MAKE) build-dev build-number=${build-number} && \
	$(MAKE) build-prod build-number=${build-number}
