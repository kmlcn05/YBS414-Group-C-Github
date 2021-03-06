PGDMP         3                y            mydb2    11.11    14.0      ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16582    mydb2    DATABASE     i   CREATE DATABASE mydb2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE mydb2;
                kemal    false            ?            1259    16596    EmployeeApp_departments    TABLE     ?   CREATE TABLE public."EmployeeApp_departments" (
    "DepartmentId" integer NOT NULL,
    "DepartmentName" character varying(500) NOT NULL
);
 -   DROP TABLE public."EmployeeApp_departments";
       public            kemal    false            ?            1259    16594 (   EmployeeApp_departments_DepartmentId_seq    SEQUENCE     ?   CREATE SEQUENCE public."EmployeeApp_departments_DepartmentId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public."EmployeeApp_departments_DepartmentId_seq";
       public          kemal    false    203            ?           0    0 (   EmployeeApp_departments_DepartmentId_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public."EmployeeApp_departments_DepartmentId_seq" OWNED BY public."EmployeeApp_departments"."DepartmentId";
          public          kemal    false    202            ?            1259    16604    EmployeeApp_employees    TABLE       CREATE TABLE public."EmployeeApp_employees" (
    "EmployeeId" integer NOT NULL,
    "EmployeeName" character varying(500) NOT NULL,
    "Department" character varying(500) NOT NULL,
    "DateOfJoining" date NOT NULL,
    "PhotoFileName" character varying(500) NOT NULL
);
 +   DROP TABLE public."EmployeeApp_employees";
       public            kemal    false            ?            1259    16602 $   EmployeeApp_employees_EmployeeId_seq    SEQUENCE     ?   CREATE SEQUENCE public."EmployeeApp_employees_EmployeeId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public."EmployeeApp_employees_EmployeeId_seq";
       public          kemal    false    205            ?           0    0 $   EmployeeApp_employees_EmployeeId_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public."EmployeeApp_employees_EmployeeId_seq" OWNED BY public."EmployeeApp_employees"."EmployeeId";
          public          kemal    false    204            ?            1259    16615    EmployeeApp_users    TABLE     ?   CREATE TABLE public."EmployeeApp_users" (
    "UserId" integer NOT NULL,
    "UserName" character varying(500) NOT NULL,
    "Password" character varying(500) NOT NULL
);
 '   DROP TABLE public."EmployeeApp_users";
       public            kemal    false            ?            1259    16613    EmployeeApp_users_UserId_seq    SEQUENCE     ?   CREATE SEQUENCE public."EmployeeApp_users_UserId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public."EmployeeApp_users_UserId_seq";
       public          kemal    false    207            ?           0    0    EmployeeApp_users_UserId_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public."EmployeeApp_users_UserId_seq" OWNED BY public."EmployeeApp_users"."UserId";
          public          kemal    false    206            ?            1259    16585    django_migrations    TABLE     ?   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public            kemal    false            ?            1259    16583    django_migrations_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          kemal    false    201            ?           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          kemal    false    200                       2604    16599 $   EmployeeApp_departments DepartmentId    DEFAULT     ?   ALTER TABLE ONLY public."EmployeeApp_departments" ALTER COLUMN "DepartmentId" SET DEFAULT nextval('public."EmployeeApp_departments_DepartmentId_seq"'::regclass);
 W   ALTER TABLE public."EmployeeApp_departments" ALTER COLUMN "DepartmentId" DROP DEFAULT;
       public          kemal    false    203    202    203                       2604    16607     EmployeeApp_employees EmployeeId    DEFAULT     ?   ALTER TABLE ONLY public."EmployeeApp_employees" ALTER COLUMN "EmployeeId" SET DEFAULT nextval('public."EmployeeApp_employees_EmployeeId_seq"'::regclass);
 S   ALTER TABLE public."EmployeeApp_employees" ALTER COLUMN "EmployeeId" DROP DEFAULT;
       public          kemal    false    205    204    205                       2604    16618    EmployeeApp_users UserId    DEFAULT     ?   ALTER TABLE ONLY public."EmployeeApp_users" ALTER COLUMN "UserId" SET DEFAULT nextval('public."EmployeeApp_users_UserId_seq"'::regclass);
 K   ALTER TABLE public."EmployeeApp_users" ALTER COLUMN "UserId" DROP DEFAULT;
       public          kemal    false    206    207    207                       2604    16588    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          kemal    false    200    201    201            ?          0    16596    EmployeeApp_departments 
   TABLE DATA           U   COPY public."EmployeeApp_departments" ("DepartmentId", "DepartmentName") FROM stdin;
    public          kemal    false    203   ?&       ?          0    16604    EmployeeApp_employees 
   TABLE DATA              COPY public."EmployeeApp_employees" ("EmployeeId", "EmployeeName", "Department", "DateOfJoining", "PhotoFileName") FROM stdin;
    public          kemal    false    205   ?&       ?          0    16615    EmployeeApp_users 
   TABLE DATA           O   COPY public."EmployeeApp_users" ("UserId", "UserName", "Password") FROM stdin;
    public          kemal    false    207   ?'       ?          0    16585    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          kemal    false    201   ?'       ?           0    0 (   EmployeeApp_departments_DepartmentId_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public."EmployeeApp_departments_DepartmentId_seq"', 22, true);
          public          kemal    false    202            ?           0    0 $   EmployeeApp_employees_EmployeeId_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public."EmployeeApp_employees_EmployeeId_seq"', 21, true);
          public          kemal    false    204            ?           0    0    EmployeeApp_users_UserId_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public."EmployeeApp_users_UserId_seq"', 12, true);
          public          kemal    false    206            ?           0    0    django_migrations_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_migrations_id_seq', 2, true);
          public          kemal    false    200                       2606    16601 4   EmployeeApp_departments EmployeeApp_departments_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public."EmployeeApp_departments"
    ADD CONSTRAINT "EmployeeApp_departments_pkey" PRIMARY KEY ("DepartmentId");
 b   ALTER TABLE ONLY public."EmployeeApp_departments" DROP CONSTRAINT "EmployeeApp_departments_pkey";
       public            kemal    false    203            !           2606    16612 0   EmployeeApp_employees EmployeeApp_employees_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public."EmployeeApp_employees"
    ADD CONSTRAINT "EmployeeApp_employees_pkey" PRIMARY KEY ("EmployeeId");
 ^   ALTER TABLE ONLY public."EmployeeApp_employees" DROP CONSTRAINT "EmployeeApp_employees_pkey";
       public            kemal    false    205            #           2606    16623 (   EmployeeApp_users EmployeeApp_users_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."EmployeeApp_users"
    ADD CONSTRAINT "EmployeeApp_users_pkey" PRIMARY KEY ("UserId");
 V   ALTER TABLE ONLY public."EmployeeApp_users" DROP CONSTRAINT "EmployeeApp_users_pkey";
       public            kemal    false    207                       2606    16593 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            kemal    false    201            ?   J   x?3???2??.-(?/*?2????22?t.-.??M-RJ?I,???+??,?22?tLN?/?+??K?????? {#u      ?   ?   x?}ͻ
?@??z?)|???6??K-m????̲!o?U?-?????z????h?b??KIM??:@O?)Z??H??h8?ǍpV??!?dbx?$??SQC?d?З??۸?L?	?Ʌ??~?F)??tF?      ?   I   x?3?462a.#8??2??N?M??M??&Hls$????1sYr?0???i??Z????!qb???? ?J?      ?   \   x?3?t?-?ɯLMu,(?4000????,?L??4202?54?52V0??26?21?3705?0?60?2B?h_Z?ZT?E????????!H[? 0/?     