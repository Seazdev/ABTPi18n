import requests
def test_order_flow(monkeypatch):
    # This is a high-level E2E test that uses a mock exchange endpoint
    base = "http://localhost:8000"
    r = requests.get(f"{base}/health")
    assert r.status_code == 200
    # place a mock order
    payload = {"symbol":"BTCUSDT","side":"buy","qty":0.001}
    r = requests.post(f"{base}/order", json=payload)
    assert r.status_code == 200
    data = r.json()
    assert data.get("status") in ("queued","ok")
