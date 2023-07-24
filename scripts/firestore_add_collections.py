import requests

data = [
    {
        "img": "https://image.freepik.com/foto-gratis/alitas-pollo-al-horno-al-estilo-asiatico_2829-10159.jpg",
        "name": "Americana",
        "id": 5
    },
    {
        "img": "https://image.freepik.com/foto-gratis/falafel-hummus-pita-platos-oriente-medio-o-arabe-comida-halal-vista-superior-copia-espacio_2829-14288.jpg",
        "name": "Árabe",
        "id": 9
    },
    {
        "img": "https://image.freepik.com/foto-gratis/arreglo-conceptual-delicioso-alfajores_23-2148777349.jpg",
        "name": "Argentina",
        "id": 10
    },
    {
        "img": "https://image.freepik.com/foto-gratis/arreglo-deliciosos-chips-yuca_23-2149091056.jpg",
        "name": "Brasileña",
        "id": 13
    },
    {
        "img": "https://image.freepik.com/foto-gratis/cafe-croissants-desayuno_23-2148877588.jpg",
        "name": "Desayuno",
        "id": 16
    },
    {
        "img": "https://image.freepik.com/foto-gratis/frutas-tabla-cortar_140725-100.jpg",
        "name": "Caribeña",
        "id": 14
    },
    {
        "img": "https://image.freepik.com/foto-gratis/salteado-pollo-calabacin-pimientos-cebolla-verde-palillos_2829-10785.jpg",
        "name": "China",
        "id": 7
    },
    {
        "img": "https://image.freepik.com/foto-gratis/delicioso-pastel-ciruelas-frescas-frambuesas_2829-5473.jpg",
        "name": "Por ti mismo/a",
        "id": 15
    },
    {
        "img": "https://image.freepik.com/foto-gratis/ingredientes-mexicanos-colores_23-2148224164.jpg",
        "name": "Ecuatoriana",
        "id": 17
    },
    {
        "img": "https://image.freepik.com/foto-gratis/empanadas-carne-masa-bougie-tabla-madera_140725-4827.jpg",
        "name": "Empanadas",
        "id": 18
    },
    {
        "img": "https://image.freepik.com/foto-gratis/chef-colocando-hierba-comida-gourmet_23-2148516908.jpg",
        "name": "Gourmet",
        "id": 2
    },
    {
        "img": "https://image.freepik.com/foto-gratis/ensalada-griega-pepino-tomate-pimiento-dulce-lechuga-cebolla-verde-queso-feta-aceitunas-aceite-oliva-comida-sana-vista-superior_2829-19685.jpg",
        "name": "Griego",
        "id": 20
    },
    {
        "img": "https://image.freepik.com/foto-gratis/gajar-halwa-tambien-conocido-como-gajorer-halua-gajrela-gajar-pak-zanahoria-halwa-es-pudin-postre-dulce-base-zanahoria-subcontinente-indio_466689-75509.jpg",
        "name": "Halal",
        "id": 21
    },
    {
        "img": "https://image.freepik.com/foto-gratis/sandwich-grande-hamburguesa-jugosa-hamburguesa-ternera-queso-tomate-cebolla-roja-mesa-madera_2829-19631.jpg",
        "name": "Hamburguesa",
        "id": 22
    },
    {
        "img": "https://image.freepik.com/foto-gratis/tazon-postre-helado-chocolate-vainilla-cerrar_53876-106080.jpg",
        "name": "Heladería",
        "id": 23
    },
    {
        "img": "https://image.freepik.com/foto-gratis/hermoso-sabroso-apetitosos-ingredientes-especias-red-chilli-pepper-mercearia-cocinar-cocina-saludable_1220-1676.jpg",
        "name": "India",
        "id": 24
    },
    {
        "img": "https://image.freepik.com/foto-gratis/concepto-cocina-ingredientes-cocinar_1220-5184.jpg",
        "name": "Italiana",
        "id": 4
    },
    {
        "img": "https://image.freepik.com/foto-gratis/sushi-set-hot-rolls-aguacate-california-rollos-salmon_141793-1279.jpg",
        "name": "Japonesa",
        "id": 25
    },
    {
        "img": "https://image.freepik.com/foto-gratis/vista-lateral-doner-salsa-tomate-carne-pepino-papas-fritas-tablero_141793-4882.jpg",
        "name": "Kebab",
        "id": 26
    },
    {
        "img": "https://image.freepik.com/foto-gratis/postres-tradicionales-orientales-mesa_93675-131751.jpg",
        "name": "Libanés",
        "id": 27
    },
    {
        "img": "https://image.freepik.com/foto-gratis/aceitunas-verdes-aceite_144627-26921.jpg",
        "name": "Mediterranea",
        "id": 29
    },
    {
        "img": "https://image.freepik.com/foto-gratis/plato-nachos-salsa-salsa_23-2148181586.jpg",
        "name": "Mexicana",
        "id": 6
    },
    {
        "img": "https://image.freepik.com/foto-gratis/tajine-platos-tradicionales-cuscus-ensalada-fresca-mesa-madera-rustica-tagine-carne-cordero-calabaza-vista-superior-lay-flat_2829-6116.jpg",
        "name": "Marroquí",
        "id": 28
    },
    {
        "img": "https://image.freepik.com/foto-gratis/vista-superior-pizza-pepperoni-salchichas-salsa-tomate-queso-chispas-hierbas_140725-652.jpg",
        "name": "Pizza",
        "id": 8
    },
    {
        "img": "https://static6.depositphotos.com/1059850/588/v/600/depositphotos_5884100-stock-illustration-promo-background.jpg",
        "name": "Promo",
        "id": 1
    },
    {
        "img": "https://image.freepik.com/foto-gratis/paella-espanola-mariscos-mejillones-camarones-etc-paellera-acero-canarias-cocina-pequeno-restaurante-familiar_1217-1763.jpg",
        "name": "Arroces",
        "id": 11
    },
    {
        "img": "https://image.freepik.com/foto-gratis/cerveza-bocadillos_144627-36555.jpg",
        "name": "Snack",
        "id": 12
    },
    {
        "img": "https://image.freepik.com/foto-gratis/sabrosa-paella-espanola-marisco_1205-8950.jpg",
        "name": "Española",
        "id": 19
    },
    {
        "img": "https://image.freepik.com/foto-gratis/tortilla-envuelta-falafel-ensalada-fresca-tacos-veganos-comida-vegetariana-saludable-vista-superior_2829-14371.jpg",
        "name": "Turca",
        "id": 3
    },
    {
        "img": "https://image.freepik.com/foto-gratis/menu-dietetico-ensalada-vegana-saludable-verduras-brocoli-champinones-espinacas-quinua-tazon-endecha-plana-vista-superior_2829-20115.jpg",
        "name": "Vegana",
        "id": 30
    }
]


for d in data:
    payload = {
        "fields": {
            "img": {
                "stringValue": d["img"]
            },
            "name": {
                "stringValue": d["name"]
            },
            "id": {
                "integerValue": d["id"]
            },
        }
    }
    
    url = "https://firestore.googleapis.com/v1/projects/delivery-app-f0e5b/databases/(default)/documents/collections/"

    params = {
        "documentId": d["id"]
    }

    response = requests.request("POST", url, json=payload, params=params)

    print(response.text)