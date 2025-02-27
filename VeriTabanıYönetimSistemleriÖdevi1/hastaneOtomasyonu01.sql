PGDMP  !    ;                |            HastaneOtomasyonu    17.2    17.2 b    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16388    HastaneOtomasyonu    DATABASE     �   CREATE DATABASE "HastaneOtomasyonu" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
 #   DROP DATABASE "HastaneOtomasyonu";
                     postgres    false            �            1255    16638 B   hastaekle(bigint, character varying, character varying, character)    FUNCTION     k  CREATE FUNCTION public.hastaekle(tc bigint, ad character varying, soyad character varying, cinsiyet character) RETURNS integer
    LANGUAGE plpgsql
    AS $$ 
BEGIN
    INSERT into "Hasta"("TC","Hasta"."ad","Hasta"."soyad","Hasta"."cinsiyet")
    VALUES(tc,ad,soyad,cinsiyet);
    if found then 
        return 1;
    else 
        return 0;
    end if;
END;
$$;
 n   DROP FUNCTION public.hastaekle(tc bigint, ad character varying, soyad character varying, cinsiyet character);
       public               postgres    false            �            1255    16639    hastasayisiarttir()    FUNCTION     �   CREATE FUNCTION public.hastasayisiarttir() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update public."hastaSayi" set sayi=sayi+1;
return new;
end;
$$;
 *   DROP FUNCTION public.hastasayisiarttir();
       public               postgres    false            �            1255    16640    hastasayisiazalt()    FUNCTION     �   CREATE FUNCTION public.hastasayisiazalt() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update public."hastaSayi" set sayi=sayi-1;
return new;
end;
$$;
 )   DROP FUNCTION public.hastasayisiazalt();
       public               postgres    false            �            1255    16641    ilacsil(character varying)    FUNCTION     �   CREATE FUNCTION public.ilacsil(ilac character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$ 
BEGIN
    DELETE from "Ilac" WHERE "ilacAdi" = ilac;
    if found then 
        return 1;
    else 
        return 0;
    end if;
END;
$$;
 6   DROP FUNCTION public.ilacsil(ilac character varying);
       public               postgres    false            �            1255    16642 !   maasode(integer, bigint, integer)    FUNCTION     �   CREATE FUNCTION public.maasode(miktar integer, tc bigint, mesai integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
begin
	INSERT into "Maas" ("miktar", "personelTC", "mesai")
    VALUES(miktar,tc, mesai);
	
	
end;
$$;
 H   DROP FUNCTION public.maasode(miktar integer, tc bigint, mesai integer);
       public               postgres    false            �            1255    16643    randevusayisiarttir()    FUNCTION     �   CREATE FUNCTION public.randevusayisiarttir() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update public."randevuSayi" set sayi=sayi+1;
return new;
end;
$$;
 ,   DROP FUNCTION public.randevusayisiarttir();
       public               postgres    false            �            1255    16644    recetesayisiarttir()    FUNCTION     �   CREATE FUNCTION public.recetesayisiarttir() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update public."receteSayi" set sayi=sayi+1;
return new;
end;
$$;
 +   DROP FUNCTION public.recetesayisiarttir();
       public               postgres    false            �            1255    16645    toplammaas()    FUNCTION     �   CREATE FUNCTION public.toplammaas() RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
	toplam integer;
begin
	toplam:=(select sum("miktar") from "Maas");
	return toplam;
end;
$$;
 #   DROP FUNCTION public.toplammaas();
       public               postgres    false            �            1255    16646    toplammesai()    FUNCTION     �   CREATE FUNCTION public.toplammesai() RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
	toplam integer;
begin
	toplam:=(select sum(mesai) from "Maas");
	return toplam;
end;
$$;
 $   DROP FUNCTION public.toplammesai();
       public               postgres    false            �            1259    16647    Ameliyathane    TABLE     i   CREATE TABLE public."Ameliyathane" (
    "ameliyathaneNo" integer NOT NULL,
    "ameliyatTarihi" date
);
 "   DROP TABLE public."Ameliyathane";
       public         heap r       postgres    false            �            1259    16650    Hasta    TABLE     �   CREATE TABLE public."Hasta" (
    "TC" bigint NOT NULL,
    ad character varying,
    soyad character varying,
    sifre character varying,
    cinsiyet character(1),
    telno integer
);
    DROP TABLE public."Hasta";
       public         heap r       postgres    false            �            1259    16655    Hastane    TABLE     �   CREATE TABLE public."Hastane" (
    "hastaneNo" integer NOT NULL,
    "hastaneAdi" character varying,
    "odaSayisi" integer
);
    DROP TABLE public."Hastane";
       public         heap r       postgres    false            �            1259    16660 
   HastaneMal    TABLE        CREATE TABLE public."HastaneMal" (
    "malzemeId" integer NOT NULL,
    "malzemeAdi" character varying,
    miktar integer
);
     DROP TABLE public."HastaneMal";
       public         heap r       postgres    false            �            1259    16665    Ilac    TABLE     _   CREATE TABLE public."Ilac" (
    "ilacId" integer NOT NULL,
    "ilacAdi" character varying
);
    DROP TABLE public."Ilac";
       public         heap r       postgres    false            �            1259    16670    Klinik    TABLE     e   CREATE TABLE public."Klinik" (
    "klinikNo" integer NOT NULL,
    "klinikAdi" character varying
);
    DROP TABLE public."Klinik";
       public         heap r       postgres    false            �            1259    16675    Maas    TABLE        CREATE TABLE public."Maas" (
    "ucretNo" integer NOT NULL,
    miktar integer,
    "personelTC" bigint,
    mesai integer
);
    DROP TABLE public."Maas";
       public         heap r       postgres    false            �            1259    16678    Muayene    TABLE     q   CREATE TABLE public."Muayene" (
    "muayeneNo" integer NOT NULL,
    "hastaTC" bigint,
    "doktorTC" bigint
);
    DROP TABLE public."Muayene";
       public         heap r       postgres    false            �            1259    16681    Muayene_muayeneNo_seq    SEQUENCE     �   CREATE SEQUENCE public."Muayene_muayeneNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Muayene_muayeneNo_seq";
       public               postgres    false    224            �           0    0    Muayene_muayeneNo_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Muayene_muayeneNo_seq" OWNED BY public."Muayene"."muayeneNo";
          public               postgres    false    225            �            1259    16682    Nakil    TABLE     V   CREATE TABLE public."Nakil" (
    "nakilId" integer NOT NULL,
    "hastaTC" bigint
);
    DROP TABLE public."Nakil";
       public         heap r       postgres    false            �            1259    16685    Personel    TABLE     �   CREATE TABLE public."Personel" (
    "TC" bigint NOT NULL,
    ad character varying,
    soyad character varying,
    sifre character varying,
    mesai integer,
    durum character varying,
    "klinikNo" integer
);
    DROP TABLE public."Personel";
       public         heap r       postgres    false            �            1259    16690    Randevu    TABLE     s   CREATE TABLE public."Randevu" (
    "randevuNo" integer NOT NULL,
    "hastaTC" bigint,
    "randevuTarih" date
);
    DROP TABLE public."Randevu";
       public         heap r       postgres    false            �            1259    16693    Randevu_randevuNo_seq    SEQUENCE     �   CREATE SEQUENCE public."Randevu_randevuNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Randevu_randevuNo_seq";
       public               postgres    false    228            �           0    0    Randevu_randevuNo_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Randevu_randevuNo_seq" OWNED BY public."Randevu"."randevuNo";
          public               postgres    false    229            �            1259    16694    Recete    TABLE     �   CREATE TABLE public."Recete" (
    "receteNo" integer NOT NULL,
    "doktorTC" bigint,
    "hastaTC" bigint,
    "ilacId" integer
);
    DROP TABLE public."Recete";
       public         heap r       postgres    false            �            1259    16697    Recete_Ilac    TABLE     f   CREATE TABLE public."Recete_Ilac" (
    "ilacId" integer NOT NULL,
    "receteNo" integer NOT NULL
);
 !   DROP TABLE public."Recete_Ilac";
       public         heap r       postgres    false            �            1259    16700    TaburcuOlanlar    TABLE     a   CREATE TABLE public."TaburcuOlanlar" (
    "taburcuId" integer NOT NULL,
    "hastaTC" bigint
);
 $   DROP TABLE public."TaburcuOlanlar";
       public         heap r       postgres    false            �            1259    16703    TaburcuOlanlar_taburcuId_seq    SEQUENCE     �   CREATE SEQUENCE public."TaburcuOlanlar_taburcuId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public."TaburcuOlanlar_taburcuId_seq";
       public               postgres    false    232            �           0    0    TaburcuOlanlar_taburcuId_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public."TaburcuOlanlar_taburcuId_seq" OWNED BY public."TaburcuOlanlar"."taburcuId";
          public               postgres    false    233            �            1259    16704    YatanHastalar    TABLE     �   CREATE TABLE public."YatanHastalar" (
    "yatanNo" integer NOT NULL,
    "klinikNo" integer,
    "yatisTarihi" date,
    "hastaTC" bigint
);
 #   DROP TABLE public."YatanHastalar";
       public         heap r       postgres    false            �            1259    16707    YatanHastalar_yatanNo_seq    SEQUENCE     �   CREATE SEQUENCE public."YatanHastalar_yatanNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."YatanHastalar_yatanNo_seq";
       public               postgres    false    234            �           0    0    YatanHastalar_yatanNo_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."YatanHastalar_yatanNo_seq" OWNED BY public."YatanHastalar"."yatanNo";
          public               postgres    false    235            �            1259    16708 	   hastaSayi    TABLE     6   CREATE TABLE public."hastaSayi" (
    sayi integer
);
    DROP TABLE public."hastaSayi";
       public         heap r       postgres    false            �            1259    16711    randevuSayi    TABLE     8   CREATE TABLE public."randevuSayi" (
    sayi integer
);
 !   DROP TABLE public."randevuSayi";
       public         heap r       postgres    false            �            1259    16714 
   receteSayi    TABLE     7   CREATE TABLE public."receteSayi" (
    sayi integer
);
     DROP TABLE public."receteSayi";
       public         heap r       postgres    false            �           2604    16717    Muayene muayeneNo    DEFAULT     |   ALTER TABLE ONLY public."Muayene" ALTER COLUMN "muayeneNo" SET DEFAULT nextval('public."Muayene_muayeneNo_seq"'::regclass);
 D   ALTER TABLE public."Muayene" ALTER COLUMN "muayeneNo" DROP DEFAULT;
       public               postgres    false    225    224            �           2604    16718    Randevu randevuNo    DEFAULT     |   ALTER TABLE ONLY public."Randevu" ALTER COLUMN "randevuNo" SET DEFAULT nextval('public."Randevu_randevuNo_seq"'::regclass);
 D   ALTER TABLE public."Randevu" ALTER COLUMN "randevuNo" DROP DEFAULT;
       public               postgres    false    229    228            �           2604    16719    TaburcuOlanlar taburcuId    DEFAULT     �   ALTER TABLE ONLY public."TaburcuOlanlar" ALTER COLUMN "taburcuId" SET DEFAULT nextval('public."TaburcuOlanlar_taburcuId_seq"'::regclass);
 K   ALTER TABLE public."TaburcuOlanlar" ALTER COLUMN "taburcuId" DROP DEFAULT;
       public               postgres    false    233    232            �           2604    16720    YatanHastalar yatanNo    DEFAULT     �   ALTER TABLE ONLY public."YatanHastalar" ALTER COLUMN "yatanNo" SET DEFAULT nextval('public."YatanHastalar_yatanNo_seq"'::regclass);
 H   ALTER TABLE public."YatanHastalar" ALTER COLUMN "yatanNo" DROP DEFAULT;
       public               postgres    false    235    234            l          0    16647    Ameliyathane 
   TABLE DATA           L   COPY public."Ameliyathane" ("ameliyathaneNo", "ameliyatTarihi") FROM stdin;
    public               postgres    false    217   *v       m          0    16650    Hasta 
   TABLE DATA           J   COPY public."Hasta" ("TC", ad, soyad, sifre, cinsiyet, telno) FROM stdin;
    public               postgres    false    218   bv       n          0    16655    Hastane 
   TABLE DATA           K   COPY public."Hastane" ("hastaneNo", "hastaneAdi", "odaSayisi") FROM stdin;
    public               postgres    false    219   �w       o          0    16660 
   HastaneMal 
   TABLE DATA           I   COPY public."HastaneMal" ("malzemeId", "malzemeAdi", miktar) FROM stdin;
    public               postgres    false    220   �w       p          0    16665    Ilac 
   TABLE DATA           5   COPY public."Ilac" ("ilacId", "ilacAdi") FROM stdin;
    public               postgres    false    221   x       q          0    16670    Klinik 
   TABLE DATA           ;   COPY public."Klinik" ("klinikNo", "klinikAdi") FROM stdin;
    public               postgres    false    222   qx       r          0    16675    Maas 
   TABLE DATA           H   COPY public."Maas" ("ucretNo", miktar, "personelTC", mesai) FROM stdin;
    public               postgres    false    223   �x       s          0    16678    Muayene 
   TABLE DATA           G   COPY public."Muayene" ("muayeneNo", "hastaTC", "doktorTC") FROM stdin;
    public               postgres    false    224   y       u          0    16682    Nakil 
   TABLE DATA           7   COPY public."Nakil" ("nakilId", "hastaTC") FROM stdin;
    public               postgres    false    226   Hy       v          0    16685    Personel 
   TABLE DATA           V   COPY public."Personel" ("TC", ad, soyad, sifre, mesai, durum, "klinikNo") FROM stdin;
    public               postgres    false    227   xy       w          0    16690    Randevu 
   TABLE DATA           K   COPY public."Randevu" ("randevuNo", "hastaTC", "randevuTarih") FROM stdin;
    public               postgres    false    228   	z       y          0    16694    Recete 
   TABLE DATA           O   COPY public."Recete" ("receteNo", "doktorTC", "hastaTC", "ilacId") FROM stdin;
    public               postgres    false    230   nz       z          0    16697    Recete_Ilac 
   TABLE DATA           =   COPY public."Recete_Ilac" ("ilacId", "receteNo") FROM stdin;
    public               postgres    false    231   �z       {          0    16700    TaburcuOlanlar 
   TABLE DATA           B   COPY public."TaburcuOlanlar" ("taburcuId", "hastaTC") FROM stdin;
    public               postgres    false    232   �z       }          0    16704    YatanHastalar 
   TABLE DATA           Z   COPY public."YatanHastalar" ("yatanNo", "klinikNo", "yatisTarihi", "hastaTC") FROM stdin;
    public               postgres    false    234   -{                 0    16708 	   hastaSayi 
   TABLE DATA           +   COPY public."hastaSayi" (sayi) FROM stdin;
    public               postgres    false    236   m{       �          0    16711    randevuSayi 
   TABLE DATA           -   COPY public."randevuSayi" (sayi) FROM stdin;
    public               postgres    false    237   �{       �          0    16714 
   receteSayi 
   TABLE DATA           ,   COPY public."receteSayi" (sayi) FROM stdin;
    public               postgres    false    238   �{       �           0    0    Muayene_muayeneNo_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Muayene_muayeneNo_seq"', 2, true);
          public               postgres    false    225            �           0    0    Randevu_randevuNo_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Randevu_randevuNo_seq"', 7, true);
          public               postgres    false    229            �           0    0    TaburcuOlanlar_taburcuId_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."TaburcuOlanlar_taburcuId_seq"', 2, true);
          public               postgres    false    233            �           0    0    YatanHastalar_yatanNo_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."YatanHastalar_yatanNo_seq"', 2, true);
          public               postgres    false    235            �           2606    16722    Ameliyathane Ameliyathane_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Ameliyathane"
    ADD CONSTRAINT "Ameliyathane_pkey" PRIMARY KEY ("ameliyathaneNo");
 L   ALTER TABLE ONLY public."Ameliyathane" DROP CONSTRAINT "Ameliyathane_pkey";
       public                 postgres    false    217            �           2606    16724    Hasta Hasta_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Hasta"
    ADD CONSTRAINT "Hasta_pkey" PRIMARY KEY ("TC");
 >   ALTER TABLE ONLY public."Hasta" DROP CONSTRAINT "Hasta_pkey";
       public                 postgres    false    218            �           2606    16726    HastaneMal HastaneMal_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."HastaneMal"
    ADD CONSTRAINT "HastaneMal_pkey" PRIMARY KEY ("malzemeId");
 H   ALTER TABLE ONLY public."HastaneMal" DROP CONSTRAINT "HastaneMal_pkey";
       public                 postgres    false    220            �           2606    16728    Hastane Hastane_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Hastane"
    ADD CONSTRAINT "Hastane_pkey" PRIMARY KEY ("hastaneNo");
 B   ALTER TABLE ONLY public."Hastane" DROP CONSTRAINT "Hastane_pkey";
       public                 postgres    false    219            �           2606    16730    Ilac Ilac_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Ilac"
    ADD CONSTRAINT "Ilac_pkey" PRIMARY KEY ("ilacId");
 <   ALTER TABLE ONLY public."Ilac" DROP CONSTRAINT "Ilac_pkey";
       public                 postgres    false    221            �           2606    16732    Klinik Klinik_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Klinik"
    ADD CONSTRAINT "Klinik_pkey" PRIMARY KEY ("klinikNo");
 @   ALTER TABLE ONLY public."Klinik" DROP CONSTRAINT "Klinik_pkey";
       public                 postgres    false    222            �           2606    16734    Maas Maas_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public."Maas"
    ADD CONSTRAINT "Maas_pkey" PRIMARY KEY ("ucretNo");
 <   ALTER TABLE ONLY public."Maas" DROP CONSTRAINT "Maas_pkey";
       public                 postgres    false    223            �           2606    16736    Muayene Muayene_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Muayene"
    ADD CONSTRAINT "Muayene_pkey" PRIMARY KEY ("muayeneNo");
 B   ALTER TABLE ONLY public."Muayene" DROP CONSTRAINT "Muayene_pkey";
       public                 postgres    false    224            �           2606    16738    Nakil Nakil_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Nakil"
    ADD CONSTRAINT "Nakil_pkey" PRIMARY KEY ("nakilId");
 >   ALTER TABLE ONLY public."Nakil" DROP CONSTRAINT "Nakil_pkey";
       public                 postgres    false    226            �           2606    16740    Personel Personel_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Personel"
    ADD CONSTRAINT "Personel_pkey" PRIMARY KEY ("TC");
 D   ALTER TABLE ONLY public."Personel" DROP CONSTRAINT "Personel_pkey";
       public                 postgres    false    227            �           2606    16742    Randevu Randevu_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Randevu"
    ADD CONSTRAINT "Randevu_pkey" PRIMARY KEY ("randevuNo");
 B   ALTER TABLE ONLY public."Randevu" DROP CONSTRAINT "Randevu_pkey";
       public                 postgres    false    228            �           2606    16744    Recete_Ilac Recete_Ilac_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."Recete_Ilac"
    ADD CONSTRAINT "Recete_Ilac_pkey" PRIMARY KEY ("ilacId", "receteNo");
 J   ALTER TABLE ONLY public."Recete_Ilac" DROP CONSTRAINT "Recete_Ilac_pkey";
       public                 postgres    false    231    231            �           2606    16746    Recete Recete_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Recete"
    ADD CONSTRAINT "Recete_pkey" PRIMARY KEY ("receteNo");
 @   ALTER TABLE ONLY public."Recete" DROP CONSTRAINT "Recete_pkey";
       public                 postgres    false    230            �           2606    16748 "   TaburcuOlanlar TaburcuOlanlar_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public."TaburcuOlanlar"
    ADD CONSTRAINT "TaburcuOlanlar_pkey" PRIMARY KEY ("taburcuId");
 P   ALTER TABLE ONLY public."TaburcuOlanlar" DROP CONSTRAINT "TaburcuOlanlar_pkey";
       public                 postgres    false    232            �           2606    16750     YatanHastalar YatanHastalar_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public."YatanHastalar"
    ADD CONSTRAINT "YatanHastalar_pkey" PRIMARY KEY ("yatanNo");
 N   ALTER TABLE ONLY public."YatanHastalar" DROP CONSTRAINT "YatanHastalar_pkey";
       public                 postgres    false    234            �           2620    16751    Hasta hastaarttir    TRIGGER     t   CREATE TRIGGER hastaarttir AFTER INSERT ON public."Hasta" FOR EACH ROW EXECUTE FUNCTION public.hastasayisiarttir();
 ,   DROP TRIGGER hastaarttir ON public."Hasta";
       public               postgres    false    218    240            �           2620    16752    Hasta hastaazalt    TRIGGER     r   CREATE TRIGGER hastaazalt AFTER DELETE ON public."Hasta" FOR EACH ROW EXECUTE FUNCTION public.hastasayisiazalt();
 +   DROP TRIGGER hastaazalt ON public."Hasta";
       public               postgres    false    218    241            �           2620    16753    Randevu randevuarttir    TRIGGER     z   CREATE TRIGGER randevuarttir AFTER INSERT ON public."Randevu" FOR EACH ROW EXECUTE FUNCTION public.randevusayisiarttir();
 0   DROP TRIGGER randevuarttir ON public."Randevu";
       public               postgres    false    228    244            �           2620    16754    Recete recetearttir    TRIGGER     w   CREATE TRIGGER recetearttir AFTER INSERT ON public."Recete" FOR EACH ROW EXECUTE FUNCTION public.recetesayisiarttir();
 .   DROP TRIGGER recetearttir ON public."Recete";
       public               postgres    false    245    230            �           2606    16755    Maas Maas_personelTC_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Maas"
    ADD CONSTRAINT "Maas_personelTC_fkey" FOREIGN KEY ("personelTC") REFERENCES public."Personel"("TC");
 G   ALTER TABLE ONLY public."Maas" DROP CONSTRAINT "Maas_personelTC_fkey";
       public               postgres    false    227    4798    223            �           2606    16760    Muayene Muayene_doktorTC_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Muayene"
    ADD CONSTRAINT "Muayene_doktorTC_fkey" FOREIGN KEY ("doktorTC") REFERENCES public."Personel"("TC");
 K   ALTER TABLE ONLY public."Muayene" DROP CONSTRAINT "Muayene_doktorTC_fkey";
       public               postgres    false    227    224    4798            �           2606    16765    Muayene Muayene_hastaTC_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Muayene"
    ADD CONSTRAINT "Muayene_hastaTC_fkey" FOREIGN KEY ("hastaTC") REFERENCES public."Hasta"("TC");
 J   ALTER TABLE ONLY public."Muayene" DROP CONSTRAINT "Muayene_hastaTC_fkey";
       public               postgres    false    218    224    4782            �           2606    16770    Nakil Nakil_hastaTC_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Nakil"
    ADD CONSTRAINT "Nakil_hastaTC_fkey" FOREIGN KEY ("hastaTC") REFERENCES public."Hasta"("TC");
 F   ALTER TABLE ONLY public."Nakil" DROP CONSTRAINT "Nakil_hastaTC_fkey";
       public               postgres    false    226    4782    218            �           2606    16775    Personel Personel_klinikNo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Personel"
    ADD CONSTRAINT "Personel_klinikNo_fkey" FOREIGN KEY ("klinikNo") REFERENCES public."Klinik"("klinikNo");
 M   ALTER TABLE ONLY public."Personel" DROP CONSTRAINT "Personel_klinikNo_fkey";
       public               postgres    false    222    4790    227            �           2606    16780    Randevu Randevu_hastaTC_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Randevu"
    ADD CONSTRAINT "Randevu_hastaTC_fkey" FOREIGN KEY ("hastaTC") REFERENCES public."Hasta"("TC");
 J   ALTER TABLE ONLY public."Randevu" DROP CONSTRAINT "Randevu_hastaTC_fkey";
       public               postgres    false    4782    228    218            �           2606    16785 #   Recete_Ilac Recete_Ilac_ilacId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Recete_Ilac"
    ADD CONSTRAINT "Recete_Ilac_ilacId_fkey" FOREIGN KEY ("ilacId") REFERENCES public."Ilac"("ilacId");
 Q   ALTER TABLE ONLY public."Recete_Ilac" DROP CONSTRAINT "Recete_Ilac_ilacId_fkey";
       public               postgres    false    221    4788    231            �           2606    16790 %   Recete_Ilac Recete_Ilac_receteNo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Recete_Ilac"
    ADD CONSTRAINT "Recete_Ilac_receteNo_fkey" FOREIGN KEY ("receteNo") REFERENCES public."Recete"("receteNo");
 S   ALTER TABLE ONLY public."Recete_Ilac" DROP CONSTRAINT "Recete_Ilac_receteNo_fkey";
       public               postgres    false    231    230    4802            �           2606    16795    Recete Recete_doktorTC_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Recete"
    ADD CONSTRAINT "Recete_doktorTC_fkey" FOREIGN KEY ("doktorTC") REFERENCES public."Personel"("TC");
 I   ALTER TABLE ONLY public."Recete" DROP CONSTRAINT "Recete_doktorTC_fkey";
       public               postgres    false    227    4798    230            �           2606    16800    Recete Recete_hastaTC_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Recete"
    ADD CONSTRAINT "Recete_hastaTC_fkey" FOREIGN KEY ("hastaTC") REFERENCES public."Hasta"("TC");
 H   ALTER TABLE ONLY public."Recete" DROP CONSTRAINT "Recete_hastaTC_fkey";
       public               postgres    false    230    4782    218            �           2606    16805    Recete Recete_ilacId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Recete"
    ADD CONSTRAINT "Recete_ilacId_fkey" FOREIGN KEY ("ilacId") REFERENCES public."Ilac"("ilacId");
 G   ALTER TABLE ONLY public."Recete" DROP CONSTRAINT "Recete_ilacId_fkey";
       public               postgres    false    4788    230    221            �           2606    16810 *   TaburcuOlanlar TaburcuOlanlar_hastaTC_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."TaburcuOlanlar"
    ADD CONSTRAINT "TaburcuOlanlar_hastaTC_fkey" FOREIGN KEY ("hastaTC") REFERENCES public."Hasta"("TC");
 X   ALTER TABLE ONLY public."TaburcuOlanlar" DROP CONSTRAINT "TaburcuOlanlar_hastaTC_fkey";
       public               postgres    false    4782    218    232            �           2606    16815 (   YatanHastalar YatanHastalar_hastaTC_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."YatanHastalar"
    ADD CONSTRAINT "YatanHastalar_hastaTC_fkey" FOREIGN KEY ("hastaTC") REFERENCES public."Hasta"("TC");
 V   ALTER TABLE ONLY public."YatanHastalar" DROP CONSTRAINT "YatanHastalar_hastaTC_fkey";
       public               postgres    false    4782    218    234            �           2606    16820 )   YatanHastalar YatanHastalar_klinikNo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."YatanHastalar"
    ADD CONSTRAINT "YatanHastalar_klinikNo_fkey" FOREIGN KEY ("klinikNo") REFERENCES public."Klinik"("klinikNo");
 W   ALTER TABLE ONLY public."YatanHastalar" DROP CONSTRAINT "YatanHastalar_klinikNo_fkey";
       public               postgres    false    222    4790    234            l   (   x�3�4202�54�50�2�sM��Ac]s'F��� ��7      m     x�]�=O1�gߏA�p�d���*K�.��}�rt�?CG�.L����0�kO��<~�Ri4�����ubOo�-p"l�91��K�w�ị@�2����F�
e�P�{Α�7GJ�����Y�VjX���}�>ېYu�s<S=<�2fNRPq�2�n�yX�.����gj·�����y�u·԰��*�X�6q<��e$$�x5��B
m	Q��M�X���uf9���a�C��M�׭������8|]�P8"E��k/���(�^ps�      n   *   x�3��,K,V�+�-�KU�H,.I�K-��455������ ��	�      o   A   x�3�L�I�,K��440�2��M,�N�M��9SR�R��R�K�8�L�L8sK�9M�
c���� �C�      p   R   x��9�0���$q��ƀ��ÑC$��v�%.�\BG�Oy�GO�M:4�ɍ�x�1��E.��.�8��"	�j5cm �+�K      q   J   x�3��.�I�VH*-*�SH�?2?��ˈ3%��|.cΔČ̜��T.��Լ���Ԣ"��)gvbNW� ��      r   8   x�eȱ  ����Awq�9��3e(S��<f����הT�k�X�VɐR��ܒ|      s   %   x�3�4426153��44Ebp!�̐؆\1z\\\ 1�
H      u       x�3�4426153��44�2B�q��qqq eO�      v   �   x�M�A
�0F����H&�$�.nihc��.����3)n���Sw%jVl�*�y�~u^@�N����]^��ED���~f-��G	�=7E�kiǇ�=��;�.Eb�L�`�k>\@:����
k,�      w   U   x�uͱ�0�z���^�V�_���8�3�oo���1`�j�k����"m�!tJQ�L�	�kش�B�����R�h��      y   ^   x�}���0�l1����눟�%�k��������)��A�z�r����y�td�ԏs4�$�l�)��Ze�t�U8晴�+Ss��O��} |��9,      z      x�3�4����� ]      {       x�3�4426153��44�2B�s��qqq eV�      }   0   x�3�4�4202�54"NC#cS3sKCS.#N#��1��W� /t
            x�34����� �      �      x�3����� � �      �      x�34����� �     