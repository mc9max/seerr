# Deploy and Host Seerr with Railway

Seerr is the community successor to Overseerr and Jellyseerr: an open-source media request and discovery manager for Jellyfin, Plex, and Emby. Search for movies and shows, request them, manage approvals, and get notified — all from one clean self-hosted web interface.

## About Hosting Seerr

This template deploys Seerr as a single Railway service from a pinned upstream image (`seerr/seerr` v3.5.0). The app is a lightweight Node.js server with an embedded SQLite database — no external database service needed. A 1 GB Railway volume mounted at `/app/config` holds the database and all settings, so everything survives redeploys and restarts. Railway assigns a public HTTPS URL on deploy; open it and run the setup wizard to create your admin account.

## Why Deploy

- **Sticky daily use.** Once your household's request workflow lives in Seerr, everyone opens it constantly — the definition of a high-retention template.
- **Always-on by nature.** Library syncs, notification checks, and discovery refreshes run on schedules around the clock.
- **Zero database to manage.** SQLite is embedded; the template wires nothing external and costs nothing extra.
- **Jellyfin / Plex / Emby native.** Connects to any of the three media servers, with 4K-aware requests and per-user quotas.

## Common Use Cases

- **Family media requests** — let everyone request movies and shows without touching the server.
- **Discovery** — browse trending and upcoming titles with rich metadata.
- **Approval workflow** — approve requests manually or auto-approve, with per-user quotas.
- **Notifications** — webhook, Discord, Telegram, email, and more when requests complete.
- **Companion to *arr apps** — pairs with Sonarr and Radarr for automatic fulfillment.

## Dependencies for Seerr Hosting

- **Railway account** (Hobby or higher recommended for always-on; ~200–400 MB RAM at rest).
- **1 GB volume** at `/app/config` (provisioned automatically by the template).
- **A Jellyfin, Plex, or Emby server** to connect after setup (your own, reachable over the network).
- **Upstream image** `seerr/seerr` v3.5.0, pinned by digest (MIT-licensed).

### Deployment Dependencies

- Source repository `https://github.com/mc9max/seerr` (Dockerfile wrapper, pinned digest, runs as root so the SQLite database writes to the root-owned volume).
- Railway-provided `PORT` (default 8080) — the app follows it automatically; no variables to configure.
- [Railway health checks](https://docs.railway.com/guides/healthchecks) on `/`.
- [Template best practices](https://docs.railway.com/templates/best-practices)
