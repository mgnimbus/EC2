output "Count-ARN" {
  value = aws_instance.count-test.*.arn #legacy splat
}

output "count-ID" {
  value = aws_instance.count-test[*].id #latest splat
}

output "pub-ip" {
  value = aws_instance.basic-test.public_ip
}

output "ROOT_DEVICE" {
  value = aws_instance.count-test[*].root_block_device
}

# output "azes" {
#   value = aws_instance.for-each-test
# }

output "public-ip" {
  value = [for x in aws_instance.for-each-test : x.public_ip]
}

output "az-ip" {
  value = { for x, y in aws_instance.for-each-test : x => y.public_ip }
}

# output "root_device" {
#   #value = aws_instance.web-var
#   value = [for x in aws_instance.web-var : x.root_block_device]
# }
