FROM alpine:3.12.0

ENV INVENTORY_URL=https://github.com/do-community/do-ansible-inventory/releases/download/v1.0.0/do-ansible-inventory_1.0.0_linux_x86_64.tar.gz \
    OUTPUT_DIR=/tmp \
    OUTPUT_FILE=do-ansible-inventory.tar.gz

RUN wget -O ${OUTPUT_DIR}/${OUTPUT_FILE} ${INVENTORY_URL} && \
    cd ${OUTPUT_DIR} && \
    tar xvzf ${OUTPUT_FILE} && \
    chmod 755 do-ansible-inventory && \
    cp do-ansible-inventory /usr/bin && \
    rm *

ENTRYPOINT ["do-ansible-inventory"]
