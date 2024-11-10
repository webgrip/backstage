workspace {
    model {
        group "Organization" {
            properties {
                "structurizr.groupSeparator" "/"
            }

            group "People" {
                person developer "Developer" "Builds and maintains applications" {
                    tags "Developer"
                }
                person platformEngineer "Platform Engineer" "Designs and manages the platform" {
                    tags "Platform Engineer"
                }
            }

            group "Developer Control Plane" {
                softwareSystem ide "IDE" "PHPStorm, VSCode, etc." {
                    tags "Developer Tool"
                }
                softwareSystem dbc "Database Client" "Datagrid, MySQL Workbench, etc." {
                    tags "Amazon Web Services - Amazon RDS"
                }

                group "Version Control" {
                    softwareSystem github "GitHub" "Version control platform" {
                        tags "Amazon Web Services - AWS CodeCommit"
                    }
                    softwareSystem appSource "Application Source" "Source code for applications" {
                        tags "Amazon Web Services - AWS CodeCommit"
                    }
                    softwareSystem workflowSource "Workflow Source" "Source code for workflows" {
                        tags "Amazon Web Services - AWS CodeCommit"
                    }
                }

                group "Service Catalog" {
                    softwareSystem idp "Internal Developer Platform" "Self-service, single point of entry to the platform" {
                        tags "Microsoft Azure - Kubernetes Services"
                    }
                }
            }

            group "Integration Delivery Plane" {
                group "CI/CD Pipeline" {
                    softwareSystem ci "CI Pipelines" "GitHub Actions" {
                        tags "Amazon Web Services - AWS CodePipeline"
                    }
                    softwareSystem cd "CD Pipelines" "GitHub Actions" {
                        tags "Amazon Web Services - AWS CodePipeline"
                    }
                }

                group "Registry" {
                    softwareSystem packageRegistry "Package Registry" "Packagist, npm, etc." {
                        tags "Microsoft Azure - Container Registries"
                    }
                    softwareSystem containerRegistry "Container Registry" "Docker, etc." {
                        tags "Microsoft Azure - Container Registries"
                    }
                    softwareSystem artifactRegistry "Artifact Registry" "Artifactory, etc." {
                        tags "Microsoft Azure - Container Registries"
                    }
                }
            }

            group "Monitoring and Logging Plane" {
                group "Observability" {
                    softwareSystem grafana "Grafana" "Logs/Traces/Metrics visualization" {
                        tags "Microsoft Azure - Activity Log"
                        tags "Microsoft Azure - Metrics"
                    }
                    softwareSystem collector "Collector" "Collects logs, traces, and metrics" {
                        tags "Amazon Web Services - AWS X-Ray"
                    }
                }

                group "Monitoring" {
                    softwareSystem monitoring "Monitoring Tools" "Tracks system performance and health" {
                        tags "Microsoft Azure - Azure Monitor Dashboard"
                    }
                }
            }

            group "Security Plane" {
                softwareSystem secretManagement "Secret Management Services" "Manages secrets and credentials" {
                    tags "Microsoft Azure - Network Security Groups"
                }
            }

            group "Resource Plane" {
                softwareSystem servers "Servers" "Physical or virtual machines" {
                    tags "Microsoft Azure - Spot VM"
                }
                softwareSystem networking "Networking" "Connects servers and services" {
                    tags "Microsoft Azure - Virtual Networks"
                }
                softwareSystem loadBalancers "Load Balancers" "Distributes incoming network traffic" {
                    tags "Amazon Web Services - Elastic Load Balancing"
                }
            }
        }


    }

    views {
        systemLandscape {
            include *
        }

        styles {
            element "Person" {
                shape person
            }
        }

        theme https://raw.githubusercontent.com/structurizr/themes/refs/heads/master/microsoft-azure-2023.01.24/theme.json
        theme https://raw.githubusercontent.com/structurizr/themes/refs/heads/master/amazon-web-services-2023.01.31/theme.json

    }
}
