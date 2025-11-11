# Render 3proxy

A minimal HTTP/HTTPS proxy server for Render.com using the community 3proxy Docker image.

## How it works
- Listens on `process.env.PORT` (Render sets this automatically).
- Username and password come from environment variables `PROXY_USER` and `PROXY_PASS`.
- Supports HTTP and HTTPS (CONNECT).

## How to deploy on Render

1. Create a new GitHub repository (e.g. `render-http-proxy`).
2. Upload these files directly to the repository (you can drag and drop on GitHub web UI).
3. On Render:
   - Click **New → Web Service**.
   - Connect your GitHub account and choose your new repo.
   - Select **Environment: Docker**.
   - Build Command: *(leave blank)*
   - Start Command: *(leave blank)*
4. After deployment, go to **Environment** tab and set:
   - `PROXY_USER` = `yourusername`
   - `PROXY_PASS` = `yourpassword`
5. Redeploy.

Once live, connect your Android/PC proxy client:

| Setting | Value |
|----------|--------|
| Type | HTTP (or HTTPS) |
| Host | your-app-name.onrender.com |
| Port | 80 (or 443) |
| Username | your PROXY_USER |
| Password | your PROXY_PASS |

Test with curl:

```bash
curl -x http://user:pass@your-app.onrender.com http://example.com -v
```

---
⚠️ Free tier sleeps after inactivity, so first request may take a few seconds.
