PGDMP      2            
    {            Firma    16.0    16.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16651    Firma    DATABASE     z   CREATE DATABASE "Firma" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Polish_Poland.1250';
    DROP DATABASE "Firma";
                postgres    false                        2615    16652 
   ksiegowosc    SCHEMA        CREATE SCHEMA ksiegowosc;
    DROP SCHEMA ksiegowosc;
                postgres    false            �            1259    16663    godziny    TABLE     �   CREATE TABLE public.godziny (
    id_godziny character varying(4) NOT NULL,
    data date NOT NULL,
    liczba_godzin integer NOT NULL,
    id_pracownika character varying(4)
);
    DROP TABLE public.godziny;
       public         heap    postgres    false            �            1259    16673    pensje    TABLE     �   CREATE TABLE public.pensje (
    id_pensji character varying(4) NOT NULL,
    stanowisko character varying(30) NOT NULL,
    kwota numeric NOT NULL
);
    DROP TABLE public.pensje;
       public         heap    postgres    false            �            1259    16653 
   pracownicy    TABLE        CREATE TABLE public.pracownicy (
    id_pracownika character varying(4) NOT NULL,
    imie character varying(20) NOT NULL,
    nazwisko character varying(30) NOT NULL,
    adres character varying(50) NOT NULL,
    telefon character varying(12) NOT NULL
);
    DROP TABLE public.pracownicy;
       public         heap    postgres    false            �            1259    16678    premie    TABLE        CREATE TABLE public.premie (
    id_premii character varying(4) NOT NULL,
    rodzaj character varying(30),
    kwota money
);
    DROP TABLE public.premie;
       public         heap    postgres    false            �            1259    16683    wynagrodzenie    TABLE       CREATE TABLE public.wynagrodzenie (
    id_wynagrodzenia character varying(4) NOT NULL,
    data date NOT NULL,
    id_pracownika character varying(4),
    id_godziny character varying(4),
    id_pensji character varying(4),
    id_premii character varying(4)
);
 !   DROP TABLE public.wynagrodzenie;
       public         heap    postgres    false            �          0    16663    godziny 
   TABLE DATA           Q   COPY public.godziny (id_godziny, data, liczba_godzin, id_pracownika) FROM stdin;
    public          postgres    false    217   �                  0    16673    pensje 
   TABLE DATA           >   COPY public.pensje (id_pensji, stanowisko, kwota) FROM stdin;
    public          postgres    false    218   -       �          0    16653 
   pracownicy 
   TABLE DATA           S   COPY public.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) FROM stdin;
    public          postgres    false    216   �                 0    16678    premie 
   TABLE DATA           :   COPY public.premie (id_premii, rodzaj, kwota) FROM stdin;
    public          postgres    false    219   5                  0    16683    wynagrodzenie 
   TABLE DATA           p   COPY public.wynagrodzenie (id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii) FROM stdin;
    public          postgres    false    220   �        c           2606    16667    godziny godziny_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.godziny
    ADD CONSTRAINT godziny_pkey PRIMARY KEY (id_godziny);
 >   ALTER TABLE ONLY public.godziny DROP CONSTRAINT godziny_pkey;
       public            postgres    false    217            e           2606    16677    pensje pensje_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.pensje
    ADD CONSTRAINT pensje_pkey PRIMARY KEY (id_pensji);
 <   ALTER TABLE ONLY public.pensje DROP CONSTRAINT pensje_pkey;
       public            postgres    false    218            a           2606    16657    pracownicy pracownicy_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.pracownicy
    ADD CONSTRAINT pracownicy_pkey PRIMARY KEY (id_pracownika);
 D   ALTER TABLE ONLY public.pracownicy DROP CONSTRAINT pracownicy_pkey;
       public            postgres    false    216            g           2606    16682    premie premie_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.premie
    ADD CONSTRAINT premie_pkey PRIMARY KEY (id_premii);
 <   ALTER TABLE ONLY public.premie DROP CONSTRAINT premie_pkey;
       public            postgres    false    219            i           2606    16687     wynagrodzenie wynagrodzenie_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.wynagrodzenie
    ADD CONSTRAINT wynagrodzenie_pkey PRIMARY KEY (id_wynagrodzenia);
 J   ALTER TABLE ONLY public.wynagrodzenie DROP CONSTRAINT wynagrodzenie_pkey;
       public            postgres    false    220            j           2606    16668 "   godziny godziny_id_pracownika_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.godziny
    ADD CONSTRAINT godziny_id_pracownika_fkey FOREIGN KEY (id_pracownika) REFERENCES public.pracownicy(id_pracownika);
 L   ALTER TABLE ONLY public.godziny DROP CONSTRAINT godziny_id_pracownika_fkey;
       public          postgres    false    216    4705    217            k           2606    16693 +   wynagrodzenie wynagrodzenie_id_godziny_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.wynagrodzenie
    ADD CONSTRAINT wynagrodzenie_id_godziny_fkey FOREIGN KEY (id_godziny) REFERENCES public.godziny(id_godziny);
 U   ALTER TABLE ONLY public.wynagrodzenie DROP CONSTRAINT wynagrodzenie_id_godziny_fkey;
       public          postgres    false    217    4707    220            l           2606    16698 *   wynagrodzenie wynagrodzenie_id_pensji_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.wynagrodzenie
    ADD CONSTRAINT wynagrodzenie_id_pensji_fkey FOREIGN KEY (id_pensji) REFERENCES public.pensje(id_pensji);
 T   ALTER TABLE ONLY public.wynagrodzenie DROP CONSTRAINT wynagrodzenie_id_pensji_fkey;
       public          postgres    false    218    220    4709            m           2606    16688 .   wynagrodzenie wynagrodzenie_id_pracownika_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.wynagrodzenie
    ADD CONSTRAINT wynagrodzenie_id_pracownika_fkey FOREIGN KEY (id_pracownika) REFERENCES public.pracownicy(id_pracownika);
 X   ALTER TABLE ONLY public.wynagrodzenie DROP CONSTRAINT wynagrodzenie_id_pracownika_fkey;
       public          postgres    false    216    4705    220            n           2606    16703 *   wynagrodzenie wynagrodzenie_id_premii_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.wynagrodzenie
    ADD CONSTRAINT wynagrodzenie_id_premii_fkey FOREIGN KEY (id_premii) REFERENCES public.premie(id_premii);
 T   ALTER TABLE ONLY public.wynagrodzenie DROP CONSTRAINT wynagrodzenie_id_premii_fkey;
       public          postgres    false    220    4711    219            �   T   x�e�)�0@�ܥ�,]e\���?|	���}IRV�"�5�tnr_�E��`l���k�
n����x�g�I����\D� ��+5          �   x�st6�TN���/R�,���SpI-�42 =.G�`#N�Rt�ycN���ĲD��!�^����>&�Bt�&&�@�Z $�����Y[��!e�B�hh����j�!LA����A`93�T� ��N�      �   a  x�U��j�0E���(��X:-��--m�P�'�Q�XA�	��w�8��fs���i�.��s3A{�{�-�A_F)x���5�ժ�?J_0�HҌ�Eɪ:
��Ka��=�
>LR��X�;\��8JH��e��(v\F��
��iu���+!���w�U��+��Eq��h&.a-��J�R�I�q�{��ug3X$Y��,��)��j>�߳5z�"���*�47>H��88��w\�utP��4m��'JzSr�Cn�5F�S�3ʹ�v����T�?:��`Qs�.�(IN���vz���v�ۢ�JV�K?~L��-��Z�(Һ�G�!o��^A����Z         �   x�stt2�t��+M��4<����@��@��h�����G~NfJb%'��1gpfz�n~��(R&���9��%�y��&蒦�A�%�y%�@�F�f@ɴԢ"�CP��q:��D3qK��9������,Q������ &�Ry         �   x�]�+�0Q�%+���2 ��9��v����C-�-�\�������DδbDSy���I�h�g
�т��T1�ӜibD�;�1Ĉv�pf`�����#:1�3��#�㟹�^����	!|�mH.     