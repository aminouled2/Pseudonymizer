U8 *fopen(U8 *path, U8 *mode);
U8 *fgets(U8 *buffer, I64 size, U8 *stream);
I64 fclose(U8 *stream);
I64 rand();
U0 srand(U32 seed);
I64 time(I64 *timer);
U0 rewind(U8 *stream);

U8 *GenerateName(U8 *name, I64 bufferSize) {
    U8 *nameListPath = "./src/Names/NameList.csv";
    U8 *ftr = fopen(nameListPath, "r");
    if (ftr == 0) {
        printf("Oh no!!! I couldn't open my own names list!!! ->  %s\n", nameListPath);
        return 0;
    }

    U8 line[256];
    if (fgets(line, sizeof(line), ftr) == 0) {
        fclose(ftr);
        return 0;
    }

    I64 lineCount = 0;
    while (fgets(line, sizeof(line), ftr) != 0) {
        lineCount++;
    }

    if (lineCount == 0 || bufferSize <= 1) {
        fclose(ftr);
        return 0;
    }

    srand(time(0));
    I64 randomLine = rand() % lineCount;
    rewind(ftr);
    fgets(line, sizeof(line), ftr);

    I64 currentLine = 0;
    while (fgets(line, sizeof(line), ftr) != 0) {
        if (currentLine == randomLine) {
            U8 *firstName = strtok(line, ",");
            U8 *lastName = strtok(0, ",");
            if (firstName == 0 || lastName == 0) {
                fclose(ftr);
                return 0;
            }

            I64 outputIndex = 0;
            while (firstName[outputIndex] != 0 && outputIndex < bufferSize - 1) {
                name[outputIndex] = firstName[outputIndex];
                outputIndex++;
            }
            if (outputIndex < bufferSize - 1) {
                name[outputIndex++] = ' ';
            }
            I64 lastNameIndex = 0;
            while (lastName[lastNameIndex] != 0 &&
                   lastName[lastNameIndex] != '\n' &&
                   lastName[lastNameIndex] != '\r' &&
                   outputIndex < bufferSize - 1) {
                name[outputIndex++] = lastName[lastNameIndex++];
            }
            name[outputIndex] = 0;
            fclose(ftr);
            return name;
        }
        currentLine++;
    }

    fclose(ftr);
    return 0;
}
