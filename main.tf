provider "aws" {
  region = "us-east-1" # Change to your desired region
}

resource "aws_instance" "jenkins" {
  ami           = "ami-0c7217cdde317cfec" # Replace with your specific AMI ID
  instance_type = "t2.small"
  key_name      = "vprofile-ci-key"

  security_groups = ["jenkins-sg"]

  user_data = file("${path.module}/userdata/jenkins-setup.sh")
}

resource "aws_instance" "nexus" {
  ami           = "ami-0df2a11dd1fe1f8e3" # Replace with your specific AMI ID
  instance_type = "t2.medium"
  key_name      = "vprofile-ci-key"

  security_groups = ["nexus-sg"]

  user_data = file("${path.module}userdata/nexus-setup.sh")
}

resource "aws_instance" "sonarqube" {
  ami           = "ami-0c7217cdde317cfec" # Replace with your specific AMI ID
  instance_type = "t2.medium"
  key_name      = "vprofile-ci-key"

  security_groups = ["sonar-sg"]

  user_data = file("${path.module}/userdata/sonar-setup.sh")
}
