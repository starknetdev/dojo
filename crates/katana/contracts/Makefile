CONTRACT_CLASS_SUFFIX := .contract_class.json
# Directory where the compiled classes will be stored
BUILD_DIR := ./build

## ---- Default Pre-deployed Account

ORIGINAL_CLASS_NAME := katana_account_Account$(CONTRACT_CLASS_SUFFIX)
CLASS_NAME := default_account.json

$(BUILD_DIR): ./account/src/*
	scarb build -p katana_account
	mv target/dev/$(ORIGINAL_CLASS_NAME) $(BUILD_DIR)/$(CLASS_NAME)

## ----
