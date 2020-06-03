from flask import url_for


def test_urls(client):
    urls = [("home", {"status": "OK"})]
    for url, data in urls:
        res = client.get(url_for(f"api.{url}"))
        assert res.status_code == 200
        assert res.json == data

