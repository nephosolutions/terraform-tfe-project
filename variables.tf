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

variable "name" {
  description = "Name of the workspace."
  type        = string
}

variable "organization" {
  description = "Name of the Terraform Cloud organization."
  type        = string
  default     = null
}

variable "teams" {
  description = ""

  type = set(object({
    name   = string
    access = string

    project_access = optional(object({
      settings = optional(string)
      teams    = optional(string)
    }))

    workspace_access = optional(object({
      create         = optional(bool)
      delete         = optional(bool)
      locking        = optional(bool)
      move           = optional(bool)
      run_tasks      = optional(bool)
      runs           = optional(string)
      sentinel_mocks = optional(string)
      state_versions = optional(string)
      variables      = optional(string)
    }))
  }))

  nullable = false
  default  = []
}
