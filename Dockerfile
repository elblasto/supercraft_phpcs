FROM cytopia/phpcs:3

COPY ./ /Supercraft
RUN phpcs --config-set installed_paths /Supercraft && phpcs -i

COPY entrypoint.sh \
     problem-matcher.json \
     /action/

RUN chmod +x /action/entrypoint.sh

ENTRYPOINT ["/action/entrypoint.sh"]

#RUN wget https://github.com/squizlabs/PHP_CodeSniffer/releases/download/3.4.2/phpcs.phar -O phpcs \
#    && chmod a+x phpcs \
#    && mv phpcs /usr/local/bin/phpcs

#COPY ./ /Supercraft
#RUN phpcs --config-set installed_paths /Supercraft && phpcs -i

#ADD entrypoint.sh /entrypoint.sh
#RUN phpcs -i
#ENTRYPOINT ["/entrypoint.sh"]
