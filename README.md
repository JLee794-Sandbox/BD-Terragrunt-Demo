Maintained by @JinLee794

# BD Terragrunt Demo

This repo shows an example file/folder structure
you can use with [Terragrunt](https://github.com/gruntwork-io/terragrunt) to keep your
[Terraform](https://www.terraform.io) code DRY. For background information, check out the [Keep your Terraform code
DRY](https://github.com/gruntwork-io/terragrunt#keep-your-terraform-code-dry) section of the Terragrunt documentation.

Be sure to read through [the Terragrunt documentation on DRY
Architectures](https://terragrunt.gruntwork.io/docs/features/keep-your-terragrunt-architecture-dry/) to understand the
features of Terragrunt used in this folder organization.

Note: This code is solely for demonstration purposes. This is not production-ready code, so use at your own risk. If
you are interested in battle-tested, production-ready Terraform code, check out [Gruntwork](http://www.gruntwork.io/).


## How do you deploy the infrastructure in this repo?


### Pre-requisites

1. Install [Terraform](https://www.terraform.io/) version `1.1.7` and
   [Terragrunt](https://github.com/gruntwork-io/terragrunt) version `v0.36.0` or newer.
1. Configure your remote state backend values within the `common.hcl` configuration files
1. Configure your Azure credentials using one of the supported [authentication
   mechanisms](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret).
1. Fill in details relevant to your subscription in the following files:
   - [`Live-env/common.hcl`](./Live-env/common.hcl)
   - [`Live-env/dev.hcl`](./Live-env/dev.hcl)
   - [`Live-env/Compute/layer.hcl`](./Live-env/Shared/layer.hcl)



### Deploying a single module

1. `cd` into the module's folder (e.g. `cd Live-env/Shared/resource-group`).
1. Run `terragrunt plan` to see the changes you're about to apply.
1. If the plan looks good, run `terragrunt apply`.


### Deploying all modules in a layer

1. `cd` into the layer folder (e.g. `cd Live-env/Shared`).
1. Run `terragrunt run-all plan` to see all the changes you're about to apply.
1. If the plan looks good, run `terragrunt run-all apply`.


## How is the code in this repo organized?

The code in this repo uses the following folder hierarchy:

```
Live
 └ environment
    └ subscription
       └ layer
         └ resource
Modules
 └ module
```

Where:

* **environment**: At the top level is the `nonprod` or `prod` grouping to accommodate for multi-subscription Azure environments, while assuming each subscription will be designated for either production on non-production workloads.

* **subscription**: Within each environment, there will be an Azure subscription name to directly reflect the resource organization structure on both Azure and in code.

* **layer**: Within each subscription, there will be one or more "layers", such as `Compute`, `Network`, etc. These are logical groupings of resources that also share a common attribute file (`layer.hcl`) to further allow you to keep your code 'DRY'. Such a structure allows quick and easy configuration for numerous resources all at a centralized location.

* **resource**: Within each environment, you deploy all the resources for that environment, such as Windows VM Instances, Virtual Network, Subnets, Network Security Groups, Bastions, and so on. Note that the Terraform code for most of these
  resources lives in the `/Modules/` directory.
