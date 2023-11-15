#ssh jump.gcp.peritus.ai 'bash -s' <<< "KUBECONFIG=/home/ubuntu/k8sconfig/production-2.config kubectl get pods --namespace $1 -o json | jq -r '.items[] |  .status.podIP + \" \" + .metadata.labels.\"app.kubernetes.io/name\"' > /home/ubuntu/appdev_ips.txt"
 #ssh jump.gcp.peritus.ai 'bash -s' <<< "KUBECONFIG=/home/ubuntu/k8sconfig/development.config kubectl get pods --namespace app-dev-ext -o json | jq -r '.items[] |  .status.podIP + \" \" + .metadata.labels.\"app.kubernetes.io/name\"' > /home/ubuntu/appdev_ips.txt"
 ssh jump.gcp.peritus.ai 'bash -s' <<< "KUBECONFIG=/home/ubuntu/k8sconfig/development.config kubectl get pods --field-selector=status.phase==Running --namespace app-dev-ext -o json | jq -r '.items[] |  .status.podIP + \" \" + .metadata.labels.\"app.kubernetes.io/name\"' > /home/ubuntu/appdev_ips.txt"

# echo "copying ips to local machine";
scp jump.gcp.peritus.ai:/home/ubuntu/appdev_ips.txt ~/;

# echo "cleaning hosts";
sed '/# Added by get_appdev_ips/q' /etc/hosts > ~/hosts_clean;

# echo "yo";
cat /etc/hosts_clean ~/appdev_ips.txt > ~/hosts_clean_joined
sudo mv ~/hosts_clean_joined /etc/hosts
