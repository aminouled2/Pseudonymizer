
U8 *fopen(U8 *path, U8 *mode);
U8 *fgets(U8 *buffer, I64 size, U8 *stream);
I64 fclose(U8 *stream);

U0 Main(U64 argc, U8 *argv[]) {
  if (argc < 3) {
        printf("Usage: %s (--s | --swap | --r | --restore) <file>\n", argv[0]);
        return;
    }

  if (strcmp(argv[1], "--s") == 0 || strcmp(argv[1], "--swap") == 0) {
        printf("this program does nothing at the moment lmao but soontm it would swap all names from this file with some randomly generated name \n");
        U8 *ftr = fopen(argv[2], "r");
        if (ftr == 0) {
            printf("Could not open file: %s\n", argv[2]);
            return;
        }
        U8 content[1000];
        while (fgets(content, sizeof(content), ftr) != 0) {
            printf("%s", content);
        }
        fclose(ftr);
  } else if (strcmp(argv[1], "--r") == 0 || strcmp(argv[1], "--restore") == 0) {
        printf("this program does nothing at the moment lmao but soontm it would restore all names back to this file \n");
        return;
    } else {
      printf("You have to let me know if you want to swap or restore. Use --s or --swap to swap, and --r or --restore to restore. \n");
     return;
    }
}
