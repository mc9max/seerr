# Seerr

Request and discover movies & TV shows for your Jellyfin, Plex, or Emby library — from one clean web interface. Seerr is the community successor to Overseerr and Jellyseerr: search, request, manage, and get notified, all self-hosted.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.com/deploy/seerr?utm_campaign=seerr)

## Deploy and Host

One click. No variables to configure. Railway provisions a single service with a 1 GB `/app/config` volume and starts Seerr. Open the public URL and run the setup wizard.

- **Runtime** — Node.js, single container, SQLite (no external database).
- **Memory** — light: ~200–400 MB at rest. Fits comfortably on Railway Hobby.
- **Port** — 5055 (baked into the Docker wrapper).
- **Persistence** — the SQLite database and all settings live in `/app/config` on the volume. Survives redeploys and restarts.
- **Public URL** — auto-assigned by Railway on deploy.

## Why Deploy

- **Sticky by design.** Once your request workflow lives in Seerr, the whole household uses it daily.
- **Always-on metadata sync.** Library syncs and notification checks run on a schedule — the kind of steady usage Railway is built for.
- **No database to manage.** SQLite is embedded; the template wires nothing external.
- **Jellyfin / Plex / Emby native.** Connects to any of the three; 4K-aware requests included.

## Common Use Cases

- **Family media requests** — let everyone request movies and shows without touching the server.
- **Discovery** — browse trending and upcoming titles with rich metadata.
- **Approval workflow** — approve or auto-approve requests, with per-user quotas.
- **Notifications** — webhook, Discord, Telegram, email, and more when requests complete.
- **Companion to *arr apps** — pairs with Sonarr/Radarr for automatic fulfillment.

### Deployment Dependencies

- **Railway Hobby or above** — 512 MB RAM is plenty.
- **1 GB volume** included for the database and settings.

## First-run setup

Open your Railway public URL and follow the setup wizard: create the admin account, then connect Jellyfin, Plex, or Emby. No IP restrictions, no CLI needed.

## Troubleshooting

- **Setup wizard not appearing** — give the container ~60s on first boot; the Node server starts fast but the healthcheck needs one passing check.
- **Settings vanished after a redeploy** — the `/app/config` volume must stay attached to the service; check the Volumes tab.
- **Can't reach Jellyfin/Plex** — Seerr must reach your media server over the network; for servers outside Railway, use their public URL.

## License

Upstream [Seerr](https://github.com/seerr-team/seerr) is MIT-licensed. This template's wrapper Dockerfile and config are provided as-is.
