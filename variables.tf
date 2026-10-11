variable "dataplex_datascan_iam_bindings" {
  description = <<EOT
Map of dataplex_datascan_iam_bindings, attributes below
Required:
    - data_scan_id
    - members
    - role
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    data_scan_id = string
    members      = set(string)
    role         = string
    location     = optional(string)
    project      = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

