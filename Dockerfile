FROM ubuntu:20.04
RUN mkdir testDir
COPY ./test.txt testDir/
CMD [ "cat", "testDir/test.txt" ]
