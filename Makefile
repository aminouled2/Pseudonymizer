HCC      ?= hcc
HCCFLAGS ?=
TARGET   = pseudonymizer

$(TARGET): main.hc src/name_generate.hc
	$(HCC) $(HCCFLAGS) -o $@ $<

run: $(TARGET)
	./$(TARGET) $(ARGS)

clean:
	rm -f $(TARGET)

.PHONY: run clean
