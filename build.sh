#!/bin/bash
go build -o terraform-provider-neo4j
export OS_ARCH="$(go env GOHOSTOS)_$(go env GOHOSTARCH)"
mkdir -p ~/.terraform.d/plugins/registry.terraform.io/naviat/neo4j/0.1/$OS_ARCH
mv terraform-provider-neo4j ~/.terraform.d/plugins/registry.terraform.io/naviat/neo4j/0.1/$OS_ARCH