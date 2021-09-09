## Use cases

### Print output in the terminal

```
OPENTELEMETRY_CONSOLE_OUTPUT=true \
   ansible-playbook -i hosts test.yml
```

### Export with insecure local environment

```
OTEL_EXPORTER_OTLP_ENDPOINT=localhost:8200 \
   OTEL_EXPORTER_OTLP_INSECURE=true \
   ansible-playbook -i hosts test.yml
```

### Export with secured local environment

```
OTEL_EXPORTER_OTLP_ENDPOINT=localhost:8200 \
   ansible-playbook -i hosts test.yml
```

### Change service name

```
OTEL_EXPORTER_OTLP_ENDPOINT=localhost:8200 \
   OTEL_EXPORTER_OTLP_INSECURE=true \
   OTEL_SERVICE_NAME=foo \
   ansible-playbook -i hosts test.yml
```

### Disable task arguments

```
OTEL_EXPORTER_OTLP_ENDPOINT=localhost:8200 \
   OTEL_EXPORTER_OTLP_INSECURE=true \
   OPENTELEMETRY_HIDE_TASK_ARGUMENTS=true \
   ansible-playbook -i hosts test.yml
```


