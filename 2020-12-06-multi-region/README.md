This code goes with our blog here:

to run the code your self, start with updating the cloudinit.yml file with your credentials and socket_id. As well as the private key used to authenticate tunnels with.

```
 email=your_my_socket_email
 password=your_mysocket_passowrd
 socket_id=your_mysoscket_socket_id
 giphykey=your_giphy_API_key
 
   #THE BELOW NEEDS TO BE UPDATED!
- content: |
    -----BEGIN OPENSSH PRIVATE KEY-----
    PRIVATE KEY you're USING FOR MYSOCKET
    DATAPLANE
    -----END OPENSSH PRIVATE KEY-----
  path: /home/mysocket/.ssh/id_ed25519
```


Make sure to get a digital ocean token and add it your env:
```export TF_VAR_DO_TOKEN=xxxx```

then start building and bring up the VM's
```
terraform init
terraform plan
terraform apply
```
It will take about two minutes or so for the VM's the spin up and load all the software. After that your service should be globally available.
You can test the load balancing like this:


```for i in {1..20}; do  curl -s YOUR_MYSOCKET_URL | grep Server; done | sort | uniq -c```



when done you can bring it all down with
```terraform destroy```
