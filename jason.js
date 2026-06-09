{
  "collections": [
    {
      "name": "projects",
      "type": "base",
      "schema": [
        { "name": "name", "type": "text", "required": true },
        { "name": "client", "type": "text", "required": true },
        { "name": "location", "type": "text", "required": false },
        {
          "name": "status",
          "type": "select",
          "required": true,
          "options": {
            "maxSelect": 1,
            "values": ["active", "completed"]
          }
        },
        {
          "name": "created_by",
          "type": "relation",
          "required": false,
          "options": {
            "collectionId": "_pb_users_auth_",
            "maxSelect": 1
          }
        }
      ]
    },

    {
      "name": "inspection_items",
      "type": "base",
      "schema": [
        {
          "name": "project",
          "type": "relation",
          "required": true,
          "options": {
            "collectionId": "projects",
            "maxSelect": 1
          }
        },
        { "name": "code", "type": "text", "required": true },
        { "name": "description", "type": "text", "required": true },
        { "name": "unit", "type": "text", "required": true },
        { "name": "planned_quantity", "type": "number", "required": true },
        { "name": "category", "type": "text", "required": true },
        { "name": "order_index", "type": "number", "required": true }
      ]
    },

    {
      "name": "inspections",
      "type": "base",
      "schema": [
        {
          "name": "project",
          "type": "relation",
          "required": true,
          "options": {
            "collectionId": "projects",
            "maxSelect": 1
          }
        },
        {
          "name": "inspector",
          "type": "relation",
          "required": true,
          "options": {
            "collectionId": "_pb_users_auth_",
            "maxSelect": 1
          }
        },
        { "name": "inspection_date", "type": "date", "required": true },
        {
          "name": "status",
          "type": "select",
          "required": true,
          "options": {
            "maxSelect": 1,
            "values": ["pending", "in_progress", "completed"]
          }
        }
      ]
    },

    {
      "name": "inspection_results",
      "type": "base",
      "schema": [
        {
          "name": "inspection",
          "type": "relation",
          "required": true,
          "options": {
            "collectionId": "inspections",
            "maxSelect": 1
          }
        },
        {
          "name": "item",
          "type": "relation",
          "required": true,
          "options": {
            "collectionId": "inspection_items",
            "maxSelect": 1
          }
        },
        { "name": "is_inspected", "type": "bool", "required": false },
        { "name": "measurement_value", "type": "number", "required": false },
        { "name": "measurement_unit", "type": "text", "required": false },
        { "name": "complies", "type": "bool", "required": false },
        { "name": "observations", "type": "text", "required": false },
        { "name": "photos", "type": "file", "required": false, "options": { "maxSelect": 10 } },
        { "name": "signature", "type": "file", "required": false, "options": { "maxSelect": 1 } },
        { "name": "gps_latitude", "type": "number", "required": false },
        { "name": "gps_longitude", "type": "number", "required": false }
      ]
    },

    {
      "name": "measurements",
      "type": "base",
      "schema": [
        {
          "name": "item",
          "type": "relation",
          "required": true,
          "options": {
            "collectionId": "inspection_items",
            "maxSelect": 1
          }
        },
        {
          "name": "inspection",
          "type": "relation",
          "required": true,
          "options": {
            "collectionId": "inspections",
            "maxSelect": 1
          }
        },
        { "name": "measured_value", "type": "number", "required": true },
        { "name": "measurement_unit", "type": "text", "required": true },
        {
          "name": "device_type",
          "type": "select",
          "required": true,
          "options": {
            "maxSelect": 1,
            "values": ["bluetooth_laser", "ar_camera", "manual"]
          }
        },
        { "name": "device_model", "type": "text", "required": false },
        { "name": "accuracy_mm", "type": "number", "required": false },
        { "name": "gps_latitude", "type": "number", "required": false },
        { "name": "gps_longitude", "type": "number", "required": false },
        { "name": "photo", "type": "file", "required": false, "options": { "maxSelect": 1 } }
      ]
    }
  ]
}
