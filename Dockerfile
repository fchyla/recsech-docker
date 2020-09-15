FROM alpine as builder

RUN apk update && apk add git

WORKDIR /opt

RUN git clone --depth 1 https://github.com/radenvodka/Recsech.git Recsech

FROM php:alpine

COPY --from=builder /opt/Recsech /Recsech/

ENTRYPOINT [ "php","/Recsech/Recsech.php" ]