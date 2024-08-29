/**
 * Copyright 2019-2024 NephoSolutions srl, Sebastian Trebitz
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

resource "tfe_project" "project" {
  name         = var.name
  organization = var.organization
}

locals {
  tfe_team_project_access = { for k, v in var.teams : "${v.name}/${v.access}" => v }
}

data "tfe_team" "project_team" {
  for_each = local.tfe_team_project_access

  organization = var.organization
  name         = each.value["name"]
}

resource "tfe_team_project_access" "team_project_access" {
  for_each = local.tfe_team_project_access

  access     = each.value["access"]
  team_id    = data.tfe_team.project_team[each.key].id
  project_id = tfe_project.project.id

  dynamic "project_access" {
    for_each = each.value["access"] == "custom" && each.value["project_access"] != null ? [1] : []

    content {
      settings = each.value["project_access"]["settings"]
      teams    = each.value["project_access"]["teams"]
    }
  }

  dynamic "workspace_access" {
    for_each = each.value["access"] == "custom" && each.value["workspace_access"] != null ? [1] : []

    content {
      create         = each.value["workspace_access"]["create"]
      delete         = each.value["workspace_access"]["delete"]
      locking        = each.value["workspace_access"]["locking"]
      move           = each.value["workspace_access"]["move"]
      run_tasks      = each.value["workspace_access"]["run_tasks"]
      runs           = each.value["workspace_access"]["runs"]
      sentinel_mocks = each.value["workspace_access"]["sentinel_mocks"]
      state_versions = each.value["workspace_access"]["state_versions"]
      variables      = each.value["workspace_access"]["variables"]
    }
  }
}
