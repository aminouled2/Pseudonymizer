CC     = cc
CFLAGS = -Wall -Wextra -std=c11
TARGET = pseudonymizer

$(TARGET): main.c
	$(CC) $(CFLAGS) -o $@ $<

run: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(TARGET)

.PHONY: run clean
