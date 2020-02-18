FROM openjdk:7 

RUN apt-get update && apt-get install --assume-yes curl 

RUN curl https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_httpserver/0.12.0/jmx_prometheus_httpserver-0.12.0-jar-with-dependencies.jar -o /usr/bin/jmx_prometheus_httpserver-0.12.0-jar-with-dependencies.jar

COPY http-server-config.yaml /etc/kafka-prometheus-config/

ENTRYPOINT ["java", "-jar", "/usr/bin/jmx_prometheus_httpserver-0.12.0-jar-with-dependencies.jar", "5556", "/etc/kafka-prometheus-config/http-server-config.yaml"]

CMD ["-Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=5555"]
