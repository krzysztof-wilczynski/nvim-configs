return {
  settings = {
    yaml = {
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
      schemas = {
        -- GitHub
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://json.schemastore.org/github-action.json"] = "/.github/actions/**/action.{yml,yaml}",
        -- Docker Compose
        ["https://json.schemastore.org/docker-compose.json"] = "docker-compose*.{yml,yaml}",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "compose*.{yml,yaml}",
        -- Azure Pipelines
        ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
          "azure-pipelines.{yml,yaml}",
          "/.azure-pipelines/**/*.{yml,yaml}",
          "/.azuredevops/**/*.{yml,yaml}",
        },
        -- Kubernetes
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.0-standalone-strict/all.json"] = {
          "k8s/**/*.{yml,yaml}",
          "kubernetes/**/*.{yml,yaml}",
          "**/deployment*.{yml,yaml}",
          "**/service*.{yml,yaml}",
          "**/configmap*.{yml,yaml}",
          "**/secret*.{yml,yaml}",
          "**/ingress*.{yml,yaml}",
          "**/pod*.{yml,yaml}",
        },
        -- Helm
        ["https://json.schemastore.org/chart.json"] = "Chart.{yml,yaml}",
        ["https://json.schemastore.org/helmfile.json"] = "helmfile.{yml,yaml}",
      },
      validate = true,
      completion = true,
      hover = true,
    },
  },
}
