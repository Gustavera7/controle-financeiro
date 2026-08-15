-- Meu Dinheiro — esquema do Supabase
-- Cole este bloco inteiro em: Supabase Dashboard → SQL Editor → Run.
-- Cria a tabela de estado por usuário com Row Level Security:
-- cada usuário só lê e escreve o próprio registro.

create table if not exists public.app_state (
  user_id uuid primary key references auth.users (id) on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.app_state enable row level security;

drop policy if exists "own state" on public.app_state;
create policy "own state" on public.app_state
  for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
