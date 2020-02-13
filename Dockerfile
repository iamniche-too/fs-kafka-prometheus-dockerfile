FROM openjdk:7 

#Download the jar
RUN apt-get update && apt-get install --assume-yes wget 

RUN wget https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.3.1/jmx_prometheus_javaagent-0.3.1.jar -o /usr/bin/jmx_prometheus_javaagent-0.3.1.jar

COPY kafka-prometheus-metric.yaml /etc/kafka-prometheus/kafka-prometheus-metric.yaml

CMD java -javaagent:/usr/bin/jmx_prometheus_javaagent-0.3.1.jar=5555:/etc/kafka-proetheus/kafka-prometheus-metric.yaml
