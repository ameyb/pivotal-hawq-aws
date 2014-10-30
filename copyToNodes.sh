#Include Public IP Addresses of your EC2 instances here
key=amey_personal2014.pem

for node in 
do
scp -i $key hosts root@$node:/etc/
scp -i $key setupNodes.sh root@$node:/root
nohup ssh -i $key root@$node sh setupNodes.sh > $node_logs.out &
done