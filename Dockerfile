# syntax=docker/dockerfile:1
# =============================================================================
# Railway Template: Seerr  (v1)
# Upstream: https://github.com/seerr-team/seerr  (MIT)
# Image:    seerr/seerr@sha256:27602401178d54f1964442287b9f23f67a3fa2252645ee8065839ea1c3f69e45
#           (pinned 2026-10-12 — upstream v3.5.0, released 2026-09-28)
# =============================================================================
# Why this wrapper:
#   * Upstream runs as USER node:node. Railway mounts persistent volumes
#     root-owned, so the non-root process cannot write the SQLite DB in
#     /app/config -> run as root so the database writes cleanly.
#   * All state (SQLite DB, settings) lives in /app/config — the Railway
#     volume mounts there (railway.json volumeMounts).
#   * Port 5055 baked in. Railway's reverse proxy and external healthcheck
#     both target the EXPOSEd port.
#   * No in-container HEALTHCHECK (no curl/wget guarantee) — Railway's
#     external healthcheck (healthcheckPath="/") runs instead.
#   * Port: Railway injects its own PORT env at runtime (default service port
#     8080), which overrides any Dockerfile ENV. The wrapper therefore does
#     NOT set PORT — it listens on whatever Railway provides, defaulting to
#     8080. Railway's reverse proxy and external healthcheck target the
#     service port (8080).
FROM seerr/seerr@sha256:27602401178d54f1964442287b9f23f67a3fa2252645ee8065839ea1c3f69e45

USER root

EXPOSE 8080

LABEL org.opencontainers.image.source="https://github.com/mc9max/seerr"
LABEL org.opencontainers.image.description="Seerr Railway template"
