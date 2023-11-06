PGDMP                  
    {            firma    16.0    16.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16397    firma    DATABASE     x   CREATE DATABASE firma WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Polish_Poland.1250';
    DROP DATABASE firma;
                postgres    false                        2615    16398    rozliczenia    SCHEMA        CREATE SCHEMA rozliczenia;
    DROP SCHEMA rozliczenia;
                postgres    false            �            1259    16486    godziny    TABLE     �   CREATE TABLE rozliczenia.godziny (
    id_godziny character(4) NOT NULL,
    data date NOT NULL,
    liczba_godzin integer NOT NULL,
    id_pracownika character(4) NOT NULL
);
     DROP TABLE rozliczenia.godziny;
       rozliczenia         heap    postgres    false    6            �            1259    16491    pensje    TABLE     �   CREATE TABLE rozliczenia.pensje (
    id_pensji character(4) NOT NULL,
    stanowisko character(20) NOT NULL,
    kwota_brutto money NOT NULL,
    id_premii character(4) NOT NULL,
    kwota_netto money DEFAULT 0 NOT NULL
);
    DROP TABLE rozliczenia.pensje;
       rozliczenia         heap    postgres    false    6            �            1259    16481 
   pracownicy    TABLE     �   CREATE TABLE rozliczenia.pracownicy (
    id_pracownika character(4) NOT NULL,
    imie character(20) NOT NULL,
    nazwisko character(30) NOT NULL,
    adres character(50) NOT NULL,
    telefon character(12) NOT NULL
);
 #   DROP TABLE rozliczenia.pracownicy;
       rozliczenia         heap    postgres    false    6            �            1259    16496    premie    TABLE     �   CREATE TABLE rozliczenia.premie (
    id_premii character(4) NOT NULL,
    rodzaj character(20) NOT NULL,
    kwota money NOT NULL
);
    DROP TABLE rozliczenia.premie;
       rozliczenia         heap    postgres    false    6            �          0    16486    godziny 
   TABLE DATA           V   COPY rozliczenia.godziny (id_godziny, data, liczba_godzin, id_pracownika) FROM stdin;
    rozliczenia          postgres    false    217   �       �          0    16491    pensje 
   TABLE DATA           b   COPY rozliczenia.pensje (id_pensji, stanowisko, kwota_brutto, id_premii, kwota_netto) FROM stdin;
    rozliczenia          postgres    false    218   �       �          0    16481 
   pracownicy 
   TABLE DATA           X   COPY rozliczenia.pracownicy (id_pracownika, imie, nazwisko, adres, telefon) FROM stdin;
    rozliczenia          postgres    false    216   �       �          0    16496    premie 
   TABLE DATA           ?   COPY rozliczenia.premie (id_premii, rodzaj, kwota) FROM stdin;
    rozliczenia          postgres    false    219   �       `           2606    16490    godziny godziny_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY rozliczenia.godziny
    ADD CONSTRAINT godziny_pkey PRIMARY KEY (id_godziny);
 C   ALTER TABLE ONLY rozliczenia.godziny DROP CONSTRAINT godziny_pkey;
       rozliczenia            postgres    false    217            b           2606    16495    pensje pensje_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY rozliczenia.pensje
    ADD CONSTRAINT pensje_pkey PRIMARY KEY (id_pensji);
 A   ALTER TABLE ONLY rozliczenia.pensje DROP CONSTRAINT pensje_pkey;
       rozliczenia            postgres    false    218            ^           2606    16485    pracownicy pracownicy_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY rozliczenia.pracownicy
    ADD CONSTRAINT pracownicy_pkey PRIMARY KEY (id_pracownika);
 I   ALTER TABLE ONLY rozliczenia.pracownicy DROP CONSTRAINT pracownicy_pkey;
       rozliczenia            postgres    false    216            d           2606    16500    premie premie_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY rozliczenia.premie
    ADD CONSTRAINT premie_pkey PRIMARY KEY (id_premii);
 A   ALTER TABLE ONLY rozliczenia.premie DROP CONSTRAINT premie_pkey;
       rozliczenia            postgres    false    219            e           2606    16501 "   godziny godziny_id_pracownika_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY rozliczenia.godziny
    ADD CONSTRAINT godziny_id_pracownika_fkey FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika) NOT VALID;
 Q   ALTER TABLE ONLY rozliczenia.godziny DROP CONSTRAINT godziny_id_pracownika_fkey;
       rozliczenia          postgres    false    216    217    4702            f           2606    16506    pensje pensje_id_premii_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY rozliczenia.pensje
    ADD CONSTRAINT pensje_id_premii_fkey FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii) NOT VALID;
 K   ALTER TABLE ONLY rozliczenia.pensje DROP CONSTRAINT pensje_id_premii_fkey;
       rozliczenia          postgres    false    218    219    4708            �   Q   x�eϩ�0@l��$�P����:��9�l#�%W/�,���"�I�vb���܈�w� �I<��xɷ�S����Q�+�      �   �   x��ѱj�0����'�,K�4Sh���.�54K%$c�D�"�{űA�e�Q����d�%@��w�_|?{\7'D��;�ؒ1��_��މ��c9��o�Uj9�4/c�nw߸�Ou��4���שQ����[�3��L�����8$�@�wZ�X>;-9������"zq��S������Ʃ������q��5���ޑ�%���?J���=�v�<�ϗ,�n���      �   �  x����n� Ư�S�0���[�2gf�%M�ݜ*�C�y�vK��qE����We�V��F�W�����Z�V]����d�k�A�,�W�0�q��,��^Q�!z���ly"��[p�����Q�?
~6�䛋�n �%�b���gS�ЂH��Aي��e���B*�ٝkjE���-:S�	N�Ϧ�ǚ���uٻ�C�9.��8e��[�M�G���x�-1��A����T�3����Z+>P���W�:oT�{Ψ��Y[p��ݭ6����8�������?N����Y[pv�ꅕ䒌>���0��w�r���Y[p�Jڊ���!.����3'C���w�6�HY�=�a��"��j�c
���W�d��l"��e0ՊY+��I���96��D�}�8�p��8
u��&��� �w��      �   �   x�stt2�t��+M�Q@�����(Tm�rtt2�����LI�DU��Ș383=O7?U��(�L8}3sR�K��R�ՙ��3�J-I�+�D1��]�P]ZjQ�7@�@UgN�g-�{�E�%vE�H������e1z\\\ >gb     