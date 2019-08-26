pipeline {

    def mvnHome 
    def server =Artifactory.server 'artifactory'

    stages{
     stage('git checkout') { 
      steps{
       git 'https://github.com/priyankamindtree/Priyanka301.git' 
       mvnHome = tool 'MAVEN' 
    }
     }
    
        
     stage('Quality Analysis') { 
         withSonarQubeEnv('sonarqube') { 
         sh 'mvn clean package sonar:sonar' 
         } 
     } 
      
     stage("Quality Gate"){ 
         timeout(time: 1, unit: 'HOURS') {  
             def qg = waitForQualityGate()  
             if (qg.status != 'OK') { 
                 currentBuild.status='FAILURE' 
                 error "Pipeline aborted due to quality gate failure: ${qg.status}" 
             } 
         } 
     }
     }
}
