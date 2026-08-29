-- Configuración de AMADA en Supabase
-- Pegá TODO este código en: SQL Editor → New query → Run

-- Tabla que guarda los datos de la tienda (una fila por usuario)
create table if not exists tienda (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

-- Seguridad: cada usuario solo puede ver y tocar SUS datos
alter table tienda enable row level security;

create policy "el propietario lee sus datos"
  on tienda for select using (auth.uid() = user_id);

create policy "el propietario crea sus datos"
  on tienda for insert with check (auth.uid() = user_id);

create policy "el propietario actualiza sus datos"
  on tienda for update using (auth.uid() = user_id);
