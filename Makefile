BUILD_DIR = build
OUT = $(BUILD_DIR)/bin/main

.PHONY: all configure build clean

all: configure build

configure:
	cmake -S . -B $(BUILD_DIR)

build:
	cmake --build $(BUILD_DIR)

install:
	cmake --install $(BUILD_DIR)

run:
	@./$(OUT)

args:
	@./$(OUT) $(filter-out $@,$(MAKECMDGOALS))

%:
	@:

clean:
	rm -rf $(BUILD_DIR)

rebuild: configure build
