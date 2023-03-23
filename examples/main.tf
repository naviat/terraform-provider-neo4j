terraform {
  required_providers {
    neo4j = {
      version = "0.2"
      source  = "naviat/neo4j"
    }
  }
}

provider "neo4j" {
  host     = "neo4j://localhost:7687"
  username = "neo4j"
  password = "password"
}

resource "neo4j_database" "my_database" {
  name = "mydatabase"
}

resource "neo4j_role" "my_role" {
  name = "myRole"
}

resource "neo4j_grant" "my_grant" {
  action   = "match"
  graph    = "neo4j"
  resource = "all_properties"
  role     = neo4j_role.my_role.name
}

resource "neo4j_user" "my_user" {
  name     = "myUser"
  password = "password"

  roles = [
    neo4j_role.my_role.name
  ]
}