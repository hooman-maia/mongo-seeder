FROM mongo:6.0.14

WORKDIR /mongo-seeder

COPY seed.sh .

RUN chmod +x seed.sh

CMD ["./seed.sh"]
