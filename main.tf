resource "github_repository" "this" {
  name        = var.repository_name
  description = var.repository_description
  visibility  = var.repository_visibility
  auto_init   = true

  # Destroying this configuration archives the repository instead of deleting
  # it, so the GitOps history survives a `terraform destroy`.
  archive_on_destroy = var.archive_on_destroy
}

resource "github_repository_deploy_key" "this" {
  title      = var.public_key_openssh_title
  repository = github_repository.this.name
  key        = var.public_key_openssh
  read_only  = false
}
