FROM babim/debianbase
ENV SOFT	Acunetix
ENV SOFT_OPT	/home

# download option
RUN apt update && apt install curl -y && \
    curl -Ls https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20SCRIPT%20AUTO/option.sh -o /option.sh && \
    chmod +x /option.sh

# install
RUN curl -s https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20${SOFT}/${SOFT}_install.sh | bash

# Set the default working directory as the installation directory.
#WORKDIR ${SOFT_HOME}

VOLUME ["${SOFT_OPT}"]
# Expose default HTTP connector port.
EXPOSE 3443

CMD ["/docker-entrypoint.sh"]