INC_DIR = include
SRC_DIR = src
OBJ_DIR = obj

INC = $(wildcard $(INC_DIR)/*.h)
SRC = $(wildcard $(SRC_DIR)/*.c)
OBJ = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC))

CC = gcc

CFLAGS = -g -Wall -fPIC -I$(INC_DIR)
LDFLAGS = -shared

LIB_NAME = tberry
TARGET = $(shell printf lib%s.so $(LIB_NAME))
LIB_INSTALL_DIR = /usr/lib
INC_INSTALL_DIR = /usr/include

.PHONY: all
all: setup $(TARGET)

.PHONY: setup
setup:
	@mkdir -p $(OBJ_DIR)

$(TARGET): $(OBJ)
	@$(CC) $(LDFLAGS) $(OBJ) -o $(TARGET)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(INC)
	@$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	@rm -rf $(OBJ_DIR)
	@rm -f $(TARGET)

.PHONY: install
install: all uninstall
	@cp $(TARGET) $(LIB_INSTALL_DIR)
	@cp -r $(INC_DIR) $(INC_INSTALL_DIR)/$(LIB_NAME)

.PHONY: uninstall
uninstall:
	@2>&1 rm -f $(LIB_INSTALL_DIR)/$(TARGET)
	@2>&1 rm -rf $(INC_INSTALL_DIR)/$(LIB_NAME)
