-- Configuración de AMADA en Supabase (versión con código de tienda)
-- Pegá TODO este código en: SQL Editor → New query → botón Run
-- Es seguro correrlo más de una vez.

create table if not exists tiendas (
  store_key uuid primary key,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

-- Nadie puede tocar la tabla directamente…
alter table tiendas enable row level security;

-- …solo a través de estas dos funciones, conociendo el código de tienda:
create or replace function amada_get(k uuid)
returns jsonb
language sql
security definer
set search_path = public
as $$
  select data from tiendas where store_key = k;
$$;

create or replace function amada_set(k uuid, payload jsonb)
returns void
language sql
security definer
set search_path = public
as $$
  insert into tiendas (store_key, data, updated_at)
  values (k, payload, now())
  on conflict (store_key) do update
    set data = excluded.data, updated_at = now();
$$;
