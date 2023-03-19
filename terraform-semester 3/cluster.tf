module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "~> 19.0"
    cluster_name = "myapp-eks-cluster"
    cluster_version = "1.24"

    cluster_endpoint_public_access  = true

    vpc_id = module.my-vpc.vpc_id
    subnet_ids = module.my-vpc.private_subnets

    tags = {
        environment = "development"
        application = "myapp"
    }


    eks_managed_node_groups = {
        dev = {
            min_size = 1
            max_size = 5
            desired_size = 2

            instance_types = ["t2.medium"]
        }
    }
}




