variable "repository_name" {
  type        = string
  default     = "flux-gitops"
  description = "Name of the GitHub repository"
}

variable "repository_description" {
  type        = string
  default     = "Flux GitOps repository"
  description = "Description of the GitHub repository"
}

variable "repository_visibility" {
  type        = string
  default     = "private"
  description = "Repository visibility: public or private"

  validation {
    condition     = contains(["public", "private"], var.repository_visibility)
    error_message = "repository_visibility must be public or private."
  }
}

variable "archive_on_destroy" {
  type        = bool
  default     = true
  description = "Archive the repository on destroy instead of deleting it"
}

variable "public_key_openssh" {
  type        = string
  description = "OpenSSH public key added as a read-write deploy key"
}

variable "public_key_openssh_title" {
  type        = string
  default     = "flux"
  description = "Title of the deploy key"
}
