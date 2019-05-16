# Python version of call to the API made by R/plumber

import requests
import json
response = requests.post(
    “localhost:8000”
    , headers={“Content-Type”: “application/json”}
    , data=json.dumps({
        "Status.of.existing.checking.account": "A11"
    , "Duration.in.month": 24
    , "Credit.history": "A32"
    , "Savings.account.bonds": "A63"
    })
)
 
print response.json()