output "full_name" {
  description = "owner/name of the repository"
  value       = github_repository.this.full_name
}

output "ssh_clone_url" {
  description = "SSH clone URL"
  value       = github_repository.this.ssh_clone_url
}

output "html_url" {
  description = "Web URL of the repository"
  value       = github_repository.this.html_url
}

# Resolves only after the deploy key exists, so a caller that passes this to
# Flux cannot start the bootstrap before GitHub accepts the key.
output "deploy_key_id" {
  description = "ID of the deploy key"
  value       = github_repository_deploy_key.this.id
}
