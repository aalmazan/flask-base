from flask import url_for


def test_urls(client):
    urls = ["home", "about"]
    for url in urls:
        assert client.get(url_for(f"main.{url}")).status_code == 200
