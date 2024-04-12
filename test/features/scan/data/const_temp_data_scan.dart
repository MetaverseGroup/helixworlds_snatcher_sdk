

import 'dart:convert';

dynamic scanSuccessEncodeResponse = jsonEncode( 
  {
    'inventoryId': '1ee',     
    "name": "Bag",
    "description": "Bag",
    "redirectUrl": "https://bag.com",
    "images": [
        {
            "file": {
                "id": "b5a3d4b2-92da-4ebe-abd5-acfeb9da9e50",
                "name": "88daa38f-b115-4f28-b51a-1e713e9e3f96-bag.jpeg",
                "extension": "image/jpeg",
                "path": "inventories/668e644c-0cfb-464c-b72c-87fe40a25cc0/images/88daa38f-b115-4f28-b51a-1e713e9e3f96-bag.jpeg",
                "download_url": "https://app-d-helixworlds-content.s3.amazonaws.com/inventories/668e644c-0cfb-464c-b72c-87fe40a25cc0/images/88daa38f-b115-4f28-b51a-1e713e9e3f96-bag.jpeg",
                "size": 10688,
                "created_at": "2024-04-10T00:15:13.369Z",
                "updated_at": "2024-04-10T00:15:13.369Z"
            }
        }
    ]
});

dynamic scanSuccessResponse = jsonDecode(scanSuccessEncodeResponse);

dynamic scanFailureResponse = {
  'message': ''
};