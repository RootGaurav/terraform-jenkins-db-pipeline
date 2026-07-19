pipeline {

    agent{
        label 'built-in'
    }

    parameters {

        string(
            name: 'INSTANCE_COUNT',
            defaultValue: '1',
            description: 'Number of EC2 instances per selected database'
        )

        booleanParam(
            name: 'MYSQL',
            defaultValue: false,
            description: 'Deploy MySQL'
        )

        booleanParam(
            name: 'POSTGRES',
            defaultValue: false,
            description: 'Deploy PostgreSQL'
        )

        booleanParam(
            name: 'MONGODB',
            defaultValue: false,
            description: 'Deploy MongoDB'
        )

        booleanParam(
            name: 'REDIS',
            defaultValue: false,
            description: 'Deploy Redis'
        )

        booleanParam(
            name: 'CASSANDRA',
            defaultValue: false,
            description: 'Deploy Cassandra'
        )
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Format Check') {
            steps {
                sh 'terraform fmt -check'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {

                sh """
                terraform plan \
                -var="instance_count=${params.INSTANCE_COUNT}" \
                -var="mysql_enabled=${params.MYSQL}" \
                -var="postgres_enabled=${params.POSTGRES}" \
                -var="mongodb_enabled=${params.MONGODB}" \
                -var="redis_enabled=${params.REDIS}" \
                -var="cassandra_enabled=${params.CASSANDRA}"
                """
            }
        }

        stage('Terraform Apply') {

            steps {

                sh """
                terraform apply -auto-approve \
                -var="instance_count=${params.INSTANCE_COUNT}" \
                -var="mysql_enabled=${params.MYSQL}" \
                -var="postgres_enabled=${params.POSTGRES}" \
                -var="mongodb_enabled=${params.MONGODB}" \
                -var="redis_enabled=${params.REDIS}" \
                -var="cassandra_enabled=${params.CASSANDRA}"
                """

            }

        }

    }

    post {

        success {
            echo "Infrastructure created successfully."
        }

        failure {
            echo "Pipeline failed."
        }

        always {
            cleanWs()
        }

    }

}