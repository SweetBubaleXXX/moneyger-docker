## Configuration

These variables must be present in your `.env` file:

- [`SECRET_KEY`](https://docs.djangoproject.com/en/4.2/ref/settings/#secret-key)
- [`ALLOWED_HOSTS`](https://docs.djangoproject.com/en/4.2/ref/settings/#secret-key)
- `POSTGRES_PASSWORD`
- `REDIS_PASSWORD`

Optional variables:

- [`EMAIL_CONFIG`](https://django-environ.readthedocs.io/en/latest/types.html#environ-env-search-url)
- `CORS_ALLOW_ALL_ORIGINS` *boolean*
- `CORS_ALLOWED_ORIGINS` *list*
- `CSRF_TRUSTED_ORIGINS` *list*
- `XFF_TRUSTED_PROXY_DEPTH` *number*, must be greater than 1
- `AUTH_COOKIE_SECURE` *boolean*
- `AUTH_COOKIE_HTTP_ONLY` *boolean*
- `AUTH_COOKIE_SAMESITE`
- `ALFA_BANK_NATIONAL_RATES_URL`

## Usage

Start services:

```bash
docker compose up -d
```

Once containers are created, you need to apply migrations and collect static files:

```bash
docker compose exec api python manage.py migrate
```

```bash
docker compose exec api python manage.py collectstatic
```

## Notes

To make server able to determine host, port and protocol, the following headers must be added by your proxy:

- [`X-Forwarded-Host`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Forwarded-Host)
- `X-Forwarded-Server`
- [`X-Forwarded-Proto`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Forwarded-Proto)
