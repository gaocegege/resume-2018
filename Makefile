CC = xelatex
CHINESE_DIR = OpenFonts.Chinese
ENGLISH_DIR = OpenFonts
OUTPUT_DIR = docs

NAME = resume

all: $(NAME).pdf clean

$(NAME).pdf:
	cd $(CHINESE_DIR) \
	$(CC) $(NAME).tex \
	mv $(CHINESE_DIR)/$(NAME).pdf $(OUTPUT_DIR)/$(NAME)-cn.pdf
	cd - > /dev/null \
	cd $(ENGLISH_DIR) \
	$(CC) $(NAME).tex \
	mv $(ENGLISH_DIR)/$(NAME).pdf $(OUTPUT_DIR)/$(NAME).pdf
	cd - > /dev/null
clean:
	-@rm -f $(CHINESE_DIR)/*.xdv $(CHINESE_DIR)/*.aux $(CHINESE_DIR)/*.out $(CHINESE_DIR)/*.fdb_latexmk $(CHINESE_DIR)/*.log $(CHINESE_DIR)/*.fls $(ENGLISH_DIR)/*.xdv $(ENGLISH_DIR)/*.aux $(ENGLISH_DIR)/*.out $(ENGLISH_DIR)/*.fdb_latexmk $(ENGLISH_DIR)/*.log $(ENGLISH_DIR)/*.fls 2> /dev/null || true
