node 
{ 
    def mvnHome 
    def server = Artifactory.server 'artifactory'
    def server1 = [:]
    server1.host = 'nrruz17621dns1.eastus2.cloudapp.azure.com'
    server1.user = "devopsinfra"
    server1.password = "Maplestore12#"
    server1.allowAnyHosts = true
    //def server2 = [:]
    //server2.host = 'nrruz17621dns2.eastus2.cloudapp.azure.com'
    //server2.user = "devopsinfra"
    //server2.password = "Maplestore12#"
    //server2.allowAnyHosts = true
        
    stage('Gitcheckout') { // for display purposes 
       // Get some code from a GitHub repository 
       git 'https://github.com/priyankamindtree/Priyanka301.git' 
       // Get the Maven tool. 
       // ** NOTE: This 'M3' Maven tool must be configured 
       // **       in the global configuration.            
       mvnHome = tool 'M3' 
    }
    //stage('Sonar Quality Analysis'){ 
 	//Run the sonar scan 
 	//withSonarQubeEnv('SonarQube'){ 
 	//sh 'mvn clean package sonar:sonar' 
 	//} 
    //} 
    //stage('Sonar Quality Gate') { 
 	//timeout(time: 2, unit: 'MINUTES') { 
 	//def qg = waitForQualityGate() 
 	//if (qg.status != 'OK') { 
 		//currentBuild.status='FAILURE' 
 		//error "Pipeline aborted due to quality gate failure: ${qg.status}" 
 		//} 
 	//} 
    //} 
    stage('Build') { 
      //Run the maven build 
       withEnv(["MVN_HOME=$mvnHome"]) { 
          if (isUnix()) { 
             sh '"$MVN_HOME/bin/mvn" -Dmaven.test.failure.ignore clean package' 
          } else { 
             bat(/"%MVN_HOME%\bin\mvn" -Dmaven.test.failure.ignore clean package/) 
          } 
       } 
    }
    stage('Jfrog Artifactory Upload'){ 
    def uploadSpec = """  
    {   
 	"files": [ { "pattern": "/var/lib/jenkins/workspace/sample/target/*.war", "target": "example-repo-local" } ]   
     }"""   
    server.upload(uploadSpec)  
    }
    stage('Petclinic Docker Image') {
	
	sh "sudo docker build -t priyanka301/springpetclinic ."
	sh "sudo docker push priyanka301/springpetclinic"
	   }
        
        stage("Deployment"){
                sh "sudo docker-compose up -d --build"
        }
        
     catch(err){ 
     stage('MAIL'){ 
     mail bcc: '', body: 'Build Failed', cc: '', from: '', replyTo: '', subject: 'Build Failed', to: 'meet_priyan@rediff.com'  
         } 
       } 
                
}
