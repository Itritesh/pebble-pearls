-- Run this entirely in your Supabase SQL Editor

-- 1. Create the inventory table
CREATE TABLE IF NOT EXISTS public.inventory (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    name text,
    price numeric,
    "desc" text,
    category text,
    "inStock" boolean,
    images text[],
    "createdAt" bigint
);

-- 2. Create the categories table
CREATE TABLE IF NOT EXISTS public.categories (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    name text,
    "createdAt" bigint
);

-- 3. Create the slides table
CREATE TABLE IF NOT EXISTS public.slides (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    title text,
    subtitle text,
    "desc" text,
    "btnText" text,
    "btnLink" text,
    img text,
    "createdAt" bigint
);

-- 4. Create the cart table
CREATE TABLE IF NOT EXISTS public.cart (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
    name text,
    price numeric,
    img text
);

-- 5. Create the orders table
CREATE TABLE IF NOT EXISTS public.orders (
    id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
    name text,
    email text,
    phone text,
    address text,
    items jsonb,
    total numeric,
    status text,
    "createdAt" bigint
);

-- 6. Disable Row Level Security (RLS) for testing, or set up policies if in production.
-- (By default, tables with RLS disabled allow all access through the anon key)
ALTER TABLE public.inventory DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.categories DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.slides DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.cart DISABLE ROW LEVEL SECURITY;
ALTER TABLE public.orders DISABLE ROW LEVEL SECURITY;

-- 7. Enable Realtime triggers so the live-updates work in your app
ALTER PUBLICATION supabase_realtime ADD TABLE inventory;
ALTER PUBLICATION supabase_realtime ADD TABLE categories;
ALTER PUBLICATION supabase_realtime ADD TABLE slides;
ALTER PUBLICATION supabase_realtime ADD TABLE orders;
ALTER PUBLICATION supabase_realtime ADD TABLE cart;
