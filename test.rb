investor_id = '618101e145f5c109fb5c8a05'
recommendations = DataHackathonDataset.fetch_recommendations_for(investor_id)
puts recommendations
{
    "investor": {
        "name": "YES Bank Limited"
    },
    "recommendations": [
        {
            "id": 373,
            "sector": "LAP",
            "client_name": "indiabulls",
            "client_entity_name": "Indiabulls Housing Finance Limited",
            "product_name": "HousingFinance IB-YBL",
            "product_description": "[PRODUCTION] Housing Finance Loans",
            "live_investors": 1
        },
        {
            "id": 925,
            "sector": "LAP",
            "client_name": "dbs",
            "client_entity_name": "DBS",
            "product_name": "LAP DBS-PSL",
            "product_description": "[SIT] LAP Product for DBS-PSL",
            "live_investors": 1
        },
        {
            "id": 160,
            "sector": "LAP",
            "client_name": "ca_pvtlt",
            "client_entity_name": "CA Pvt ltd",
            "product_name": "RRR LAP sector",
            "product_description": "[QA] Description",
            "live_investors": 1
        },
        {
            "id": 878,
            "sector": "SME Secured",
            "client_name": "indiabulls",
            "client_entity_name": "INDIABULLS COMMERCIAL CREDIT LIMITED",
            "product_name": "Indiabulls - RBL (CLM1)",
            "product_description": "[PRODUCTION] Indiabulls - RBL (CLM1)",
            "live_investors": 1
        },
        {
            "id": 970,
            "sector": "SME Secured",
            "client_name": "indiabulls",
            "client_entity_name": "Indiabulls Housing Finance Limited",
            "product_name": "Indiabulls - RBL(Housing)",
            "product_description": "[PRODUCTION] Indiabulls - RBL(Housing)",
            "live_investors": 1
        },
        {
            "id": 689,
            "sector": "SME Secured",
            "client_name": "indiabulls",
            "client_entity_name": "Indiabulls Housing Finance Limited",
            "product_name": "IndiaBulls - Indian Bank(Housing)",
            "product_description": "[PRODUCTION] Housing Product",
            "live_investors": 1
        },
        {
            "id": 68,
            "sector": "Two Wheeler",
            "client_name": "automony",
            "client_entity_name": "Automony",
            "product_name": "Commercial Vehicle",
            "product_description": "[PRODUCTION] Automony Commercial Vehicle",
            "live_investors": 2
        },
        {
            "id": 79,
            "sector": "Two Wheeler",
            "client_name": "automony",
            "client_entity_name": "Automony",
            "product_name": "Passenger Vehicle",
            "product_description": "[PRODUCTION] Automony Passenger Vehicle",
            "live_investors": 2
        },
        {
            "id": 893,
            "sector": "Two Wheeler",
            "client_name": "krazybee",
            "client_entity_name": "KrazyBee Services Private Limited",
            "product_name": "DP-API",
            "product_description": "[QA] DP-API",
            "live_investors": 1
        }
    ]
}
