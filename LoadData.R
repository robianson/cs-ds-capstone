# Load en_US Dataset

filenames <- list.files(getwd(),pattern='*.txt')
blogsamp <- readLines(paste('data/en-US/',filenames[1]),encoding='UTF-8')
newssamp <- readLines(paste('data/en-US/',filenames[2]),encoding='UTF-8')
twitsamp <- readLines(paste('data/en-US/',filenames[3]),encoding='UTF-8')

