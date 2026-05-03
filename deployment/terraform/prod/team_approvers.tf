resource "awsteam_approvers_ou" "ai_labs" {
  ou_id   = "ou-4zz6-lrwm523h"
  ou_name = "AI Labs"
  approvers = [
    "Okta-PG-AWS-TEAM-Newvato-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "54785448-9011-7001-e0f8-34d03ee6c8c6",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "auth" {
  ou_id   = "ou-4zz6-bgcbyp2q"
  ou_name = "Auth"
  approvers = [
    "Okta-PG-AWS-TEAM-Customer-And-Account-Management-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "b438a408-a0a1-700a-2d79-93cca2969957",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "author" {
  ou_id   = "ou-4zz6-wlkq3ixo"
  ou_name = "Author"
  approvers = [
    "Okta-PG-AWS-TEAM-Author-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "d4d89478-b001-70cb-ed62-fc957b2498f3",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "content" {
  ou_id   = "ou-4zz6-r6s46jix"
  ou_name = "Content"
  approvers = [
    "Okta-PG-AWS-TEAM-Search-And-Content-Management-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "34b834a8-c061-70db-fc81-f5f3a4fb13ca",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "content_no_public_buckets" {
  ou_id   = "ou-4zz6-yxt2rnfk"
  ou_name = "Content - No Public Buckets"
  approvers = [
    "Okta-PG-AWS-TEAM-Search-And-Content-Management-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "34b834a8-c061-70db-fc81-f5f3a4fb13ca",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "content_operations_automation_support_prod" {
  ou_id   = "ou-4zz6-k66rj11f"
  ou_name = "Content Operations Automation Support - Production"
  approvers = [
    "Okta-PG-AWS-TEAM-Content-Operations-Automation-Support-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "64f8e498-1031-7078-229e-56a4e5a14f82",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "content_operations_automation_support_staging" {
  ou_id   = "ou-4zz6-k7mb89sv"
  ou_name = "Content Operations Automation Support - Staging"
  approvers = [
    "Okta-PG-AWS-TEAM-Content-Operations-Automation-Support-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "64f8e498-1031-7078-229e-56a4e5a14f82",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "dam_externally_managed_accounts" {
  ou_id   = "ou-4zz6-k388e8d7"
  ou_name = "DAM - Externally Managed Accounts"
  approvers = [
    "Okta-PG-AWS-TEAM-Search-And-Content-Management-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "34b834a8-c061-70db-fc81-f5f3a4fb13ca",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "data_production" {
  ou_id   = "ou-4zz6-yugi2pp6"
  ou_name = "Production"
  approvers = [
    "Okta-PG-AWS-TEAM-Data-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "b438c438-0061-7096-e922-d163c39fb567",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "data_staging_and_development" {
  ou_id   = "ou-4zz6-c6rmdi99"
  ou_name = "Staging and Development"
  approvers = [
    "Okta-PG-AWS-TEAM-Data-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "b438c438-0061-7096-e922-d163c39fb567",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "elements" {
  ou_id   = "ou-4zz6-p528be0r"
  ou_name = "Elements"
  approvers = [
    "Okta-PG-AWS-TEAM-Elements-Core-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "e4985468-f051-7064-7e41-1ccab25340a5",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "elements_cde" {
  ou_id   = "ou-4zz6-4kqiytdd"
  ou_name = "Elements"
  approvers = [
    "Okta-PG-AWS-TEAM-Elements-CDE-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "54985488-10c1-70a8-b3cc-dacb985df035",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "market_cde" {
  ou_id   = "ou-4zz6-2gi3oy9f"
  ou_name = "Market"
  approvers = [
    "Okta-PG-AWS-TEAM-Market-CDE-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "f47884c8-7011-70e9-e0ce-24758b830208",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "influx" {
  ou_id   = "ou-4zz6-4bjff45b"
  ou_name = "Influx"
  approvers = [
    "Okta-PG-AWS-TEAM-Marketing-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "a4f8d458-d001-70f1-4d6a-304f59a971c0",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "market_development" {
  ou_id   = "ou-4zz6-4g99hjvl"
  ou_name = "Development"
  approvers = [
    "Okta-PG-AWS-TEAM-Satellites-Sustained-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "74b8c408-8071-70e8-40ab-6e8c96aacb74",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "market_production" {
  ou_id   = "ou-4zz6-4tjl972a"
  ou_name = "Production"
  approvers = [
    "Okta-PG-AWS-TEAM-Satellites-Sustained-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "74b8c408-8071-70e8-40ab-6e8c96aacb74",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "placeit_non_production" {
  ou_id   = "ou-4zz6-8p3c85le"
  ou_name = "Placeit NonProduction"
  approvers = [
    "Okta-PG-AWS-TEAM-Placeit-Sustained-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "e49884a8-c071-703a-970b-15d20c96e83e",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "platform" {
  ou_id   = "ou-4zz6-6f4duk4q"
  ou_name = "Platform"
  approvers = [
    "Okta-PG-AWS-TEAM-Platform-Engineering-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "f478d478-30c1-70ca-cdd5-4e3d3ddf2656",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "placeit_production" {
  ou_id   = "ou-4zz6-vpbmngb7"
  ou_name = "Placeit Production"
  approvers = [
    "Okta-PG-AWS-TEAM-Placeit-Sustained-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "e49884a8-c071-703a-970b-15d20c96e83e",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "tech_services" {
  ou_id   = "ou-4zz6-innfcgbd"
  ou_name = "Tech Services"
  approvers = [
    "Okta-PG-AWS-TEAM-IT-Ops-SaaS-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "e42884c8-c0b1-70d6-a254-20960600441a",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "tuts_and_studio" {
  ou_id   = "ou-4zz6-k3iiauab"
  ou_name = "Tuts and Studio"
  approvers = [
    "Okta-PG-AWS-TEAM-Satellites-Sustained-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "74b8c408-8071-70e8-40ab-6e8c96aacb74",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_account" "access_management_production" {
  account_id   = "221082199185"
  account_name = "Access Management - Production"
  approvers = [
    "Okta-PG-AWS-TEAM-Platform-Engineering-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "f478d478-30c1-70ca-cdd5-4e3d3ddf2656",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_account" "dam_integrations_development" {
  account_id   = "190422683646"
  account_name = "DAM Integrations Development"
  approvers = [
    "Okta-PG-AWS-TEAM-Search-And-Content-Management-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "34b834a8-c061-70db-fc81-f5f3a4fb13ca",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_account" "dam_integrations_production" {
  account_id   = "236598071212"
  account_name = "DAM Integrations Production"
  approvers = [
    "Okta-PG-AWS-TEAM-Search-And-Content-Management-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "34b834a8-c061-70db-fc81-f5f3a4fb13ca",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "placeit" {
  ou_id   = "ou-4zz6-wwb56d3s"
  ou_name = "Placeit"
  approvers = [
    "Okta-PG-AWS-TEAM-Placeit-Sustained-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "e49884a8-c071-703a-970b-15d20c96e83e",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "analytics" {
  ou_id   = "ou-4zz6-od6o3xyf"
  ou_name = "Analytics"
  approvers = [
    "Okta-PG-AWS-TEAM-Analytics-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "14f82458-8081-7017-21c0-3eac216a04ca",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_ou" "newvato" {
  ou_id   = "ou-4zz6-26x7qwdu"
  ou_name = "Newvato"
  approvers = [
    "Okta-PG-AWS-TEAM-Newvato-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "54785448-9011-7001-e0f8-34d03ee6c8c6",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}

resource "awsteam_approvers_account" "envato_platform_production" {
  account_id   = "909551307430"
  account_name = "Envato Platform Production Account"
  approvers = [
    "Okta-PG-AWS-TEAM-Platform-Engineering-Approvers",
    "Okta-PG-AWS-TEAM-Global-Approvers",
  ]
  group_ids = [
    "f478d478-30c1-70ca-cdd5-4e3d3ddf2656",
    "64f8d4e8-a0d1-70b7-0298-ea034a958c9f",
  ]
}
