# Define the output executable name
TARGET = example

# Define the Lex source file path with a default in "LEX programs" folder
# Change this default if you have a specific file you want to use often
LEX_FILE ?= LEX programs/example.l

# Default build rule
all: $(TARGET)

# Rule to generate lex.yy.c from the specified Lex file in the "LEX programs" folder
lex.yy.c: $(LEX_FILE)
	@echo "Running flex on $(LEX_FILE)"
	flex $(LEX_FILE)

# Rule to compile lex.yy.c and link it to create the executable
$(TARGET): lex.yy.c
	@echo "Compiling lex.yy.c to create $(TARGET)"
	gcc lex.yy.c -lfl -o $(TARGET)

# Clean up generated files
clean:
	@echo "Cleaning up generated files..."
	rm -f lex.yy.c $(TARGET)
