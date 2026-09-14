# tf-github-repository

Creates a GitHub repository and adds a read-write deploy key to it, for Flux to
use as its GitOps repository.

## Usage

```hcl
provider "github" {
  owner = var.GITHUB_OWNER
  token = var.GITHUB_TOKEN
}

module "tls_private_key" {
  source = "github.com/Alexander-2212/tf-hashicorp-tls-keys?ref=v1.0.0"
}

module "github_repository" {
  source                = "github.com/Alexander-2212/tf-github-repository?ref=v1.0.0"
  repository_name       = "flux-gitops"
  repository_visibility = "public"
  public_key_openssh    = module.tls_private_key.public_key_openssh
}
```

## Inputs

| Name | Default | Description |
|---|---|---|
| `repository_name` | `flux-gitops` | Repository name |
| `repository_description` | `Flux GitOps repository` | Description |
| `repository_visibility` | `private` | `public` or `private` |
| `archive_on_destroy` | `true` | Archive instead of delete on destroy |
| `public_key_openssh` | — | Deploy key (read-write) |
| `public_key_openssh_title` | `flux` | Deploy key title |

## Outputs

`full_name`, `ssh_clone_url`, `html_url`, `deploy_key_id`.

## Changes from upstream

- No `provider "github"` block inside the module. The caller configures the
  provider; a module with its own provider block cannot be used with
  `depends_on`, `count` or `for_each`. `github_owner` and `github_token` inputs
  are gone for the same reason.
- `archive_on_destroy = true` by default: `terraform destroy` no longer deletes
  the GitOps repository and its history.
- Removed the unused `branch` input.
- Added outputs; `deploy_key_id` lets callers wait for the key to exist.
- `integrations/github` `>= 6.0.0, < 7.0.0`.
