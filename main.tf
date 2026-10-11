resource "google_dataplex_datascan_iam_binding" "dataplex_datascan_iam_bindings" {
  for_each = var.dataplex_datascan_iam_bindings

  data_scan_id = each.value.data_scan_id
  members      = each.value.members
  role         = each.value.role
  location     = each.value.location
  project      = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

