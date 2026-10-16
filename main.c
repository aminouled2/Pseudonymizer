#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {

  if (argc < 3) {
        printf("Usage: %s (--s | --swap | --r | --restore) <file>\n", argv[0]);
        return 1;
    }

  if (strcmp(argv[1], "--s") == 0 || strcmp(argv[1], "--swap") == 0) {
        printf("this program does nothing at the moment lmao but soontm it would swap all names from this file with some randomly generated name \n");
    } else if (strcmp(argv[1], "--r") == 0 || strcmp(argv[1], "--restore") == 0) {
        printf("this program does nothing at the moment lmao but soontm it would restore all names back to this file \n");
    } else {
      printf("You have to let me know if you want to swap or restore. Use --s or --swap to swap, and --r or --restore to restore. \n");
      return 1;
    }
    return 0;
}
