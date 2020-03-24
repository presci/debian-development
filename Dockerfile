FROM debian:bullseye-slim 
RUN mkdir -p /usr/share/man/man1

# Update packages and install dependencies
RUN apt-get update && apt-get -y install \
    git             \
    ca-certificates \
    bash      \
    vim       \
    gawk sed grep bc coreutils wget zip \
    make wget curl 
RUN apt-get update
RUN apt-get -y install haskell-platform
RUN apt-get update
RUN apt-get install -y ghc
RUN apt-get update
RUN apt-get install -y emacs
RUN wget -qO- https://get.haskellstack.org/ | sh
ENV PATH="/usr/local/bin:/usr/local/bin/stack:${PATH}"
RUN mkdir -p /tmp/app
WORKDIR /tmp/app

COPY debian-init.sh /usr/local/bin
RUN ln -s /usr/local/bin/debian-init.sh
RUN chmod +x /usr/local/bin/debian-init.sh
ENTRYPOINT ["/usr/local/bin/debian-init.sh"]
CMD ["bash"]
