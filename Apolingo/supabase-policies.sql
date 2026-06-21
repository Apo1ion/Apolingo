-- Выполни это в Supabase: SQL Editor -> New query -> Run.
-- Ошибка 42501 / row-level security означает, что anon-ключ видит таблицу,
-- но RLS запрещает SELECT/INSERT в public.users.

alter table public.users enable row level security;

-- Для учебного проекта: разрешить сайту проверять логин+пароль.
drop policy if exists "apolingo_users_select" on public.users;
create policy "apolingo_users_select"
on public.users
for select
to anon
using (true);

-- Для учебного проекта: разрешить регистрацию через сайт.
drop policy if exists "apolingo_users_insert" on public.users;
create policy "apolingo_users_insert"
on public.users
for insert
to anon
with check (true);


-- Разрешить сайту сохранять завершённые уроки пользователя.
drop policy if exists "apolingo_users_update_completed_lessons" on public.users;
create policy "apolingo_users_update_completed_lessons"
on public.users
for update
to anon
using (true)
with check (true);
