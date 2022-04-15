docker build --file Dockerfile --rm --tag 186042536779.dkr.ecr.us-east-1.amazonaws.com/ecr-task-chmielecki:nginx .

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 186042536779.dkr.ecr.us-east-1.amazonaws.com

docker push 186042536779.dkr.ecr.us-east-1.amazonaws.com/ecr-task-chmielecki:nginx