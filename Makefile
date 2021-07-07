NAME ?= DragonFire-Kernel

VER := 3.1.1

CODE := olives

ZIP := $(NAME)-$(CODE)-$(VER).zip

EXCLUDE := Makefile *.git* *.jar* *placeholder* *.md*

normal: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."


clean:
	@rm -vf *.zip*
	@rm -vf zImage
	@rm -vf modules/system/lib/modules/*.ko
	@rm -vf modules/system/lib/modules/pronto/*.ko
	@echo "Done."


