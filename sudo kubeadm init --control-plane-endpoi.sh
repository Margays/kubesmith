sudo kubeadm init --control-plane-endpoint "192.168.1.155:6443" --upload-certs


IPADDR="192.168.1.155"
POD_CIDR="10.0.0.0/24"
NODENAME=$(hostname -s)
sudo kubeadm init \
    --apiserver-advertise-address=$IPADDR  \
    --apiserver-cert-extra-sans=$IPADDR  \
    --pod-network-cidr=$POD_CIDR \
    --node-name $NODENAME


kubeadm join 192.168.1.155:6443 --token v03l5x.b952as51ib74gh1g \
        --discovery-token-ca-cert-hash sha256:637140b405a47f85e5288f698246ed5000e08af04c15df44719ba27cfe4b77f1