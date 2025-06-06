let json = """
{
  "created": {
    "$date": 1686654720000
  },
  "expires_in_seconds": 60,
  "filtering": {
    "filters": []
  },
  "how_search_works_link": {
    "target": "how_search_works",
    "target_sort": null,
    "target_title": null,
    "telemetry_object_id": "search-info-link",
    "title": "How search works",
    "type": "link",
    "view_name": "search-info"
  },
  "how_search_works_url": "https://example.com/how-search-works",
  "name": "Restaurants",
  "page_title": "Food delivery in Helsinki",
  "sections": [
    {
      "name": "restaurants_page_categories",
      "title": "Browse categories",
      "items": [
        {
          "title": "Salad",
          "content_id": "cat1",
          "image": {
            "blurhash": "abc123",
            "url": "https://example.com/images/salad.jpg"
          }
        },
        {
          "title": "Burgers",
          "content_id": "cat2",
          "image": {
            "blurhash": "def456",
            "url": "https://example.com/images/burgers.jpg"
          }
        }
      ]
    },
    {
      "name": "popular_venues",
      "title": "Popular Near You",
      "items": [
        {
          "image": {
            "blurhash": "aaa111",
            "url": "https://example.com/images/pizza.jpg"
          },
          "title": "Pizza Place",
          "track_id": "track-pizza",
          "template": "venue-large",
          "overlay": "Open",
          "overlay_v2": {
            "icon": "clock",
            "primary_text": "Order now",
            "secondary_text": "Closes at 22:00",
            "telemetry_status": "open",
            "variant": "footer"
          },
          "sorting": {
            "sortables": [
              { "id": "rating", "value": 820 },
              { "id": "delivery-price", "value": 300 }
            ]
          },
          "telemetry_object_id": "obj-001",
          "venue": {
            "id": "v1",
            "name": "Pizza Place",
            "short_description": "Freshly baked pizzas",
            "address": "Pizza Blvd 5",
            "country": "FI",
            "currency": "EUR",
            "estimate": 25,
            "estimate_range": "20-30",
            "estimate_box": {
              "title": "20-30",
              "subtitle": "min",
              "template": "estimate"
            },
            "location": [24.935, 60.169],
            "price_range": 2,
            "rating": {
              "rating": 4,
              "score": 9.0,
              "volume": 134
            },
            "brand_image": {
              "url": "https://example.com/brands/pizza.jpg",
              "blurhash": "pizzablur"
            },
            "tags": ["pizza", "italian"],
            "online": true,
            "slug": "pizza-place"
          }
        },
        {
          "image": {
            "blurhash": "bbb222",
            "url": "https://example.com/images/sushi.jpg"
          },
          "title": "Sushi Spot",
          "track_id": "track-sushi",
          "template": "venue-large",
          "overlay": "Temporarily Offline",
          "overlay_v2": {
            "icon": "clock",
            "primary_text": "Opens at 17:00",
            "secondary_text": "Closed now",
            "telemetry_status": "offline",
            "variant": "footer"
          },
          "sorting": {
            "sortables": [
              { "id": "rating", "value": 910 },
              { "id": "delivery-price", "value": 400 }
            ]
          },
          "telemetry_object_id": "obj-002",
          "venue": {
            "id": "v2",
            "name": "Sushi Spot",
            "short_description": "Authentic Japanese sushi",
            "address": "Sushi Ave 10",
            "country": "FI",
            "currency": "EUR",
            "estimate": 35,
            "estimate_range": "30-40",
            "estimate_box": {
              "title": "30-40",
              "subtitle": "min",
              "template": "estimate"
            },
            "location": [24.940, 60.170],
            "price_range": 3,
            "rating": {
              "rating": 5,
              "score": 9.6,
              "volume": 245
            },
            "brand_image": {
              "url": "https://example.com/brands/sushi.jpg",
              "blurhash": "sushiblur"
            },
            "tags": ["sushi", "japanese"],
            "online": false,
            "slug": "sushi-spot"
          }
        }
      ]
    }
  ]
}
"""
