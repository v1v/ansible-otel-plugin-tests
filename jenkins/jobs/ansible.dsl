NAME = 'ansible'
DSL = """pipeline {
  agent any
  stages {
    stage('checkout') {
      steps {
        git(credentialsId: 'github-personal-token', url: 'git@github.com:v1v/ansible-opentelemetry-plugin.git', branch: 'feature/community')
      }
    }
    stage('prepare-context') {
      steps {
        sh(label: 'pip3 install', script: 'pip3 install opentelemetry-api opentelemetry-sdk opentelemetry-exporter-otlp')
      }
    }
    stage('run-ansible') {
      steps {
        sh(label: 'run env', script: 'env | sort')
        sh(label: 'run ansible', script: '''
          TRACEPARENT="00-\${TRACE_ID}-\${SPAN_ID}-01" \
          OTEL_EXPORTER_OTLP_TRACES_ENDPOINT=localhost:8200 \
          OTEL_EXPORTER_OTLP_INSECURE=true \
          ansible-playbook -i hosts test.yml''')
      }
    }
  }
}"""

pipelineJob(NAME) {
  definition {
    cps {
      script(DSL.stripIndent())
    }
  }
}
