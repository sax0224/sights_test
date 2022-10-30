def version(tag){
    tag_list = tag.split("\\.")
    tag_len = tag1_list.size()
    str_tag = ""
    for ( i=0; i < tag_len-1; i++){
        str_tag += tag_list[i]
    }
    return str_tag
}

pipeline {
    agent any

    stages {
        stage('Fist test') {
            steps {
                script {
                    try {
                        // git branch: 'main', credentialsId: 'github', url: 'git@github.com:sax0224/tag3.git'
                        // git branch: 'main', credentialsId: 'github', url: 'git@github.com:sax0224/tag1.git'
                        git branch: 'main', credentialsId: 'github', url: 'git@github.com:sax0224/KeelungSights.git'
						sh "mvn -Dmaven.test.failure.ignore=false clean package"
                    }
                    catch (exc) {
                        error "API repository is not exist !!!"
                    }
                    tag1 = sh(returnStdout:  true, script: "git tag --contains")
                    echo "tag1: ${tag1}"
					
                    try {
                        git branch: 'main', credentialsId: 'github', url: 'git@github.com:sax0224/tag2.git'
						// sh "mvn -Dmaven.test.failure.ignore=false clean package"
                    }
                    catch (exc) {
                        error "test repository is not exist !!!"
                    }
                    
                    tag2 = sh(returnStdout:  true, script: "git tag --contains")
                    echo "tag2: ${tag2}"
                    
                    tag1_list = tag1.split("\\.")
                    tag1_len = tag1_list.size()
                    echo "tag1_len: ${tag1_len}"
                    
                    dev = version(tag1)
                    test = version(tag2)
                    
                    echo "dev: ${dev}"
                    echo "test: ${test}"
                    
                    if (dev == test){
                        echo "the same"
                    }   else {
                        echo "not same"
                    }
                }
            }
        }
    }
	
    post {
        always {
            script {
                mail = 'sax0224@gmail.com'
                jobName = currentBuild.fullDisplayName
            }
            // emailext body: '''${SCRIPT, template="groovy-html.template"}''',
            //     mimeType: 'text/html',
            //     subject: "[Jenkins] ${jobName}",
            //     to: "sax0224@gmail.com"
            // emailext attachmentsPattern: 'TestResults\\*.trx',   
            emailext body: '''${SCRIPT, template="groovy-html.template"}''', 
            mimeType: 'text/html',
            subject: "[Jenkins]" + currentBuild.currentResult + "Pipeline: " + env.JOB_NAME, 
            to: 'sax0224@gmail.com'
        }
    }
}
