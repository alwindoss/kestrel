APP_NAME := kestrel
SRC_DIR := . # If the Source files are in the root of the project then use .
BIN_DIR := bin
GO_CMD := go
BUILD_CMD := $(GO_CMD) build
BUILD_FLAGS := -o
BUILD_ENVS := CGO_ENABLED=0

.PHONY: dev build run clean

dev:
	@echo "\nRunning the dev backend and frontend $(APP_NAME)"
	go tool task dev

build: clean
	@echo "\nBuilding $(APP_NAME)"
	$(BUILD_ENVS) $(BUILD_CMD) $(BUILD_FLAGS) $(BIN_DIR)/$(APP_NAME) $(SRC_DIR)

run: build
	@echo "\nRunning ./$(BIN_DIR)/$(APP_NAME)"
	./$(BIN_DIR)/$(APP_NAME)

clean:
	@echo "\nDeleting $(BIN_DIR)"
	rm -rf $(BIN_DIR)