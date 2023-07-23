import requests

data = [
    {
        "address": "Carrer dels Arcs, 5 (Barcelona). Con Portal de l'Àngel.",
        "adminId": "cbc9db30-6dda-4319-9df2-4f032f34ba51",
        "city": "Barcelona",
        "collectionId": 25,
        "country": "Spain",
        "description": "Gastronomía, arte y cultura en el casco antiguo de la ciudad",
        "email": "info@restaurante.com",
        "favourites": [
            "11285d5c-3511-11ed-a261-0242ac120002"
        ],
        "imgs": [
            "https://image.freepik.com/foto-gratis/mujer-comiendo-pasta-restaurante-italiano_1303-24364.jpg",
            "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
        ],
        "lat": 41.384624,
        "long": 2.175544,
        "phoneNumber": "535353",
        "placeId": "5ccb70a0-2f94-11ed-a261-0242ac120002",
        "placeName": "RESTAURANTE EL CERCLE",
        "ratings": 125,
        "ratingAverage": 4.5,
        "zipCode": "08002",
        "status": "active",
        "isPopularThisWeek": False,
        "isNovelty": True,
        "hasFreeDelivery": False,
        "hasAlcohol": False,
        "isOpenNow": False,
        "averagePrice": 20.0
    },
    {
        "address": "Moll d' Espanya, 5 (Barcelona). Maremagnum",
        "adminId": "5e81252a-7862-48ac-ae0b-f0eee60c5b3f",
        "city": "Barcelona",
        "collectionId": 19,
        "country": "Spain",
        "description": "Restaurante Mirandoalmar, cocina mediterránea con vistas",
        "email": "info@restaurante.com",
        "favourites": [
            "11285d5c-3511-11ed-a261-0242ac120002"
        ],
        "imgs": [
            "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
        ],
        "lat": 41.3746496,
        "long": 2.1801781,
        "phoneNumber": "5353535353",
        "placeId": "43cb2504-2f95-11ed-a261-0242ac120002",
        "placeName": "RESTAURANTE MIRANDOALMAR",
        "ratings": 125,
        "ratingAverage": 4.5,
        "zipCode": "08039",
        "status": "active",
        "isPopularThisWeek": True,
        "isNovelty": False,
        "hasFreeDelivery": True,
        "hasAlcohol": False,
        "isOpenNow": False,
        "averagePrice": 20.0
    },
    {
        "address": "Carrer del Consell de Cent, 336 - 08036 Barcelona",
        "adminId": "0fdca98b-fe98-4b97-9439-33782a24038e",
        "city": "Barcelona",
        "collectionId": 4,
        "country": "Spain",
        "description": "La auténtica pizza napolitana en Barcelona",
        "email": "info@restaurante.com",
        "favourites": [
            "11285d5c-3511-11ed-a261-0242ac120002"
        ],
        "imgs": [
            "https://images.unsplash.com/photo-1593504049359-74330189a345?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80"
        ],
        "lat": 41.392809,
        "long": 2.1659803,
        "phoneNumber": "5353535",
        "placeId": "9489e37c-2f95-11ed-a261-0242ac120002",
        "placeName": "Antica Pizzería Da Michele",
        "ratings": 125,
        "ratingAverage": 4.5,
        "zipCode": "08029",
        "status": "active",
        "isPopularThisWeek": False,
        "isNovelty": True,
        "hasFreeDelivery": False,
        "hasAlcohol": False,
        "isOpenNow": False,
        "averagePrice": 20.0
    },
    {
        "address": "Carrer del Rosselló, 253 (Barcelona). Entre Rbla. Catalunya y Pg. de Gràcia.",
        "adminId": "44820634-2afb-4d9c-993d-5caaef7403c4",
        "city": "Barcelona",
        "collectionId": 8,
        "country": "Spain",
        "description": "Restaurante Margherita, excelente cocina italiana casera",
        "email": "info@restaurante.com",
        "favourites": [
            "11285d5c-3511-11ed-a261-0242ac120002"
        ],
        "imgs": [
            "https://images.unsplash.com/photo-1546549032-9571cd6b27df?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
        ],
        "lat": 41.3950833,
        "long": 2.1573366,
        "phoneNumber": "6363663",
        "placeId": "fc94f51a-2f95-11ed-a261-0242ac120002",
        "placeName": "RESTAURANTE MARGHERITA",
        "ratings": 125,
        "ratingAverage": 4.5,
        "zipCode": "08008",
        "status": "active",
        "isPopularThisWeek": False,
        "isNovelty": True,
        "hasFreeDelivery": True,
        "hasAlcohol": False,
        "isOpenNow": False,
        "averagePrice": 20.0
    },
    {
        "address": "Carrer del Rosselló, 253 (Barcelona). Entre Rbla. Catalunya y Pg. de Gràcia.",
        "adminId": "9e57f626-75fb-4f84-981d-32eef5c4452b",
        "city": "Barcelona",
        "collectionId": 19,
        "country": "Spain",
        "description": "Restaurante de cocina española",
        "email": "info@restaurante.com",
        "favourites": [
            "11285d5c-3511-11ed-a261-0242ac120002"
        ],
        "imgs": [
            "https://images.unsplash.com/photo-1504973960431-1c467e159aa4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
        ],
        "lat": 41.4590946,
        "long": 2.2316319,
        "phoneNumber": "6363663",
        "placeId": "5d628768-337e-11ed-a261-0242ac120002",
        "placeName": "El Rebost de Montigalà",
        "ratings": 125,
        "ratingAverage": 4.5,
        "zipCode": "08008",
        "status": "active",
        "isPopularThisWeek": True,
        "isNovelty": False,
        "hasFreeDelivery": False,
        "hasAlcohol": False,
        "isOpenNow": False,
        "averagePrice": 20.0
    },
    {
        "address": "C. de Còrsega, 178, 08036 Barcelona",
        "adminId": "609eda50-d3e9-4677-8452-c558137a4aab",
        "city": "Barcelona",
        "collectionId": 5,
        "country": "Spain",
        "description": "Restaurante americano",
        "email": "info@restaurante.com",
        "favourites": [
            "11285d5c-3511-11ed-a261-0242ac120002"
        ],
        "imgs": [
            "https://images.unsplash.com/photo-1491960693564-421771d727d6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=763&q=80"
        ],
        "lat": 41.4055588,
        "long": 2.1481333,
        "phoneNumber": "6363663",
        "placeId": "a03ed738-3380-11ed-a261-0242ac120002",
        "placeName": "Big Al's",
        "ratings": 125,
        "ratingAverage": 4.5,
        "zipCode": "08036",
        "status": "active",
        "isPopularThisWeek": False,
        "isNovelty": True,
        "hasFreeDelivery": False,
        "hasAlcohol": False,
        "isOpenNow": False,
        "averagePrice": 20.0
    },
    {
        "address": "Ronda de la Univ., 20, 08007 Barcelona",
        "adminId": "08098d3b-6fdf-468a-83d2-3c001c3ee7a2",
        "city": "Barcelona",
        "collectionId": 5,
        "country": "Spain",
        "description": "Restaurante americano",
        "email": "info@restaurante.com",
        "favourites": [
            "11285d5c-3511-11ed-a261-0242ac120002"
        ],
        "imgs": [
            "https://images.unsplash.com/photo-1565299507177-b0ac66763828?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=722&q=80"
        ],
        "lat": 41.4055588,
        "long": 2.1481333,
        "phoneNumber": "6363663",
        "placeId": "6c0d57a4-3381-11ed-a261-0242ac120002",
        "placeName": "The Ranch Smokehouse",
        "ratings": 125,
        "ratingAverage": 4.5,
        "zipCode": "08007",
        "status": "active",
        "isPopularThisWeek": True,
        "isNovelty": False,
        "hasFreeDelivery": True,
        "hasAlcohol": False,
        "isOpenNow": False,
        "averagePrice": 20.0
    },
    {
        "address": "Carrer d'Aribau, 90, 08036 Barcelona",
        "adminId": "8d8dd9de-7ef8-4396-8888-8fdc5c6024e3",
        "city": "Barcelona",
        "collectionId": 9,
        "country": "Spain",
        "description": "Restaurante Árabe",
        "email": "info@restaurante.com",
        "favourites": [
            "11285d5c-3511-11ed-a261-0242ac120002"
        ],
        "imgs": [
            "https://images.unsplash.com/photo-1614514710295-129a2e3bbf24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=706&q=80"
        ],
        "lat": 41.4056206,
        "long": 2.1481333,
        "phoneNumber": "6363663",
        "placeId": "b67f464e-3381-11ed-a261-0242ac120002",
        "placeName": "Alo Beirut restaurante libanés árabe",
        "ratings": 125,
        "ratingAverage": 4.5,
        "zipCode": "08036",
        "status": "active",
        "isPopularThisWeek": False,
        "isNovelty": False,
        "hasFreeDelivery": False,
        "hasAlcohol": False,
        "isOpenNow": False,
        "averagePrice": 20.0
    },
    {
        "address": "Carrer del Comandant Benítez, 20, 08028 Barcelona",
        "adminId": "b604d0e6-4e6d-4567-8ff9-90cafd18821a",
        "city": "Barcelona",
        "collectionId": 10,
        "country": "Spain",
        "description": "Restaurante Argentino",
        "email": "info@restaurante.com",
        "favourites": [
            "11285d5c-3511-11ed-a261-0242ac120002"
        ],
        "imgs": [
            "https://images.unsplash.com/photo-1609525313344-a56b96f20718?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"
        ],
        "lat": 41.3802312,
        "long": 2.0914329,
        "phoneNumber": "6363663",
        "placeId": "81e0f102-3382-11ed-a261-0242ac120002",
        "placeName": "Corte & Brasa",
        "ratings": 125,
        "ratingAverage": 4.5,
        "zipCode": "08028",
        "status": "active",
        "isPopularThisWeek": True,
        "isNovelty": False,
        "hasFreeDelivery": False,
        "hasAlcohol": False,
        "isOpenNow": False,
        "averagePrice": 20.0
    },
    {
        "address": "C/ de Sant Antoni Maria Claret, 148, 08025 Barcelona",
        "adminId": "9cb17797-7378-48ff-83cf-33f63fab2882",
        "city": "Barcelona",
        "collectionId": 13,
        "country": "Spain",
        "description": "Restaurante Brasileño",
        "email": "info@restaurante.com",
        "favourites": [
            "11285d5c-3511-11ed-a261-0242ac120002"
        ],
        "imgs": [
            "https://images.unsplash.com/photo-1485995768424-01c1ccc33f7a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
        ],
        "lat": 41.3802312,
        "long": 2.0914329,
        "phoneNumber": "6363663",
        "placeId": "ea5965de-3382-11ed-a261-0242ac120002",
        "placeName": "K' Delicia Restaurante",
        "ratings": 125,
        "ratingAverage": 4.5,
        "zipCode": "08028",
        "status": "active",
        "isPopularThisWeek": True,
        "isNovelty": True,
        "hasFreeDelivery": False,
        "hasAlcohol": False,
        "isOpenNow": False,
        "averagePrice": 20.0
    },
    {
        "address": "Av. de Josep Tarradellas, 50, 08029 Barcelona",
        "adminId": "c2dec3c6-eb17-49ee-b401-b4103f79ce44",
        "city": "Barcelona",
        "collectionId": 16,
        "country": "Spain",
        "description": "Restaurante de Desayunos",
        "email": "info@restaurante.com",
        "favourites": [
            "11285d5c-3511-11ed-a261-0242ac120002"
        ],
        "imgs": [
            "https://images.unsplash.com/photo-1495147466023-ac5c588e2e94?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
        ],
        "lat": 41.4082004,
        "long": 2.1353452,
        "phoneNumber": "6363663",
        "placeId": "11285d5c-3511-11ed-a261-0242ac120002",
        "placeName": "Restaurant Mister Esmorzar",
        "ratings": 125,
        "ratingAverage": 4.5,
        "zipCode": "08029",
        "status": "active",
        "isPopularThisWeek": True,
        "isNovelty": False,
        "hasFreeDelivery": False,
        "hasAlcohol": False,
        "isOpenNow": False,
        "averagePrice": 20.0
    },
    {
        "address": "Plaça de Maragall, 20, 08027 Barcelona",
        "adminId": "b5dbaa96-520f-486c-bf11-c3852ce0566f",
        "city": "Barcelona",
        "collectionId": 7,
        "country": "Spain",
        "description": "Restaurante Comida China",
        "email": "info@restaurante.com",
        "favourites": [
            "11285d5c-3511-11ed-a261-0242ac120002"
        ],
        "imgs": [
            "https://images.unsplash.com/photo-1623689048105-a17b1e1936b8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2hpbmElMjBmb29kfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
        ],
        "lat": 41.4082628,
        "long": 2.1353452,
        "phoneNumber": "6363663",
        "placeId": "20d7d6a6-3511-11ed-a261-0242ac120002",
        "placeName": "Restaurante Asiatic YUNLAI",
        "ratings": 125,
        "ratingAverage": 4.5,
        "zipCode": "08027",
        "status": "active",
        "isPopularThisWeek": True,
        "isNovelty": False,
        "hasFreeDelivery": False,
        "hasAlcohol": False,
        "isOpenNow": False,
        "averagePrice": 20.0
    }
]


for d in data:
    payload = {
        "fields": {
            "address": {
                "stringValue": d["address"]
            },
            "adminId": {
                "stringValue": d["adminId"]
            },
            "city": {
                "stringValue": d["city"]
            },
            "collectionId": {
                "integerValue": d["collectionId"]
            },
            "country": {
                "stringValue": d["country"]
            },
            "description": {
                "stringValue": d["description"]
            },
            "email": {
                "stringValue": d["email"]
            },
            "favourites": {
                "arrayValue": {
                    "values": []
                }
            },
            "imgs": {
                "arrayValue": {
                    "values": []
                }
            },
            "lat": {
                "doubleValue": d["lat"]
            },
            "long": {
                "doubleValue": d["long"]
            },
            "phoneNumber": {
                "stringValue": d["phoneNumber"]
            },
            "placeId": {
                "stringValue": d["placeId"]
            },
            "placeName": {
                "stringValue": d["placeName"]
            },
            "ratings": {
                "integerValue": d["ratings"]
            },
            "ratingAverage": {
                "doubleValue": d["ratingAverage"]
            },
            "zipCode": {
                "stringValue": d["zipCode"]
            },
            "status": {
                "stringValue": d["status"]
            },
            "isPopularThisWeek": {
                "booleanValue": d["isPopularThisWeek"]
            },
            "isNovelty": {
                "booleanValue": d["isNovelty"]
            },
            "hasFreeDelivery": {
                "booleanValue": d["hasFreeDelivery"]
            },
            "hasAlcohol": {
                "booleanValue": d["hasAlcohol"]
            },
            "isOpenNow": {
                "booleanValue": d["isOpenNow"]
            },
            "averagePrice": {
                "doubleValue": d["averagePrice"]
            },
        }
    }

    for f in d["favourites"]:
        payload["fields"]["favourites"]["arrayValue"]["values"].append({"stringValue": f})

    for i in d["imgs"]:
        payload["fields"]["imgs"]["arrayValue"]["values"].append({"stringValue": i})
    
    url = "https://firestore.googleapis.com/v1/projects/delivery-app-f0e5b/databases/(default)/documents/places/"

    params = {
        "documentId": d["placeId"]
    }

    response = requests.request("POST", url, json=payload, params=params)

    print(response.text)