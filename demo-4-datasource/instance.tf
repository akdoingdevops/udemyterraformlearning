resource "aws_instance" "example" {
  ami           = data.aws_ami.amazonlinux.id
  instance_type = "${var.instance_type}"
  key_name      = aws_key_pair.mykey.key_name
  tags = {
    "name" = "terraformlearninginstance"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  #disable_api_termination = true

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo sed -i -e 's/\r$//' /tmp/script.sh", # Remove the spurious CR characters.
      "sudo /tmp/script.sh",
    ]
  }

  // provisioner "local-exec" {
  //   command = "echo private IP is  ${aws_instance.example.private_ip} >> private_ips.txt"
  // }

  // provisioner "local-exec" {
  //   command = "echo public IP is ${aws_instance.example.public_ip} >> public_ips.txt"
  // }

  // provisioner "local-exec" {
  //   command = "echo public IP is ${self.public_ip} >> public_ips.txt"
  // }

  // provisioner "local-exec" {
  //   command = "echo private IP is  ${self.private_ip} >> private_ips.txt"
  // }

  // provisioner "local-exec" {
  //   command = "echo localhost ip is `ipconfig` >> localhost.txt"
  // }

    provisioner "local-exec" {
      command = <<-EOT
  echo private IP is  ${aws_instance.example.private_ip} >> private_ips.txt;
  echo public IP is ${aws_instance.example.public_ip} >> public_ips.txt;
  echo public IP is ${self.public_ip} >> public_ips.txt;
  echo private IP is  ${self.private_ip} >> private_ips.txt;
  echo localhost ip is `ipconfig` >> localhost.txt;
  EOT
    }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}

// resource "aws_s3_bucket" "aks3statebucket" {
//   bucket = "${var.bucketname}"
//   // acl = "${var.acl}"

//   //  versioning {
//   //   enabled = "${var.versioning}"
//   // }

//   tags = "${var.tags}"
// }

// resource "aws_dynamodb_table" "terraform_locks" {
//   name = "terraformstate.lock"
//   billing_mode = "PAY_PER_REQUEST"
//   hash_key = "LockID"

//   attribute {
//     name = "LockID"
//     type = "s"
//   }
// }