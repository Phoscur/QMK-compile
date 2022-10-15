FROM qmkfm/qmk_cli
ARG FORK=zsa/qmk_firmware
ARG BRANCH
RUN git clone ${BRANCH:+-b $BRANCH --single-branch} --recurse-submodules https://github.com/${FORK}.git /qmk_firmware
RUN qmk setup -y
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]