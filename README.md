# Terraform Cloud Project

This module provisions a Terraform Cloud project.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Copyright 2019-2024 NephoSolutions srl, Sebastian Trebitz

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | >= 0.41 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.58.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_project.project](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/project) | resource |
| [tfe_team_project_access.team_project_access](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team_project_access) | resource |
| [tfe_team.project_team](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/team) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the workspace. | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | Name of the Terraform Cloud organization. | `string` | `null` | no |
| <a name="input_teams"></a> [teams](#input\_teams) | n/a | <pre>set(object({<br>    name   = string<br>    access = string<br><br>    project_access = optional(object({<br>      settings = optional(string)<br>      teams    = optional(string)<br>    }))<br><br>    workspace_access = optional(object({<br>      create         = optional(bool)<br>      delete         = optional(bool)<br>      locking        = optional(bool)<br>      move           = optional(bool)<br>      run_tasks      = optional(bool)<br>      runs           = optional(string)<br>      sentinel_mocks = optional(string)<br>      state_versions = optional(string)<br>      variables      = optional(string)<br>    }))<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The project identifier. |
| <a name="output_name"></a> [name](#output\_name) | The project name. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
