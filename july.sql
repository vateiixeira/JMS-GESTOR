PGDMP                         x            james    12.3    12.3 �   H           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            I           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            J           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            K           1262    24980    james    DATABASE     w   CREATE DATABASE james WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE james;
                mgwrazdkuavmyp    false            L           0    0    DATABASE james    ACL     8   REVOKE CONNECT,TEMPORARY ON DATABASE james FROM PUBLIC;
                   mgwrazdkuavmyp    false    3403            M           0    0    SCHEMA public    ACL     Y   REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO mgwrazdkuavmyp;
                   postgres    false    3            N           0    0    LANGUAGE plpgsql    ACL     1   GRANT ALL ON LANGUAGE plpgsql TO mgwrazdkuavmyp;
                   postgres    false    890            �            1259    24981    account_perfil    TABLE     �   CREATE TABLE public.account_perfil (
    id integer NOT NULL,
    cargo character varying(100) NOT NULL,
    regiao character varying(100) NOT NULL,
    avatar character varying(255),
    usuario_id integer NOT NULL,
    cpf character varying(100)
);
 "   DROP TABLE public.account_perfil;
       public         heap    mgwrazdkuavmyp    false            �            1259    24987    account_perfil_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_perfil_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.account_perfil_id_seq;
       public          mgwrazdkuavmyp    false    202            O           0    0    account_perfil_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.account_perfil_id_seq OWNED BY public.account_perfil.id;
          public          mgwrazdkuavmyp    false    203            �            1259    24989    account_planejadouser    TABLE     �   CREATE TABLE public.account_planejadouser (
    id integer NOT NULL,
    planejado numeric(7,2) NOT NULL,
    planejado_moto integer NOT NULL,
    planejado_cota integer NOT NULL,
    planejado_visita integer NOT NULL,
    usuario_id integer NOT NULL
);
 )   DROP TABLE public.account_planejadouser;
       public         heap    mgwrazdkuavmyp    false            �            1259    24992    account_planejadouser_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_planejadouser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.account_planejadouser_id_seq;
       public          mgwrazdkuavmyp    false    204            P           0    0    account_planejadouser_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.account_planejadouser_id_seq OWNED BY public.account_planejadouser.id;
          public          mgwrazdkuavmyp    false    205            �            1259    24994 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    mgwrazdkuavmyp    false            �            1259    24997    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          mgwrazdkuavmyp    false    206            Q           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          mgwrazdkuavmyp    false    207            �            1259    24999    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    mgwrazdkuavmyp    false            �            1259    25002    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          mgwrazdkuavmyp    false    208            R           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          mgwrazdkuavmyp    false    209            �            1259    25004    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    mgwrazdkuavmyp    false            �            1259    25007    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          mgwrazdkuavmyp    false    210            S           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          mgwrazdkuavmyp    false    211            �            1259    25009 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    mgwrazdkuavmyp    false            �            1259    25015    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    mgwrazdkuavmyp    false            �            1259    25018    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          mgwrazdkuavmyp    false    213            T           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          mgwrazdkuavmyp    false    214            �            1259    25020    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          mgwrazdkuavmyp    false    212            U           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          mgwrazdkuavmyp    false    215            �            1259    25022    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    mgwrazdkuavmyp    false            �            1259    25025 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          mgwrazdkuavmyp    false    216            V           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          mgwrazdkuavmyp    false    217            �            1259    25027    core_cidade    TABLE     �   CREATE TABLE public.core_cidade (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    regiao character varying(100) NOT NULL
);
    DROP TABLE public.core_cidade;
       public         heap    mgwrazdkuavmyp    false            �            1259    25030    core_cidade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_cidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.core_cidade_id_seq;
       public          mgwrazdkuavmyp    false    218            W           0    0    core_cidade_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.core_cidade_id_seq OWNED BY public.core_cidade.id;
          public          mgwrazdkuavmyp    false    219            �            1259    25032 	   core_cota    TABLE     1  CREATE TABLE public.core_cota (
    id integer NOT NULL,
    "Cpf_Vendedor" character varying(100) NOT NULL,
    "Nome_Vendedor" character varying(100) NOT NULL,
    "Data_da_Venda" date NOT NULL,
    "Prazo" integer NOT NULL,
    "Tipo_contrato" character varying(100) NOT NULL,
    "Modelo" character varying(100) NOT NULL,
    "Status" character varying(100) NOT NULL,
    "Cliente" character varying(100) NOT NULL,
    "Municipio" character varying(100) NOT NULL,
    "Telefone" character varying(100),
    "Celular" character varying(100),
    "Ponto_de_Venda" character varying(100),
    "Parcela" numeric(7,2) NOT NULL,
    "Data_de_Vencimento" date NOT NULL,
    "Grupo" integer NOT NULL,
    "Cota" integer NOT NULL,
    "R" integer NOT NULL,
    "D" integer NOT NULL,
    "Credito" integer NOT NULL,
    "Data_da_Contemplacao" date,
    "Tipo_de_Contemplacao" character varying(100),
    "Efetuou_Negociacao" character varying(100),
    "Proposta" integer NOT NULL,
    "Digito_da_Proposta" integer NOT NULL,
    "Vl_total_amortizado" numeric(7,2) NOT NULL,
    "Vl_Quitacao" numeric(7,2) NOT NULL,
    "Plano" character varying(100),
    "Porcentagem_Amortizado" numeric(9,6) NOT NULL,
    "Porcentagem_Mensal" numeric(8,6) NOT NULL,
    "Qtd_Parcelas" integer NOT NULL,
    "Seguro_de_Vida" character varying(100)
);
    DROP TABLE public.core_cota;
       public         heap    mgwrazdkuavmyp    false            �            1259    25038    core_cota_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_cota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.core_cota_id_seq;
       public          mgwrazdkuavmyp    false    220            X           0    0    core_cota_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.core_cota_id_seq OWNED BY public.core_cota.id;
          public          mgwrazdkuavmyp    false    221            �            1259    25040    core_documentcota    TABLE     �   CREATE TABLE public.core_documentcota (
    id integer NOT NULL,
    document character varying(100) NOT NULL,
    uploaded_at timestamp with time zone NOT NULL
);
 %   DROP TABLE public.core_documentcota;
       public         heap    mgwrazdkuavmyp    false            �            1259    25043    core_documentcota_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_documentcota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.core_documentcota_id_seq;
       public          mgwrazdkuavmyp    false    222            Y           0    0    core_documentcota_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.core_documentcota_id_seq OWNED BY public.core_documentcota.id;
          public          mgwrazdkuavmyp    false    223            �            1259    25045    core_documentmoto    TABLE     �   CREATE TABLE public.core_documentmoto (
    id integer NOT NULL,
    document character varying(100) NOT NULL,
    uploaded_at timestamp with time zone NOT NULL
);
 %   DROP TABLE public.core_documentmoto;
       public         heap    mgwrazdkuavmyp    false            �            1259    25048    core_documentmoto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_documentmoto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.core_documentmoto_id_seq;
       public          mgwrazdkuavmyp    false    224            Z           0    0    core_documentmoto_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.core_documentmoto_id_seq OWNED BY public.core_documentmoto.id;
          public          mgwrazdkuavmyp    false    225            �            1259    25050    core_equipe    TABLE     �   CREATE TABLE public.core_equipe (
    id integer NOT NULL,
    cidade_id integer NOT NULL,
    user_id integer NOT NULL,
    perfil_id integer NOT NULL
);
    DROP TABLE public.core_equipe;
       public         heap    mgwrazdkuavmyp    false            �            1259    25053    core_equipe_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_equipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.core_equipe_id_seq;
       public          mgwrazdkuavmyp    false    226            [           0    0    core_equipe_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.core_equipe_id_seq OWNED BY public.core_equipe.id;
          public          mgwrazdkuavmyp    false    227            �            1259    25055    core_metacotacidade    TABLE     �   CREATE TABLE public.core_metacotacidade (
    id integer NOT NULL,
    ano integer NOT NULL,
    mes integer NOT NULL,
    meta integer NOT NULL,
    cidade_id integer NOT NULL,
    modelo_id integer NOT NULL
);
 '   DROP TABLE public.core_metacotacidade;
       public         heap    mgwrazdkuavmyp    false            �            1259    25058    core_metacotacidade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_metacotacidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.core_metacotacidade_id_seq;
       public          mgwrazdkuavmyp    false    228            \           0    0    core_metacotacidade_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.core_metacotacidade_id_seq OWNED BY public.core_metacotacidade.id;
          public          mgwrazdkuavmyp    false    229            �            1259    25060    core_metamotocidade    TABLE     �   CREATE TABLE public.core_metamotocidade (
    id integer NOT NULL,
    ano integer NOT NULL,
    mes integer NOT NULL,
    meta integer NOT NULL,
    cidade_id integer NOT NULL,
    modelo_id integer NOT NULL
);
 '   DROP TABLE public.core_metamotocidade;
       public         heap    mgwrazdkuavmyp    false            �            1259    25063    core_metamotocidade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_metamotocidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.core_metamotocidade_id_seq;
       public          mgwrazdkuavmyp    false    230            ]           0    0    core_metamotocidade_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.core_metamotocidade_id_seq OWNED BY public.core_metamotocidade.id;
          public          mgwrazdkuavmyp    false    231            �            1259    25065 	   core_moto    TABLE     1  CREATE TABLE public.core_moto (
    id integer NOT NULL,
    "Empresa" character varying(30) NOT NULL,
    "Data" date NOT NULL,
    "Nota_Fiscal" integer NOT NULL,
    "Serie" integer NOT NULL,
    "Valor_da_Nota" numeric(7,2) NOT NULL,
    "Veiculo" character varying(100) NOT NULL,
    "Chassi" character varying(100) NOT NULL,
    "Forma_Pagamento" character varying(100) NOT NULL,
    "Vendedor" character varying(100) NOT NULL,
    "Cliente" character varying(100) NOT NULL,
    "Cpf_Cnpj_Cliente" character varying(100) NOT NULL,
    "Novo" boolean NOT NULL,
    "Quantidade" integer NOT NULL,
    "Operacao_Interna" character varying(100) NOT NULL,
    "Data_Compra" date NOT NULL,
    "Custo_Medio" numeric(7,2) NOT NULL,
    "Margem" numeric(7,2) NOT NULL,
    "Margem_Porcentagem" numeric(7,2) NOT NULL,
    "Ano_Fab" integer NOT NULL,
    "Ano_Modelo" integer NOT NULL,
    "Municipio" character varying(100) NOT NULL,
    "Valor_Tabela" numeric(7,2) NOT NULL,
    "Emp_Funcionario" character varying(100) NOT NULL,
    "Motivo_Devolucao" character varying(250) NOT NULL,
    "Cor" character varying(100) NOT NULL,
    "Tipo" character varying(100) NOT NULL,
    "Telefone" character varying(50) NOT NULL,
    "Celular" character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    "Placa" character varying(50) NOT NULL,
    "Despesa_Oficina" numeric(7,2) NOT NULL,
    "Despesa_Financeira" numeric(7,2) NOT NULL,
    "Valor_Venda_Gerencial" numeric(7,2) NOT NULL,
    "Base_Comissao" numeric(7,2) NOT NULL,
    "Forma_Fabrica" character varying(50) NOT NULL,
    "Sub_Forma_Fabrica" character varying(50) NOT NULL,
    "Modalidade_Venda" character varying(100) NOT NULL,
    "Grupo_Pessoa_Vendedor" character varying(100) NOT NULL,
    "Vendedor_cpf" character varying(100) NOT NULL,
    "Cancelada" boolean
);
    DROP TABLE public.core_moto;
       public         heap    mgwrazdkuavmyp    false            �            1259    25071    core_moto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_moto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.core_moto_id_seq;
       public          mgwrazdkuavmyp    false    232            ^           0    0    core_moto_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.core_moto_id_seq OWNED BY public.core_moto.id;
          public          mgwrazdkuavmyp    false    233            �            1259    25073    core_motoperfil    TABLE     �   CREATE TABLE public.core_motoperfil (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    avatar character varying(400) NOT NULL
);
 #   DROP TABLE public.core_motoperfil;
       public         heap    mgwrazdkuavmyp    false            �            1259    25079    core_motoperfil_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_motoperfil_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.core_motoperfil_id_seq;
       public          mgwrazdkuavmyp    false    234            _           0    0    core_motoperfil_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.core_motoperfil_id_seq OWNED BY public.core_motoperfil.id;
          public          mgwrazdkuavmyp    false    235            �            1259    25081    core_planejadomoto    TABLE     �   CREATE TABLE public.core_planejadomoto (
    id integer NOT NULL,
    regiao character varying(100) NOT NULL,
    mes integer NOT NULL,
    ano integer NOT NULL,
    cidade_id integer NOT NULL,
    modelo_id integer NOT NULL
);
 &   DROP TABLE public.core_planejadomoto;
       public         heap    mgwrazdkuavmyp    false            �            1259    25084    core_planejadomoto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_planejadomoto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.core_planejadomoto_id_seq;
       public          mgwrazdkuavmyp    false    236            `           0    0    core_planejadomoto_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.core_planejadomoto_id_seq OWNED BY public.core_planejadomoto.id;
          public          mgwrazdkuavmyp    false    237            �            1259    25086    core_planejadorealizado    TABLE     n  CREATE TABLE public.core_planejadorealizado (
    id integer NOT NULL,
    planejado numeric(7,2) NOT NULL,
    planejado_moto integer NOT NULL,
    planejado_cota numeric(7,2) NOT NULL,
    planejado_visita integer NOT NULL,
    cidade character varying(50) NOT NULL,
    regiao character varying(50) NOT NULL,
    mes integer NOT NULL,
    ano integer NOT NULL
);
 +   DROP TABLE public.core_planejadorealizado;
       public         heap    mgwrazdkuavmyp    false            �            1259    25089    core_planejadorealizado_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_planejadorealizado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.core_planejadorealizado_id_seq;
       public          mgwrazdkuavmyp    false    238            a           0    0    core_planejadorealizado_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.core_planejadorealizado_id_seq OWNED BY public.core_planejadorealizado.id;
          public          mgwrazdkuavmyp    false    239            �            1259    25091    core_sazonalidadecidade    TABLE     �   CREATE TABLE public.core_sazonalidadecidade (
    id integer NOT NULL,
    mes integer NOT NULL,
    percentual double precision NOT NULL,
    vl_total_anual integer NOT NULL,
    ano_base integer NOT NULL,
    cidade_id integer NOT NULL
);
 +   DROP TABLE public.core_sazonalidadecidade;
       public         heap    mgwrazdkuavmyp    false            �            1259    25094    core_sazonalidadecidade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_sazonalidadecidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.core_sazonalidadecidade_id_seq;
       public          mgwrazdkuavmyp    false    240            b           0    0    core_sazonalidadecidade_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.core_sazonalidadecidade_id_seq OWNED BY public.core_sazonalidadecidade.id;
          public          mgwrazdkuavmyp    false    241                       1259    33131    core_sazonalidadecidadecota    TABLE     �   CREATE TABLE public.core_sazonalidadecidadecota (
    id integer NOT NULL,
    mes integer NOT NULL,
    percentual double precision NOT NULL,
    vl_total_anual integer NOT NULL,
    ano_base integer NOT NULL,
    cidade_id integer NOT NULL
);
 /   DROP TABLE public.core_sazonalidadecidadecota;
       public         heap    postgres    false                       1259    33129 "   core_sazonalidadecidadecota_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_sazonalidadecidadecota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.core_sazonalidadecidadecota_id_seq;
       public          postgres    false    276            c           0    0 "   core_sazonalidadecidadecota_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.core_sazonalidadecidadecota_id_seq OWNED BY public.core_sazonalidadecidadecota.id;
          public          postgres    false    275            �            1259    25096    core_sazonalidademodelo    TABLE       CREATE TABLE public.core_sazonalidademodelo (
    id integer NOT NULL,
    mes integer NOT NULL,
    percentual double precision NOT NULL,
    vl_total_anual integer NOT NULL,
    ano_base integer NOT NULL,
    modelo_id integer NOT NULL,
    regiao character varying(100) NOT NULL
);
 +   DROP TABLE public.core_sazonalidademodelo;
       public         heap    mgwrazdkuavmyp    false            �            1259    25099    core_sazonalidademodelo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_sazonalidademodelo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.core_sazonalidademodelo_id_seq;
       public          mgwrazdkuavmyp    false    242            d           0    0    core_sazonalidademodelo_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.core_sazonalidademodelo_id_seq OWNED BY public.core_sazonalidademodelo.id;
          public          mgwrazdkuavmyp    false    243                       1259    33123    core_sazonalidademodelocota    TABLE     !  CREATE TABLE public.core_sazonalidademodelocota (
    id integer NOT NULL,
    regiao character varying(100) NOT NULL,
    mes integer NOT NULL,
    percentual double precision NOT NULL,
    vl_total_anual integer NOT NULL,
    ano_base integer NOT NULL,
    modelo_id integer NOT NULL
);
 /   DROP TABLE public.core_sazonalidademodelocota;
       public         heap    postgres    false                       1259    33121 "   core_sazonalidademodelocota_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_sazonalidademodelocota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.core_sazonalidademodelocota_id_seq;
       public          postgres    false    274            e           0    0 "   core_sazonalidademodelocota_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.core_sazonalidademodelocota_id_seq OWNED BY public.core_sazonalidademodelocota.id;
          public          postgres    false    273            �            1259    25101    core_sazonalidaderegiao    TABLE     �   CREATE TABLE public.core_sazonalidaderegiao (
    id integer NOT NULL,
    regiao character varying(100) NOT NULL,
    mes integer NOT NULL,
    percentual double precision NOT NULL,
    vl_total_anual integer NOT NULL,
    ano_base integer NOT NULL
);
 +   DROP TABLE public.core_sazonalidaderegiao;
       public         heap    mgwrazdkuavmyp    false            �            1259    25104    core_sazonalidaderegiao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_sazonalidaderegiao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.core_sazonalidaderegiao_id_seq;
       public          mgwrazdkuavmyp    false    244            f           0    0    core_sazonalidaderegiao_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.core_sazonalidaderegiao_id_seq OWNED BY public.core_sazonalidaderegiao.id;
          public          mgwrazdkuavmyp    false    245                       1259    33107    core_sazonalidaderegiaocota    TABLE       CREATE TABLE public.core_sazonalidaderegiaocota (
    id integer NOT NULL,
    regiao character varying(100) NOT NULL,
    mes integer NOT NULL,
    percentual double precision NOT NULL,
    vl_total_anual integer NOT NULL,
    ano_base integer NOT NULL
);
 /   DROP TABLE public.core_sazonalidaderegiaocota;
       public         heap    postgres    false                       1259    33105 "   core_sazonalidaderegiaocota_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_sazonalidaderegiaocota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.core_sazonalidaderegiaocota_id_seq;
       public          postgres    false    270            g           0    0 "   core_sazonalidaderegiaocota_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.core_sazonalidaderegiaocota_id_seq OWNED BY public.core_sazonalidaderegiaocota.id;
          public          postgres    false    269            �            1259    25106    core_sazonalidadevendedor    TABLE     8  CREATE TABLE public.core_sazonalidadevendedor (
    id integer NOT NULL,
    vendedor_nome character varying(250) NOT NULL,
    vendedor_cpf character varying(100) NOT NULL,
    mes integer NOT NULL,
    percentual double precision NOT NULL,
    vl_total_anual integer NOT NULL,
    ano_base integer NOT NULL
);
 -   DROP TABLE public.core_sazonalidadevendedor;
       public         heap    mgwrazdkuavmyp    false            �            1259    25109     core_sazonalidadevendedor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_sazonalidadevendedor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.core_sazonalidadevendedor_id_seq;
       public          mgwrazdkuavmyp    false    246            h           0    0     core_sazonalidadevendedor_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.core_sazonalidadevendedor_id_seq OWNED BY public.core_sazonalidadevendedor.id;
          public          mgwrazdkuavmyp    false    247                       1259    33115    core_sazonalidadevendedorcota    TABLE     <  CREATE TABLE public.core_sazonalidadevendedorcota (
    id integer NOT NULL,
    vendedor_nome character varying(250) NOT NULL,
    vendedor_cpf character varying(100) NOT NULL,
    mes integer NOT NULL,
    percentual double precision NOT NULL,
    vl_total_anual integer NOT NULL,
    ano_base integer NOT NULL
);
 1   DROP TABLE public.core_sazonalidadevendedorcota;
       public         heap    postgres    false                       1259    33113 $   core_sazonalidadevendedorcota_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_sazonalidadevendedorcota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.core_sazonalidadevendedorcota_id_seq;
       public          postgres    false    272            i           0    0 $   core_sazonalidadevendedorcota_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.core_sazonalidadevendedorcota_id_seq OWNED BY public.core_sazonalidadevendedorcota.id;
          public          postgres    false    271            �            1259    25111    core_totalmensalmoto2019    TABLE     �   CREATE TABLE public.core_totalmensalmoto2019 (
    id integer NOT NULL,
    cidade character varying(100) NOT NULL,
    mes integer NOT NULL,
    qtd integer NOT NULL
);
 ,   DROP TABLE public.core_totalmensalmoto2019;
       public         heap    mgwrazdkuavmyp    false            �            1259    25114    core_totalmensalmoto2019_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_totalmensalmoto2019_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.core_totalmensalmoto2019_id_seq;
       public          mgwrazdkuavmyp    false    248            j           0    0    core_totalmensalmoto2019_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.core_totalmensalmoto2019_id_seq OWNED BY public.core_totalmensalmoto2019.id;
          public          mgwrazdkuavmyp    false    249            �            1259    25116    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    mgwrazdkuavmyp    false            �            1259    25123    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          mgwrazdkuavmyp    false    250            k           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          mgwrazdkuavmyp    false    251            �            1259    25125    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    mgwrazdkuavmyp    false            �            1259    25128    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          mgwrazdkuavmyp    false    252            l           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          mgwrazdkuavmyp    false    253            �            1259    25130    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    mgwrazdkuavmyp    false            �            1259    25136    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          mgwrazdkuavmyp    false    254            m           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          mgwrazdkuavmyp    false    255                        1259    25138    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    mgwrazdkuavmyp    false                       1259    25625    metas_cidademodelo    TABLE     3  CREATE TABLE public.metas_cidademodelo (
    id integer NOT NULL,
    aplicado integer,
    previsto integer,
    ano integer,
    aplicado_jan integer,
    aplicado_fev integer,
    aplicado_mar integer,
    aplicado_abr integer,
    aplicado_mai integer,
    aplicado_jun integer,
    aplicado_jul integer,
    aplicado_ago integer,
    aplicado_sete integer,
    aplicado_out integer,
    aplicado_nov integer,
    aplicado_dez integer,
    cidade_id integer NOT NULL,
    modelo_id integer NOT NULL,
    previsto_abr integer,
    previsto_ago integer,
    previsto_dez integer,
    previsto_fev integer,
    previsto_jan integer,
    previsto_jul integer,
    previsto_jun integer,
    previsto_mai integer,
    previsto_mar integer,
    previsto_nov integer,
    previsto_out integer,
    previsto_sete integer
);
 &   DROP TABLE public.metas_cidademodelo;
       public         heap    postgres    false                       1259    25623    metas_cidademodelo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metas_cidademodelo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.metas_cidademodelo_id_seq;
       public          postgres    false    268            n           0    0    metas_cidademodelo_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.metas_cidademodelo_id_seq OWNED BY public.metas_cidademodelo.id;
          public          postgres    false    267                        1259    33224    metas_cidademodelocota    TABLE     7  CREATE TABLE public.metas_cidademodelocota (
    id integer NOT NULL,
    aplicado integer,
    previsto integer,
    ano integer,
    aplicado_jan integer,
    aplicado_fev integer,
    aplicado_mar integer,
    aplicado_abr integer,
    aplicado_mai integer,
    aplicado_jun integer,
    aplicado_jul integer,
    aplicado_ago integer,
    aplicado_sete integer,
    aplicado_out integer,
    aplicado_nov integer,
    aplicado_dez integer,
    previsto_jan integer,
    previsto_fev integer,
    previsto_mar integer,
    previsto_abr integer,
    previsto_mai integer,
    previsto_jun integer,
    previsto_jul integer,
    previsto_ago integer,
    previsto_sete integer,
    previsto_out integer,
    previsto_nov integer,
    previsto_dez integer,
    cidade_id integer NOT NULL,
    modelo_id integer NOT NULL
);
 *   DROP TABLE public.metas_cidademodelocota;
       public         heap    postgres    false                       1259    33222    metas_cidademodelocota_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metas_cidademodelocota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.metas_cidademodelocota_id_seq;
       public          postgres    false    288            o           0    0    metas_cidademodelocota_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.metas_cidademodelocota_id_seq OWNED BY public.metas_cidademodelocota.id;
          public          postgres    false    287            
           1259    25617    metas_vendedormodelo    TABLE     7  CREATE TABLE public.metas_vendedormodelo (
    id integer NOT NULL,
    aplicado integer,
    previsto integer,
    ano integer,
    aplicado_fev integer,
    aplicado_dez integer,
    aplicado_mai integer,
    aplicado_abr integer,
    aplicado_jun integer,
    aplicado_jul integer,
    aplicado_jan integer,
    aplicado_ago integer,
    aplicado_out integer,
    aplicado_nov integer,
    aplicado_mar integer,
    vendedor_id integer NOT NULL,
    aplicado_sete integer,
    previsto_abr integer,
    previsto_ago integer,
    previsto_dez integer,
    previsto_fev integer,
    previsto_jan integer,
    previsto_jul integer,
    previsto_jun integer,
    previsto_mai integer,
    previsto_mar integer,
    previsto_nov integer,
    previsto_out integer,
    previsto_sete integer,
    modelo_id integer NOT NULL
);
 (   DROP TABLE public.metas_vendedormodelo;
       public         heap    postgres    false            	           1259    25615    metas_vendedormodelo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metas_vendedormodelo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.metas_vendedormodelo_id_seq;
       public          postgres    false    266            p           0    0    metas_vendedormodelo_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.metas_vendedormodelo_id_seq OWNED BY public.metas_vendedormodelo.id;
          public          postgres    false    265                       1259    33216    metas_vendedormodelocota    TABLE     ;  CREATE TABLE public.metas_vendedormodelocota (
    id integer NOT NULL,
    aplicado integer,
    previsto integer,
    ano integer,
    aplicado_jan integer,
    aplicado_fev integer,
    aplicado_mar integer,
    aplicado_abr integer,
    aplicado_mai integer,
    aplicado_jun integer,
    aplicado_jul integer,
    aplicado_ago integer,
    aplicado_sete integer,
    aplicado_out integer,
    aplicado_nov integer,
    aplicado_dez integer,
    previsto_jan integer,
    previsto_fev integer,
    previsto_mar integer,
    previsto_abr integer,
    previsto_mai integer,
    previsto_jun integer,
    previsto_jul integer,
    previsto_ago integer,
    previsto_sete integer,
    previsto_out integer,
    previsto_nov integer,
    previsto_dez integer,
    modelo_id integer NOT NULL,
    vendedor_id integer NOT NULL
);
 ,   DROP TABLE public.metas_vendedormodelocota;
       public         heap    postgres    false                       1259    33214    metas_vendedormodelocota_id_seq    SEQUENCE     �   CREATE SEQUENCE public.metas_vendedormodelocota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.metas_vendedormodelocota_id_seq;
       public          postgres    false    286            q           0    0    metas_vendedormodelocota_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.metas_vendedormodelocota_id_seq OWNED BY public.metas_vendedormodelocota.id;
          public          postgres    false    285                       1259    25419    planejado_firstetapa    TABLE     �  CREATE TABLE public.planejado_firstetapa (
    id integer NOT NULL,
    regiao character varying(100) NOT NULL,
    ano integer,
    jan integer,
    fev integer,
    mar integer,
    abr integer,
    mai integer,
    jun integer,
    jul integer,
    ago integer,
    sete integer,
    "out" integer,
    nov integer,
    dez integer,
    modelo_id integer NOT NULL,
    aplicado integer,
    previsto integer
);
 (   DROP TABLE public.planejado_firstetapa;
       public         heap    postgres    false                       1259    25417    planejado_firstetapa_id_seq    SEQUENCE     �   CREATE SEQUENCE public.planejado_firstetapa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.planejado_firstetapa_id_seq;
       public          postgres    false    262            r           0    0    planejado_firstetapa_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.planejado_firstetapa_id_seq OWNED BY public.planejado_firstetapa.id;
          public          postgres    false    261                       1259    33175    planejado_firstetapacota    TABLE     �  CREATE TABLE public.planejado_firstetapacota (
    id integer NOT NULL,
    regiao character varying(100) NOT NULL,
    aplicado integer,
    previsto integer,
    ano integer,
    jan integer,
    fev integer,
    mar integer,
    abr integer,
    mai integer,
    jun integer,
    jul integer,
    ago integer,
    sete integer,
    "out" integer,
    nov integer,
    dez integer,
    modelo_id integer NOT NULL
);
 ,   DROP TABLE public.planejado_firstetapacota;
       public         heap    postgres    false                       1259    33173    planejado_firstetapacota_id_seq    SEQUENCE     �   CREATE SEQUENCE public.planejado_firstetapacota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.planejado_firstetapacota_id_seq;
       public          postgres    false    284            s           0    0    planejado_firstetapacota_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.planejado_firstetapacota_id_seq OWNED BY public.planejado_firstetapacota.id;
          public          postgres    false    283                       1259    25433    planejado_potencialcidade    TABLE     �   CREATE TABLE public.planejado_potencialcidade (
    id integer NOT NULL,
    anual integer NOT NULL,
    cidade_id integer NOT NULL
);
 -   DROP TABLE public.planejado_potencialcidade;
       public         heap    postgres    false                       1259    25431     planejado_potencialcidade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.planejado_potencialcidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.planejado_potencialcidade_id_seq;
       public          postgres    false    264            t           0    0     planejado_potencialcidade_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.planejado_potencialcidade_id_seq OWNED BY public.planejado_potencialcidade.id;
          public          postgres    false    263                       1259    33167    planejado_potencialcidadecota    TABLE     �   CREATE TABLE public.planejado_potencialcidadecota (
    id integer NOT NULL,
    anual integer NOT NULL,
    cidade_id integer NOT NULL
);
 1   DROP TABLE public.planejado_potencialcidadecota;
       public         heap    postgres    false                       1259    33165 $   planejado_potencialcidadecota_id_seq    SEQUENCE     �   CREATE SEQUENCE public.planejado_potencialcidadecota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.planejado_potencialcidadecota_id_seq;
       public          postgres    false    282            u           0    0 $   planejado_potencialcidadecota_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.planejado_potencialcidadecota_id_seq OWNED BY public.planejado_potencialcidadecota.id;
          public          postgres    false    281                       1259    25385 "   planejado_sazonalidademodelocidade    TABLE     H  CREATE TABLE public.planejado_sazonalidademodelocidade (
    id integer NOT NULL,
    regiao character varying(100) NOT NULL,
    mes integer NOT NULL,
    percentual double precision NOT NULL,
    vl_total_anual integer NOT NULL,
    ano_base integer NOT NULL,
    cidade_id integer NOT NULL,
    modelo_id integer NOT NULL
);
 6   DROP TABLE public.planejado_sazonalidademodelocidade;
       public         heap    postgres    false                       1259    25383 )   planejado_sazonalidademodelocidade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.planejado_sazonalidademodelocidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.planejado_sazonalidademodelocidade_id_seq;
       public          postgres    false    258            v           0    0 )   planejado_sazonalidademodelocidade_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.planejado_sazonalidademodelocidade_id_seq OWNED BY public.planejado_sazonalidademodelocidade.id;
          public          postgres    false    257                       1259    33159 &   planejado_sazonalidademodelocidadecota    TABLE     L  CREATE TABLE public.planejado_sazonalidademodelocidadecota (
    id integer NOT NULL,
    regiao character varying(100) NOT NULL,
    mes integer NOT NULL,
    percentual double precision NOT NULL,
    vl_total_anual integer NOT NULL,
    ano_base integer NOT NULL,
    cidade_id integer NOT NULL,
    modelo_id integer NOT NULL
);
 :   DROP TABLE public.planejado_sazonalidademodelocidadecota;
       public         heap    postgres    false                       1259    33157 -   planejado_sazonalidademodelocidadecota_id_seq    SEQUENCE     �   CREATE SEQUENCE public.planejado_sazonalidademodelocidadecota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.planejado_sazonalidademodelocidadecota_id_seq;
       public          postgres    false    280            w           0    0 -   planejado_sazonalidademodelocidadecota_id_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.planejado_sazonalidademodelocidadecota_id_seq OWNED BY public.planejado_sazonalidademodelocidadecota.id;
          public          postgres    false    279                       1259    25405 $   planejado_sazonalidademodelovendedor    TABLE     c  CREATE TABLE public.planejado_sazonalidademodelovendedor (
    id integer NOT NULL,
    vendedor_nome character varying(250) NOT NULL,
    vendedor_cpf character varying(100) NOT NULL,
    mes integer NOT NULL,
    percentual double precision NOT NULL,
    vl_total_anual integer NOT NULL,
    ano_base integer NOT NULL,
    modelo_id integer NOT NULL
);
 8   DROP TABLE public.planejado_sazonalidademodelovendedor;
       public         heap    postgres    false                       1259    25403 +   planejado_sazonalidademodelovendedor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.planejado_sazonalidademodelovendedor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.planejado_sazonalidademodelovendedor_id_seq;
       public          postgres    false    260            x           0    0 +   planejado_sazonalidademodelovendedor_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.planejado_sazonalidademodelovendedor_id_seq OWNED BY public.planejado_sazonalidademodelovendedor.id;
          public          postgres    false    259                       1259    33151 (   planejado_sazonalidademodelovendedorcota    TABLE     g  CREATE TABLE public.planejado_sazonalidademodelovendedorcota (
    id integer NOT NULL,
    vendedor_nome character varying(250) NOT NULL,
    vendedor_cpf character varying(100) NOT NULL,
    mes integer NOT NULL,
    percentual double precision NOT NULL,
    vl_total_anual integer NOT NULL,
    ano_base integer NOT NULL,
    modelo_id integer NOT NULL
);
 <   DROP TABLE public.planejado_sazonalidademodelovendedorcota;
       public         heap    postgres    false                       1259    33149 /   planejado_sazonalidademodelovendedorcota_id_seq    SEQUENCE     �   CREATE SEQUENCE public.planejado_sazonalidademodelovendedorcota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.planejado_sazonalidademodelovendedorcota_id_seq;
       public          postgres    false    278            y           0    0 /   planejado_sazonalidademodelovendedorcota_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.planejado_sazonalidademodelovendedorcota_id_seq OWNED BY public.planejado_sazonalidademodelovendedorcota.id;
          public          postgres    false    277            �           2604    25144    account_perfil id    DEFAULT     v   ALTER TABLE ONLY public.account_perfil ALTER COLUMN id SET DEFAULT nextval('public.account_perfil_id_seq'::regclass);
 @   ALTER TABLE public.account_perfil ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    203    202            �           2604    25145    account_planejadouser id    DEFAULT     �   ALTER TABLE ONLY public.account_planejadouser ALTER COLUMN id SET DEFAULT nextval('public.account_planejadouser_id_seq'::regclass);
 G   ALTER TABLE public.account_planejadouser ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    205    204            �           2604    25146    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    207    206            �           2604    25147    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    209    208            �           2604    25148    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    211    210            �           2604    25149    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    215    212            �           2604    25150    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    214    213            �           2604    25151    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    217    216            �           2604    25152    core_cidade id    DEFAULT     p   ALTER TABLE ONLY public.core_cidade ALTER COLUMN id SET DEFAULT nextval('public.core_cidade_id_seq'::regclass);
 =   ALTER TABLE public.core_cidade ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    219    218            �           2604    25153    core_cota id    DEFAULT     l   ALTER TABLE ONLY public.core_cota ALTER COLUMN id SET DEFAULT nextval('public.core_cota_id_seq'::regclass);
 ;   ALTER TABLE public.core_cota ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    221    220            �           2604    25154    core_documentcota id    DEFAULT     |   ALTER TABLE ONLY public.core_documentcota ALTER COLUMN id SET DEFAULT nextval('public.core_documentcota_id_seq'::regclass);
 C   ALTER TABLE public.core_documentcota ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    223    222            �           2604    25155    core_documentmoto id    DEFAULT     |   ALTER TABLE ONLY public.core_documentmoto ALTER COLUMN id SET DEFAULT nextval('public.core_documentmoto_id_seq'::regclass);
 C   ALTER TABLE public.core_documentmoto ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    225    224            �           2604    25156    core_equipe id    DEFAULT     p   ALTER TABLE ONLY public.core_equipe ALTER COLUMN id SET DEFAULT nextval('public.core_equipe_id_seq'::regclass);
 =   ALTER TABLE public.core_equipe ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    227    226            �           2604    25157    core_metacotacidade id    DEFAULT     �   ALTER TABLE ONLY public.core_metacotacidade ALTER COLUMN id SET DEFAULT nextval('public.core_metacotacidade_id_seq'::regclass);
 E   ALTER TABLE public.core_metacotacidade ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    229    228            �           2604    25158    core_metamotocidade id    DEFAULT     �   ALTER TABLE ONLY public.core_metamotocidade ALTER COLUMN id SET DEFAULT nextval('public.core_metamotocidade_id_seq'::regclass);
 E   ALTER TABLE public.core_metamotocidade ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    231    230            �           2604    25159    core_moto id    DEFAULT     l   ALTER TABLE ONLY public.core_moto ALTER COLUMN id SET DEFAULT nextval('public.core_moto_id_seq'::regclass);
 ;   ALTER TABLE public.core_moto ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    233    232            �           2604    25160    core_motoperfil id    DEFAULT     x   ALTER TABLE ONLY public.core_motoperfil ALTER COLUMN id SET DEFAULT nextval('public.core_motoperfil_id_seq'::regclass);
 A   ALTER TABLE public.core_motoperfil ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    235    234            �           2604    25161    core_planejadomoto id    DEFAULT     ~   ALTER TABLE ONLY public.core_planejadomoto ALTER COLUMN id SET DEFAULT nextval('public.core_planejadomoto_id_seq'::regclass);
 D   ALTER TABLE public.core_planejadomoto ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    237    236            �           2604    25162    core_planejadorealizado id    DEFAULT     �   ALTER TABLE ONLY public.core_planejadorealizado ALTER COLUMN id SET DEFAULT nextval('public.core_planejadorealizado_id_seq'::regclass);
 I   ALTER TABLE public.core_planejadorealizado ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    239    238            �           2604    25163    core_sazonalidadecidade id    DEFAULT     �   ALTER TABLE ONLY public.core_sazonalidadecidade ALTER COLUMN id SET DEFAULT nextval('public.core_sazonalidadecidade_id_seq'::regclass);
 I   ALTER TABLE public.core_sazonalidadecidade ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    241    240            �           2604    33134    core_sazonalidadecidadecota id    DEFAULT     �   ALTER TABLE ONLY public.core_sazonalidadecidadecota ALTER COLUMN id SET DEFAULT nextval('public.core_sazonalidadecidadecota_id_seq'::regclass);
 M   ALTER TABLE public.core_sazonalidadecidadecota ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    276    275    276            �           2604    25164    core_sazonalidademodelo id    DEFAULT     �   ALTER TABLE ONLY public.core_sazonalidademodelo ALTER COLUMN id SET DEFAULT nextval('public.core_sazonalidademodelo_id_seq'::regclass);
 I   ALTER TABLE public.core_sazonalidademodelo ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    243    242            �           2604    33126    core_sazonalidademodelocota id    DEFAULT     �   ALTER TABLE ONLY public.core_sazonalidademodelocota ALTER COLUMN id SET DEFAULT nextval('public.core_sazonalidademodelocota_id_seq'::regclass);
 M   ALTER TABLE public.core_sazonalidademodelocota ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    274    273    274            �           2604    25165    core_sazonalidaderegiao id    DEFAULT     �   ALTER TABLE ONLY public.core_sazonalidaderegiao ALTER COLUMN id SET DEFAULT nextval('public.core_sazonalidaderegiao_id_seq'::regclass);
 I   ALTER TABLE public.core_sazonalidaderegiao ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    245    244            �           2604    33110    core_sazonalidaderegiaocota id    DEFAULT     �   ALTER TABLE ONLY public.core_sazonalidaderegiaocota ALTER COLUMN id SET DEFAULT nextval('public.core_sazonalidaderegiaocota_id_seq'::regclass);
 M   ALTER TABLE public.core_sazonalidaderegiaocota ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    269    270    270            �           2604    25166    core_sazonalidadevendedor id    DEFAULT     �   ALTER TABLE ONLY public.core_sazonalidadevendedor ALTER COLUMN id SET DEFAULT nextval('public.core_sazonalidadevendedor_id_seq'::regclass);
 K   ALTER TABLE public.core_sazonalidadevendedor ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    247    246            �           2604    33118     core_sazonalidadevendedorcota id    DEFAULT     �   ALTER TABLE ONLY public.core_sazonalidadevendedorcota ALTER COLUMN id SET DEFAULT nextval('public.core_sazonalidadevendedorcota_id_seq'::regclass);
 O   ALTER TABLE public.core_sazonalidadevendedorcota ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    272    271    272            �           2604    25167    core_totalmensalmoto2019 id    DEFAULT     �   ALTER TABLE ONLY public.core_totalmensalmoto2019 ALTER COLUMN id SET DEFAULT nextval('public.core_totalmensalmoto2019_id_seq'::regclass);
 J   ALTER TABLE public.core_totalmensalmoto2019 ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    249    248            �           2604    25168    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    251    250            �           2604    25169    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    253    252            �           2604    25170    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    255    254            �           2604    25628    metas_cidademodelo id    DEFAULT     ~   ALTER TABLE ONLY public.metas_cidademodelo ALTER COLUMN id SET DEFAULT nextval('public.metas_cidademodelo_id_seq'::regclass);
 D   ALTER TABLE public.metas_cidademodelo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    268    267    268            �           2604    33227    metas_cidademodelocota id    DEFAULT     �   ALTER TABLE ONLY public.metas_cidademodelocota ALTER COLUMN id SET DEFAULT nextval('public.metas_cidademodelocota_id_seq'::regclass);
 H   ALTER TABLE public.metas_cidademodelocota ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    287    288    288            �           2604    25620    metas_vendedormodelo id    DEFAULT     �   ALTER TABLE ONLY public.metas_vendedormodelo ALTER COLUMN id SET DEFAULT nextval('public.metas_vendedormodelo_id_seq'::regclass);
 F   ALTER TABLE public.metas_vendedormodelo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    265    266    266            �           2604    33219    metas_vendedormodelocota id    DEFAULT     �   ALTER TABLE ONLY public.metas_vendedormodelocota ALTER COLUMN id SET DEFAULT nextval('public.metas_vendedormodelocota_id_seq'::regclass);
 J   ALTER TABLE public.metas_vendedormodelocota ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    285    286    286            �           2604    25422    planejado_firstetapa id    DEFAULT     �   ALTER TABLE ONLY public.planejado_firstetapa ALTER COLUMN id SET DEFAULT nextval('public.planejado_firstetapa_id_seq'::regclass);
 F   ALTER TABLE public.planejado_firstetapa ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    262    261    262            �           2604    33178    planejado_firstetapacota id    DEFAULT     �   ALTER TABLE ONLY public.planejado_firstetapacota ALTER COLUMN id SET DEFAULT nextval('public.planejado_firstetapacota_id_seq'::regclass);
 J   ALTER TABLE public.planejado_firstetapacota ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    284    283    284            �           2604    25436    planejado_potencialcidade id    DEFAULT     �   ALTER TABLE ONLY public.planejado_potencialcidade ALTER COLUMN id SET DEFAULT nextval('public.planejado_potencialcidade_id_seq'::regclass);
 K   ALTER TABLE public.planejado_potencialcidade ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    263    264    264            �           2604    33170     planejado_potencialcidadecota id    DEFAULT     �   ALTER TABLE ONLY public.planejado_potencialcidadecota ALTER COLUMN id SET DEFAULT nextval('public.planejado_potencialcidadecota_id_seq'::regclass);
 O   ALTER TABLE public.planejado_potencialcidadecota ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    281    282    282            �           2604    25388 %   planejado_sazonalidademodelocidade id    DEFAULT     �   ALTER TABLE ONLY public.planejado_sazonalidademodelocidade ALTER COLUMN id SET DEFAULT nextval('public.planejado_sazonalidademodelocidade_id_seq'::regclass);
 T   ALTER TABLE public.planejado_sazonalidademodelocidade ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    258    257    258            �           2604    33162 )   planejado_sazonalidademodelocidadecota id    DEFAULT     �   ALTER TABLE ONLY public.planejado_sazonalidademodelocidadecota ALTER COLUMN id SET DEFAULT nextval('public.planejado_sazonalidademodelocidadecota_id_seq'::regclass);
 X   ALTER TABLE public.planejado_sazonalidademodelocidadecota ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    279    280    280            �           2604    25408 '   planejado_sazonalidademodelovendedor id    DEFAULT     �   ALTER TABLE ONLY public.planejado_sazonalidademodelovendedor ALTER COLUMN id SET DEFAULT nextval('public.planejado_sazonalidademodelovendedor_id_seq'::regclass);
 V   ALTER TABLE public.planejado_sazonalidademodelovendedor ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    259    260    260            �           2604    33154 +   planejado_sazonalidademodelovendedorcota id    DEFAULT     �   ALTER TABLE ONLY public.planejado_sazonalidademodelovendedorcota ALTER COLUMN id SET DEFAULT nextval('public.planejado_sazonalidademodelovendedorcota_id_seq'::regclass);
 Z   ALTER TABLE public.planejado_sazonalidademodelovendedorcota ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    278    277    278            �          0    24981    account_perfil 
   TABLE DATA           T   COPY public.account_perfil (id, cargo, regiao, avatar, usuario_id, cpf) FROM stdin;
    public          mgwrazdkuavmyp    false    202   �S      �          0    24989    account_planejadouser 
   TABLE DATA           |   COPY public.account_planejadouser (id, planejado, planejado_moto, planejado_cota, planejado_visita, usuario_id) FROM stdin;
    public          mgwrazdkuavmyp    false    204   �U      �          0    24994 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          mgwrazdkuavmyp    false    206   �U      �          0    24999    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          mgwrazdkuavmyp    false    208   �U      �          0    25004    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          mgwrazdkuavmyp    false    210   �U      �          0    25009 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          mgwrazdkuavmyp    false    212   /\      �          0    25015    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          mgwrazdkuavmyp    false    213   �_      �          0    25022    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          mgwrazdkuavmyp    false    216   �_      �          0    25027    core_cidade 
   TABLE DATA           7   COPY public.core_cidade (id, nome, regiao) FROM stdin;
    public          mgwrazdkuavmyp    false    218   `                0    25032 	   core_cota 
   TABLE DATA           �  COPY public.core_cota (id, "Cpf_Vendedor", "Nome_Vendedor", "Data_da_Venda", "Prazo", "Tipo_contrato", "Modelo", "Status", "Cliente", "Municipio", "Telefone", "Celular", "Ponto_de_Venda", "Parcela", "Data_de_Vencimento", "Grupo", "Cota", "R", "D", "Credito", "Data_da_Contemplacao", "Tipo_de_Contemplacao", "Efetuou_Negociacao", "Proposta", "Digito_da_Proposta", "Vl_total_amortizado", "Vl_Quitacao", "Plano", "Porcentagem_Amortizado", "Porcentagem_Mensal", "Qtd_Parcelas", "Seguro_de_Vida") FROM stdin;
    public          mgwrazdkuavmyp    false    220   �a                0    25040    core_documentcota 
   TABLE DATA           F   COPY public.core_documentcota (id, document, uploaded_at) FROM stdin;
    public          mgwrazdkuavmyp    false    222   |$                0    25045    core_documentmoto 
   TABLE DATA           F   COPY public.core_documentmoto (id, document, uploaded_at) FROM stdin;
    public          mgwrazdkuavmyp    false    224   %                0    25050    core_equipe 
   TABLE DATA           H   COPY public.core_equipe (id, cidade_id, user_id, perfil_id) FROM stdin;
    public          mgwrazdkuavmyp    false    226   f%      	          0    25055    core_metacotacidade 
   TABLE DATA           W   COPY public.core_metacotacidade (id, ano, mes, meta, cidade_id, modelo_id) FROM stdin;
    public          mgwrazdkuavmyp    false    228   �&                0    25060    core_metamotocidade 
   TABLE DATA           W   COPY public.core_metamotocidade (id, ano, mes, meta, cidade_id, modelo_id) FROM stdin;
    public          mgwrazdkuavmyp    false    230   �&                0    25065 	   core_moto 
   TABLE DATA           t  COPY public.core_moto (id, "Empresa", "Data", "Nota_Fiscal", "Serie", "Valor_da_Nota", "Veiculo", "Chassi", "Forma_Pagamento", "Vendedor", "Cliente", "Cpf_Cnpj_Cliente", "Novo", "Quantidade", "Operacao_Interna", "Data_Compra", "Custo_Medio", "Margem", "Margem_Porcentagem", "Ano_Fab", "Ano_Modelo", "Municipio", "Valor_Tabela", "Emp_Funcionario", "Motivo_Devolucao", "Cor", "Tipo", "Telefone", "Celular", email, "Placa", "Despesa_Oficina", "Despesa_Financeira", "Valor_Venda_Gerencial", "Base_Comissao", "Forma_Fabrica", "Sub_Forma_Fabrica", "Modalidade_Venda", "Grupo_Pessoa_Vendedor", "Vendedor_cpf", "Cancelada") FROM stdin;
    public          mgwrazdkuavmyp    false    232   �&                0    25073    core_motoperfil 
   TABLE DATA           ;   COPY public.core_motoperfil (id, nome, avatar) FROM stdin;
    public          mgwrazdkuavmyp    false    234   N[                0    25081    core_planejadomoto 
   TABLE DATA           X   COPY public.core_planejadomoto (id, regiao, mes, ano, cidade_id, modelo_id) FROM stdin;
    public          mgwrazdkuavmyp    false    236   ?_                0    25086    core_planejadorealizado 
   TABLE DATA           �   COPY public.core_planejadorealizado (id, planejado, planejado_moto, planejado_cota, planejado_visita, cidade, regiao, mes, ano) FROM stdin;
    public          mgwrazdkuavmyp    false    238   \_                0    25091    core_sazonalidadecidade 
   TABLE DATA           k   COPY public.core_sazonalidadecidade (id, mes, percentual, vl_total_anual, ano_base, cidade_id) FROM stdin;
    public          mgwrazdkuavmyp    false    240   y_      9          0    33131    core_sazonalidadecidadecota 
   TABLE DATA           o   COPY public.core_sazonalidadecidadecota (id, mes, percentual, vl_total_anual, ano_base, cidade_id) FROM stdin;
    public          postgres    false    276   �h                0    25096    core_sazonalidademodelo 
   TABLE DATA           s   COPY public.core_sazonalidademodelo (id, mes, percentual, vl_total_anual, ano_base, modelo_id, regiao) FROM stdin;
    public          mgwrazdkuavmyp    false    242   �q      7          0    33123    core_sazonalidademodelocota 
   TABLE DATA           w   COPY public.core_sazonalidademodelocota (id, regiao, mes, percentual, vl_total_anual, ano_base, modelo_id) FROM stdin;
    public          postgres    false    274   S�                0    25101    core_sazonalidaderegiao 
   TABLE DATA           h   COPY public.core_sazonalidaderegiao (id, regiao, mes, percentual, vl_total_anual, ano_base) FROM stdin;
    public          mgwrazdkuavmyp    false    244   ��      3          0    33107    core_sazonalidaderegiaocota 
   TABLE DATA           l   COPY public.core_sazonalidaderegiaocota (id, regiao, mes, percentual, vl_total_anual, ano_base) FROM stdin;
    public          postgres    false    270   �                0    25106    core_sazonalidadevendedor 
   TABLE DATA              COPY public.core_sazonalidadevendedor (id, vendedor_nome, vendedor_cpf, mes, percentual, vl_total_anual, ano_base) FROM stdin;
    public          mgwrazdkuavmyp    false    246   ��      5          0    33115    core_sazonalidadevendedorcota 
   TABLE DATA           �   COPY public.core_sazonalidadevendedorcota (id, vendedor_nome, vendedor_cpf, mes, percentual, vl_total_anual, ano_base) FROM stdin;
    public          postgres    false    272   x�                0    25111    core_totalmensalmoto2019 
   TABLE DATA           H   COPY public.core_totalmensalmoto2019 (id, cidade, mes, qtd) FROM stdin;
    public          mgwrazdkuavmyp    false    248   n�                0    25116    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          mgwrazdkuavmyp    false    250   v�      !          0    25125    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          mgwrazdkuavmyp    false    252   ��      #          0    25130    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          mgwrazdkuavmyp    false    254   C�      %          0    25138    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          mgwrazdkuavmyp    false    256   H�      1          0    25625    metas_cidademodelo 
   TABLE DATA           �  COPY public.metas_cidademodelo (id, aplicado, previsto, ano, aplicado_jan, aplicado_fev, aplicado_mar, aplicado_abr, aplicado_mai, aplicado_jun, aplicado_jul, aplicado_ago, aplicado_sete, aplicado_out, aplicado_nov, aplicado_dez, cidade_id, modelo_id, previsto_abr, previsto_ago, previsto_dez, previsto_fev, previsto_jan, previsto_jul, previsto_jun, previsto_mai, previsto_mar, previsto_nov, previsto_out, previsto_sete) FROM stdin;
    public          postgres    false    268   I�      E          0    33224    metas_cidademodelocota 
   TABLE DATA           �  COPY public.metas_cidademodelocota (id, aplicado, previsto, ano, aplicado_jan, aplicado_fev, aplicado_mar, aplicado_abr, aplicado_mai, aplicado_jun, aplicado_jul, aplicado_ago, aplicado_sete, aplicado_out, aplicado_nov, aplicado_dez, previsto_jan, previsto_fev, previsto_mar, previsto_abr, previsto_mai, previsto_jun, previsto_jul, previsto_ago, previsto_sete, previsto_out, previsto_nov, previsto_dez, cidade_id, modelo_id) FROM stdin;
    public          postgres    false    288   ��      /          0    25617    metas_vendedormodelo 
   TABLE DATA           �  COPY public.metas_vendedormodelo (id, aplicado, previsto, ano, aplicado_fev, aplicado_dez, aplicado_mai, aplicado_abr, aplicado_jun, aplicado_jul, aplicado_jan, aplicado_ago, aplicado_out, aplicado_nov, aplicado_mar, vendedor_id, aplicado_sete, previsto_abr, previsto_ago, previsto_dez, previsto_fev, previsto_jan, previsto_jul, previsto_jun, previsto_mai, previsto_mar, previsto_nov, previsto_out, previsto_sete, modelo_id) FROM stdin;
    public          postgres    false    266   ��      C          0    33216    metas_vendedormodelocota 
   TABLE DATA           �  COPY public.metas_vendedormodelocota (id, aplicado, previsto, ano, aplicado_jan, aplicado_fev, aplicado_mar, aplicado_abr, aplicado_mai, aplicado_jun, aplicado_jul, aplicado_ago, aplicado_sete, aplicado_out, aplicado_nov, aplicado_dez, previsto_jan, previsto_fev, previsto_mar, previsto_abr, previsto_mai, previsto_jun, previsto_jul, previsto_ago, previsto_sete, previsto_out, previsto_nov, previsto_dez, modelo_id, vendedor_id) FROM stdin;
    public          postgres    false    286   ��      +          0    25419    planejado_firstetapa 
   TABLE DATA           �   COPY public.planejado_firstetapa (id, regiao, ano, jan, fev, mar, abr, mai, jun, jul, ago, sete, "out", nov, dez, modelo_id, aplicado, previsto) FROM stdin;
    public          postgres    false    262   \�      A          0    33175    planejado_firstetapacota 
   TABLE DATA           �   COPY public.planejado_firstetapacota (id, regiao, aplicado, previsto, ano, jan, fev, mar, abr, mai, jun, jul, ago, sete, "out", nov, dez, modelo_id) FROM stdin;
    public          postgres    false    284   ��      -          0    25433    planejado_potencialcidade 
   TABLE DATA           I   COPY public.planejado_potencialcidade (id, anual, cidade_id) FROM stdin;
    public          postgres    false    264   ��      ?          0    33167    planejado_potencialcidadecota 
   TABLE DATA           M   COPY public.planejado_potencialcidadecota (id, anual, cidade_id) FROM stdin;
    public          postgres    false    282   ��      '          0    25385 "   planejado_sazonalidademodelocidade 
   TABLE DATA           �   COPY public.planejado_sazonalidademodelocidade (id, regiao, mes, percentual, vl_total_anual, ano_base, cidade_id, modelo_id) FROM stdin;
    public          postgres    false    258   ��      =          0    33159 &   planejado_sazonalidademodelocidadecota 
   TABLE DATA           �   COPY public.planejado_sazonalidademodelocidadecota (id, regiao, mes, percentual, vl_total_anual, ano_base, cidade_id, modelo_id) FROM stdin;
    public          postgres    false    280   ޖ      )          0    25405 $   planejado_sazonalidademodelovendedor 
   TABLE DATA           �   COPY public.planejado_sazonalidademodelovendedor (id, vendedor_nome, vendedor_cpf, mes, percentual, vl_total_anual, ano_base, modelo_id) FROM stdin;
    public          postgres    false    260   ��      ;          0    33151 (   planejado_sazonalidademodelovendedorcota 
   TABLE DATA           �   COPY public.planejado_sazonalidademodelovendedorcota (id, vendedor_nome, vendedor_cpf, mes, percentual, vl_total_anual, ano_base, modelo_id) FROM stdin;
    public          postgres    false    278   $�      z           0    0    account_perfil_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.account_perfil_id_seq', 21, true);
          public          mgwrazdkuavmyp    false    203            {           0    0    account_planejadouser_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.account_planejadouser_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    205            |           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    207            }           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    209            ~           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 160, true);
          public          mgwrazdkuavmyp    false    211                       0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    214            �           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 21, true);
          public          mgwrazdkuavmyp    false    215            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    217            �           0    0    core_cidade_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.core_cidade_id_seq', 44, true);
          public          mgwrazdkuavmyp    false    219            �           0    0    core_cota_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.core_cota_id_seq', 1649, true);
          public          mgwrazdkuavmyp    false    221            �           0    0    core_documentcota_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.core_documentcota_id_seq', 3, true);
          public          mgwrazdkuavmyp    false    223            �           0    0    core_documentmoto_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.core_documentmoto_id_seq', 1, true);
          public          mgwrazdkuavmyp    false    225            �           0    0    core_equipe_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.core_equipe_id_seq', 67, true);
          public          mgwrazdkuavmyp    false    227            �           0    0    core_metacotacidade_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.core_metacotacidade_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    229            �           0    0    core_metamotocidade_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.core_metamotocidade_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    231            �           0    0    core_moto_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.core_moto_id_seq', 2939, true);
          public          mgwrazdkuavmyp    false    233            �           0    0    core_motoperfil_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.core_motoperfil_id_seq', 23, true);
          public          mgwrazdkuavmyp    false    235            �           0    0    core_planejadomoto_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.core_planejadomoto_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    237            �           0    0    core_planejadorealizado_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.core_planejadorealizado_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    239            �           0    0    core_sazonalidadecidade_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.core_sazonalidadecidade_id_seq', 1584, true);
          public          mgwrazdkuavmyp    false    241            �           0    0 "   core_sazonalidadecidadecota_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.core_sazonalidadecidadecota_id_seq', 1836, true);
          public          postgres    false    275            �           0    0    core_sazonalidademodelo_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.core_sazonalidademodelo_id_seq', 3312, true);
          public          mgwrazdkuavmyp    false    243            �           0    0 "   core_sazonalidademodelocota_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.core_sazonalidademodelocota_id_seq', 3312, true);
          public          postgres    false    273            �           0    0    core_sazonalidaderegiao_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.core_sazonalidaderegiao_id_seq', 144, true);
          public          mgwrazdkuavmyp    false    245            �           0    0 "   core_sazonalidaderegiaocota_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.core_sazonalidaderegiaocota_id_seq', 144, true);
          public          postgres    false    269            �           0    0     core_sazonalidadevendedor_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.core_sazonalidadevendedor_id_seq', 1548, true);
          public          mgwrazdkuavmyp    false    247            �           0    0 $   core_sazonalidadevendedorcota_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.core_sazonalidadevendedorcota_id_seq', 6732, true);
          public          postgres    false    271            �           0    0    core_totalmensalmoto2019_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.core_totalmensalmoto2019_id_seq', 528, true);
          public          mgwrazdkuavmyp    false    249            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 56, true);
          public          mgwrazdkuavmyp    false    251            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 40, true);
          public          mgwrazdkuavmyp    false    253            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 66, true);
          public          mgwrazdkuavmyp    false    255            �           0    0    metas_cidademodelo_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.metas_cidademodelo_id_seq', 65, true);
          public          postgres    false    267            �           0    0    metas_cidademodelocota_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.metas_cidademodelocota_id_seq', 535, true);
          public          postgres    false    287            �           0    0    metas_vendedormodelo_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.metas_vendedormodelo_id_seq', 518, true);
          public          postgres    false    265            �           0    0    metas_vendedormodelocota_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.metas_vendedormodelocota_id_seq', 461, true);
          public          postgres    false    285            �           0    0    planejado_firstetapa_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.planejado_firstetapa_id_seq', 23, true);
          public          postgres    false    261            �           0    0    planejado_firstetapacota_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.planejado_firstetapacota_id_seq', 23, true);
          public          postgres    false    283            �           0    0     planejado_potencialcidade_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.planejado_potencialcidade_id_seq', 38, true);
          public          postgres    false    263            �           0    0 $   planejado_potencialcidadecota_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.planejado_potencialcidadecota_id_seq', 1, false);
          public          postgres    false    281            �           0    0 )   planejado_sazonalidademodelocidade_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.planejado_sazonalidademodelocidade_id_seq', 82698, true);
          public          postgres    false    257            �           0    0 -   planejado_sazonalidademodelocidadecota_id_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.planejado_sazonalidademodelocidadecota_id_seq', 1, false);
          public          postgres    false    279            �           0    0 +   planejado_sazonalidademodelovendedor_id_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.planejado_sazonalidademodelovendedor_id_seq', 1476, true);
          public          postgres    false    259            �           0    0 /   planejado_sazonalidademodelovendedorcota_id_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.planejado_sazonalidademodelovendedorcota_id_seq', 1, false);
          public          postgres    false    277            �           2606    25172 "   account_perfil account_perfil_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.account_perfil
    ADD CONSTRAINT account_perfil_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.account_perfil DROP CONSTRAINT account_perfil_pkey;
       public            mgwrazdkuavmyp    false    202            �           2606    25174 0   account_planejadouser account_planejadouser_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.account_planejadouser
    ADD CONSTRAINT account_planejadouser_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.account_planejadouser DROP CONSTRAINT account_planejadouser_pkey;
       public            mgwrazdkuavmyp    false    204            �           2606    25176    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            mgwrazdkuavmyp    false    206            �           2606    25178 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            mgwrazdkuavmyp    false    208    208            �           2606    25180 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            mgwrazdkuavmyp    false    208            �           2606    25182    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            mgwrazdkuavmyp    false    206            �           2606    25184 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            mgwrazdkuavmyp    false    210    210            �           2606    25186 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            mgwrazdkuavmyp    false    210            �           2606    25188 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            mgwrazdkuavmyp    false    213            �           2606    25190 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            mgwrazdkuavmyp    false    213    213            �           2606    25192    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            mgwrazdkuavmyp    false    212            �           2606    25194 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            mgwrazdkuavmyp    false    216            �           2606    25196 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            mgwrazdkuavmyp    false    216    216            �           2606    25198     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            mgwrazdkuavmyp    false    212            �           2606    25200    core_cidade core_cidade_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.core_cidade
    ADD CONSTRAINT core_cidade_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.core_cidade DROP CONSTRAINT core_cidade_pkey;
       public            mgwrazdkuavmyp    false    218            �           2606    25202    core_cota core_cota_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.core_cota
    ADD CONSTRAINT core_cota_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.core_cota DROP CONSTRAINT core_cota_pkey;
       public            mgwrazdkuavmyp    false    220            �           2606    25204 (   core_documentcota core_documentcota_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.core_documentcota
    ADD CONSTRAINT core_documentcota_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.core_documentcota DROP CONSTRAINT core_documentcota_pkey;
       public            mgwrazdkuavmyp    false    222            �           2606    25206 (   core_documentmoto core_documentmoto_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.core_documentmoto
    ADD CONSTRAINT core_documentmoto_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.core_documentmoto DROP CONSTRAINT core_documentmoto_pkey;
       public            mgwrazdkuavmyp    false    224            �           2606    25208    core_equipe core_equipe_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.core_equipe
    ADD CONSTRAINT core_equipe_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.core_equipe DROP CONSTRAINT core_equipe_pkey;
       public            mgwrazdkuavmyp    false    226            �           2606    25210 ,   core_metacotacidade core_metacotacidade_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.core_metacotacidade
    ADD CONSTRAINT core_metacotacidade_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.core_metacotacidade DROP CONSTRAINT core_metacotacidade_pkey;
       public            mgwrazdkuavmyp    false    228            �           2606    25212 ,   core_metamotocidade core_metamotocidade_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.core_metamotocidade
    ADD CONSTRAINT core_metamotocidade_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.core_metamotocidade DROP CONSTRAINT core_metamotocidade_pkey;
       public            mgwrazdkuavmyp    false    230            �           2606    25214    core_moto core_moto_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.core_moto
    ADD CONSTRAINT core_moto_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.core_moto DROP CONSTRAINT core_moto_pkey;
       public            mgwrazdkuavmyp    false    232            �           2606    25216 $   core_motoperfil core_motoperfil_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.core_motoperfil
    ADD CONSTRAINT core_motoperfil_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.core_motoperfil DROP CONSTRAINT core_motoperfil_pkey;
       public            mgwrazdkuavmyp    false    234            �           2606    25218 *   core_planejadomoto core_planejadomoto_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.core_planejadomoto
    ADD CONSTRAINT core_planejadomoto_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.core_planejadomoto DROP CONSTRAINT core_planejadomoto_pkey;
       public            mgwrazdkuavmyp    false    236            �           2606    25220 4   core_planejadorealizado core_planejadorealizado_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.core_planejadorealizado
    ADD CONSTRAINT core_planejadorealizado_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.core_planejadorealizado DROP CONSTRAINT core_planejadorealizado_pkey;
       public            mgwrazdkuavmyp    false    238            �           2606    25222 4   core_sazonalidadecidade core_sazonalidadecidade_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.core_sazonalidadecidade
    ADD CONSTRAINT core_sazonalidadecidade_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.core_sazonalidadecidade DROP CONSTRAINT core_sazonalidadecidade_pkey;
       public            mgwrazdkuavmyp    false    240            1           2606    33136 <   core_sazonalidadecidadecota core_sazonalidadecidadecota_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.core_sazonalidadecidadecota
    ADD CONSTRAINT core_sazonalidadecidadecota_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.core_sazonalidadecidadecota DROP CONSTRAINT core_sazonalidadecidadecota_pkey;
       public            postgres    false    276            �           2606    25224 4   core_sazonalidademodelo core_sazonalidademodelo_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.core_sazonalidademodelo
    ADD CONSTRAINT core_sazonalidademodelo_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.core_sazonalidademodelo DROP CONSTRAINT core_sazonalidademodelo_pkey;
       public            mgwrazdkuavmyp    false    242            .           2606    33128 <   core_sazonalidademodelocota core_sazonalidademodelocota_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.core_sazonalidademodelocota
    ADD CONSTRAINT core_sazonalidademodelocota_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.core_sazonalidademodelocota DROP CONSTRAINT core_sazonalidademodelocota_pkey;
       public            postgres    false    274                        2606    25226 4   core_sazonalidaderegiao core_sazonalidaderegiao_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.core_sazonalidaderegiao
    ADD CONSTRAINT core_sazonalidaderegiao_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.core_sazonalidaderegiao DROP CONSTRAINT core_sazonalidaderegiao_pkey;
       public            mgwrazdkuavmyp    false    244            )           2606    33112 <   core_sazonalidaderegiaocota core_sazonalidaderegiaocota_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.core_sazonalidaderegiaocota
    ADD CONSTRAINT core_sazonalidaderegiaocota_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.core_sazonalidaderegiaocota DROP CONSTRAINT core_sazonalidaderegiaocota_pkey;
       public            postgres    false    270                       2606    25228 8   core_sazonalidadevendedor core_sazonalidadevendedor_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.core_sazonalidadevendedor
    ADD CONSTRAINT core_sazonalidadevendedor_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.core_sazonalidadevendedor DROP CONSTRAINT core_sazonalidadevendedor_pkey;
       public            mgwrazdkuavmyp    false    246            +           2606    33120 @   core_sazonalidadevendedorcota core_sazonalidadevendedorcota_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.core_sazonalidadevendedorcota
    ADD CONSTRAINT core_sazonalidadevendedorcota_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.core_sazonalidadevendedorcota DROP CONSTRAINT core_sazonalidadevendedorcota_pkey;
       public            postgres    false    272                       2606    25230 6   core_totalmensalmoto2019 core_totalmensalmoto2019_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.core_totalmensalmoto2019
    ADD CONSTRAINT core_totalmensalmoto2019_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.core_totalmensalmoto2019 DROP CONSTRAINT core_totalmensalmoto2019_pkey;
       public            mgwrazdkuavmyp    false    248                       2606    25232 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            mgwrazdkuavmyp    false    250            
           2606    25234 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            mgwrazdkuavmyp    false    252    252                       2606    25236 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            mgwrazdkuavmyp    false    252                       2606    25238 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            mgwrazdkuavmyp    false    254                       2606    25240 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            mgwrazdkuavmyp    false    256            '           2606    25630 *   metas_cidademodelo metas_cidademodelo_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.metas_cidademodelo
    ADD CONSTRAINT metas_cidademodelo_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.metas_cidademodelo DROP CONSTRAINT metas_cidademodelo_pkey;
       public            postgres    false    268            F           2606    33229 2   metas_cidademodelocota metas_cidademodelocota_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.metas_cidademodelocota
    ADD CONSTRAINT metas_cidademodelocota_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.metas_cidademodelocota DROP CONSTRAINT metas_cidademodelocota_pkey;
       public            postgres    false    288            "           2606    25622 .   metas_vendedormodelo metas_vendedormodelo_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.metas_vendedormodelo
    ADD CONSTRAINT metas_vendedormodelo_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.metas_vendedormodelo DROP CONSTRAINT metas_vendedormodelo_pkey;
       public            postgres    false    266            A           2606    33221 6   metas_vendedormodelocota metas_vendedormodelocota_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.metas_vendedormodelocota
    ADD CONSTRAINT metas_vendedormodelocota_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.metas_vendedormodelocota DROP CONSTRAINT metas_vendedormodelocota_pkey;
       public            postgres    false    286                       2606    25424 .   planejado_firstetapa planejado_firstetapa_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.planejado_firstetapa
    ADD CONSTRAINT planejado_firstetapa_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.planejado_firstetapa DROP CONSTRAINT planejado_firstetapa_pkey;
       public            postgres    false    262            >           2606    33180 6   planejado_firstetapacota planejado_firstetapacota_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.planejado_firstetapacota
    ADD CONSTRAINT planejado_firstetapacota_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.planejado_firstetapacota DROP CONSTRAINT planejado_firstetapacota_pkey;
       public            postgres    false    284                       2606    25438 8   planejado_potencialcidade planejado_potencialcidade_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.planejado_potencialcidade
    ADD CONSTRAINT planejado_potencialcidade_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.planejado_potencialcidade DROP CONSTRAINT planejado_potencialcidade_pkey;
       public            postgres    false    264            ;           2606    33172 @   planejado_potencialcidadecota planejado_potencialcidadecota_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.planejado_potencialcidadecota
    ADD CONSTRAINT planejado_potencialcidadecota_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.planejado_potencialcidadecota DROP CONSTRAINT planejado_potencialcidadecota_pkey;
       public            postgres    false    282                       2606    25390 J   planejado_sazonalidademodelocidade planejado_sazonalidademodelocidade_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.planejado_sazonalidademodelocidade
    ADD CONSTRAINT planejado_sazonalidademodelocidade_pkey PRIMARY KEY (id);
 t   ALTER TABLE ONLY public.planejado_sazonalidademodelocidade DROP CONSTRAINT planejado_sazonalidademodelocidade_pkey;
       public            postgres    false    258            8           2606    33164 R   planejado_sazonalidademodelocidadecota planejado_sazonalidademodelocidadecota_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.planejado_sazonalidademodelocidadecota
    ADD CONSTRAINT planejado_sazonalidademodelocidadecota_pkey PRIMARY KEY (id);
 |   ALTER TABLE ONLY public.planejado_sazonalidademodelocidadecota DROP CONSTRAINT planejado_sazonalidademodelocidadecota_pkey;
       public            postgres    false    280                       2606    25410 N   planejado_sazonalidademodelovendedor planejado_sazonalidademodelovendedor_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.planejado_sazonalidademodelovendedor
    ADD CONSTRAINT planejado_sazonalidademodelovendedor_pkey PRIMARY KEY (id);
 x   ALTER TABLE ONLY public.planejado_sazonalidademodelovendedor DROP CONSTRAINT planejado_sazonalidademodelovendedor_pkey;
       public            postgres    false    260            4           2606    33156 V   planejado_sazonalidademodelovendedorcota planejado_sazonalidademodelovendedorcota_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.planejado_sazonalidademodelovendedorcota
    ADD CONSTRAINT planejado_sazonalidademodelovendedorcota_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.planejado_sazonalidademodelovendedorcota DROP CONSTRAINT planejado_sazonalidademodelovendedorcota_pkey;
       public            postgres    false    278            �           1259    25241 "   account_perfil_usuario_id_b23e6d20    INDEX     c   CREATE INDEX account_perfil_usuario_id_b23e6d20 ON public.account_perfil USING btree (usuario_id);
 6   DROP INDEX public.account_perfil_usuario_id_b23e6d20;
       public            mgwrazdkuavmyp    false    202            �           1259    25242 )   account_planejadouser_usuario_id_d3d4b699    INDEX     q   CREATE INDEX account_planejadouser_usuario_id_d3d4b699 ON public.account_planejadouser USING btree (usuario_id);
 =   DROP INDEX public.account_planejadouser_usuario_id_d3d4b699;
       public            mgwrazdkuavmyp    false    204            �           1259    25243    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            mgwrazdkuavmyp    false    206            �           1259    25244 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            mgwrazdkuavmyp    false    208            �           1259    25245 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            mgwrazdkuavmyp    false    208            �           1259    25246 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            mgwrazdkuavmyp    false    210            �           1259    25247 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            mgwrazdkuavmyp    false    213            �           1259    25248 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            mgwrazdkuavmyp    false    213            �           1259    25249 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            mgwrazdkuavmyp    false    216            �           1259    25250 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            mgwrazdkuavmyp    false    216            �           1259    25251     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            mgwrazdkuavmyp    false    212            �           1259    25252    core_equipe_cidade_id_7841757b    INDEX     [   CREATE INDEX core_equipe_cidade_id_7841757b ON public.core_equipe USING btree (cidade_id);
 2   DROP INDEX public.core_equipe_cidade_id_7841757b;
       public            mgwrazdkuavmyp    false    226            �           1259    25253    core_equipe_perfil_id_4dc22eb9    INDEX     [   CREATE INDEX core_equipe_perfil_id_4dc22eb9 ON public.core_equipe USING btree (perfil_id);
 2   DROP INDEX public.core_equipe_perfil_id_4dc22eb9;
       public            mgwrazdkuavmyp    false    226            �           1259    25254    core_equipe_user_id_a0d90f89    INDEX     W   CREATE INDEX core_equipe_user_id_a0d90f89 ON public.core_equipe USING btree (user_id);
 0   DROP INDEX public.core_equipe_user_id_a0d90f89;
       public            mgwrazdkuavmyp    false    226            �           1259    25255 &   core_metacotacidade_cidade_id_f5ba1c0c    INDEX     k   CREATE INDEX core_metacotacidade_cidade_id_f5ba1c0c ON public.core_metacotacidade USING btree (cidade_id);
 :   DROP INDEX public.core_metacotacidade_cidade_id_f5ba1c0c;
       public            mgwrazdkuavmyp    false    228            �           1259    25256 &   core_metacotacidade_modelo_id_9fc9a085    INDEX     k   CREATE INDEX core_metacotacidade_modelo_id_9fc9a085 ON public.core_metacotacidade USING btree (modelo_id);
 :   DROP INDEX public.core_metacotacidade_modelo_id_9fc9a085;
       public            mgwrazdkuavmyp    false    228            �           1259    25257 &   core_metamotocidade_cidade_id_ff14d219    INDEX     k   CREATE INDEX core_metamotocidade_cidade_id_ff14d219 ON public.core_metamotocidade USING btree (cidade_id);
 :   DROP INDEX public.core_metamotocidade_cidade_id_ff14d219;
       public            mgwrazdkuavmyp    false    230            �           1259    25258 &   core_metamotocidade_modelo_id_965aa791    INDEX     k   CREATE INDEX core_metamotocidade_modelo_id_965aa791 ON public.core_metamotocidade USING btree (modelo_id);
 :   DROP INDEX public.core_metamotocidade_modelo_id_965aa791;
       public            mgwrazdkuavmyp    false    230            �           1259    25259 %   core_planejadomoto_cidade_id_09f22229    INDEX     i   CREATE INDEX core_planejadomoto_cidade_id_09f22229 ON public.core_planejadomoto USING btree (cidade_id);
 9   DROP INDEX public.core_planejadomoto_cidade_id_09f22229;
       public            mgwrazdkuavmyp    false    236            �           1259    25260 %   core_planejadomoto_modelo_id_28f380ea    INDEX     i   CREATE INDEX core_planejadomoto_modelo_id_28f380ea ON public.core_planejadomoto USING btree (modelo_id);
 9   DROP INDEX public.core_planejadomoto_modelo_id_28f380ea;
       public            mgwrazdkuavmyp    false    236            �           1259    25261 *   core_sazonalidadecidade_cidade_id_87273f65    INDEX     s   CREATE INDEX core_sazonalidadecidade_cidade_id_87273f65 ON public.core_sazonalidadecidade USING btree (cidade_id);
 >   DROP INDEX public.core_sazonalidadecidade_cidade_id_87273f65;
       public            mgwrazdkuavmyp    false    240            /           1259    33148 .   core_sazonalidadecidadecota_cidade_id_65d0d012    INDEX     {   CREATE INDEX core_sazonalidadecidadecota_cidade_id_65d0d012 ON public.core_sazonalidadecidadecota USING btree (cidade_id);
 B   DROP INDEX public.core_sazonalidadecidadecota_cidade_id_65d0d012;
       public            postgres    false    276            �           1259    25262 *   core_sazonalidademodelo_modelo_id_ae4a9c0e    INDEX     s   CREATE INDEX core_sazonalidademodelo_modelo_id_ae4a9c0e ON public.core_sazonalidademodelo USING btree (modelo_id);
 >   DROP INDEX public.core_sazonalidademodelo_modelo_id_ae4a9c0e;
       public            mgwrazdkuavmyp    false    242            ,           1259    33142 .   core_sazonalidademodelocota_modelo_id_8fbf95b0    INDEX     {   CREATE INDEX core_sazonalidademodelocota_modelo_id_8fbf95b0 ON public.core_sazonalidademodelocota USING btree (modelo_id);
 B   DROP INDEX public.core_sazonalidademodelocota_modelo_id_8fbf95b0;
       public            postgres    false    274                       1259    25263 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            mgwrazdkuavmyp    false    250                       1259    25264 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            mgwrazdkuavmyp    false    250                       1259    25265 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            mgwrazdkuavmyp    false    256                       1259    25266 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            mgwrazdkuavmyp    false    256            $           1259    25647 %   metas_cidademodelo_cidade_id_d8540593    INDEX     i   CREATE INDEX metas_cidademodelo_cidade_id_d8540593 ON public.metas_cidademodelo USING btree (cidade_id);
 9   DROP INDEX public.metas_cidademodelo_cidade_id_d8540593;
       public            postgres    false    268            %           1259    25648 %   metas_cidademodelo_modelo_id_efff6d2a    INDEX     i   CREATE INDEX metas_cidademodelo_modelo_id_efff6d2a ON public.metas_cidademodelo USING btree (modelo_id);
 9   DROP INDEX public.metas_cidademodelo_modelo_id_efff6d2a;
       public            postgres    false    268            C           1259    33252 )   metas_cidademodelocota_cidade_id_10d06819    INDEX     q   CREATE INDEX metas_cidademodelocota_cidade_id_10d06819 ON public.metas_cidademodelocota USING btree (cidade_id);
 =   DROP INDEX public.metas_cidademodelocota_cidade_id_10d06819;
       public            postgres    false    288            D           1259    33253 )   metas_cidademodelocota_modelo_id_c93e6984    INDEX     q   CREATE INDEX metas_cidademodelocota_modelo_id_c93e6984 ON public.metas_cidademodelocota USING btree (modelo_id);
 =   DROP INDEX public.metas_cidademodelocota_modelo_id_c93e6984;
       public            postgres    false    288                        1259    25650 '   metas_vendedormodelo_modelo_id_8f8232a5    INDEX     m   CREATE INDEX metas_vendedormodelo_modelo_id_8f8232a5 ON public.metas_vendedormodelo USING btree (modelo_id);
 ;   DROP INDEX public.metas_vendedormodelo_modelo_id_8f8232a5;
       public            postgres    false    266            #           1259    25636 )   metas_vendedormodelo_vendedor_id_640a9553    INDEX     q   CREATE INDEX metas_vendedormodelo_vendedor_id_640a9553 ON public.metas_vendedormodelo USING btree (vendedor_id);
 =   DROP INDEX public.metas_vendedormodelo_vendedor_id_640a9553;
       public            postgres    false    266            ?           1259    33240 +   metas_vendedormodelocota_modelo_id_7f84ed0b    INDEX     u   CREATE INDEX metas_vendedormodelocota_modelo_id_7f84ed0b ON public.metas_vendedormodelocota USING btree (modelo_id);
 ?   DROP INDEX public.metas_vendedormodelocota_modelo_id_7f84ed0b;
       public            postgres    false    286            B           1259    33241 -   metas_vendedormodelocota_vendedor_id_ea8508ad    INDEX     y   CREATE INDEX metas_vendedormodelocota_vendedor_id_ea8508ad ON public.metas_vendedormodelocota USING btree (vendedor_id);
 A   DROP INDEX public.metas_vendedormodelocota_vendedor_id_ea8508ad;
       public            postgres    false    286                       1259    25430 '   planejado_firstetapa_modelo_id_38b67f4c    INDEX     m   CREATE INDEX planejado_firstetapa_modelo_id_38b67f4c ON public.planejado_firstetapa USING btree (modelo_id);
 ;   DROP INDEX public.planejado_firstetapa_modelo_id_38b67f4c;
       public            postgres    false    262            <           1259    33210 +   planejado_firstetapacota_modelo_id_a50ffe54    INDEX     u   CREATE INDEX planejado_firstetapacota_modelo_id_a50ffe54 ON public.planejado_firstetapacota USING btree (modelo_id);
 ?   DROP INDEX public.planejado_firstetapacota_modelo_id_a50ffe54;
       public            postgres    false    284                       1259    25444 ,   planejado_potencialcidade_cidade_id_0a5595cc    INDEX     w   CREATE INDEX planejado_potencialcidade_cidade_id_0a5595cc ON public.planejado_potencialcidade USING btree (cidade_id);
 @   DROP INDEX public.planejado_potencialcidade_cidade_id_0a5595cc;
       public            postgres    false    264            9           1259    33204 0   planejado_potencialcidadecota_cidade_id_1f0a3851    INDEX        CREATE INDEX planejado_potencialcidadecota_cidade_id_1f0a3851 ON public.planejado_potencialcidadecota USING btree (cidade_id);
 D   DROP INDEX public.planejado_potencialcidadecota_cidade_id_1f0a3851;
       public            postgres    false    282                       1259    25401 5   planejado_sazonalidademodelocidade_cidade_id_5bce301b    INDEX     �   CREATE INDEX planejado_sazonalidademodelocidade_cidade_id_5bce301b ON public.planejado_sazonalidademodelocidade USING btree (cidade_id);
 I   DROP INDEX public.planejado_sazonalidademodelocidade_cidade_id_5bce301b;
       public            postgres    false    258                       1259    25402 5   planejado_sazonalidademodelocidade_modelo_id_01764384    INDEX     �   CREATE INDEX planejado_sazonalidademodelocidade_modelo_id_01764384 ON public.planejado_sazonalidademodelocidade USING btree (modelo_id);
 I   DROP INDEX public.planejado_sazonalidademodelocidade_modelo_id_01764384;
       public            postgres    false    258            5           1259    33197 9   planejado_sazonalidademodelocidadecota_cidade_id_a4c43680    INDEX     �   CREATE INDEX planejado_sazonalidademodelocidadecota_cidade_id_a4c43680 ON public.planejado_sazonalidademodelocidadecota USING btree (cidade_id);
 M   DROP INDEX public.planejado_sazonalidademodelocidadecota_cidade_id_a4c43680;
       public            postgres    false    280            6           1259    33198 9   planejado_sazonalidademodelocidadecota_modelo_id_47883a54    INDEX     �   CREATE INDEX planejado_sazonalidademodelocidadecota_modelo_id_47883a54 ON public.planejado_sazonalidademodelocidadecota USING btree (modelo_id);
 M   DROP INDEX public.planejado_sazonalidademodelocidadecota_modelo_id_47883a54;
       public            postgres    false    280                       1259    25416 7   planejado_sazonalidademodelovendedor_modelo_id_847fd58c    INDEX     �   CREATE INDEX planejado_sazonalidademodelovendedor_modelo_id_847fd58c ON public.planejado_sazonalidademodelovendedor USING btree (modelo_id);
 K   DROP INDEX public.planejado_sazonalidademodelovendedor_modelo_id_847fd58c;
       public            postgres    false    260            2           1259    33186 ;   planejado_sazonalidademodelovendedorcota_modelo_id_38dee415    INDEX     �   CREATE INDEX planejado_sazonalidademodelovendedorcota_modelo_id_38dee415 ON public.planejado_sazonalidademodelovendedorcota USING btree (modelo_id);
 O   DROP INDEX public.planejado_sazonalidademodelovendedorcota_modelo_id_38dee415;
       public            postgres    false    278            G           2606    25267 A   account_perfil account_perfil_usuario_id_b23e6d20_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_perfil
    ADD CONSTRAINT account_perfil_usuario_id_b23e6d20_fk_auth_user_id FOREIGN KEY (usuario_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.account_perfil DROP CONSTRAINT account_perfil_usuario_id_b23e6d20_fk_auth_user_id;
       public          mgwrazdkuavmyp    false    202    3018    212            H           2606    25272 O   account_planejadouser account_planejadouser_usuario_id_d3d4b699_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_planejadouser
    ADD CONSTRAINT account_planejadouser_usuario_id_d3d4b699_fk_auth_user_id FOREIGN KEY (usuario_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.account_planejadouser DROP CONSTRAINT account_planejadouser_usuario_id_d3d4b699_fk_auth_user_id;
       public          mgwrazdkuavmyp    false    204    3018    212            I           2606    25277 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          mgwrazdkuavmyp    false    208    210    3016            J           2606    25282 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          mgwrazdkuavmyp    false    208    206    3005            K           2606    25287 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          mgwrazdkuavmyp    false    3084    210    252            L           2606    25292 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          mgwrazdkuavmyp    false    3005    213    206            M           2606    25297 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          mgwrazdkuavmyp    false    3018    213    212            N           2606    25302 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          mgwrazdkuavmyp    false    216    210    3016            O           2606    25307 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          mgwrazdkuavmyp    false    216    212    3018            P           2606    25312 <   core_equipe core_equipe_cidade_id_7841757b_fk_core_cidade_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_equipe
    ADD CONSTRAINT core_equipe_cidade_id_7841757b_fk_core_cidade_id FOREIGN KEY (cidade_id) REFERENCES public.core_cidade(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.core_equipe DROP CONSTRAINT core_equipe_cidade_id_7841757b_fk_core_cidade_id;
       public          mgwrazdkuavmyp    false    218    226    3035            Q           2606    25317 ?   core_equipe core_equipe_perfil_id_4dc22eb9_fk_account_perfil_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_equipe
    ADD CONSTRAINT core_equipe_perfil_id_4dc22eb9_fk_account_perfil_id FOREIGN KEY (perfil_id) REFERENCES public.account_perfil(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.core_equipe DROP CONSTRAINT core_equipe_perfil_id_4dc22eb9_fk_account_perfil_id;
       public          mgwrazdkuavmyp    false    202    2996    226            R           2606    25322 8   core_equipe core_equipe_user_id_a0d90f89_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_equipe
    ADD CONSTRAINT core_equipe_user_id_a0d90f89_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 b   ALTER TABLE ONLY public.core_equipe DROP CONSTRAINT core_equipe_user_id_a0d90f89_fk_auth_user_id;
       public          mgwrazdkuavmyp    false    3018    226    212            S           2606    25327 L   core_metacotacidade core_metacotacidade_cidade_id_f5ba1c0c_fk_core_cidade_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_metacotacidade
    ADD CONSTRAINT core_metacotacidade_cidade_id_f5ba1c0c_fk_core_cidade_id FOREIGN KEY (cidade_id) REFERENCES public.core_cidade(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.core_metacotacidade DROP CONSTRAINT core_metacotacidade_cidade_id_f5ba1c0c_fk_core_cidade_id;
       public          mgwrazdkuavmyp    false    228    218    3035            T           2606    25332 P   core_metacotacidade core_metacotacidade_modelo_id_9fc9a085_fk_core_motoperfil_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_metacotacidade
    ADD CONSTRAINT core_metacotacidade_modelo_id_9fc9a085_fk_core_motoperfil_id FOREIGN KEY (modelo_id) REFERENCES public.core_motoperfil(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.core_metacotacidade DROP CONSTRAINT core_metacotacidade_modelo_id_9fc9a085_fk_core_motoperfil_id;
       public          mgwrazdkuavmyp    false    3058    228    234            U           2606    25337 L   core_metamotocidade core_metamotocidade_cidade_id_ff14d219_fk_core_cidade_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_metamotocidade
    ADD CONSTRAINT core_metamotocidade_cidade_id_ff14d219_fk_core_cidade_id FOREIGN KEY (cidade_id) REFERENCES public.core_cidade(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.core_metamotocidade DROP CONSTRAINT core_metamotocidade_cidade_id_ff14d219_fk_core_cidade_id;
       public          mgwrazdkuavmyp    false    230    218    3035            V           2606    25342 P   core_metamotocidade core_metamotocidade_modelo_id_965aa791_fk_core_motoperfil_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_metamotocidade
    ADD CONSTRAINT core_metamotocidade_modelo_id_965aa791_fk_core_motoperfil_id FOREIGN KEY (modelo_id) REFERENCES public.core_motoperfil(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.core_metamotocidade DROP CONSTRAINT core_metamotocidade_modelo_id_965aa791_fk_core_motoperfil_id;
       public          mgwrazdkuavmyp    false    230    234    3058            W           2606    25347 J   core_planejadomoto core_planejadomoto_cidade_id_09f22229_fk_core_cidade_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_planejadomoto
    ADD CONSTRAINT core_planejadomoto_cidade_id_09f22229_fk_core_cidade_id FOREIGN KEY (cidade_id) REFERENCES public.core_cidade(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.core_planejadomoto DROP CONSTRAINT core_planejadomoto_cidade_id_09f22229_fk_core_cidade_id;
       public          mgwrazdkuavmyp    false    218    3035    236            X           2606    25352 N   core_planejadomoto core_planejadomoto_modelo_id_28f380ea_fk_core_motoperfil_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_planejadomoto
    ADD CONSTRAINT core_planejadomoto_modelo_id_28f380ea_fk_core_motoperfil_id FOREIGN KEY (modelo_id) REFERENCES public.core_motoperfil(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.core_planejadomoto DROP CONSTRAINT core_planejadomoto_modelo_id_28f380ea_fk_core_motoperfil_id;
       public          mgwrazdkuavmyp    false    236    3058    234            g           2606    33143 P   core_sazonalidadecidadecota core_sazonalidadecid_cidade_id_65d0d012_fk_core_cida    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_sazonalidadecidadecota
    ADD CONSTRAINT core_sazonalidadecid_cidade_id_65d0d012_fk_core_cida FOREIGN KEY (cidade_id) REFERENCES public.core_cidade(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.core_sazonalidadecidadecota DROP CONSTRAINT core_sazonalidadecid_cidade_id_65d0d012_fk_core_cida;
       public          postgres    false    276    218    3035            Y           2606    25357 T   core_sazonalidadecidade core_sazonalidadecidade_cidade_id_87273f65_fk_core_cidade_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_sazonalidadecidade
    ADD CONSTRAINT core_sazonalidadecidade_cidade_id_87273f65_fk_core_cidade_id FOREIGN KEY (cidade_id) REFERENCES public.core_cidade(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.core_sazonalidadecidade DROP CONSTRAINT core_sazonalidadecidade_cidade_id_87273f65_fk_core_cidade_id;
       public          mgwrazdkuavmyp    false    218    3035    240            f           2606    33137 P   core_sazonalidademodelocota core_sazonalidademod_modelo_id_8fbf95b0_fk_core_moto    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_sazonalidademodelocota
    ADD CONSTRAINT core_sazonalidademod_modelo_id_8fbf95b0_fk_core_moto FOREIGN KEY (modelo_id) REFERENCES public.core_motoperfil(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.core_sazonalidademodelocota DROP CONSTRAINT core_sazonalidademod_modelo_id_8fbf95b0_fk_core_moto;
       public          postgres    false    234    3058    274            Z           2606    25362 L   core_sazonalidademodelo core_sazonalidademod_modelo_id_ae4a9c0e_fk_core_moto    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_sazonalidademodelo
    ADD CONSTRAINT core_sazonalidademod_modelo_id_ae4a9c0e_fk_core_moto FOREIGN KEY (modelo_id) REFERENCES public.core_motoperfil(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.core_sazonalidademodelo DROP CONSTRAINT core_sazonalidademod_modelo_id_ae4a9c0e_fk_core_moto;
       public          mgwrazdkuavmyp    false    242    3058    234            [           2606    25367 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          mgwrazdkuavmyp    false    250    252    3084            \           2606    25372 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          mgwrazdkuavmyp    false    3018    250    212            d           2606    25637 J   metas_cidademodelo metas_cidademodelo_cidade_id_d8540593_fk_core_cidade_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.metas_cidademodelo
    ADD CONSTRAINT metas_cidademodelo_cidade_id_d8540593_fk_core_cidade_id FOREIGN KEY (cidade_id) REFERENCES public.core_cidade(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.metas_cidademodelo DROP CONSTRAINT metas_cidademodelo_cidade_id_d8540593_fk_core_cidade_id;
       public          postgres    false    3035    268    218            e           2606    25642 N   metas_cidademodelo metas_cidademodelo_modelo_id_efff6d2a_fk_core_motoperfil_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.metas_cidademodelo
    ADD CONSTRAINT metas_cidademodelo_modelo_id_efff6d2a_fk_core_motoperfil_id FOREIGN KEY (modelo_id) REFERENCES public.core_motoperfil(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.metas_cidademodelo DROP CONSTRAINT metas_cidademodelo_modelo_id_efff6d2a_fk_core_motoperfil_id;
       public          postgres    false    268    234    3058            o           2606    33242 R   metas_cidademodelocota metas_cidademodelocota_cidade_id_10d06819_fk_core_cidade_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.metas_cidademodelocota
    ADD CONSTRAINT metas_cidademodelocota_cidade_id_10d06819_fk_core_cidade_id FOREIGN KEY (cidade_id) REFERENCES public.core_cidade(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.metas_cidademodelocota DROP CONSTRAINT metas_cidademodelocota_cidade_id_10d06819_fk_core_cidade_id;
       public          postgres    false    3035    288    218            p           2606    33247 V   metas_cidademodelocota metas_cidademodelocota_modelo_id_c93e6984_fk_core_motoperfil_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.metas_cidademodelocota
    ADD CONSTRAINT metas_cidademodelocota_modelo_id_c93e6984_fk_core_motoperfil_id FOREIGN KEY (modelo_id) REFERENCES public.core_motoperfil(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.metas_cidademodelocota DROP CONSTRAINT metas_cidademodelocota_modelo_id_c93e6984_fk_core_motoperfil_id;
       public          postgres    false    3058    234    288            m           2606    33230 M   metas_vendedormodelocota metas_vendedormodelo_modelo_id_7f84ed0b_fk_core_moto    FK CONSTRAINT     �   ALTER TABLE ONLY public.metas_vendedormodelocota
    ADD CONSTRAINT metas_vendedormodelo_modelo_id_7f84ed0b_fk_core_moto FOREIGN KEY (modelo_id) REFERENCES public.core_motoperfil(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.metas_vendedormodelocota DROP CONSTRAINT metas_vendedormodelo_modelo_id_7f84ed0b_fk_core_moto;
       public          postgres    false    286    3058    234            c           2606    25651 R   metas_vendedormodelo metas_vendedormodelo_modelo_id_8f8232a5_fk_core_motoperfil_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.metas_vendedormodelo
    ADD CONSTRAINT metas_vendedormodelo_modelo_id_8f8232a5_fk_core_motoperfil_id FOREIGN KEY (modelo_id) REFERENCES public.core_motoperfil(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.metas_vendedormodelo DROP CONSTRAINT metas_vendedormodelo_modelo_id_8f8232a5_fk_core_motoperfil_id;
       public          postgres    false    3058    266    234            b           2606    25631 S   metas_vendedormodelo metas_vendedormodelo_vendedor_id_640a9553_fk_account_perfil_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.metas_vendedormodelo
    ADD CONSTRAINT metas_vendedormodelo_vendedor_id_640a9553_fk_account_perfil_id FOREIGN KEY (vendedor_id) REFERENCES public.account_perfil(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.metas_vendedormodelo DROP CONSTRAINT metas_vendedormodelo_vendedor_id_640a9553_fk_account_perfil_id;
       public          postgres    false    2996    266    202            n           2606    33235 O   metas_vendedormodelocota metas_vendedormodelo_vendedor_id_ea8508ad_fk_account_p    FK CONSTRAINT     �   ALTER TABLE ONLY public.metas_vendedormodelocota
    ADD CONSTRAINT metas_vendedormodelo_vendedor_id_ea8508ad_fk_account_p FOREIGN KEY (vendedor_id) REFERENCES public.account_perfil(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.metas_vendedormodelocota DROP CONSTRAINT metas_vendedormodelo_vendedor_id_ea8508ad_fk_account_p;
       public          postgres    false    2996    202    286            `           2606    25425 R   planejado_firstetapa planejado_firstetapa_modelo_id_38b67f4c_fk_core_motoperfil_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.planejado_firstetapa
    ADD CONSTRAINT planejado_firstetapa_modelo_id_38b67f4c_fk_core_motoperfil_id FOREIGN KEY (modelo_id) REFERENCES public.core_motoperfil(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.planejado_firstetapa DROP CONSTRAINT planejado_firstetapa_modelo_id_38b67f4c_fk_core_motoperfil_id;
       public          postgres    false    234    3058    262            l           2606    33205 M   planejado_firstetapacota planejado_firstetapa_modelo_id_a50ffe54_fk_core_moto    FK CONSTRAINT     �   ALTER TABLE ONLY public.planejado_firstetapacota
    ADD CONSTRAINT planejado_firstetapa_modelo_id_a50ffe54_fk_core_moto FOREIGN KEY (modelo_id) REFERENCES public.core_motoperfil(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.planejado_firstetapacota DROP CONSTRAINT planejado_firstetapa_modelo_id_a50ffe54_fk_core_moto;
       public          postgres    false    284    3058    234            k           2606    33199 R   planejado_potencialcidadecota planejado_potencialc_cidade_id_1f0a3851_fk_core_cida    FK CONSTRAINT     �   ALTER TABLE ONLY public.planejado_potencialcidadecota
    ADD CONSTRAINT planejado_potencialc_cidade_id_1f0a3851_fk_core_cida FOREIGN KEY (cidade_id) REFERENCES public.core_cidade(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.planejado_potencialcidadecota DROP CONSTRAINT planejado_potencialc_cidade_id_1f0a3851_fk_core_cida;
       public          postgres    false    218    282    3035            a           2606    25439 X   planejado_potencialcidade planejado_potencialcidade_cidade_id_0a5595cc_fk_core_cidade_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.planejado_potencialcidade
    ADD CONSTRAINT planejado_potencialcidade_cidade_id_0a5595cc_fk_core_cidade_id FOREIGN KEY (cidade_id) REFERENCES public.core_cidade(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.planejado_potencialcidade DROP CONSTRAINT planejado_potencialcidade_cidade_id_0a5595cc_fk_core_cidade_id;
       public          postgres    false    264    218    3035            ]           2606    25391 W   planejado_sazonalidademodelocidade planejado_sazonalida_cidade_id_5bce301b_fk_core_cida    FK CONSTRAINT     �   ALTER TABLE ONLY public.planejado_sazonalidademodelocidade
    ADD CONSTRAINT planejado_sazonalida_cidade_id_5bce301b_fk_core_cida FOREIGN KEY (cidade_id) REFERENCES public.core_cidade(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.planejado_sazonalidademodelocidade DROP CONSTRAINT planejado_sazonalida_cidade_id_5bce301b_fk_core_cida;
       public          postgres    false    218    258    3035            i           2606    33187 [   planejado_sazonalidademodelocidadecota planejado_sazonalida_cidade_id_a4c43680_fk_core_cida    FK CONSTRAINT     �   ALTER TABLE ONLY public.planejado_sazonalidademodelocidadecota
    ADD CONSTRAINT planejado_sazonalida_cidade_id_a4c43680_fk_core_cida FOREIGN KEY (cidade_id) REFERENCES public.core_cidade(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.planejado_sazonalidademodelocidadecota DROP CONSTRAINT planejado_sazonalida_cidade_id_a4c43680_fk_core_cida;
       public          postgres    false    218    280    3035            ^           2606    25396 W   planejado_sazonalidademodelocidade planejado_sazonalida_modelo_id_01764384_fk_core_moto    FK CONSTRAINT     �   ALTER TABLE ONLY public.planejado_sazonalidademodelocidade
    ADD CONSTRAINT planejado_sazonalida_modelo_id_01764384_fk_core_moto FOREIGN KEY (modelo_id) REFERENCES public.core_motoperfil(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.planejado_sazonalidademodelocidade DROP CONSTRAINT planejado_sazonalida_modelo_id_01764384_fk_core_moto;
       public          postgres    false    258    3058    234            h           2606    33181 ]   planejado_sazonalidademodelovendedorcota planejado_sazonalida_modelo_id_38dee415_fk_core_moto    FK CONSTRAINT     �   ALTER TABLE ONLY public.planejado_sazonalidademodelovendedorcota
    ADD CONSTRAINT planejado_sazonalida_modelo_id_38dee415_fk_core_moto FOREIGN KEY (modelo_id) REFERENCES public.core_motoperfil(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.planejado_sazonalidademodelovendedorcota DROP CONSTRAINT planejado_sazonalida_modelo_id_38dee415_fk_core_moto;
       public          postgres    false    234    278    3058            j           2606    33192 [   planejado_sazonalidademodelocidadecota planejado_sazonalida_modelo_id_47883a54_fk_core_moto    FK CONSTRAINT     �   ALTER TABLE ONLY public.planejado_sazonalidademodelocidadecota
    ADD CONSTRAINT planejado_sazonalida_modelo_id_47883a54_fk_core_moto FOREIGN KEY (modelo_id) REFERENCES public.core_motoperfil(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.planejado_sazonalidademodelocidadecota DROP CONSTRAINT planejado_sazonalida_modelo_id_47883a54_fk_core_moto;
       public          postgres    false    234    3058    280            _           2606    25411 Y   planejado_sazonalidademodelovendedor planejado_sazonalida_modelo_id_847fd58c_fk_core_moto    FK CONSTRAINT     �   ALTER TABLE ONLY public.planejado_sazonalidademodelovendedor
    ADD CONSTRAINT planejado_sazonalida_modelo_id_847fd58c_fk_core_moto FOREIGN KEY (modelo_id) REFERENCES public.core_motoperfil(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.planejado_sazonalidademodelovendedor DROP CONSTRAINT planejado_sazonalida_modelo_id_847fd58c_fk_core_moto;
       public          postgres    false    234    260    3058            �   �  x���]kT1����g�3�v+X�
�QY����]��]џ�T����\�$3y^���z��^��+7�7�p�M��}9λ��x�,�Wð|=�.?�iu?�����p8���[�� �!��ϫ6��8�G��{b�qϡ�zZƩ�pC3���{��b8�Ӽ�ٝ���v����y�M�V ~�L�T����+Zg�h�M͡b�o0�]�-���_���㽀��'>��?��zy|n"��X	˧/��楛��R��z}�nӧ����U�H�?d%�*}{]��kkN�Z;k&-#F�Àjg�<;��fL��b�0l�m\����� ��Z��z���3e��+Bg�e�Z@H�XM�`g���(C]�2ب3����F�"w�U.�eI�W�ε�����u��yUk��2      �      x������ � �      �      x������ � �      �      x������ � �      �   @  x��Xˎ�F<K_�/���� ���X�8�X���`��#��Mv��ew��*�ɮVU���p>���n�͏�EU,��\~�ϲ�����cT(�� ��u�5/E`���?[/DP"������y�nE��e/�S@�N`2>�� �CTH�Q�N!ʏ��u/�.����).�T2&�P8�c(�(h�	|=�G�B �e����*���;����in���p���6/om7���EХ�JYe 	�R���+�S|_�c�	�U�*D���0�*kU�Cq�����L�zAT+�s��� ���*oZ�@�j� D!�2�c�ޯ�m�g8O��8\/����#6����Q�mS����y��i�E;�\lQ�وz���Du:e����P�+��	�P�+��%�Tz�b씷�y8��2���lTDG@(��a ��1!b����ei�
'���V5@�P4�R�Q�D�GDÈX����_����Z�U����V�B�=�p�	\t�E�$��/�]�m���G���s��2�w�_,ǟ�T�X<N$��X�Q�itVo��Qڐ�Z��h����J�,��'���>�*a��$'v�yz��\wh�
w)�mک6�𔍦���(�����A3��U��W�@�k3�' �13`J�RZ#&�;|^2���߲X��q���^5�K��L5\��T���C�&;N���k�-��Z��w�[�d���A�˦Ġ����٬t1B2��'Iܠ�<N�Q@y����@��!9)�H$�hۀ����~���X���go�����}�o��(qrߡ�0�b�8��(�7����e�����Ǖ�X��G��;�7�H7�fz�d�Y�L��?��v��2ƕ�ػG��1�nƑnd����q$g35N(t>E��1{�;'5�"$���MDţ5��X�>Tp��[==�zr�3��$gz0)�H2�S��@�3=�� �;��h���1�	���Z�<ɴ�R#�j�M�L�)� ��҉��w�T�V�ޟ:������?�A��	Ao2r�sbqV�uy<��b~�CQ���KpeA�ᔀ�9(��F	��Tx1~4d����4����⥸Z�_�џ�,7z��_&w{Ɣ_�|Ɗ�_T��h�2��J�3H�Z�SS��QbO2�ie�O�+�����{_JP�5G�K9�#s�w��!>y�K7���Ƴ4p��-_T\sCB['�6��^{� �q\O�T��H��@���Kb�#��^X`��Q&�ar�s��J��� ��'�D���Q�?�%B�n�B�i/��vri�'C���s�%��}2��{�%��}2��{&��y2��s&�8=��~�߭ހ�Y�Q�(u���Gj�:���C�vB"��v�!z�N�m�Dr����KT7�1�nX�D�K&ŗg�t�6�2in[s�M�L�['�\y�@����n���I5NvaaI�Xj���+��DT��"f&��bR[��m���ĳ�)Q_���6*	�r�A���$���@7<+�ߊ�67�D�l`.�Ⱦ�d��"��,m�f���V����a�)      �   �  x����n�V��GO���<=�� �%Z�K�*)�J��#�9�.�nN����W��/�!%�-@�Z��t����1�Ї="b��DQ�J*7w�껗��������b��(�X��@�@P�	�>�=FO$J�т
%
7�ZT^�;�*��\�/�L�)fTP�j�8�$5Rk��(L&�(�3/����>ȼ4,��(J'YV���<��)f�a���q�f�(��"�P3�Tk�k�j���<l��9C1�s/π=��
�GjэU��X������r�J�NrO��_�<�/�t@�V+nk�i}ab����]o��!�Þ7/��-e'���t0��bz���p���>5(/�v[z�[���kZ��T�I=�PYL��z���`��W��ܲ�;Tns
�X1	�7�s$��D	��"܉C�$�����(�y�����4�n+� K)�ḩ��S����Z�3�Fq� �Q/(��P� dYaMc�'� P��X@K�F�j���֭�pq ��^��z�M�;$�(�"h3�^a
�C���~���0E1H���8ʻ�, �=�鱧�A�o8�-����(�|B7����bځ'!�ƒ&�=��1l(,	u�&� ԛD���dvcy ����f��R)��n� ��K�}ʳ������U�1�@�y����u���<�C;�Y2�S묙rڎtR 03�7ݭ�$�K��G�� ��8)b�"Lq}}�2dl?�L�+*	|��d4��|?��"����"����o�/�0��0{�y�ߏ���n�nt{;�R�ֶC��%,���z|x�\���~��(Hw�Vӿ�6ZOg�����&}��|[�K��_o���~�E�85.e��e��G_�7�s����3~��\b�%o�{@G9_����r�[�'�>-K��,�4�~��^�'�$�{      �      x������ � �      �      x������ � �      �   �  x�eSK��0\ӧ�	���ߒ����,�d��]u��{=�/VJr�<tc�Cj4���l)���ɢ��uU�CO���/C���>���A�ɭ�:�0�#�+F9���WV3:���0���L�+�$tf�w��B�=���+��HeV'H�K���lu4����]n�L���Ry�Z���}La\:?	����+g�Ż�i��فa��`"y�v��n���3�ٴ��V�IPݵK��>!�W�rd�>$��� ���K�)C�����X��Z����t�ְ �E���ȶ�`�D,F5��(η ����2Ķ��� ��I������r(�����C;������7N�1I���=%|���Go�x�����Y����U����w	kg�g&��.���1��7�w�A��}�^�_����^V;zd��c_u�{ȳc^�k��qҠ /��GUU�؏            x����r#��%���
=�<$��#Cb(�"�HI'3m^���fʬ�����g�ml>�~l�ڀ�p�;��Y�G��P�u���N�`���9�;�o��e����	���� v�ݷӟOR�����~|�u>�\���v������p;>�^O������q�?џ��ϧ�����;����۷�n�N�oO1H�L�aw�q��o���m'��+C���	�;#�p;mw�IvR
��s���9.�ǧ���v|z9�?N/���?����S::�މ�WN��io�^��ۿ�����?�������v��&���E���������h��������?,Ӓ��aW�8-m�}��������~8ӎ�]�������v:��Aڅ(��Q��[����M1R샪6�>vc�����14���+{b�S"����Ǹ3V뽐՞8���C��zi�/��'jiO>������I:���@�� ՞�r:<}��ޯO/ǧ+}���V�˸1VHZ\y<����x��5�`--JЎ�hw��eW.8�]�i#�ޮ4>:<�+V{�֚�����������
U��~:�O��xh;\���r����ݱ����x��+�İfe���[eТ�����N+��"xzYf��R�`v�*��Pn��L mո"m�]�:n>m�?��v`���ˑ��~����E;p#�1~������5�����[���ꃣA�oM��r���W$�'�e:	�Շ�����L��u���@o������i\�!Y����u:�/�~OG�^�;��-{i�l�d�v���>�]4R��|�޶���Y�t��;|��z{;�����Eޮ�Å����d����g���5A߆ �g��+�>�G��}�颏/mVO��,}0A8C��u �Fg�8�p���_��ә��V/���x�1-���l���3�i�ק�m�ӯ����6h����>�{�5�.���
�wֺ�ڹ]��-}�v�l��/$Wk�o�Y�#Yw����jT�P�C��,9 �!�ɴC�v������^N���|�oO������q/���t���Er�t��
"
/�2N흟��\����v�
��M�Hndgi�{r�F�t��XC�G��5�$M�����?zi�od��X�o#�'>;�+Y��Du���E�2h2&����e�>+����x*O�7+Z6>��t(A[-,�atH(^�t���rH@v��p\~����F���xy雐���������Dn��絳|�l��ᑦ�����5���b�ߓ��YP@��})�������������?�	�;m?z���TZ0� /%�G����N�锅�vSD�N�m!&x!+�~�p};]^ig~����u�|n�5pAi2C÷�����?~ �<��~���4B��k��ӧ���ݒ�7�cJ����h�Q
�iKT�WM�VK����{O =�c��臢����:�k���x9�@�*JZٓ���r�<��W�$����x�����I�}.�B�7`Lid���0���8�.o�t�_h��wd�f�HvR��2���_9�������Ӱh��A�?i����l��)G��Z��m��p ?i�^�f��~���&H�Zz�?(m(͢sA6������������?�����o����5�ߥ�c{$`����e��@�"W\Ί�E��{��^�\w�������£_����)d���p�.���HN��}���h�c�V�	cc��-'�8�xFGo_ա�B>$�a��֏noIX��{X��]�����@���~�;���k��j[Z>K��¹*H0�d/$�U�D��v���ᑔ�;x��K��G���D�RM����>�����9,wn����?~�O�����V��H Hupmc�L��/� %�{Y;���O�ml��wm%2t���LtB".����.R$E�2�tc'�C���q@t: �ӿL;�t�v_�!��<�^/��NO�#o>}"��M��vQ�7�Ҿ���J�7�7C	��|��Ǒ�ӋV�
T�H^����`ǔ�������������<��ᑌiL���I�~\��������%��k��zjm(�V�Fk\�RQx�f΁c>������*����R8������5�Q�d�n�7�r3u<���X�ۉ~��(]��񍲪7�t��!��ç�*�`U�@ڽ�� 6�p���0`)>�CN/[e�P%V�r^:�;��YH�q�v${q�q-CrWmA?q8�Oױ`@�x���Ξ%�3M�@ǽ5M<D�N�)$]�	?Y 2A��'����2�J֓��(m�Dx������h��t[L6�$���U�)�8i܎_��o�ݤ G��t���^P�U������~���������B�#TI���ѵ�6&�|�H�0 lL���3ʴ9d']���nSDm	�]D��]�8 ��館�E�M���a)jmu�㝶�����z?,;E�B�ig�6���J� �\h��2;
�Qk�7wM���$���,NGN��j	:Wdb���t|��DX�]�q;��O�(�<R$�P����6:�9�BtEo�I,��:Ƥ�^3�ݼ�&���N!%~��,�
�S��C�K�aZ���^Q���+��1�h5N*)������OJ,�ק��4(ʦ�p��1�0� n�ҏ
Ci} "�o.��N�I���d�i�U)�ŉ{:�
!V�fn[�C�X�4o�$�t��Ks&�a�-y��(�Ch.y��B��m@D^(T�?�͓�����e�a��\�R@QmZ�·��XH8�i���^{U]Yy�����	v�K��(uA"ݢ����R6⡎t@�3?�!����RH���to�G2Ƈ��)o�~B}�>�r?6�he��.�1{��c�����8����o��{c�����Bә��`���d�̞Y��jD�|�7#�㍎����p�,��@��S�@&0TVߐ�����d̂�z-���p��r�v��Co��1� ю.�ΔM��� �M�����S)�RJ���N�@�QR�@^ϧ��ki8t���3�P~h�d��J�6
��{���z�ߏ�E��(�D+����:m���ʟo��>h���AR �lu��թB����Z�\�o����)��2j����0�u6�,\G��T^͑�+���tL~nW���v�����XO�Uɱ���Y�N��*O�?џCfvLR���4
��@�q �)xe&�7���ᦐ`<)�H�'SJIa,9�����p��v��R��_�U���c�Q��G�ME��#����dt��_�����p��0Xr8BX2F�������M%U�)���s�HA�;����[?}+��Q�3�_�O�7z�����>�����y�Wd
�	�~h��:D1���R ʀ�g���"�f 2%�"2���.~#��{K�Zv�T�v^���5��qQ�hI��k�m:�}���EgaD���'�
tH��('��^Э��u��}�V��0���=�O�~,8gQ0k��G��p�Av܃���ɍ����(>B���|�rp@�.��)V��-���b�=�)��a_ȂsJ�L�`Ol����y)�$%��B�\�����BYq�vd��MEUziu��Vx���GC:�W�+�]�^���e%Ā�RvI�T9
�(ή�^탷AĩA/���o%��o��X8���c?�Rff"��@���,T���E�P	�K�>Q�5mۮ��.�i��ak����FVX!������;O��.��hv�Va$��||+���g�nh)z:FJl˝p��?+�,�g`n��;D���[�H./����0�?�Œ!H(4WJ�j��nU�(8�y�=};�];o~���l,�y:��	L�zc��.�NirJ�����4�p�d�-GC��E�9��3o7�R��	Χ?ѓ{>�^P)���x��(X.�B�0�7q���Ԅ&L(zPS.��?$)����ؓ�$W���2!����5��z���RP�pX���%����+�p�CqL��
ߖW  b:����7P 1�ߓ1�����#ߕG�7�`�>��5e>:���S*疫a�Е'���������    ����D7D2\!���������)
 Tt�H!�������).hZg��������b�wSU%�{���I�A6{�#-{r-�����(~�6���HJuż�>�ER0�:6�w��RTj*�I9�%W�
�Ҿl�L�f���5�cO��p�]�ޯtD��G��Zs÷e��͊�*��*o]#��ג�-����D���Xـ��F�~H({[�����p ��o	�r>ݿ]{����m���TJ����� H�糣��`�ǥ�4�i}��~(�L�G���{jIM�ܑ�K����3C;1ܞ*ڜS�U�ֶJ-��PSM��-;"�����(;J�!�,���{k�e'ǖ_�}�q"��t;�]�ޡ��]q0@3W���mk(8l
S�Y�C�:�=�>Z��U�@��y�HLQC.�����!03-0�!��b�	9�l��lՇ�B袛9��l���)�6g���z>|�?��
r);C��eѓY��飜���VOG�j$������(2���.K ��#~�clhw�P��h���4����'��j�p����~O|�+O������bl���2�F�;�ZB��)p/:J�a�㭜��kk	֯fj��/��d-���^����vMV�]�� ��F�Ȯ�%:% v
V�$��F&%�gd�x�j����`�~е�W�U
�?�i��ձ�D�5}VGK3�.T��ʭ3�/>�6Ҋ�fk�V�f�[÷�Ԇx���pz�iO2��!���AUё%c'�S�T���hhx?6������`��b���9�a ��E�4�/B����/�K���q�Uz������7�ݙtDG�F���*��a�H��6��P�b���{��P��C5��"[xє�Ֆ�C����p){Ӈ��ǭӄP.HK�h�Ƣ���̫-�����h@�y(5}�1�dgX���^���t^~��{��+�q�p���b,NL�PoՖ]�P9�as����~L�@t����bT�|�k�ΉH�t�[�qPaޔ�wGC����|�m*M��+P�XL�!�XF;��
�%���t�"�t@�����1�a]�ܶ��dh�恾�V�<��d�u�_y��3*��R%���P�Q_�Q��D�k���	l!�[���k��>D,�q� <�B�֗��=�f��#m #���+4�G��a*�xJn��Bi�n�$'u�[,8�B=[Bg��sl�P���xѭ%�~��l	o[M���|�Y ��q�t�-���-E�(��,���ȍ�w��P�9�h�=h�g�L�Qچh�:��p��P��Ϗ3�9'l�����|�4����'Kn�ah�S��#��
��.�� ��Ҙ(�\6As���ȣBl�(Z��h��wh�?��1�@�[rt�P<O�Uٳ��r�~.E����4���|�����=�*�̠ӐٙU�M��U����<%�&��'w%� Vy錺1��z�:j���"	�w��S?B�f[<s	Q�H!�)�Ԋ�S4dN�q��	�� ����b��{�,\��W��9���ZQnk�"Rթ6EUo&5'0�p&���1-P\��a�U�2���ڙ�y0�HW��*i��Scڈ^���{�������M��������L[h��,�f�Z���
���t,�1n�Sn�`#�(}{��������@<�������2�����C���'Su?�R��iP�h�l�N۶K��#��"���������J%_�����E�6�r�X�=.���p�9"�u�8�?Z�����&),˭#�n�z݀#GA�H�m�\	�t��tEFSY� �SH9R]�"��v��͠�?�|Ek��TSd!��X���)�Ș������׳`a>�zՖl!�iG�8����q�Y�����?q>R�m��"]�
��0�`9.t�� &0ҊcdEI�3E��i�F�y��7�gJx�Hbi��r�
>��?��4�%ܓ�hȬ[�b�[�1�[cb��QI�kh�n����6�ŧ�J ��l$%ު,*�����sy4�oT��X/x���{���������8�[L�IP(���Abt)�h$aݎ�}t�=���>X ��a�5e덗�'�o��:��:��[�6��V��B��#�F˥�h�e:&(�:����Ά:�P�=�LC�� qލ��c�X���n���x|�Z3�#�)/�ڋ�-a0�U}.��n�>/!W�(�@f�uu,e<٘@j��K�n��z}5^��>��xz=<�Xw��Ӽ�(�� 6є�w�<0]�J��.;U=����|���؊ Hʖ -��Z̠����T��t�j����?n��y��X
C�2��pIп�u����Y0z�����e�V�'���H#���C�<x�n�p>��c�=���Ӌ��:�~Z�A�\�ݠ6���P fn��<8Ӕk��K��Am���l˫�����x��N��HE�4"u��W@�)��BV3㽲:%�;קYK���i�
93zt�C���4�PF&�.�`����?<�v���������*��e���r?>�7�h�!�ZJ���^����?4�ёWw��%��,G$�����f]X�:�]X��j	Si,�w���[(t������&�zn����OA�w6V�G�ND��PI2*���Z�T:L�9�8.���mє2
��k�C��"������f��|��>QF���(����Q��Ɉ�	���|���~�H� �+)��׺���z	�M/>.v��D9=g���70��������
�����w\�c�#��1�}&ʠG���b{�p���)��7.�I��H�����:��=�F��C��
b%��*-r��1����Mc���_�6 �"�i`22\��{񲖘rf@��H�|��[0�y� '�ߩcoE�5�ڀ�A�rޢ�t,.=��I �`��.��= X%�:�`f� =)&u>��M��~����J�|���1����1�13v�b��v���9(�~�b������	J��[��)�G�d�e��?���<�"D�.H���M��1����y��|�T6b�w #!��86��#])]L8棱α)j���H/�I�|~����j��	�McNJ�5�r@�c��n��r�e�T��`1�E�g�/N�1T\.K��Y���C؀�bF��~{}`S����U��F�J\9�1w;ʖΎ�n�I9r���nzAcT	��`�`"�|��0�8�[�0K��L��ac�����)@Z���ь@�K �^���K�D ���Y�X��jVP�\y�d1\�Pz/�Ŧ&�'�v�^VT�d�0��4Y5^O"�Z"����.��цE�Ea����(2�`�C�D��v&�L��i%����[s=<�n�\���C�2��Eo*$3P��N<� �I����y�"�U�0�x��L���%�k#�z��޽=W� ��@g�@9������$dU\�M�m�nq1at<��P��Y+"5�M�F�5�v�`��]j�^�<� ^��>�`h駞��LU�AQW%4�
Jv �s͏ĴrcT�[��~�D�	NWՎͣ��i�ꩼ%jݹƆ��{$.G ���R�T'bVZ�k���/�Ҫ���K�+nG�t/�N��r�r-
3Pa@������g�[���1�"��;��i�W��?i/9��Ν���c��5��������f����2Б�d��OqEՉM�v?�����2ǟ�*4t������Z��������j��� 'Ȓ��zS`[i��3��j�;�֠=�%J��!�8�?�kr$(5�i,H�8T�O�)��}oߟhW�o&pKP�|>��d��zrNzo�v���}IId�C�!�!oaR(*��emUw��R��aj0Z���@����T��[�7&��#��9Hǰ#�#:4��<�u��0�h5*����Z�FA�s0��*�X��L����m��6x��o"~	�Re"ך��ˢ4E�f�c����l H�����4�`&k    �#AA���$O7�N���lF1W��q%cCG�xF8��<�?W�ҁ���%�;�Q�����}��˔ec�{�cd�`��Ci?�U�O��j� H�%�ۼ#��( �����X+�zN 8���.FɊ���P�`:���r;��ܮCO��[(�زY�.�F+ч�^�ֵȧ�č0�]:6��0�L���-�{��a�xy� �K��v�_6�b��P�Gh�3aa&���:�o=	!`���$j^/���%BR�b/��*�=z�ڃ��DށY��Zv`�9����RH��*o�*+����/%�h�|?��'��?[}��)��Q��?U���xA�5��.�ᱣ�l\�_�|���������I����&���o�=��F?w.\�3>�
u6j�q�&{����/8Ýq$'O���tY��x���O=��8��O�?�3�\A�=9��Y�r��Bl>��=��g�a|�{��a|`���=Z#9��.����-D݊��z�.<�?�R������JI�}��������!V�}�|b��i�(g:@|��G�!��>uUPIf۸U���x����zj}��N�ʇj���X�^�q���Rs:��/�:L�x�*@+&���ƕh�1��ŷ>Ęcn�_���tI����ߑ
 �SX49�ЎK�4O�cQ�s�_G�,�}�lb�y;�J�RΝ+u= YD���� ����_�Fk�մ�i��F� @ؿ���1�G�#�(Yt�����-��|��b��'��ލ� 7�����1�"aіɶ�}P�Q�Z��"�`�*��'f��%N;��Q�qE�2k+�5�����N�Ov��?ݟ����8�+�w1:t���X9�Q�`�
�S����!��W���"jk ���)�L���J1�nW=k���w�}��^!qz;�QF�T�Ȓ��2�	NC�O��t�M�4�O}ռ�Xp_[��4z�*�pn�0se�*w��'��@�y�O�06��KB{s��P�fʮ�Y�~raߨ}"��:Ч�P�˽?1�h�݄������7��RP�~������
�Z@0��,�i�ٚ���p�&(�$��*�7�)�LS@6A��U"r�+`(`�D���95?P�x���R)��\.��#(�c�6�J!j�,` ��)W���㌳���-�e�3+?4�;N� ��LV����.'	���Asm(G�h*:ך��	G�v�����pVbM����� �F��38��p�f�m#�*���jp`� �	EI��i{��@aS-Y��hD��i��������F����ZqD���F6j�L=0୯x
%��݊щX�Tu�U(���usD^2�f�P�|��e[�=���6�(�׈[n���*뢛�ԩ*XP�H�Rl��M]�ˠ��W�"0im?�D�|��Qј�����@@��Q�|�qX�p*5��Ԉd�[�����/��V��A��<S��V��je%$|(i(�c��_701l�����(eP�`�^ ���U�����^k\B�Xf-:ԈZ�e:!�88�a��#����XH�Mq��,!���Z��� �PM���,޹<Q	��3����@�6�ɨ��*х����=���!DV!����FgV&0�%��e�8*N�"B�QP�Z�v)>�t�GC0Ե#���̳e����upx�h�����!{�"�zcȮ�eY���&9�[R
y:P2tI#"�8�����)�q>�؎Fzp]U�y�ή�1�ҥ������+�Z�J�h��q��T-�\���V�~��VS1FO��n�
�ؑ��zW �X�̊B�TBa�Eׂ�����eY1l��\����d�'+�-�TO�H�N\3��6�+�젃�o*
c���f��8�PWl�-�5���6h�ע��<=S�GN��@���J���F)�B�}"�d�����&G�K�f)$vA���boq7��g�a�:G�ѓ^�_��hA7q>�^O��v��?M�{C�D	�rS&i��5=WG����0H���;#�sMٴ�qki���PP��+3M�z�8\��������m`i��g�ct��?���f6���Nj���	g����$i0���~e�>�
[��\3zh���3���'k�i���*ȶ�� �5���*�$�TÀr¨$�@��%T��0�J��L��|H�Gy�#�����z&;ym]�|��exǌΙq��Ts#*�@��6,�f��MS�rUݬ��>�)��1��'rº66�R�/�0,��{j���̳�m��x�%5U���2���:keQ2�������Y�Xk�4Aa-D�*�'��T� �$���f�Aɼ��2���kh���_.���p����@�/d��(��|�x�q|�&��Ό p~*�m��+�@ױ�p�2�8�Y��B��^{d Qcj�"t�ˮ�����0q�b�͍��u���D~?|���Q�H�&�IF�bu%k�ahF�f�4��صՌ��#F����(��-v�Np/dQ*�ѐ]lX��A�!��3d�ޑ��J^1e^��{�B�� 3)U+
"L�ikZ� �׋jV�ǿQ��vq��� >0��XZs�;8SMh^	�W]���"v�j�k�|�*J��߬f̻B�
O\�-S]Ev��'̝���Z��f2��0��	l�`ZE�����ãRQ�Ɠ�^���ɜ�\/�P�,u�R�i��D
w�g�D��D� ��e�w�q~�n���>z��l��8S����w�ֽ�F��{ץ/G4ʓ�JY����T���p<�Bs����X���^<�6I�����4�#�+�V y�Z����m���u��2���)k��)w�J"3�6@����|�ʿ\o����A9�����*d\(��18��S��g��tfv�Z:pB^�D�Cy�[APN�j����·G��끽}p@��r�d�ҽ@!�c]S�v�\,Ip�SH��k�ݬ
��z}k캥nnn�����y�J�5���r�n<�\9!Tc�|��][��r�3�`tH]�֨Hr���O���HecoV���+1�q���yEQ���Te�M�#�6Jx��3�eN�D_��xˀ���]��YC�Q@��ZF>Wt��YXlu��'��Q�b\�|
VE=MrE�ҳ�#Vh .w�h�<�ؒ�ҏ�@<����<�v����,>"c��f���P�e���}';GqNfǚ��f��-h�*f ��L5��f�S���v%(��D��_����1������A��������1A�6��\P��k��e��=�ӥ��E��d���0�y�������{�)D��d������Q�w�5�ɞ.�׏��;�n]�wtF�Ev��;`���m�"���J��;�z�?"gC����=uJ��O_ou���Ň��ߎ�0�Y�pn�'p����� �o�ݡ�)��>�U���=�<7vC�uc��\@A}��o}��YL�~��=,��4,1e2����>�&� �U[��o)���t��(T�\�|��sD����#;��qA��� ����;qV����g
}���}c���@Qj��SiI1�0m�1�͠�mi���	[A�~�����^H�U�&/ۑC�S	�5+�r��Z����P�B����`��>��͆�7H�x����Q���}�����WB�X��N���j!=t�3��ݢ�X��o��N�+A�P��ڽ���4u�|C�r�>�8��v�/���oE�1�nu��a�� jɥc�o8�����;P����CS#9� n��a���3��q<��m4�������^L��ݧh�:N��Q��/�뿑�_+wh+@�E�2/�ei3��&���"�[��R��~-]B�x>%fҥ(|kF1R���-0��L	r~Hm%Q%�K���|36~�7�fK���e�ٿLL�N1��y�@�dT���6ڮ$�����z���@P4��v��&����aޖ�!~���6�6^�߮����T����z�v~���v�R?�AeRr�t(�����ؠ�N�G>ߐ-�l�Ž�L+    �_v���p�6�`d���pN�k���L?��:�S}˩Y}���km���.bݹc�Ƞ��Vt�&�[�����CB��F�l2���<7~�_U�@B롞�� ~y<$N�>n���n�Md�L�SiD�1(z� 9���̌` �Zle�)Ӻo�b*��7�'t�\�	��\Т�
gj4$�r�ڤ���r;�����s� .T���@!�	d���| �����ÿ��ۗ�������Ǐ{��Rs���4���[�cQ4A��&j�6$v�uy��B3��ʎ�A��̟���P�.'ِ�80���Z7�@p`��u���$��kOo�o�u�-av,ٴ���Xĝ�m;T���TН�X�P*u�8�\�_��2�� =�8%��DJ2VJƬaaR�R\��ވ��Tw~��\�)8�����X5����(Z/?Է��D>?豚�7e��Q�L1z?�z��I^A+O~�lN	`���L�o0��T@�E�$���Lǃ�m�	g�xC�����i����Za�0�R��+'N4�*iE�I��M����屪�Ɔ�	���H	���í�������}p&Vє�17��b/܍����in��O��@���
fUT���>����mj�L�#�Ä�C~����y�!M==��L�	�h����!�nu�����Z3�ɺ���rcm2��*�Ә�E�1kB�j��o���k����ʰH(�-31�F5y+��k���D[��:�MA�r|�A�c9�wh8T�%ٵ=�cn����4��>dO��V"�ABb=bz=|���~M�E4��!�l>JYI�C�H�	��mĶt�ǝ�	�K,)�h�,����
` �����å��]�TMD���)��7�x`q�������qN�?EIqt���k̞�`t!J� Jm�q*�cB��R�E8��_��������r̙T���F�M�b$!+��+&ƈ@4(��|�dmd�PaA�FQ���W@BL��sU:�Ǹ�Tm1>ؚ委](j������U��r���A�CC��;-0�X5�K	uw<~ �-��
��<2��M��m��^?�n=�Pb!So0���ĸ�$/!��3�NS5\X������	�v?��e蔄�e;=K1�1Q�T� Y��e�y;��6����\�Mz�=�AF�R�������\X�3'�f1rlD���B�x�Li�Q��ϱ�2��t��C�#��'���������LY�-�Mޡ|)y&��!�H�w�cD��&�*o@�,y�s����8
���֠1�Dn��6�.������\��ü��U�����DB������1�9 l�qq-5d�=�T#��N�}�0}�p����*��U~�6�B|f�I��SS�w�Ā�,1����&h��`��ӌ&j���Cq %��߮�d0g�9� ��
B������Z5W��ZN�c�)M�|F7��@/��o*�>��0oֆ�������Z��H���b8$k�R5[���@����S�o	o���ǲ8=aZ����#ZL�b)P��i9I���Bͦ��^4P���-ӭ`��L�1��j�����q��صJs@CgbQ�Vyw��dڋ�~�N/��kuc^� &�M��SԐ����ښޏ�S��hE�U�ɂ���]��,i�1�`v�\ҥ�Pd��z�ɝ�Q�F��a����E.-���x�������-�G
q}��0!�8^��:�G[BMO�WnqI;�[�A	�iy�b�B�B�u���pp/`HY�j�Ƴ�彝��a����F�ލ�����W2��i��S�0�-U���v�TC��p4��c��eYԍ���v��De����T 3i�(���"P�ך?���A���	�u���|���ݯ#ˌӦ��ë�@�V��O�<Ro�{���᪬j�(u�:��+	t�/ݾ�]�(k)�"Jw�]I�h2�Öt�,��챶�b�XBsfZ�\���|٥����0��b\q?�^7Q��k֐��Z5����m�س����PA��CY�QP��#n��sy��0��z�=�l)�)�����r |�V[�ʥV;���O8&8��Z��m4��׸�*��h0�Y���l�z��$b#�����u�,8'��#ˢN9!C�a\���m"L~q>����ǽ;tX0��mmȇ2�m������;�(�g�N͒�/
O��L���ʺ�2ɲb�e#OE�r*Rˣo��8��a���|t�Mq�|q8�Su��r��*~�0}���b�wB�!#�]�<��b��p��j�7�B����e�rXB^C�d9��C������
9�.w��׶�
���f���BI���0�S��It��+�(.q$>�@E�����cE����2�Ȉ�ğ5I����%����i
BM���U���A�g���z��;��ֻ���L�
?�uz�:�!e%ѕ1�G��h�;y;@҅CQ��d΀��6A��}�ࡦ�WB�8+:��(h`\祇	�B{|��J���+���R؝��ބ,X]�5,[����(�Ɣp�ap�nλ�K��C[�s�$԰n�b��m��?���Ԡ8<��-x>��ꎆ�0Jҩ�3h����_#E�7�B����6~�����|�~�N;e���kO���`�­�-q��Nj���(����y�/H��V��f���f��l�t�x�W�	�$H�顀1�7E�~X�"M� ���$"�C]w�es�����Z����IIW7�Р�$��G��5�cn����R��Ӈw�Y^mG �&�X��omۼ�@��y&.]��Б�3�
� �n�g&��ۂ<{H�6���_��5yr�u����!���~:�����o��T�7.&��qG�dمцꦦ`�⦩��F�Ҏ���p/^�+���ad�X��y+|u� $� .+��%�|���h�%/c��~���|�v�@�F��^�� �]
L�2�8�mݑ���A��&xd�r�6F���A��4���@��-���xœW_�p̛蟬K���-�ncr��#��hTU�e���!�P�Ձ~2�m#Sa�k�7�����X��Li9.=ɰ5�V�� ��n��Yy�j̅4���A��D�^���X��暊��<�Fၛ�l~��7?�dP��b��r�jD[ӱf���B:$΍f+�xH@Am~�r�ԡ�������p�OMWr|���p�W3`<��,e(��م�	csi��"#��L�!P�@)b��!��w�5K_�i��x>��%�Rl�ЇD_ɉB�Y~�K	N�U��i�2�Ao����؋�(��&d�\�eq�m����'��)���c����6��2uc�(6}��城�i��B����3�������I��Em=J��8������s��J^������x���E"S.)��6r�{�}(���=F�\�G����5:����[1�>��<;lƠAP��2=ἸcE���� ��J����\�*[Nc��::�r[��'tO�0����wT��%�D�>�H� ��8�<|�sm�����AI���$�~�6��ơ?VlD6[D�|���R�8S����?;��B�8M�z�ɺ����@;1���*�zQ>���0~(!]?��V
^	��p��z<ӑ����E�GQ��@�ۨJo��Z`S����4>�;ȴh�>	�T��Cy�z�ͱgw�ï��x(x6��2�n��!`a���mH���鏒4�?A��nB]���t�Ɣ.�}�e���U�]����~��ح1��r�t����+�At=�a�&���aa�4�x!���ea�M�AV�װքb2{�ƀ6u �y-o��:��XޤS����,FŃ�u� 5��j@>�|�6]�@�l�"�a��`�,�nC>f��8�C���IG�}J�ǭ�(OM��g=g��H�b���S�n�S�Ƨ����^���܍��N
�9}2k5r�#�+����Kİ\&��.�o�4����'    ֗f ��n�o�9r�.r��p~[Y*h�ᐘ��?Vʺ0�a����h8$����_���o�ͤ(20y��/��
�{(�ON�k.�\����kZr�3�-(;)�R��P��E"b؉k���
0���
��6�8z�e���Dʴ*sH(��)}��w�����{�LI[ �`��.�yv�x4�������Y�ȨY�-����Otf�/��ݮ������6��a�u�1v4k�k#[aځb1���-cj��;�U�>x��~\���� jm#�"G�`�Z���W������k��9:��d���P�ݜ�
�F�E�5���@*�6�ܒk�`u��.�r�e�:G��Ӷ�U��5����Q�g�q�Ĺ�25HO�u<{�*��4�Lf!A2�7�@1�{�F1���m�)�@	��A����.�������� jlR�nF����c��;��*�ٛ�J��,3�p`<����JO��9B��J[��_a�����M�p*� $؅2�iW.�Ŭ7x�
�k5�Z0�e.5�YVɎ��B��� ��k��P���L��*P0BЯ@����������=���"`~}>�ߠd���퓐[�-ߖ�3����30�����a�i�&���WF�G�Ad5�q���XT�k�9��~����׻�\fBqqx:�M�*Sq��^����lV�F�{���P��F?w.�1���
�pq+>�m�e�>���9)�� Q�q��F�� Qo֒�אܿ�����*��~hB1��e�&�A��
hjr<���jTQN�� XRPT�d����9��6�{�3n(�^�$���硯"[`)��I
�]�TP��/%	z��l���ms���t��*k�rd���������b��ҫ�?āB0}q ~�[Q��$q���%w������3�lbR=Ğ���՘��N�i1 ;U�3��J���e�Ō���\ʔ1�LS��m}��Y�@3Œ(���&������~R��t?e�u��3c�M��V"���f�/���x�P��=���@A��*��h��l�{�T�Z�V4��ӈ㫾D�Dޗb��� 	�A�GĨf�<b�Y���,�7����ql0��cp���tZ��ڦ��jŕ��§'.��v�i	j5� 
�*��7���EUJb��2+o:#��<V;�ڴU�o��*��'ľc��mR֪�X^�V]�r?]>9��X�V�s�t��0AY�!�^��E���RĘ#0NkoP�ttY��̏�Cio�
pf��:P�g���@��\?��9���x����1�
Wmp���g��ONC�����S2���sySd�k�j�I �|Q�����\�rյA�X��#�4�����T枣lh�arJ$ˑJ��"�`>5SMz��\/2�*�Xb!�8��T,ю��V�G9��I4b�"�#k�M Il3f�-3��� 0*(����@�⹶���9c���TC�5�j�s?$=E4��b:䕢f�L7*�@�N��R�(�2�(�p��	�I�*h�i�-)W��0���� IVJ�p�=;�qT�- N4��?�q.�,���e^E �l&��$@T�7��B/[f ��2hdrW�šYƀt��a�dP���d��[ĭ���x��r�sw�!����8�Tcq�F�!��9�%�Ep:1P���xVz�V--Y.���t'�G�Xq�#�oK�K�h��q��'��՚׵!�ՂN�f��9�r�8L:�!jʿ �Ǹn��׀}��cڃ�ӑ���edG��1���Y�m�ǣ�ń��@O㛽�����<m���-  �fn����N@�b��|D���r�pEnb�Bm�>���W��'�C���ɭ�I�b���|-Z����f2.���Z�CR�N�s��S�'�/v�}N�7��9�S�t|@�؛g�h���#��u��CՎ���"���Ն�*.�8�r ��ޡ�V�
�� R�B?�b�ݯ�3��BV'>�x������܉�0� E��*NE4כ�ie˼������(��;��
߰�<Ы��~�&Ƒʽ���������M�� ��,�*r�-V�@0�3��s�|5��*Z�Ա��MHA�L>�yc��v~�n���iC�������� ���-�s�[��@��+-qV�Ŋ���5���]dX�f�_�_9b�3g�`Gq\n���o�i�:�߆��L|X�ܚ4��Y���|
�_(��r��ae��<�+� e;Ț^�i)��Xb<�2�^<K�7�2Ld!F@��^e����U��?��W�7=�A���R0/�O��:�9w�`/���5(���x>_?��Hř������-N9P�2��n�X��߁��G[��`ļ¬��
`H�*
Xt�
U�ÃU��5�������x+�Iځ[��ACM��٤ȯ:%�"�G��tβ��w`.G�\H�,ơ����ྱ�e� ���É��႕���q(���F�e-��k �RI?��#����P0�ܮ5�{jm`���� @4?T%�@���yIbK%`��Ki���q�� �	�� G��ȜT$U��E��0n�V9��vs��P<��Z��\���A�8�Q�c9��C^���~���]X�~�A)j�ģ�{hM�����*���⤠Эٮ
��BW�GF�9f�L5�JD:C�^�.��>��f���a['�􁷧&ͼw�k�
z��A3���� �xS��vx7�IaV`�2����<|'�Y�l\�F5��G �CNҩpM� S�:xK�7˨gQd��l�4h���0��&�$
�!�d>'I�����4gY��@���Զ���r�����rzC9{�06����X8X���� 9_���Xk���p�����KV�6M��353���aʂ�j�����x��f0a�&��!��,y;+m��`���E#m	�u�E��2��*�T�a�P����eɁ��~ß�1��
�w�OG��H;���N[���i����4
�h2�F�F�oD�ҕ�Z1��nDM��p�p6��-�����r�}{����e�:*;'k�^W1'ؘ�zK`���E�Bl�an���R4�괞��8۾l������M��G����������1����Sb��_�}#H�D��C[Elf�k�[��E�z|߂14wN��d��B�{�^'�v'LB��_S!�j*zJ��&���SKS�sDӶ	9}�N.�f�W��@�4��)*�婰�d&у{�I灮��;Z��,Q���É��R�ʸ:����xU�24���u���Y&/m����`-�^ٶ��M#�уp�D�_����V��O`
�Q,���%ڨ�R�m�2g��R�c6����ԅB���e�J����烰,��s��)K���p~�|O�I���	d@�����*����R��� ����q�14���;!�sֵ%.���u�����B��뿾�.�����a�*D;UCT�e"���H�x'XJ��c�h�ĠwNI�E��,�{:���8�	A�c�+2w�fx1H[&Sx9ܟy������ +�gG1�8��`�����Lw�'Y.��3�_���&\�d��1e����Uzy���Ĥwo"sb��Jo\Sv��R�|�0���o!����/V�d�B->;����C>���)�`c=�m�VHЄL���k=ᯅy���������+z6�J��q����g���+}C"\E@��c7�	��J�8߿1�w�\�_����	�5��
�v98Yk)�����(���j׫԰��x<�)���,yPvIH����ˢ!×����T�y�8Q��ә|yO�*����塞pf�܄��0�\�#�i�i�i���>8�ˑx�waq�+����P0�>pJ×tp)jvZ־Q̂#������l��k��]����%� x(����!�әHii��@�� �P�	�gz�d^���B"p���@�^R�-d^�\�
Ņ`M��    ۧ S���%'��20 ��e�m�D&d�<x�_�2C�aKJ����9R�_k�J���c��e6��\�e�J
A�n�����1>`�gJ
y��Zi䁅+�Y���z\ )loTwJQ���`\�ţ�D�_ՠ��1���M�����}P����`Ky��Y�!�0L%τ��������&s�6�EC�����2��&����m!A/��
e٪�Q6�SavL~�R��z�iN���C0�{�����aF)V���qn��l��o���
,g0��$��t�O<w澃WSo'�߃	
PM��n#S��t���M��(�K�0>�iYz�c��E�@Ly������R���Օ��v�v/v	��a�2*?�H����-0UmC��䱭��S4Bu6�D ַ!��\.�XOڐ-T�U����g�P�dZ8B�\�I��ވUu���Ͱy���q���wu�>�̭�VG����b-2"=ܐaS68�B��=l[)������ ��\���eX�.�X�E/��m�
lV�A����g����K<�k.�|K�t]��s��!�R��g?A�qybV��Ք��FU_b[d�ҨG$ѿi`P0@�Z?����Q	T� ���fo�?L�He���*��g!�ǔ�/�[�J�=;���bz ���fұo;���(p��WY���xrP�U�C�����Z�Io�J�Qxc#�8>���1�Pl�z�u���[�k �l ��Tn��		�DW���� �x(��vBK]놸lu�Ǐ��[i	���o)G�zX �'�D?�����	θni&:�@ �#H�� �JW�ۡ��[P�'C|��G��ϭ���f�ەqzS'0�����8�E�	bMݪd����@��Ga&��M�*���A%dUW��*q�j`�~re���pl|�Z�?+H`�S
;���ӦӦ �f�M�O9 �j�&�Y�KB!:�=Emt��6]>̰�Y޺�d�Yw�l�8��	�$��#�K}-D\�JC��ؠG�!�uw���z�Y[���wW�<��B��:)eQ��o?�O���۷[EM7U�L�U�����A���T
OΥ�9���3�4HA��%jA(Q�s@��r��R�MLN���;���2���>T�⁽k�s$@�L3���#���t>��M_뀒�ڍ��J�(d�M�,����)L%�DZ�4U��LS=���;��L�1�X�FՇn	?%�Hϴ� Sk~h�=.���{�X�#}�$�0\��p;��ሁ\�}w�F.����QJ�����]�:�\��i�)`�֯�յZk�ݍ�[�	�i"�X���od� ؄3`V��_>�X���zU���0�qmP���f��e�~L��k%)�M����A(;���3ʔ-����=P�]��(���b�O��,3o�_�_�������H��հ��0<ٛ�[�뮺hk�hf��J�2&�k({M�]չ�֞o�/�~����� �� ��z}+�S[on�i�2��B ��:O(
װ�З���"��Q	~����qY�h@��7|��	wpE�m��T��b=��	+��M�p3C�0OJJ˓����f�0l���i-��[Co�#�-�
�5�M-%-�'z�wdBY	�H�V����4���xQ9Ʈ�/��YW:F���,��m�*�-���n��Kv� �@e��䂃�����oAٌ��Y�I�����IM��b�Gw��O1q��y��<d�͇�^؆���' �'z� �����X��Y���G�S���2��7���{����$�h�$$?T�;ы�t�����^&4/��jJ�r�)<1o��٧��m�̣l}�I�Α.�h��+�p��.<��k�"e�ӳW��D����sB
�����\��I�*�)�7U� >��i�kЈvsB�y!WPUZ?}��sZ/K"���2�,w��b	�<��7e�P+��Ǎٌ�,�� m$s�C)t�1����Lܰ�e�{���.9<4\�d�2R���2�
�hu��k~�Q�|��0��r���g���9P�fo7Z���	%�ƪ�|ܣ\��],
�J��4'#γ1x����W�����#~&��vm��%/��՛��]�K�V���j�M�_�.��ID�*2muA�"k`)�~��б+��6j'?�CĜ`�����į�����18��W��
M�j#��Y�kvB��c�����kP{�7I�Z_�+�YJ9�`���t�_��Dݹ� i)���R�Ɋ�Z�-%�H����.�$Mx�� T�rA�йG_�~X�w�����+��M��c��j>�p�3��0�o�9��2�F#�����t#�Y��6��:��Z��S�a�� Z���@�����*�=���`��Z��#�C=t�����l�f���?�;���n2�������N� J��IhDZ�#�Z�hDb��/Q&�-�搅�� �FE��z���]���_��	���xLhLP�U�r�	�&͚�\�K�����h�`���#Wd�@;(���=@D���jEa�"�{�*�b� �ZF��}J�t4zׅ%���h���"�P¦E��l��X��ԇ.��ݷ�7��:8^H&�$j��R�-�-��I6q��3�ZQR��Q�[eU]r`.s5/9l�Y�ì���$�D�
լ������2�f	�����M��|`O	8���|$�4�DKBV	̬Q9�ܢ2D�+�/��Ԡ�8r�6C��
���i�)������ڈ�1L�eꔾ!�#��x$V�=O�K�~T�a�J�P��L�PK�����d'?W
�=M��`ע����r6�.�h�� ����Ʊ����]�7�ٌԳEzY�f͏.ɞP�D������t�ss�D1%`��ot�eg����S�k-</�x@��=Ҋ��!S�n4�:����Wq|�I{������d�xe�-�|���6����܍/zv3�Z}ӗU���"�Ufl��Vb�ԅ�cI�a�[�]S������svm����K�E���&囁L�ߒ�Y9�rFV�j��3`�*^l��&=�Q�U����y`�g.��z3���x�,�m�@��2N@�$%ErB��^��D�*f�XAT�=����K��}��r�������
)�1RX&QC7+����nVt��2U���B..�98�ULq;<�Q��� &�h*Cjzy�_��yG��^T��h=-H�
?�U f�``����?���kg��Df�`�j`j���~T�$C�µ:S[ �z!s?0�g��ݷہBc��A�,��H�R�0��M�6!��U��Z;X�Y���hC���:!����>�<g2��.P �ŗ� J��O�����p��AE/@5�'���&(N�4!"eȢ�'aD�=ĂH��F7 �h��iƸY��-FFq�`p�b��3,ȁ�@Q����Qcĝn��@;�3aG'&@XH�e�D�%�j��`żᖚ�t���
c�J�Tn��`�mB��t���}��f�P�*��ʂg�H��O4#����m����Γ�K �#N�6��S'*���N�6:�Z�:o��� �c��mG�J`�v��.~���N
8}�ޒE����fhx�⧯��Y_^]��O�V��2.���
M�(�ydȕ6O6TR`�(��:aޘ6��v�L*����1�co�>����J�e��5m�5�7%9{q�^�m�@��d��'| OHJ��E��QZ[Ƃ2Ė�]���Dy��G� PE���bl�ʠ󒫬[2/SK~3 <�V3	�L=����敪�y���C����e��#�a$q����F5��E�5�a��Q�ʖ���<��j�z&4a�Eg�qT5T��zngyp����ЪDKJ�P�!{����z�[���K�]i��/�z��K������vz[H�:99)�c��B�O�k��ā�@;
5|��S|DnR�u����X1��Q5���
��g�#�*����ߐ�L��5hz    -�eL�-qN�叁K>��S����cAu�]����zyEu������!����qw
��Qf45hQd�+�(�=�a�[`;�R!�����=��:Y���=�\'���,�n�)���M8��t&n�]Il5�p���>F����I���`j7�[��Eret`.�AJ����sL�ɕ�5�M�����]��t~�̩b�;
�ȼ**� ��W8
��<�}��(���BN�a�9�2�$��,4t�я`�գ��߫vc��[ ���$!�th|�v��o���4�X�A`��g��K.�Y�&E������@����B��2S��}ׁ0�ę᳗��(iD�B!�6t
��2D;�RA�� ���)�t6s�{V#�\~Z����	��82%�<,rbb���W���	M�	�(�lw,�^M��Ŵ�FG���2թ�s�2�h/@�pj�ܿ�:Q
���i��+�4�%������+��	���\�����-��d�$��Ќ9RQ�J�mY��t>�)@K��q.d�l
�/s!��7*1�h�[��b��Բd<��^, �X?����]f}�w�i[��-�M�ݎpfd V`Vo*��������|d=�!65�j��f 3q��ڞX��5;�YŊZY�D��1(�!�5��D���x��(��z���R�Fǧ�^P���8���ܜ�8�l��m٢i�у��/�J�U���ݴ"�v�u�PjM���fQ0t3J~*^5�4�V�� Ә� -�[1��R9�,��$��1���;�/,�H�&U�|K缄H�����p������X��� ��@o�� ��$f��~����D�z�����T �D��s��t-K�_�?�����
$�{aVx%��r�({ek 
 ���}���C;ߐb�����4�Ùm�㇪�DAc��ʐ�2���'b���Q(�?��|+m�x�!?q8-v@
&^a�A"�PO����
}���ڢR���I,�@�( �x(ۭ�T���TaOP�E#��c/��3��S5��T��*�'�tC�l%�°�m�@�����֕`Xp]l�צ��1���,��n_N�G �oN��z���@���B�	923�֦+1;���!'!�Au���O�_��{Xq��yܔ�;���o�52Ƒ��8*XQ�܉G|�QV�е�����9ը��΂K�"1��b2^�zn����-�E�����8��̳��j��
a]��h���Y0��1f�Þ�Α2?|�$�TKH������2�~�jU� �'X:c�/�:����v��)�D0v�A���:��mx`�>��[AFg:�4 A����d��ઘ(����;AP���<�<̓�h��s�ڰ1������C���jfE~��O��V�W��g����K�Y~�q���}}�Nz����i4��I)��:VT�� �#d�=�>@q3�Z�̜|��;��5��|h���_�4e�=$AZ�K�J�ۮ�b��$�oЅ�(*Ȑr���
�X��vxc���Yg�[`�|j*X�,7��Ǚ��E����6`��Å��n�t��,�-b.knh��&�NANM��[��4����R���R����/���N��%OL��挂��W�
J6J~\�;T��y���3<�8p4�+�ԅ��Ii�����Ce��:��[B=h�����	n_M"���5J�P7�Ҹ�b:D���fѿ����Pd�����u,3��]K[A�:����_`�V�Z�τ3ff��z�1a��f'��$,��}�w��,���!Hgd-s�Y\��Q4Q��y^6�����	�T��t��,K���w����tT��3� o����]{��v &^�Q��t�&T,�P.��u�l��c+��Y��t�y�J�2v*�J��ЌZ�(S��b�������R��5��ښ���=�`� ��,k�R��1��(�b]革umwT�kx��_����HG[�c�y?a=��b�cݭ0����)���kaP�(���z¿��/^�1��B)�x��T�B�g�q����
Z���o�>2n�;�s4w�����ET�2�EMq ͛�0����EF�D.��mPi�Ѫ��c`Hg���x����փA��̻���gè�`R�@�m1D�8��q�#�1���$����;+�$���\?��lބ�T�2*k�z}���(Fg��no�c"*A��Q��٠E~P�^\���`��z>��#"���O��=��MA5�u5y��XK#���Y](��Ѕ�JX�<�F�v� ��~=ڠ]��a~��?���ci��0%�F�vV(��n�Y!-�jf��+����WԬW�Ł`:��>?G�=(=�d@
���� w�B��M�6��%Cы~8&28�����|���%/h�;�Xt��U�.G�L���b0U���J�!���99V�#i�85暀���.�m�0�7xe�`��Y둨��wڀ��=U;�J�;LHcU3�P\���M����XC�Q�ynʇ\d�fi�R�7o��E�D*W~;��K{PhL?};^����}Ў�=��a_ �l?�Uo�;٭ 똂�� ��4�6��K�6⡬ S� U�
���5�`;�y�Ǐ#�䑻\�^�Y��MjJcK�+�~�����\"l6�Lx�R���M!֔���._.�_�@�����otB�B(0�BIg4�jH�v¶Sh�n�8�Q��6��d���J���k?Jh��A'�2�|ELp��A���Y�]s�x��HY�Q���3��6:F�H�>�	��vAr���~�p��z�P�H�|%�C����6�,�0E?��|�τ7W����>=`u�\��F�Pi�J���)���=�Rrf
��q:S&}B��������8��:ws�@_�b���B"̴ "����^sG���e�/��A4�ڮ�.�s@ ��Lb7�!�)(�a&"
����մ��8c[��-dt���92C�2��3��ݵqp����A�
��! ���%H ���T0'sHf^=TE�]�;�	0n�W��F���GK"��'�K&�=�O.��(pML�	\T���w�r��9��/��#��@����!�w��;���q�,�l�T]"�8/O7�(1@2D���"��\��0
R�JƊ.����D����� ՊP2�P��L�-ʩd��0kzf-96ZGX�u�g6�bJ���uX���d#���P�rh1�����l�"�<p���*
��e/i?�������p}�.�G	�!"CEV��C�m"d0��e8�l��a`8Al�ƚ����4�EӅxv���(i2���&A�/*�d���L|��"��)E��B�<�J���N� R��!r��+�Bx�����9�e��c̆>H��EX��sy���X�~:�S���8���_D'T�s,2�$oe����!�4���݉��;#-��E�� `#_�/s�0��b��$6^r0V� ��$`j~�&@����g�d[<4��nHy�A��w�7���RC���$/qx���*��I��D(|�.��p�x�� N����f�A��|e;u����wۍ#ٲ��z,`Є�/�!2D�2�$uR��(04��韙ߙ�������݃�3�*]'S)��ٶ}Yӡ
��m���֌Sg��.���Xs�T���X�HO�m�/<�Ȣ��?h�s��2OիG�;��P�K��#l_/�NT&���k���d�v�I�ï\8> �P�X\`��l؞���T�L�ܕT��"��bjr$�v&�6�$�-~x��b �{#����P�Q��4LAe��J�*��ک�悩�	
C�ajA)�j�дz�aNs��0�^h�RT�à����I����q��-���O��J��b��R|Q���MI�2M�I�����x�4�
��F�ηu�)�r@��q�ٙ�mY���_��B�	:P���<32���(�&�LW{�Q��
_)(��94�K<�9*����h'�n��Y�U�e6�|3����Ed#��g>?�bR    ��^8I��� ��͏2S�h��D�PC���v�a@4e82�5x��������W;��Y-�V�N:6@��f����@�u��ݔ��N�@��Gs�Z�Ҥ-�ۢ4a�{��Yu��������xA��?� �m���A�"�P��D�0�' h�d���
�<�Lm'J��fNo�vs�A��տ%��l�7Dl��%�TL�JCw���+!h��i>ҩO'@pG�L3��ӆҳ��3
�f�Sl������Ӳ���zϮ���&�F�\�4��m6����Ȃ�wۆߎ/pOG�>L�?�?.cǉ����t4N�j=9R�?$Y?Qe�%)�⨬��������`%C�P%F'#�ٶ,����ѹ�I�@�@�$�U ���z�ʌ���1!�?���'�^��χ���yp��#ʄ(g���j�G����ﾻ���q��T��_�m�+��Zx��ϑ�%��^,�gs�~g-æ�`�-����O%��
�y�:��v@P�b7�ن�wx�qĿ����㞇|a���%�8�=ïQ(�1��.�=3M���lV����6矦{J�DYz��QCC�%s��jEA�}5��t�#�������
�L#���X ��bL#����l7�PH����ߘ9�U�[�}��F��g^v~�,e���q�����S���y���LL���26���ː��$��ٟPZ� �Ъ�` �^K���;]�$ӕ	�3����2\�E����o�#p��w yF�w��@6~C:b��T	M������������^K��v~��B���A��Ct	��6���grܲ�tG���M+ ���5�G�D���xn���i�
�Yԙ)�@hy� K�j(���<�P�W\������#@S�.�XH���#��^cٝ#x�pe��|�tS��V�y����DjJ�>��7��.WF+����}�4�N5�[�V'U��X!�{n���P߃�P�Mz_0�kH��Qj 4j1v����k�=ழ.����E>�u�)wO��D����,�"bM񥌠k�1������喽c�\�X�� ����c�)��ooy:ߐ}O�$��0<��1,e�׶�;B@�Y��h�X��;���Ae5��0��C��MLЎ�c��A�3�t�~?~dvǦ�I�L�=�軧�=���� �ܒ���z0�|��%���_?N��T��Qt����B���WX)�1�z3�V���<�v�7���*��
lW�@vX���w�<3��
�_���1Q��\��Y���;j�A.g����;�v8���nGQy�3vA����˟0\���cZ��I���h����6��b�r�kc纁��|�xwU�����0����h����E�0[GdߎYJ8�z�n��|$]�aQ~�"BԱ5XFrr���ǂ�^'F�}hǪ��x1>��{���Iҗ����+�+��6$P�[�����ʅ��T���%�j�P�����,5���;��T����zD��:�;���PV�
"%�K@��\;���tX���h���$.�n�}s<�Plt��a������S�O5肀Lr����E�X-�{�`/���|@�o�F����dA�jv�ʒ`
	�����M���UW"������~.�ʑ�&d=��4'[�8�[b0$G�s�0nz�]������ ��Q��	�����+[u�<���O�/�Q�Ar�Ni���9/hH1��!qe�ˢ�������������d���c3b�J�F@;�"l����r[�hj���@�88�gejD#�!�<}�@No��zw��P�*�?��e+���j���J�L 8%��N��|S�?��ӈ��>�����l=��(���>3�E
,xe�t�]ɀ�l�� ��C7*����^��PG�������o�g*�˕�ˠo�9s-�4��i@B��d��K/�ֽ�`~�C�(�����Tw/V��
[w��l.���D{����'�+@�^A��彴f��GV�V��G��0�"�>	���}�bk�fD������̭(�^�SX�]8�z BV�t>�{��~7QA���#�[_6Us�}�0z�0���������j�h��M��ß�+p�	��3��&ǉz� ���ĀǬD��@+�C�B|�?݋e�7���}����1���q�a��q�:�=��<:� CC���E�H�f���? $���:FUo�B3�P�NU��;7 N�a\��<d�C/U0����@��K�2f`&�ެK^�²�}.�����'��;>���v���������AX���	�\�[�j�$��
����}f:�kz}��hY�1Q*���pJ|$h]ƍ���U0g�g��t>��O���>��9���'5�^*NXm�p =�R9h ���[�f-��NPIB����y���J��ШZǝT�5Q>���Gd�� (��o�g������"g|��KD&U;m�T5{IK�4+A9�ue,�5�qq��UW�l�"$�Rh$쫩(y.��=��U����#O�UKa{0�G���.R��j� :)�	��Lqb�T��i���r:�����B)�!Q�/���r�Y��X��KW����[ݨ�Z:1��[q�&,�#ʲ�u��Q"�
�|Y�M�(՗�����Ю����V@��4U�z)���3��ٓ�#��Ce���u�y�����gD��07��D%��Y��!bt��i?������t������E1d��n� �9\6�N_�>�4�Am���)�/fܚ���T.m�lXծ�x��Zb���H"�T�Z���(%���g(���a�r�"\N�l��5��(�%���k���!Cf.9���&�%a��|=dMR*�����rK�Ò���.d]̩r�`e-$��RNZ�vNY^���9P� �<c����23te[�j���tLլ�xg����~��B���Oʦ�Bbq�b���d(�MJ*�jP���4���Gd5J8&wH�_ |�ʛ�}��}��B��Ms> � ��:L��h[R�l����DөH瘐ε�tZ��d+#oz��.��`�� >�J1�L�b+χ�b_Uߡ(=�<+�+2����.͢���`e�h��$}Gz�rİ��l����|*������_	�_?!�V�1 �Y��.�EN����#:��sy���v�D?�<��Z��z���?v�?�]���7L�â#AG�[��*�%�p>���L݈e)c�'���1�
���5�*�P癞�H�<� ��y_��JL�u=�%�ÿ�ߪ�u]�M$���{����gS�0%v._�V�S5&�2p+�j����x��OZ~Tc��^�ؽg�*�e�6)��*�%~t�K�-�Un�:�~>���Y`�j5�h�cFM댇�Ie�Ta�f��+N�/Eb�MG%]�s�Ji�^M���S�w�Hݵ^�Qs�JN���C�V85+W�Q<��̇������*�� ������!���R(�u�i���0�419�oSZd��!����K�丼0�)T�P y9^a@�C(f5��m�m���ԥ�B�� U$KREW��������K���G��R=��0gw�%�,�5xp'��;�6񨝰R�0�	�
3���o�;�!-p�8��e�� ���a�-����.6Ft1N����5����B1�M�%~}�IW Z���ʨ�.��=�c��l��R)(��%Aw;��F�����>��|������������S]�U��ڷ	����������d��r1���+�)�n[:�f���?���Z�g�I�,���{�_j+�#���o�C�8�R#t���ybEi��'W :�N��`���:[����^QFL��MVz\�^�����_X��~k��mxz�j��A{E�4�4tvc
�v�����S�wt2誣����h"��N9����������������B�~y[�~.��}M��L=9�A�uz����*VK�<נxg��    ��[<�=/�__ �\���"��7]�9����'}A�I"l���V�c�06�YR8�/dO���G�z���:<�	3`J�h-�n�{�p_&䕉gA�D��ޘ'�ٿ��l����I[�8��w�8t)q�o�q8��k!���*��J�wT�l���w�@�q�}�59�~5���v�*,)��pY���{+���z�)�q�,�-�� [�%� `|9��Ѐ�o.ַ�B�[���4��E��|����󭷿ע;�V��~����d�V�}�ȔX�nRZ��x� V��*Ҳ<e	Mí谖���X���T���8�q��a�[������__>N����YV�B;v�'�ˤ��E��c�-1�w<�TmsI|��e�P�q�M��1�s��xx��?��6�m���9tWY���`"������]<m�N>^��d�S��rVD!�Щ_�Vצ��tk-������ϧ�e���c8���ϲI�����8OC?��~Y�!�֦:��ɤ��S�Z��|rì��"t�bI�TZ�U�P��P��D�eӸ��p�*(wD�J��Y(�N�����L��4�?�BP!�X�wB��l�T�
��"6�\�t#��(PEŕ�dg�����z{��uhԸ}+�AT�1o�c�,�� 4��V��Рv�|S �Ȅ�8 yIgq�L/��t{9�O�� ����R1[U�����	��6'���:�UJ�M�P>���)|Oe�&2�/$Ad����oE����A������<%��E�<�6�&(H߼���U��>�Ll��8�#P�E�iËX���YA�x{����ߕ��z:����^`1F�m��Ă���P�9о�HS0��:����/�;!z�9�\�ƫ,(v[��l��O���\����h�rK��H�C�E��h�*�U��H�����	mA9�c&�~�Cj��| �� l�7���|��%�����1+�_��O�)��;oj���b���}��H�u�~��O	�&��!X�@� ��f�xL�D6�Z���Q�7�ix��T�����n��#UHH[f����գ61��@���&fm��j#�n�ԭ�q||Nyr��bX��Ĭ$֒��ܜX�;7C������P�q�D#6F��H��C#]��":L�}w�:!�v���Ӹ����C?gW 1.�T?Y#�/j�H���C�3~�v��	�r������ �r��m����Nx���/5 ��{4��TG�<�f���E��&�@�C��ʪ��5.L�w���S���>��Ƿ��W�ל�.�K���UT3XW^��� ֩U�ݑbR�; �>���`��P���������t�&���7��\��S_�UU����qv<��u�E.�aG�&��g¤8���RӍ��e�c�%!�A﷿�)���o�P�9*�K����+���|��J� ��1"%Xn�l�R\]���͹x�(D���t���<R����)�r���"@�� �^�����"Z���䶞'��"�+m�ײ���x�6���	ꃉV��Wٔ�9��L
�*�)�|:�QS��~�(�J/�Hc/k���_g�_?������7^������ӹ���>>U��0I,��GLt��+1��l =ǃ������A���8]�Q{��N�sC�3j��B�ޞ�Q�ߩ&�U����%�)�r ���
��CE�d�C;l�~�r�M��ՙ���&:��������
 +DV���28��/IE5�CM���q�cƤQ^j@�;3��><��1}ɶ�ʂ��;��_{�Ũz��x��E���\$��X�����to>��[S�}���"|��%4�vt'�1�Vy��"�C�|:>��&a�k|v���>���Ҡ��)]���FU�Ϯݰ���npJ��S��!���,o�JW�\JC�r�DhѺ��:��B]:�r��Mږ�
L�AC,Ho��j&��~�ՠ��{���i��+<�|������PE�T� �Y�엊��̫���M���%�k�O��Ny�aXG��!/����#(ת_���:��5ȶ&s[�b�_��EY8j������l�>i�V��7�堩�H��o� t#D�U�v�>kB0��B��~�V5R�q�/si��<�݂.t�$hm)3l�@b���zOL�e�� ��>r�)�ݎ=-(�W�8�g-9:
��m�%v��0�ܴʜ�����B?�����h��Vu������Q0U8��
�rm�\�5��E�H�G�E6��%;�k=|8+<3nZ�Eў�� m�(���ix�P-��k�I�rz��t����S�M�i�PH�/͸<e�����+k��HP����Eo��&5���0��FǴJN��	�K�%����$-݉�����A�� t���z�:j�x�[��h�t�d/QbR�{����3P���x8��b��B$��-��#0I#oP���[����XM�v�o���B�ߖ;I���-kM�����.�9S�XE�	�!�P���Hƨ�N�`�z�j��mVJG
�R���*���������hua�9����e�k0�ڙ����4
�q,���&�hm��^��wףހ�Ih��g+������������L���K�8�( ��%�Y:;DZ߮��1�
c�Z)�A��^��`�~��++ ��V��O�Q�#�~Е�У��P��X�"�3�n:�/�nxź�eb�9N�oTǱ��Vv�H�X��v��q>](8�F�B����1��[��b���.}hg&m��{��"��[�$�A�H��R,AR�Rb�i�����8����9�:l�����0wۧ�K���/�K�R�ԡ��~�R�����p1�0Ji��W��ò �*YZGOD� +q@$�Q�3��(�05Foe&���-Ե�nizh�[��Z�^L��ѐ�_�,��D� � �MM��d�A`���	-���&�X�Hm,���×.�x!(�}x�	]�"R>o�������u҉2�!��s+�x�x���R��p�ኪo�[��	���c�)����?�u��	��˵o(z��m�u�'d19���\��|U��ݶyY�_֊�F/���Ͷ�P�k���ۂ�Lo�6\������&X?1ܧ�I��sq�����t�����ǩ�f�lQ�x-��eYH�Ra��L�-h�;h,��lph�h��~f�?�}gc��|���X{{b2�_���p�	P���|���A}��o�H1I�j1tP��·bU��|����$|���2����'���� �A٬�ol;q�5�������Ea�g�q[a��Ҟ���S�Ɖ��bq�i����ß�E����z����X�M��U|!�~G
F�޶�t� �C��H%с�R �Q����Ҕc���0;����O��јg7L���R[�����B�\f��Ƥ>@�yR�u��q�Zd�R�لl�`�+Sn;���p��L��J�(4�������P ��|��*���ͬ���+U�<��_��󚠝����N�Ek�	d�y�֎�c��z9_Y�q"s5�' ��ZɔY/P�x;�1NS@X�Ʉqn�I�A�@Q��M����6ę�ɘ�+f�Ƙ��&���'h�֣��������~�y=vKd�����צa��O�3��N�<����5�t�h��.�(�s��n�_d�Q�g�5yO0��~P�8��d7aY�s���i��`z�����>m���	߶%�rvt)+���>p�����_����P�ֆ.�(p�*sLf8㗷����߽�(ݩx���TCt�[B@N�A��0�E�ʂ����V�]��]���F�]�"K�	t�$��@��ۇ�AAp2HW�m�n�p�>����A�A&�N�4&ldj�cO4M��֧D��$��r�Į`���{-'d�j9���N�B2f�^dE�Ų�б���P�o���39o�Ӝ7u�7b8���D�E:o���5D�ܚZ������A��\���7���U�4���[�#]�:�����`�����}7
i    �������U�.��wŴ
[����||=\>0�.�ͩ�P�\��?H@5�m���`����V���DFjH/�­���ƾ������=�w�G�ævA������S�hm;�� �Y���iP0D��(TR�xn�-��vق�kI� ϯ�����8e�Ǽ�O_F������1Х�
Kz'����2��&(�p�<�� ;��^Ԟ�J?l�➡p�9��i;�i�x�x>�ҽ0M)jA��X�V 0g�'���X�ޭ"�JoG%f*1��f��R��m۳�Q���>J�f��B�Gh����4�v��x�#ʛ�!�Ѯr���{֐N>?��x�@I�����X~��H����v��+�Ԗ�텊��"o��RƗ�kL,�Rk�j���+��ª�C�L�%,�^�.��	:{�2)Jx{�vk�E�Z�w/Llg��zfa��sU[�{ݽ?�Z�!�#����B��2�$�М�G}΂�O��Vpa��/�|�k�XO��Қ�o�{RA�버���m�ĵ5�!C�1�'��'PG�M��6LaN�v�k`�$]|�8�UR�v�aq|�0���	�7��#q��=i��f1�z3T�������;d�)�a��kQ�����30c0�����r�0����Ŋ�h�e��Xǆ:-9RP�`�"�E�sa,*-G�H!C��Gn[1%��]0�=��y3��jg����u?��I����X+�t�>����BP�UTx������♑ml儾�t�x˩��!o����ٍ_��oU��)����x
�N�B��T-i�S�8� �,P�S(���H0Pmg�����|~�������]<W�CP#��fP�퓍L���8d�� �������*��F�o�c���~t-DSʛ=�Vj�%���]4�1����0�GU�-my2����Mk�%?5�o;�z,�2f��E�+�B��9��b�d�˰*q`A�P���#�^����w��2���>�:�}D�Ϯ*�N+�
��2�P���>�q'HMGU`��O�;P���~,�vM�ix�@MY-��YY�Ж@�Z/�^yC�B#�o(���Х��WzyJt������Yf�������.��Đ�9�3K7+��T� �y��l��ٴ�QG��1���sE���CߔT6W<C��t��K�������?����U@��* &������M���Ld������ۗ������mY)�Yu�)�w�j��[bV�D��xm��
�J3<z�����+8;y;PN�^�,��}L���tͿ�Ҙi,���-Y���80&V}bMg��z\�ؤ� ��q.ض����>͏;P�U:�pU裾&�^�zf�F�G(����L5G4-���<�ej,�����h2P����\�C]�I�4#T�]�$�8rVL�A'Ӟx��"��������(X:I6�B){���L�6����S�TlS�U�ˡ��bu!Ġ�F����Ɂ�i]w�D�Kv�XbQ�E���Ɗ�7>�Q��PI���V�Q�,�?:z�8��o�GD��Q�������@$��G�:�(��������,2|D�\Ԣ���s^U8����寊�Yq� ��V�=�k��R]�F��v�K
�Lcmk'�����W��tx(�D�`K�Щ6q$�6����~�����q'G�\��=�y��׀
c�5����Έ�?�
}m 9N�l�U��s]�����F9��|�p:;��0�'/�tFh_YVk۪��fu��i��)I��b��(��TR�}���k�<:m5�ޟΙR�@WMÝ���^�g���[9�G�䨼��\x�w�LN��+�P'���o�LaS?M�)��B�O�Ƈ�t�	~�}K����Z�l74�8)aF�p� ��y�� �u��е�ɾ��e�0S�)��l����� ��틳�[kоu�jc���.�I�_�SMn�r	T��?���._WFA��u�� "k7�����.��bg��:��Y[H�kkB�Me}�Mn{�Mkd��;�{	��<�w��z��v�sR�!h��m�������~Y� O~:�
e�P�[hk�׎���M8[6\~p�W/�`���B		���[�e�'b�$�]�(�*�m�a2��b8�=1���Ճ�,s�?� mD��j6#OzR�������.P>��q#�!I d2c�"a"��S�nS��+�
�b4R�IN*�.x��)����U��T�K�Ǝ	�R̼^�̍�9is�w��S��WF�e*�X��qX�9����ꅩ�k��8r���D����Jʧ`�8G�`�#�h��*5�`--��\��3l��e
���#0��=�R�֋��2S��V�Sh����4u�� �"+g��Q��Z�驶vUF���(��q���1��G /��r��6��Ie\7��1�x������&z�܎/Wؐ�i:�"�r�0ӆZ�V���f�]{��H��7�D;�' �<tMQ�����L��Q,Sؚ�����h�����D�Q5�8�?�o���nv�����>8AVM��;�������%[���r�9�w���Qk�5�(q�30�fT��S�u����[�ֺlE�+U,�ٌ<��h}I���w�C���
��o����MΨ�-�w��&RB$l�;�t�!�9��� 8W��aI��AآQ~N5���- �4^�t��zi�Eҟ�ߜ��h㼉U�Y��e���Ҿ�
0��); �Fv�-�n��Tͷ�_�4�L ���r�����1��u$�h���j�:�f�Im��c��PV��=	[��}�eQX��Oa6��vQRGm1�p�5�3Ҭ��G�����=:��礼g������m�D�&����ǞE7���q(��tJ���& �F`�Z8zyYv�r<�B�N��۶L�t��j�ӭ���c��[)_�1��௱�ポ
����6rE���[C7W:]3�V���cϞ��nQVy�J�u+�G���^`��uC���
%l11�Ҡ}�~�A��,���I����RN'�����7�ےL�^����̎��V��[%鈖��A1�4�{�L^��|��,ܤ!V�]}�u�էBVx�F~2AAϋ�c~���u��>|;Գ�,��m�p/��x��c���w�$�ia�@��FX,���v���;������R�}<�����H�C��w��.�WQ��(*  ��S�jt���8E��yiQ�����P�h����J�A rl����,BKf���}�7p��,A�((>4۫ō�Z�����j�R}�+�]e�C���py_m,X�Mp(/P������5��|Q����)6B��lL��	0Z̏�3�-�7�k��/��%Z�ϖ�k 7�&�؝E�۹�-r,��2I����du��}�
��|� �t�%��.Y�y %�r~(�����&�)����XX�7<��qX��*�Der�(�T��0s��$3�܊�74p]H@EA��`��:���
��\q�}n�����1{	Q\-�e���*�R��W�T��#�@��#��]��T��pjc�-���ZeZ�q;r>"V���{�%�?�w�-���T{������2"C%�H�8y�������W��8:x9}ZP��U���8�+g����r���\�i2䀣2��X�+>�N,�1�n�����'x�\ηH�5�~�2�+��G�L�(GbO�?� ���p��ּly:�JĠ���;]ܙ~�q�]χ_�i����w��嗎`])`�/C����zL� �����[vKud���L����F���(��ʘ`X�����XO�GF2,1*��+|'������t���M�{%��&8�>Mqu]E
��Pe����Q	U��P��Y��A��Z�qo�j�L�v�1��p�?��NoM�r{�&�b	����
��z_Ӿ���8�^����� F��@j����?�ixE8�
cP�m�ң������.�����s�/!��\!�(����/    #{P��	�Ԝ!��؀��F�ր�`7hZ13,z�j� �f��D�,9s�~� `>n5�z��@x%S�VIkRq���@Ö��FOyQj�A����R����&3��PoG6{���ޯ�9�D�{ͤ�!�r*ƂLn,6c߅��X���]dI��L���^�*'(j���������3-���oO�o^�)l Ȧv�ݣ�BiaJ���3TD{��E��˘([� 	¨�OF;Oe�"t���D�Q�кA��G4���Lex�^�?�!>A�����r6��N�;1_��r���G���:4��C� �m"�������mCH�UQ�
�2��B���\�K:�����S}̬e�n>��@޳�F�C��O�B�MeV�ks��d?�atkb���ֺ�)hvRn.��Gs�C0]�S�bj=й�t�<|?S�s��:]w��\/���e#R�!���:?\�E��ғ{ĢfC��E>�C"Y�6��,�`��:`GGic����mn�;����v@�|��v}��	WV�	/V$�s%�0=��#ɮ%	�*OF���}���D��¤���U���~i6N�F�7��\��rX�����hP�\���tyL4@��Z���P�h����q�0#j$t� ����	���1��nW�U�o�Ⱦ]�پ��� T}�Y��>�<�R�B�a�(l��&�#�#V��S����A�P�5�4��Rt�yl_��}[gg������_hAf
ZE:�K�>H(�.�mö�]�!�/�Cp���1�JV*������� ���-=�\q�{C��p�n�������z]����X;Q��rm�s ����5F�2 �w�kn�6�1�k����������ԭ���_���~�R�N��t�k���ݝe*<����[z�M�P;E�G�����>S�=���� ��T��M�ʁ�[j�d��bXn3�(���X�j�aE�x�G��>�,3��.@c�G�q�^m2��`g=������-�{��R0�,�)(�
u�-a:_gK�u6ӎz�-��lH����G��#U
�������R�����n!�#j��N�QA-b�!�
��\�,Ֆ�<�Evq2��3Z��9O����.����,v��P�Z؂~G�
ӡ�vT"R�('R�j�T֎\lkJ�P4LM�J'���a������!^�K��$5��p4T9��3�.���4:,���>�씁�";�S��C_7��sjV��+I��׮E9Vq]]��K����8���ȁ6[�2�5�����{���5	k�29���CY$�9��e��!��i�&Œ7��pp2ysPcc�P���w�8#�gcƱ�-㩝��Rl�3�Rƃ�s����ۯRV5���J{��?���M@�y��E�9dp��� 4P����k�O��N��EaX���HQ3B𧊞Mьv�>�U_�fְ0�nGpV3suM�	�����������-p��2�݆��d��(^��B=0�Z���_�n/�
��RI��V��a0F�z$гo��a�256R�Q�ъ�J����J�hg9ȆMEB�*j��۳��tZ��'�[V^��7 C�Yt �`�g�!�l��Ӑ�P�Ii���_{r۷����������<���~�q�/�`
��-]�E�D�;6zM]�k�Q���7�YY�zM�ą
n֋��XZ�6�/�q��C�z��T���r��s.k�1�N�.���N�X��r"�L����w�����YƪN����,�>�㣎��V���'G9�{n5TR�F�3��X�W喐�*�>g�z�#�����̹2�^�Ax��.6W�.��׵f5
r ���^mV(�]7��d}1�������Z�Y��|}�Vt�t1��槚�(��JJ�e������v�8/TL��n�(�����nI��6e���_��a�+�֝*��/�GCj�{��-����S�!��9J����?�	�s���ŝO�����ނJH��=��U�P,ҁyp^7m�r
����ہ�h<��5 ���	��ws��ovW�����u�8��"��0�gzm:��W�8�(�����3Ͱ�H��`=���F��N�j��P@/Oa�:%Y��i�+0`^���D��È���7��0�^��z�C �a���E�7�.L�8r�a{�$C%׼
B�U3k��Ex9�wE��L�/}2%���v"�^����KoHD�"��k�Z���v冮��pӯ���b6k��qϗ�_�.�Le�,G��A���: 6�kɣp�l�L�2'���ā54�\o�.�����}*?H*����U�������Fw�kEșY_���[���bN"G�Է��ڑx�ü�͐��+T@��9%}4�-xZ�[����j`Ws��T�ࢽ�\@��c�hA
S�}�"t����6N���{ -ӓI��+{�b,g�c�]8�,�R�M���[���n{�˸��F��@Ԭ����a�?���qؖ�Ny�b��}hC3Nb0h[�u�I��4 iP&�A�p�֢%I �E�ȳ��G�<a�3zP�H��i���b.��޼J�.%��~ʦ	���y��༊=b �� $?��>?��TO�)�%
��f�h�$����K�W@z�fʈyn���U���\��J��e�'r)g�à_>b���y$�) �46: ?+P�xt�]dI>y>����k��a�� ���zy;RځR�p�>�ct�b�2�\6T/�(�Hz��3'���X/��TeUN�zx._j���ۏw�o�w�O���V�ǅ*�pT�Uφfn�zm���� S�-�tB�O�,������Z��?���\��B�w� ��� �?5��2!��L�5~+,>u�S�b�(��)V�v]y^���/_���+*]��,�����Ǯ�
1a�[����^��=�G�bGº�~��"v׫��S&��6s� ��j�/=�9U��G�cAs�=��Ęejx�#%-�u�8�9Q�L-�4�ql)�sί�r>�g�N�uH��m���؃jO�l���Yn5�yb�T:�v�u�Z)Ws��<%�,�7g�+)J�����2��YZ/���n�bH���@�Ly��Sb7��S�?�� �F�$GfD�M]���!�雷����-�V)����Ny�@����~9^��EXD 6V�� �{��ڱ�ͤ�@������ٷ=�k��v,$5�N{��-�~g%��"��]溊.Z��C$��X�c�x�&4��l`�z4�%��~���v�E��3�3\ߎ�S&��:"�G��D@+���"v���mg�X��v�\JK�EQ�G)��4���ն/��y��7��ݡ���F+̥qԋT�((_r�ɓ�!�]򒶫�\#���aHg`&� �_ݱ�L���#��.l��>���9Ok�����*�Ym0Q�f�	]�`�6]�M���y$y4�뜯����Ķldw*��������������ۿ����e{y%�79I�`W���D��1'����3�t�D�w�
�M-��� ֙�,Do�>0N-��	�F���6)Ƿ�#��hք6ٙ6�]�h�N�c� N�T��P���T��ݣl��P�Qg�ZH!���K:F��T(�'��T�/�����v1P�����t ��Xi�p����ɷ�ݬ}�O�Po�M��y�#N/$���CU.�(�Tz���5����uc����k��=���=�fy}�o,EJ�/A;5n���F��mu�D�m��5s2�a�xaA�sp�?UzG6wɮHK�_���цn�z�mXY`[T��:n3�D@ �-q�qe'~�J#�4Ra��ט2��B[����WAT���P3���r�I�����R ��;���HѲ{���9��`Ϊ���9�V���ʛ�mw��t��.�=!���������1�?�C�B����"<�]MK�T�*@���S\����P�C��D�X���E
��3%֊j�6��<��K�!���9$�+c�C.�d���y�� �T6�)r�(��֧5��    r�-�^��tc�Rʐg<���6ҽ��zA�G0���B@L\��/o)U�쯁xP��
��0����n�������L���u�'I���Q����,2�J4�+�*�ö	�jG�x*68!u	�S���!��ݜ��zI�S���3-�O�ˌa,t��-{��9��.�m��r�#����
)[`��b(�z���C9�aEX�ӭ��X{:]���%p>rŕ*,�w͝=��c1�.��*�Ry�@=�e�h:�S�L�7���xGm3��	*Ŋ__.�(�4�l��8�S�m_B:R �?}	���}c��#Ҡe��6NV~C��wZi�Sc6�����m����=ę+p�Ĭ��,��Ew�!H��l�@�����:�YÃ#{�S��m#߱a �½�Q=���E!��������H2[�-��]ԓ��ߡP'eL[aۦ���^���|��d�����?OO�K!�qh��������"j��w��t�uE$��ߔ"5�S�s%xSa>I���e������1/����Y������%��ˆ"C+��eEo-���N�o� ��v�cz�@�O��7�K/U��X��H�3 ��+`I��Gh؛tup�����3d5�{p�D�I���k��l/k����'�L'�o�ڛ>�n��]�����ǰ� � ˢ��e "N�_�����'!��:��/��0�i"e��ز�����5L���G�<Ab������_�):m�B?�jcS9��D$y���)s�-t����^��Uj6���3��X㾲�c����7�<r�������o;,'��K!��,�G�j�@-֥�Xhi�--�;���p�CM-{� �#�!���:�-R�Mv���4)��'G�	 �H��M�
R��_^#VGАKܶ���!n6����p���ܾ5χ�>����q��1ƖcFJk��f6�&�ׇ�>� Bq�N<DJ>y�Tu�	�0���`�����q<���^m5Ο���Y��Z
mE$��Tw.�Ur8'F�0�KD��� ��]�򊲓�bc���3&�������~|�^��t�/��ز8�-�M
�Њm�mA�ʪ���1`M���j�`�G��3WL�DdY 'c�)$lL��,ӽݎ?|E��ދ��D�h&1&���2Y�L:��������>wO73���A��&�bT�ڝ���c�`6w������m�]A>�ù��Ԣ��Qu啪�~�@ӛ�4��k��.{�.5U���/�l(M%��������~M�<$8#�TE~��WRC�l�E�<omחK�4r��DF�����4 fO�6Oc(���F��@v_A���g�7�dcQ�M�莠��Oʶ��z�, �op�-�0����r��	t[�Ԥ�ĥ�g��m%ՒL�� Q�:(�)X�s�L/W;(<�;x����!��g),��E۔1{�|Ċ����C�_��#)�6��0���9��s}e���7������Ϸ$9�N�3�����H���X3��_����Z�s	����/�lB�,>xǻ�Ge[�A���2���7�����*���9ᝪ�袾%ǰNz�j��ȗ2��$�QUͶvzt���4��s�dYe�KlP|k�&�E;!_rC��B?�5��k���.lZH+�A����SWeK@�
�
�*��k�B��
�Ҽt������bR"'#*l]��55��S'mk&ǲ�n*`o��GC'�W�(��>.O�+֕������rK(5g� "����E��y�i���B�fy@`o���Dk����mX����������רzT;��P�m�B�y�m� �F�@��H�l�{�b�2�F��e%a�颃*�*�b�N�Op���c�����E��[�*�h�H]���fO�V�1�� �az�`� �x5X-DZ�sD�3шN>�@�ZXBŔ8o���|[�QLc8�k���DAC��+$�<zM]�)% �������<��^�o��r�o��|u���pNl�Eu3����YT�V���n��)>�I>O)۩�e#T���쁑���M�"*�M�)��ڒ���+���ך�R��z�3bIs��pݽA�j����e�:2�<��,�H���	��&��ʣ����e�b�p�Z�w˪�����)6�����~�hS�SJUT_
�En��R�*8�;4�#J{ڢ��K �w��(EBۨ����Lf�i��]���m���0����Xn"�J�㒋�t����5gL�ս�5�4� ��c-D4���Ղ��C�a��L���p<�ޏ��Åb�����vM�B!�H�]CO�-�lW�*�����]�p �L��ʲmZ+���E�L`�^�
��}?>!�@���st�,P�;���C#j@�=�����n��9\�*m��F;.����셅a��<���3svoer������u�>������	�m+� ��V�փ�6h�L��L���?T���Ŵ]6�+w�:5���/��P{ms-���6�I��C�	��^]���7����n�
��>nl=>05�L��-LP
eY
x�(�!0��}s	{L��f_����0t�
r����P0�4����k���1�`9(�ZU������N}�!mw�t�P�E>.��*wa;�1	���}|D��lb㡅}��6�����3�^���Nqg���$��s���xz��ِ�1�����ay�k΁�QJ�<�<J[?T2-�z=�i����ɰ��fhx>\~����H��NQ�!��t{9	1v�)�d%b�ƈ��,�W#ʹ`�9R&K�����h����R��>QwA����~�8��-
��0Y	9����4Z`�,R�4�I����$ҧ3�f+0	�
ż"��ߘi���!2��d�U@�U� 8H��خU���.��L����-6 ��	�[S��X�R�%��y���<}�f�?^����ԗ�/��9�l���E3���v�!�d��G;�`E��-û�m�u�dvx�<͜��-p���4�t>~Б��c���p>�zRSx�� Q�ble��h�ރ�43r�҉L�:-Ai��*ȳ<���xz���5z�-��AK��\h�_�I��a�u[~�ኻ'����aZ�1��h(���wuZB���7L8���X�������\;��� �����hk���-5�l]�d�C��h}x���J<��u
l��3o��m���d9����������߁
H��;����a�s�(߹��R��!����,��Ef<�
��k���?] =_?^�~��^�z�����2?����Dw�^�;!�v��7yN����[5�t�=�Ӗ�}�ژ>/�Not�1O�OnO�@����C}�̲��J4���H�T:���N��-H j��
6�4w�W"��$���%M��~���N��z`��w��O]I4�0�����6*�\Wj`�LC�7��a�x��tR7�7�An�9� �pI\n�2n�ا<*���K����iR c�00r��[��UxhH@`�6��G�xe3�3�=S{�ۍ�����u���k;k =�y�i z"#�5�7 -X}�E�G�#}f�Z���5��n��,�T$t��q;`{���������̸yJ���E��.RZ�g��v;�X�>��UR>�=��ws.�As�������?@L�1)��2��Ӵz��2�z�S��<MW���-]��Nr�s���b�}���Ť���l	��^ ��T|r	�銡�o
hzݕ}�ώ�w6C��|��}LjY���By�1�r���!V�����@v<;��m;��E��5�.�l�3���nb�S�!�������ͣ�X�;�.+8W�8p��8e�t�0��,߄�)�����9=�8�č��x,�������u����4��H���4���M3�UUpj����Ua����!��ϼ/����J�H
Y����v�;<�	���x>�}�z|�2��A�^��}�\mv,"�X�:��Ud%��?�.v�"����vCI�    �\+���#��J�
n%���HU�~ZpF����L�(Ȱ���e�F��Ȥ &P�IZ��䷰�r��vp��o7������x{�ˀejK���Ǝ���u1��N��H?�{�S��2-R�!�^8�$C5T��K�	@h�R+k�f����>>�����!�5��%v��zQs��ia�Wt�b���᡿?V��L"VYv�3��C��c���`ꏭ�:����N>�jrŻg����+�R�0�z��f8�]�PN(N� �`�����~&E~�������hKs=���w�4}��X��y����0sv]�FD�[D�L��Cz���w�ͫ����X��*=Q��h��HN=Rx�����
};|�Z0y���N���ס�B�Uu�=$�E�.C�@
 `͔!�PDA�^��W�����gdI� X��k�X��S=u�g����3SD��%�c/
 Ȓ$���PChEp`���W�6υo;1�.�ߗ4_j����g|�5Du�-� �L� ��icl�Y��
�AƑ�3�*&�J3|��H`3W<0y0-B\���<d��'��n��ap��򵨡E�wlC�3�U$;�'�=n�� ��@+!{�� �!tu�RA��v>�<��2����8�"��ذz�q~Ce�D��U���a3S���`yX��{T8"t��ӌ�(�_�>��ڛr_>�w	v�����<T�"�O�+��pV���V�E�ӎA��Ng�Ό�s��V��Et��R=�xq����̼�l�M��㹟�K���i� Ac#M�n�y�����[�m��ԝry
��B ��!lO 4���� �6�##��D5z(*ڵ=n6���ބ��~?�ޕ��!�$�h;�^!��gP&ng���|�2L�	$Hݴz�R�`�+ZSqﶋ]�my�N�ߏ���-��N���Л
��$������-�k~}>�-�Z[�|�_A+BS" ������҆�b�By�Y�_�qg���.��և����sp�h�%Ĕ�B��`]4l�x�;5��bl���0�S��\�(���-gDj���D`�,��������?O��c��ќ�B/�(�L�����J���O�I7��[)��e��O�%RIQ����~,K��#m1z\��ݙ_O�d�����Ljj�ܘ~��a ��4�<��?+d�f����ذ��S��@2��Oh��qY��k�3͙���;���da�9>cv�Xݯ������k<Z���g~5A%ۯ�&�nYzÄ������q,l�r�m�Yи>sspvu���T$_�T3���dZ(�Q��u7@]�= �˸���p,`��ؤ��ba����eQ�GA2���R�
��R�~��} B<�1��whygysx	� ���%Խ���mq�7�,_n���,�\��4Ꝛ���,t�1!%8p�S����ՀD��X�񨴱9s�8���jz�3TD����p=��/L��?�I��7XG�1�'�/D!m'NL߭��Bg��"��a|5���Ơ�ȑ��U��"B3��/��Z��׏ f�Y������f��;;�)�X4[sq6-�
u
|��(�bK�y��<&�C��-:�y��d!�k�,�gJ0b.J�\n.����/�?Nae*O�qyY���d��?�˻�0+��^�&�o,�	w��������#s��˶�A����:_o}��E3�������5XB��6��8��zf�n�^���z<�y��O�ǧ�M<BP-����1��Z��q�Gs0�f�k��k5zS��D���׃�V��m���l�A��t��I{��z����Y3���M�Ұzu�7M��pCS9��)0Ĥ�����A)U^1F#/DD��6"��pmY����T���n�o�Y�m�۴���R�)Tժ*l�&�~�H���P�:��ֆ�]VeE���8��I���f[��Q<)o�TcZ��|E��bh�φ^-&l ̅��Ri� b��PFX��3�+lX�,�=����oY~-A62t��:�RU��J�߸QmR�agp��cu.��cG�]�Q<}�,h]V�ӎ�`<r'��;�<��yz�b�������z����`;����Lp���2-����+�P��`��v_@�Q�ʛցM��g�t�-�z�3V������K�i�z��y}f����ތK�c�G��M����0K���t�ov|=^��+�W�M��#�e�}���Li��[pg[�7Z��S�R���!�O�)�)��)r������d�֦�G����h����@�?8[P3��\�$N�s/W���^s[��P��.Ѹ���*��� �
��W-C���{��<���A���`S'g���.RИ(�#��q5T�TI��:�����Z� ��*˘��:hJ%7�&���IQ�鋷�/���lz�|q؎\���]�~�8M�� @�t�tt��V] ¥�^;�bw�H�YN���}}���������� ��Zzq>	��l���F���=㦱�b�Xy
[_�J},��)�
���$̱73k�V����C�?&Z��G6ׂ�t�:�[qݤ�RhK��i��Ewz<S��7@�rw܉��w����&5c|1N�_�Rh��H3�nwF��ֿ��9�R�x<�'P�|6L��l�D�ku��4D�i�g�7c<0�B���S恇��m�Z�_}�|�K7,����-�]�zx'�e�`hz��[wf�U	��v�V#@\x(���Q���ns�o�̙?ޞ�+��ˁ~�|���v��G9����n�����>�& G�JYм��"6oK���O�'Ӵf���]d�/��������=EI��կ*�,��h+E��(�F$fy2��  ���������r�m-����6|\��߽�D/N��2z���q�����C���m�t�g�"|��u�1V��h�kL��~4�/-5/�1���\m�\��"<�l�#lgf���>]vU���[�h�A�Cq��n�	Ć�l)��`u�O�U�2Ü�7��&[�^���mZ�3o��Q�N<*8����?j�����b��o��7�i�{�vb��i����"%}�������Vq
��������|z��A����L�5h7]j2�3�,%~��eT�-v��1��2�k�*�����>�ǰ����)@���v���}�M6`O�C~\OO�r��5�Ó�� �	�R?ŋ�Pg�>���Jv?�M���0�r�c�c��+�I� 0t��!0���	w]&e�T̿_�n��1�����6`v
[N��(T�C��]��ST,��"x�[�o������}�s�t�f�J� ���T;�%����;6��,K5&�RhfW���j)Wk�]SA���7��גXI0��oYA��jE�6��Ɗ�9��ڡ7�E��M�Q�:�F(�N# ��F �;G@I�t�T2Q%W�讓K^ �3�M�(d�
�:K��jЅ�K}E�S�Ei�8]$[�#;����CY�H�FBI��WڲrN$iC'Vv>�	�1�Ï�5���ay{J��Tl|�?�.E`Od�����Lmá�&|{D�������4��x�4=#f� �a b6�co��C�|	��
�!��u�)u���?�o�%�\K�������J��~U@h� ��S�����oe��q b� �b�R�T(���FL�t�Br'}Ņw�>�؈�®�3���j��Ϭ���Cȑ/d\2|�?>_��DL��#�_�V�G[�O��օA�0��:�*m�I�{�(`��I@���T�F�4�
-I9��E�<禟 ]���S�{��ӈd�R�,�|C��,�u�I+/��_-��	܆Ceht>(e�y��������t���(��';R4#1�,� �\���
���}�!��d#����'�>� vV�@^���y����@�ZP�Ju@���3��ʒi͕�~
g��䖀&+���;?��3�&[LĽN����*�E��������h���+�    ��bڙ��^���F'�M��p�K��_�m�|���I���.���z�8l[��H&�jO��Z:o�������'�Q�C(PTlP`A?��`�k�MV�]}����-���a���^�C��q:g�wp��ƛ���
��I���Y���m1=�@��ī���ѭ�_r,��x+�]*o[~�.��E�e�´��L{d�٭��v-I�h�o����ea�����]��𱝏k���l\R�p+wT�����:/ >iX!���(߿�G�&Q�3_?\��I���%8���|�q2��|I�߉����N���o�`T��5X*B�Y�J�\Ņ�����Ч1��p���)!�� W�.>Z�*�r=�.�z�3���2Q���?No�0�}_)��JPjs�p��z�N+�B9'ʖ��NV;,8Q#���*�U���b��NЀ���q�,!F��F�Ĕ�����x�oO���i���b�P�X��J]a�۶ ��i9����T�K��`j���&����@�S��3���e]*!��B+��q;}y����w0*'դ>?^�D̉P~�Gjq;�1d��,V�C)%"O�P��?F����
ƻFO�
���f�jxBf��ab�U���l:��q�r�,�S�r�/w�jGf��	��t ,H�np�����Nf��-�ݕS3dNQ���n�B;Au��w�e:�(șv= �h3����vQs���wFh*~���N��פ+�����oҫ��:\ِF=%�vM}XY�4�s�Dy;OPf���zC�"�� ���OxJ)�ѯ<2\^:���:�O0��I��v<}��DR)�wVK ��	���"]��T�%EC�<���8�.�2��c�N���M�8�;����~y_���|�h��!���0���@�����p�1��U,á�*B(h��5Z"Հ��F��b�:1]
r[���O'@,�����&���v���3�C���Y���U?x���
�r���̀U�\b�-*��娠12�|�E�c��b��=P��WD���T+�^?.��k��_��5�)b��˸�MV�'8��)�K4P*�����5X̛�fd��Nti~�{����1s7K��
��i`s9��M����4ʓ24����U\���VIPKW���r�(lVث�2��v�hEw��? �	��@f�qN�Y"�Ճۯ������i���̽��խ����b\�U�e6,E�@A-6�bj0��;��m�_����B���Alg�2�l-�	C�	��NkQ�)F'51��ׇ,`l%���F(�����R/�� �B��Q6)!� ���Ԙ\��"]�[���nGKs9���ҿ���	T2CT����0��&�&����p��+v��-"O5�Yx��ۮ'Q�i4�?���)�����,�;L�TFZ&��6�۔"��z�i	Aқ(SNVb�R�ED���3_���L:�ϵ�	Z�\x7	���2h˙��^�j&<�>n���U��W�e��f��酐�����B�\�b���.�I��J�J�\��u��V s{Ao�\�j��U�O^��	��e�EQ���eʘ��J�"���8�8�_G�n<1��6ڀ4A(��X9a9Sx��&�L��J|VDǟ��ʓ�¼�(��T�U֞�&]�����x˒�8Q��)S���(O�����I�6��3�����@!8���!)�\�0�Wi���ͺ�d�>1�մ3����6vL���u�G���HQ�.���
t��4P�I�t�@)�1/ۃ����G��`C$�6t�O3�O�~����uD�������<����}�6k*Vܞ8�_q���	D� ˝)E�.���к�n:ay#���Mǰ�|�'T"Y V�W�(Md��TZN�ª����>�7��Y�k��+
����*T~^Q�=*u7�i�YG�n��"4�S����,4Ы�
�F�#�U�.y�q�����S����F��PTd���QС��S�l�ґ� ������U�1E}G��s,0x��2��˰�B�@�����vz�����B��CȻ
�h�6�&@PSϹ0t*$�F ]� ��������L�EkY�!t�!̖��۰�YK�Ng6�yz:\�P�D�uq�Ϩ�ہ�i��M�k-�x��ɟ��6�O}�����I �o>� ��E�	.�r��ĦD`�0��bFI�&�����C{J��|�v�������b�730�r���ԍa`3���r�P�hu�)�R[�g$�
.~G��[3Cm��1�võS����D��3�Y�`�n�E�����5��*:�U-�����q��.D�h0��E6A�H<�݅HN���5�f?������Ҷ/�}��:�[�]@i�	�L�ݱ8�8`�J	�ۀeS�E"�6C�$E&L7� Y|���^�CV����2W�5]E�C�l��\��f-vJ
3_���,�$�#�d�'@	�l8����8p%:�v�[8M������F+t9�1��v��:���ݏn) ��-��������e������v��6b��n��3Q�|H�'��W��:���9� zlfr�����uV
B2����ǹ����A���l��vU`�ڰ2�b�2 ̀k�>𱕵 5Cy�ݬ螑�zG'ʭ5��;��F�~i������K1���� �ЋR(}��o H	�1l� �MO�-h/ǖ���t��-��:q?1�����W�N�Yi�} :բ�brq�N����M��=�I���mg�눃�n�0���qKШ�C_o���v|9��Y�d�ڒ�%�|#�_:zS0�9�nq;���Sā�;kȱb}s>Ldh�:�G�4����).���Q�M�ڙ�ڀ�I�ft�QM�_�/��Y-	(��h�)� qo�����ņ1)�	B�F@6�3�B�m�n��BFM��o[���|�����B��UGڢ4�'��i�:g��5,ߠ�������B裓+Uh����6���t����<mؑ��9�
B0������T�/A�� 2��aL|C���ȴ�?�6��)�
�;��-�Jk(�L	�FiWK�\�c$O����C�q�Z����ϲ0�=����� ��{�ʫ���Qܤ��h�]-[YW�+ *�˕�l�U�}�HW�v�F[G�4�e!z��n���ןt�1���o�p.c��<� *��� ڴ ����A;엄lIn� t�����:���I����;7B�L�t<�q�/��"��n�����͠ƍnC�|�s�A
7�*|f�֚�=9�[�~�Eb�;+���pmÅ
h>M�8Kw�6ۣ:) a����6�U��@<�9���o�E`+���v���C>��7�@F�����*�g��V����%⠀2�C��^H��Pt45���	
���va��Z�|�zxA��*J��P[�]s)��9g�7M �n���eAI��K�(p�'"a�vcE�K�us��+�=J��|�+)3O:�π�S��AWhGrUҷF�D�2a�e:o��TBrO�c�k��q��O�_����Y���;�Bq�����,������/�a���cL�U�3^�=RF>걃0y@��k ��d��z<��h<�.;���Ww�Gg%ڭ����r�PM]M0�Z�9�f{SiY����^����q@��`NP�C�h�M�s���3���OC���'�����P>T҈������y�mT� �s'���e�f&�a�-E Y�/ζqJi�jJg�ɶ���|�u�_ l-�ӧ^En� i̹n���!�:�=�Ӳ���J;	q`6tl<4^+����Uq?��N��aRy��)�^>�`|:;[d�@f�g���N�x�)�)��b5yM�.�C{D��2h��l ~���b��ㆁ��5׊n����m׊xgx|d��Ly�B�v��ѓ�� �vX��0E�z�y��Ԍ5Q넄�MuKmb��d����C�Z�sO:�������i�f�as��3X.?�>i�,Ų��:��� }�4�y� �e��    �2<����l�����;a+N��X�?�S�?��@{> � �D�@u��W�<�eՀ��UTT�2J��H��j�ӧ�h>�� ��)@Um}�;y��7$8O��)�?\���z6b	�r��i�S����Th�xts�����ҝJ�����b�p-�ڽ�e|ٌ�t@����އ?��ha�S���*��Mb���7����)Yt����J�CY ���.��� ��/�j���)��t9V�Ŷ}6m�G��R��"ׄ�ʷ�j�����7Y�#���x.o/��LI2�H���ŝL�/��I����;>G&j!k]IV��p?~�oXp�q��Tˇ�e4P��!eF�Y�����������u�^�����I>~8�M�y�`�5@��
��f���-O�	 �BR��L̜�C/�[�j�{�6�+.G���8���_���pD�28�+�r�l['ԛ8l/�����+6_W��	:0���x�ޱ��Vx���¨�ӟ����a�I��:�gKJx���A�-h��WpU5x���d��vrfP�����r#p��s30�;��"���}͍쑦�#�H�s���W�?��_p�r�h�"w�4��p�q��C����}P������c���at�Bx��'
B�m��c[(��e]���!2�7ym9I�H�}�^�<Qj-��a�����ԎaTXd�S��yی���/��4e�U�Ą�[����ĐY@�&`<E���$Z��L� ��`����rڝ:���˧���z�ۃ�k2ib��g��*S��rݐ�2��Qϳ$%��z�P��f��V���^&���Cq��F����~���.�����DJ�
�EE������%d��� �p�]���}=ـn�m����9z���:4�Ϣ7�Ր���Nx�W�k�4ڌţxO0���<Į��e���^}Nf��Ԇ��q��;�_��nn�	 I�*NJl��4S:�V�b2 �a�I*��B+ �V8!k[��x���ै�>����mV�3��W4����i��~������e����@�M�H����~����7cr�+�ɐ�T3&��n�#�
�3))$@y��r���2b�v-�T�`7�֬��9��o��m�$]Z�~����T(���7A�x�s�CJ�g=�\*�ht�V����㜂�Kuh4�i[c���≙�x(�Z��X�l���{�'�;`W������W�J�ls�|x>�z���J�4��][g;(t}��Z���g��!7DE�l��@kEv���\�e�>�{�}�+��s����\�:�I���2�r!@*j��5,���D+: DX:�ʓx!�h#P�˧|>r���dz�����:o�;�����f�1CS���������և�P�`�,T/ԲS ����S.�3����_S\��a�(By['7�b�_>B��c��KƗ�_���V�:��w�E�����X�����T�2^�+}��.���. �`
#_�	u�{���W >���^�ʿ��.��@?���Z�.1���#����W���Ư|ί<FG�8d�uфrx�ãn�1������;-�hTMJ�X�~��*�pi//-�L,��f�p蝰����jJ\�Al�Ф(h�� �Ѷ�v���<Y[�]��L&�p����桭%�v+�@IACSPd&}��k\Vi���/����%ݔ��<OH*aGJ_0����'�_2re�-}9���Sad��T�U�|w�ύ3�4U���&EF�;�:�݃h�QL�P�:n�E� �2IY*�M��jtG%@1��8��9�`���j=.{��?�=��
�����~���R�<~��G�E�-$n�W*�0 ��9eA�d��޺������h��hT��M�@�����C�}Y};J�ߑ�\�������:�}������@[+��'���^
 �"��FKes=F��w��6]���C�t���=v�&�i"��)Y3m[�(q�i�I�͡1�ѽo	�Z�{��!Y�J�c刼*�Eay,��ŀ��e�-��UW}�; ˰�o���i5����sy8}?\P��W��R���
r��Ƕ����KP�����\�&2x����jч��c�5P1�*�}�v�Eچ�����ܻ 2�f����j��K���a��� o��(���g�>0�W�E�N).yEY��J�H���z��S�J\ʯ[��oM��?�e:S]i�!���`�[4�r`	�tJĒ>��*����`Y���X��,kW4і
CNk�\p��-,@0��<_�+�bj��^j�ZO��#��l0P��^�Y��H�T��BI<�o�����aX�7�{iu�c�X��gΙ��;|��B���������0L���Q��i������Ԉ*X	���n졿�`c�����1zkd
Z�A�ݦۚ�q$�2n����׮b*�{\f�ڦ�=a˄�P2$�^;���<D��}Pќ���z�;�}�:b�������z����BoVƟh@=Nב�%՚���y���u7���+��Fe����i�'���^R�w�G+��(ϰ,�]�a����K{�܂8r޴�,�`��Z�N�~�t4 ��vMcc�C�{�Y��4��*�6^[��R�+�?���R��|��ק�]KaM�Bg��r4�:�~(��EY5�_�|sKM��?Ƣ�P'N��IG{l��RK1�i5�����tPG�C;��
��^�R�
��z��
A�v�V����";�K���.HY/Yd}�� ���O���/�/��3�t&��,�F4��'V�2�& |�4����mx�?ЧZ2"[o{ӟjؔ/�e��C7N�sP`u[`L�#k�)O�!�,'~p�eǡ�^�ް��p�r����{]mz��.z�ፑ2��Gx�MX}�a���z�,9�K��θakb�y��o�tK�'Ǐ��1���J�J�A��0�\����c>�
˅���	�"�
Ϊ��8(���\�o����\��'C�a��3���4DR@>O�j�x;�J���*�1�x�P�(�����-_�n
�m�h�F}��}�!��z==�>޲jg�ZJ%����P�����A��޿j��2#g���c��!d��(�h�~�>�P;L�U�����������0��	DCІ�D1$j� $)��e��9����#���[��H���qx��6�C��;W���Ş57���ˣ�~ewؿWР�+<�-l���'1��l?��p̪1����>�P�ã<j̘�%WS�w�~ob�ߩv��c�m!�}��EB!�i�C�q1��<B�n�D���U�P�gre;t�^d�Q�0���d�)��6T�V&�iSgt�#!�!�v�5w�W�bt�E��r죝$	��R�Y�k���׍��y$c�"�
����}z���V�q:|��΢m8�R�ߑ.�.���jn�|�	�����;m�{.�ƥSr�f
�" ůh�k�@����~fO�(����p;3�� ��Z���
�z�3���n�h�Nq����D�V�tu:�PƜ�Cel)����isE��������\n��T:��\�;��o��2Q!`��B��
A�Ӂ3
��&ч�.o�����P�Gh2�$Z���ڐ����J�B�gS!��l̈Z��42�����U��o��K��҂rCupi�KG��V�Z{�dYg� ��B���$���P��R+����;x�$:����~���e���W};�f�I�o��E����ݵmoܠ�`?�fmT:�Fk� �T��Ꮆ��
�Mh`�=�_�?�_�㵗�v�����⵩�n�ZM��`2"m�0���%�6C�-��.O>{e&�܀fO�2����f\0#������-�2~qauȍ����tR2�v�c����匭�����cc@el�/�e�ڕkw�r����I��~O2 ��Ր��S)(j��<6�x`�)z�$n�d�٦����}��Uw�7�OJ����r!��uc˞�ޝ����^�v�e���    D�{^8�NmФvpc��TOšp�㕭���<j/�	��޾̩��Q��uz><��/ ����)S[�M�}H�M5�_ug:�i�Q��ɢR����IΠpؖ����"W|?��y�7多�e1UH�\h,Rpѭpѵָ;�4��b�����0�W���Giw�`q��S�������	s��#m?�dn��@r+�8@(t��J���@��oNb܎��h�l�/|��۾�c�O���-[ul��� �u	��ܠ^S��+P�`$��
3e� ���x���e�t�7l���a�d�Mz�{��oK'���)�	6��c�[N��)�V6�v����cʹ�pA�1���u�p����)��yV97�D��p�}�~��M�a�<�����S	v2�St�]P9�'���tl�B��≮��;�"��/��r}��ko���(w��
& ;�Bh<6m�L��3#��X������זQ�Ћ\T�o��q���]�?.��k��]�.W�m���ec��mI�^�E��O��0��H��MP	UcQ�m�F߅�����]��X܎7
U�ɱoӊ�j�6ߩ�u�!�V���xye�z�)����R5�E�^ G��h�����I8�( ���h���PD*<�³^�BU�����0�P��3nʰ`ݚ��R��Yod]	׵�Nu2I��l��D�OP-���ٔ�	�ͭ�$*"Xj�W��ْR͍�~��/ĖS}���h���BM7�@!{3+Kͭ�V���BG�$�Ha:��x�c�}�v�Vb�-���@s�d�ܟ�E-��T��s�=�(�ɿ���yH�h�i�Ml=h�R��MD�{J��^�M_ϧ�?L�hB����A%�A�yq��xq�s�=k(` J��PM�}���Z�;5��Kq7���|1�I�~> =��p.&�7��\��Ѩf�������.�3�_���Ǎ)� �Y�ř�yrY�=�V.�������s)�jl+�df�
��w��"h�Sr�:l�@B�m��FᏇ�ș�����w�J5�����'��7N���8��`�9��H6����\�P����+˟�׻B�"�T4��o��ŒJ@�)h��J?*�Ǘ��yv{d am���C�M�h�����`(��Ŕ��cc�b#�NV:�R:c {�}\��&h�Ȩ��cʓ�V,mMV�Y[	}ӵ�%�K"c�I�ַ����Z��aqn������Gs8����R��<�Y��·hi��y� ���n���_?z��l��/O��5�W��>g<�
����[�:��lŬ���6@$@�	2���"Q� �O����mX@��I�p q�<%S�h0R�&ꂶM"��%TE?p�DGG��iߝ?�d�4��mҿ4������e2����������D-�vka<�H:��g��7ܻ:0![�)Lvm��O	y�:�!=g:A�p������� 	�[TN�2.
���r+�i�}�nh{��ݬ�P�5Y�Z�x�h?V�5.�;I/h���Z�cb �H	ޙ"�px�e�s<���r$�4�^�w� T>響n%ШmB屶��wL�ȯnc=jK�U�%�]�k,�8%md�/ɰO!Z~��O�bi�k�����nmCX/�)����>'�E�ˬ(E�|;ߐ�
�����tа����#�"��*�Sv�xC|<�Hh����k�>`'��hR������T9����>jL����0�۱@��Z���4{�J��vmD���Ԅ��+��P5�������7"V�!.hxR؎�8j��*���&?�Ã�,�W�#U��P��y�"T�E���܎O���;<4�0�<����xZ�����v�i|?�35��:��ˁH��.�칂�<�G8��t�Jᵶ�Q~���Ė��xw��ྉ�wD�<ҟQ�OV���N:|��Kԛ~k��PUZ0K���jl�� �v����Ñ`�T�+�3�r^�����%��D���;�2Նn��y������S�p/a� �.�h@`\V E҇����X%��,��G����9��[W��Я,���/
��뗷�I����8�^Z�!�ZN�4�z���v�%�,�ȇ|���2<"�3#tS�%��}5"v�A^-Ȯ��}�â3^b �Vm"�܅�k���(0�ض�ykp#��Χ.rF&�m��؟dp�v
�p=ܭJ�&��^Gxc��g����¼sL�v�M���^d_+�њZn'�[eI�v�겺����/�����p�\ȣ�h�����.
�Bԅ�6AXm1_2�I1�fltP�����*\�l�Km�.����7e�����ʲ�;��vK!���0޽AFB���a�S)�"����"8��v��]/��o���z3k�Κ�e�:W�S��7�9; �#w{�\bh��$�()�C˻s�v�u-�?��UapT~bjZw�`HS	*[azqk��@1P������Sje-�ǚFO~����歇)�6u:_>�T��y���S��s��*��"�»�����#q^�5%�d�����u����	��Հ���J���������jA��]9�Y����4���+�S(,��P�ɦ�(BjK5Uz��e:�D�/�����`����t�W��p�O/��z-Kd��
""J���-C����8��E��^��!?r��b��J<M]��/��p{�*����W0�Ҩ�]�u����K�Q������Vm��YV|0�0��v���`ϲ
Ӷsv�!�����J�`R�Q�K'�a��UDO�[�d)N�h�e5�O`]P�s+�H<�m�M��%u��c�f��a����2�����򳕠G%n�2IE�-m�L�����|��2��p���V6�5�5dZ['�au@��` �N3�y���5b^.����vo�����D�y��}�vpG����
Ie�l�8.�%�����7��6<��B�2�eE���ָO�@�� L�	YY���F(TJ�k����r$��%di�ל=� �˞4�S�%�q���5sG[��x�}Z��-ѷd�D�0&E�hkB��P�kjǸȋ��AK���#MV��� ��*;���1Y�9��0qw���cc���G�@u����L�>�Y9� �ǍJ��%�l:���.�K�F2l�֗�����TC��i�=���t���@��E%d%�����8�K�.�u�r����[�8�t]9i������ή��U�j�N����(e���\�G)�D*٢�h�n���.6m	i Z�,!b��r~�9d!P���zE��Ae=�'){�����������H�<m"����p��Zs���c��J�����:m��;��h�厃� u�.�+/�Ĳ�tM��d�4�%)�/G(<��������`.��c�*z��{�bg�`�lV�V�J�eaԟY�⃤�I�z��W���{���B���SU�l�vé�����P���6���f9Z� �\�W���9�6֭Y��3�H)���C�����_����{�GqOr���oNq i���� Q��� `&EE���ʲ�c9^���U^��l��.]�h��H���lp?�츫vf�H�M#U���ݱ���־��ل�F1�8w�<�[�6C�B2���S�?0#Th`���N�!'I7q?�@F=�ϧ�2]�^p�so��0�m��0o�D���?@"T+�G�940U웏������j^r��5�����}ÿթ����c��T;}���l��p��O@�)�E�)��F���[UBߗ쀂�.2���� �-�sQ.�w�����BN�a�Y��T����Xʦ{8Bg�Q6�vz+�����f�@H�2�&�#�t@Q>:V��Y®N`_:�ߐ;�/���.勹��^��馜mu�Sa��7͔2ǎF�&��B����*@����q��LJL]�v���6�0<�F6o;kC�G�J[|�nD��40<���QZ�DE θ�N�;㚢���_ﲾx\K�JK�ޚ���@��h>��Pua�G    ���a�Zfi����S�!�Q<����+Z�j�O�Aҧ�A	[��2�]Z�[)�I+�Q���^���H�@tR�R�nD/��ƅT��&�o7��3I
�c��l�X�Βk2y{t�����_�×w�r��ryS'�$�QX���;�.�1D��Q��"��BD���
Б��H����X1A{f]}'�e	���/PB��>ޡD�/ygߊ�Y��%ن-�VD5�]��j�Ϊ��;��E�JG�D��}
A{�G�!�R�ŭ��Tݽ�a�+����˯�-'��	B���éaqk�.���^_Re����H�",դHG��.�����t܋>�J��`ˈ�=A4ng﷬h!��Wx{����1w��)R����%4�$�j2�aI�*0�Z�$����	���.b�[�Z�/� l�ӻ3�pa,�v����f��f�`k3�8�)�~�`�;�h�*�K �%Mk�
8�% �q]�vb^���|av��N;���@�2��Е�q'>�n�x%#�A�50 b�hg��;P��y�hO�����˸�uo��1�r�
�<%�+02�M-.��q�W.%Q�5b���hN!U*%�֧E����Geo"L���F��H�u����~�6uvFH:�W�+�#*�,�e6�:h��/�I�K��VB�űG�<��uCyGC���-�O�{?�O��y�~�9��_r67��������M��#4��Qfo��� �O׮CuǙ�\3{9�����gJ��\�N�^j�@���T��%�ӭ��ye�8[�@ԉ��f"�?\���n��D��Eep�_�M���cV�a����ޅwR�s�����! ��A!�X/���hmF- ���&��yO2��%@mg�q5�ꫢnI�I�X����+F�����ct����%؟	HH�ͺ{ݡO3b~����BE����Mv��֥��a
,�bo^.)]���+���1@�'���|de�I�58S@�ͱf�jz%�����q����E^f���چRx俵	���n恓!�(
A�6SOS2�{�i%���~t^#T73$Z��������%FLk]���)����R����:�
o�t���3�g��iKJ���fhho��!�*v�V<b1H������� b@���,XY8�*݌�Tmh���,�Σ		`��4e!�P_�����в���(r�>��/�}�8^+��k_��زl�%p�u�Y�+�6X���Mb��4��� 3Z��IJ%�ձ����9e'�QY�$�D?����x[�|�P.qKh]2�,t���骬��^W�jȏ�����t˵��Hnq܄HWs�j����i�`�L£��F^�������h���LUph�%�:@�j�U�!P�~	�N!��腅�3��ߩ��ay?���nP!2���5���֫��zRx��%cW$�>�ș��0��ami�)�3����S��L3׺���y:���z�ˡv5
p��-�������N��Y��������T7q������J�K�x��-O��7��<>J�$g~?���z3ȸ=�G��[�p��������o�]�\�pU��(�2����q_�nJ��i�R%�����V�]���|}r['��'OԘ�A�J��m톻h.ق:��,�Mױ*"�[�38��̣�G�c�&�RB!о�ί���Rڜ �J��=(F5{����\?Y
ڲ9t�����Z����c],(e)V_��5�2TJ����G�����#)v\���掙@&�=��M���Y]��B\ft��C��d[�=���0���P��)��	���/{J�x9ʲ��o��;���{��7���\;}�RS3�G�!����BG�/K��oĸ�R���"UZ�8(:w#F졛����HG��"Xԝ��1U&GDH���� �]�w �y�\������-.lQ�/}�s�w_�M�O5&(�4}2���}�I�A���,<�?un�d}�K�C��u������������2��jXV�و��WI���`-�I��q�I��q ~1� ��kJ&u�۪��uX����t/�F8����yľ������O�@L�a����{��Uh-�Y�5 "���Y�H��u�X�v����	L�3�.��rsg%h|� ^Fv��_���,�$s�j�l!���n���0��9�>2<�.�XÓ$�m��}Ss�0{�A,����_hTS��'X�m�v�*i�B���m�l���H�)@��b^��
��n:�9a��7	�|�&Ȣ[a��av��ET�őM[b�HJe�Hl�ae6�Z�4[��\7Ŕb�ڀ&K��c�5�+�M������?��}9�BlB��ϙ̌����7��Ey8N��7�"����/�3�A��$������(6S��>l��^�Ī�>m7L�b�t�����i��T�i��0�0T��%��j��9�!�/F�Q�I�����D�l,�4}ѥN��j�4J�0�+C���X�n��l�rJy���H.Cת����=t�3{s�,8�IN:Q!�@l�K�l(�q#�� ��5]��;o���(`8�*>r�1���;Y�쫹^-�����uTeH��C,<D�8uA�d���C�#�����_��y�I�'I^,���0�h����B	[�(���bOx�v���Lr;��"����4P�/@G0�*8��y5�����W�V-��?�ܻG�&*<T�	�������v��2w��@�w��F[a�&L��+0�?C������A�B1@�8��,P��0&�u�fPh�����f�_������t=���?HK��.7��̬�S�,��tӫ�U�x]�JX)9	���d��\��{'�_��朘DP�sB�δ;��B�e�J����㊘y>�3�sպ�ȋ�犯v]\u�&�*Jz�I��k�ދ�q�jAcYɨ��;�Y'�&�.Z��a8ΉF�q������yK=^}~%���vuF�c�4SÙ���#�ڴ���`�����~:�(�9)"��:&ט��[j���:t:�z,�+2m���	:����ay�"���;A�v�P]S^��~����mK�T+�A%�ҥ�zT�m@x�X�9�kK�yյ����,�A�7V�J`�
ʊ}�v�\Tc1Q�db�Y����2?������E�8L�ЄO���Pe�v:�/kG�p~9��L��Uxc���
t���v�6�(b�߱[�tX�l �c�+4#[�L:|�s5X�o� �N^
�w���O�\�d�3�e������؏�,�~F�����q��Kj60�`m��`?��˴D�n�aK�t�l�q�u>��p<�w�2x/���)�ßZ��8����`�L7�V_ qC���q���
07U��nڝOO��g2�`0Rդ�G����w
K�����Kإ��=�]�}x�� �N3���=_<6:�܁2��&.=V&�� 򴮀q��J�$�2�L���ԕ?=;ҡܤ�A�X+<T�J�n�ҕl�
̎Q!Z�6X����������)O����&��������O��P=����ūf���Z��y먖B�@)
�YeI��Sp�7�@m�@�s�rs9�뗡� c"���{�hUbR:4���eCK���sx�[����]�rO�+`�B�q�����_�(�C��	�f!E)���n�ՠR�upI��K�ٳR���cnŏ������=!�����3�$U�ܽ�t淫 V*T�I:HJm���C�ԕ�ΑR�L�P�&2��Ԣ�*ŉ��>|K��{Tr�j��<|�{#�-g�s���^�usY2�4)�_ �6�/N�mJ�j��!Ԣq���:�!���kv[�7�ƶv�|�^�IkhA:浕��n>����k � ���+�j�9k%X���ة�ȵ�x�w�=�7յC>���&SNj�!"����`��@�@�Cy����jڽG� e��f�� �)�H8-�gS��_��O_���V5m��g�����A    k:�R�~{k�\,A|P!�ǜ��4b���s�ڿ�j���1!o���������_���� ���z;��p��|�-F�p�]�
��y�oeq;F^��&�i�`HY��.�x.���F9�w����zja��VV&�SA!X�
RL]9R
5� �!!��akо����Vl����{�75�Zv�)68QI%��m��8��a�:�o�W~(�'�kQ��^�]�v����z�=lA=��v\��q�:R�dA�D'�;�y7)*7 ����G�հ�p��Cd�`t'졟�Ѹ�ۊ)3���9�-ō�4 �9Q耪����r�t�p+4 �����Л�9���aS��m��<�.#tAE�A�br{��h"���9㪤�K�]p�_�kɹ�FeKǡݐ!�J�BZ��@�ڛ!�.�Jq��iV>�[��7ϽYt��@
�ĝ�?7C���������*w���|�"�e�P����N�Q\�[���F7��)憒5�&~���#��Kȉ���"��L�L�.p{P�g-�Lp�VBZ��QZ�-8&���2�ie���W5i�����Zs���������~z��ۡ(3Eb �-&9��;��"(����B���\	��*�y���>��ӫt=�l�<J2�����M�1�i�jˆ4�Њ�J�F߃����K/b,��$-��Ҏ�����hMX���fN��!׫��#�Ĳ<?���'w�5~%[��	�;�
�)�^���p�Q��:3�jM�NɗL3,�M!���	��T{�3b�rZq�@��%�x���
������ܓ^!ft��0�e5��4�����uߋ���
$��9<<�М�B���;&��H������m�&�0�c��<&S��{��0�.���N<���V����Ry�5�F�����P0�~[ !���Z�a���fEM~�o�ïԒ,�i��N�&�S��(L��]&�-��A��
34Pf馞���_�i�a�O�<~?��oo�>�
�O@��+B������$���
�'�>8I��WN��t���P����K�)�{+��";�;���f�8Q2���'4}_�{�I d̰��Hד�}V��>�X���U��{���$摳���=/ϸaJ��o'�!��c�Kl:�9S���R���n��� ���"�M�*��HQ@"���k:΂�ө��{:�+�&ۏ���R�
e$����΍�]�<�2;��E��!}#��x�![;0�5����Ճ]��4-��*�H9�f �5*�-��Z,N������Vz���n��ͥ6��\�hݵ��e�䑻��Q��P��ǁBC䲞�[gJ�5
S����C��e������ת��v�����`��'ÙMfO�j���&vdckqM�Y��,�Z�,V�˞Y:vF��M'd�FN�ș��D+�`��1v�&XP<hc�$-�OY�4�v�܊w���V��f��(IN��,Qz>�_Jt=��u$^�y�e���2�*z�����C��v��SG	2�p����+-�{Ђ���[��F��;{:��%�j�קb��#/��&[�B��j�n~G�Clc&3�P_	��w)r�h��њ��&�m�J���%�l.�W��1������M��q�ӓC#3��q�u����E����7b�PN��OۤP�W��]�U�������k����`.F��<�^H�x�׎��眂9@MF��M*)[� C����(�[e�
�M}h�6�������v��ch�w�E�?8�*MG�gQ��uᦰ���,Id�ؓ%*ɲ9B����1(X�wI�nW_����\$���"�_&e�^���M1L7�� ՝���\����3����sGC)h���C�qh.���=U�v�}���z �Ӯ����0X(��t���� ��F5��[[�� 1�ˢcH$���D���� �U� ��T浨���H�u��&��0jx�PLȍ�F+�'}+��ѓRܘ�3��҄�8/�[��4�g)em����2���yv��v_�F˧�t��3�dOoϸ7�����[<0�r[$�F���L9��)�b,�ee�t����o�B���D��q*f��-����|ß"�n;gZ�ʼB7�d��� ��SB���V��"zJvD�B�1�����`�	�Fn�ݐ��|+��sM�v�{�Y�;d�k����׿'U:���|�z��Z�X`w�:b8MY��V3jY J�5,@廭�^"e)��5l��7b�7�9���%�|;t#��A���DU�P9^�E]�~ݗ����U��XP���j'@f��^pK�=t�\�	o�ϝ��[�rH��Q�Rs�]���� ��
k)�!�� G~��D��: �l�3�Z�\`9�bGX�Oi��fɋY�w���ϧ���v����\G~<d��-[ �����5pN�ɫՠ�bn�W�X��~��b��2�¯$��L�2�bͫ�Ȕ.k�F*�{*3�Հ�q�ѣ�mtH�w�*�Yr�+�BKT���*�N/Wn8�;� ��X���ՠ*����k2�T�uA�����F�.z@�n@O1��<�;�@�R9��t��������(�+�t�q�i�q"�slz%�M��˞�H�q��%�cK&Inq�
I��Z#�,+��uf�� P;.*>�1y������PUٚy:�*ne�d����"h����Q��n��-�)�CB*I��E1��@׶�~-��?@�Hh�V���j��G�x`��d�FnU�����u��!�p%����;\�?auy,�u�}�NQ$.�_���w=��m7��.6-�	X8����$��wE�ـ�m�����e����7[Pl]����<����I`	�ï7�.=w��1���iɾ���3%Q�82�b "ƒ��:t��S,wP�he�V��e5��Pܺ�C���ὔ�-e��U��u:�A�$�\���b��������L�{���O����X�1h��r����6^�5mLͰ�m��"{ϵw�+F�4���0
@�;h�n�:���P@�Zz��s�mqbTvp���n@͚���t�S`ʢeK�8�Pӊ�G�r'�7 ~HY�#ٯ|p_�L���d����+�đ�[\�@�K����|_�i�n��c���*���>�~3���θ#w?����H�|z�Tk����r��˘��4��Yѡ�n�Z�T�#�kR{��[�ɦ����06��~te}�iKe��p�W)��;��7���q����v"�6b�+GO���A=�9��V����~��rM"w�Z�kw�����G�kn���@���,�;�vj�t~Ƽ"T�j�a�54�ECڶtA���mi���ݺ ��(+^��M ���<vA����f^���������ʵ�*n<�ۋē?V쳊mu�6��b��}bld��E�n��P���s��%����x�9�,cp�zpJ][ʗ��خ�/y�U�gd�E���u��H��,MYJ�% �� �>��ߩu�lMx�`)^��<_~��bK�<�@mT7,%Q.��A����L��J�-��ۏB�\�������*|�x{?���+�̦5���)l��W�hKHl�i�R��&��\"��JKB�g���GJyGI~�l������W �L��jS'0�,������Φ��m2)d#u��������v����䞱Φ�x�*�x�,�p>�_���;��������E7�F--vl�'����Z4�O���]h����(p�:�3����:+ ��RN�-p|�p��t��g	4F�(u.7�P�"˂�We��$�4E[�� ��� y�7�:�iA���p��j�U+]��81~�Лg���X%_��J�r����+.c5�n�>��Tt�$֏rܹ���
Qk-?QbN�e�}q%�'m�
�A+�o\�0�<�����#������N8�x�4��W3×A���
�03�cv�Z    ��2`��(E��L�,���oW���v�m0��|1�y'�4kQC<6@����y?����=�7���'E�h�PV��.��DD�o�&��`�-�>_>��3N�`�<S��d�({�.�VFLC��q>��QZ ����g��N�w��ȹKN�U��G��z����S,�O�����m�[m J��8�%���Y�2��k�R�*�P�Y���/�c��&�Ӥu���tyKfj#I\�*�[s��nd&���|�-��C�I̬|�1����⇪1�H1�9�'����V|�5L�O�*
|�v���<�Cۙ���njm�&KЮ��Cќ��5Zc���lC2H�B�b�}��T�_����/��ϫ��&^�𹭢M����^9ۙa';�=����BL�]20�$\D�+�Q��4�X���@UZ�;X���;|�6@ê�;j�R�[��z$����(��-�$�{�L����܁N�� �6��0��N��5�����Lm�gx>�&�i%�"c�"��Vǂb+�Hٯg/��b!��Y��*;[���G:E�M�s�=q@��K֎���uSG|��v�fq��9 �o�|IR}+ڔ>?��Z%�IW��(4x���`hy�x*��mg�P������;��C9�ndQl�Ҥ����a��P�F��� K�
0NxZ�b�Yv}�g���7�a���,]���7�r�VSI	h�oM�HU��%O��`�Ό���DIb��@�[��������*t:8���p��S���}��|IN���󞎛�	}��`L�ٺB�(��Q�bX������L$��zi�=Q�Ŋ 'Bg ��t¤�g4�OV�y9����p>�<]��Y� ��G[X�Q �4	6��	�ge�}#�pIr���f�8j&����9j��}�����6�_�/�
�K��?J���{b�n�y�B)��V���ć��b�)s	�9\���y��N�Ƕ.7lF�GL��y��l��)p[@�b���������qv�;�p'�E�`zJ�h�PM,���O,a��ˬ)�+v:)�JW}U��4]���P��u�$���|��_�;�\��0Y4��i� ʚRX:��#K�ѻWG�N�#�S��f�P�7V�Q��:S�:zQeV�n���)s�2x�	�e�l�O�p5'O�ۜ<^n��m ���������O��Ȣϧ���=H#�*��"NA���
c����NO~A��*\ � ���ֱxEUZ��oa���]��RT~�SL��pJ8�K�ٝ����g��5���I�`�`�˼e��#�����Rt� �t�A���i��ޙ2B�e#��)X�'�ü�÷@X0�u��t��h�"7�;����v�?{��h�fۚ3����
l~��^/O�R�Y�¡p���[آ���C�,����kۈ����z�z)g	d��囘�PǗ�+zϙ��t8]F��\��� '�J���泸;��9�j��F��%V�
p˭- n�ߨi1v��d�-h4�;�lق���|mP��,�djrk-�h��LA�����x�$\��_
�'��t�~���쵐 ���m5)�X)��X�-΅>�zK3�i�$q<���2�D�Z]v��=.��ˠ� ���|a����sI�;�5���T��3���F��M�eEm�e�9
����piM���J��$�m]��un5�ohR�������v8��:V�5m�G��&�o���pS^���w�P��v�B}��둰�\ƌ��_���1�������uS��Re�|�,����DN�s��Ʉea(`�X��6��CMP�)���k�#�60�8����iT
�$��Tm�BT�H��v`s�v4�u�BAˡ$�@�E!M��6���Z�r1'��ч�.-L#�~yi�ʨ �Q�K�J�7*�l=���E��&ie��@A�rɔ�t�Qc�kLM�2�����u�ȕL`w���mt�W��������wb���$|ve�AP�g��#�P�aR!�F�Rn�g�x(�4��!lш�G�;Yx���ة0�MM���_O�%\x5��LҞ�z�����nf��ԷbS72u!>o�]8��S0�_�'�dp藗�Ǭ� h��O�1%��
΁s�5� xx�c`��%����?�v��(�榬�ǵ�;6�N��f��o,���t*�{H��E�Jh&�?�㎎��%�l�s�6Yu"%K]���5�*�����_����MPo���f��eN!���N�ݫnF�A��in��N�@1�*��+�ﾯN?��a�"z���TAde�@��E⨩�j�]�+��T|XN��cvUW�j�g���e]���!�(�u|���n�-;�;yz+9n�����X��i0�H����1��A��΁t�+�-���Rt��f���f�_�3]��oq��ÊN��#�0�6R+�D:R.��]�ɰEz22I�P��%\��o�"��$���2�S�dů�����e	�-hA&�����F�Rd����1��32�-�g�E��7��FD�<���k�\qB�5#�=fR%�r�Z��: ��Տ?����~}�1N�>���ؗ0�$�+3:+�T1�Б���v�p��~CR����}�*Ý��T,s�.�y���ʎI"�@�$�H�_tƇ4�/e�(?�p�z���P��ZW(O��_��?^�/�˔(F!)��s���_�;�l��p��~�$�6�� 	8����ߝ�r�CpE��h���(������j�dN�J�O1����Ѡ�l�༮{&弁Oڈ*h���b��c`���vIu԰��K��.�|Uz��7��ze"��N�l��*1P�&��`�w�$2��	�h��s��ou0.�z I�S>�*h�=2Y���+[*,�5�R "����߭�1�	a̢�4ɹSG�pB��N3�H{׆��s���^�MN���[�+�95&�#����O-dS�kP�W�ì)e	���I��	��xT͉��� ��nJ��r;q��T	-����B�UP�˫�5��C������LWK�Q�`k�6�v����j�7���LS������_��^~R�������~��YF�DXg�G]~`§F�E������,�gmQQT��dF��H��]\������1�~v%B,��b�%�����5�Ѩ���ХN'P�?i���±N�@� 'b?��%����=���)k *�z)uh�a����8��5wlPlhl��x�oBd��M8g5(A{:��@2��7�aH�����nq��yg���hj�;�V�ҮH�o��L�Ʌ/o�m�ǝw��&��߹}邹l�Q^M�!/$���E�i\�S૮��.��bw����&Wەw���U��h�ޞN/���m���}	�bDUH�P�bUi�3�J�QG�>�|&l��V�[�j�9�\�&�Z����~wس�[����\�,}^�x�G��U�M����dH��>���&1����< �`�Nc������I�sV����0�%��y@Xr�� ��j�^��u�ו��x�����|��4�/�H����j\��U�r!�.u�V,"`��Xg�)}�ЕJfr�1���&@�+���_D�"���j���a���[@�q��a�
$.=�!�����-�=U �hz�^@4���ث )�v6Ъ)���N����<2��ǸC��ML���C�볢�κۑ��v�O��,b�i��Γ4@@�=���
�����U]�O���0)�Aلʸd���mؚ�o��^_���pȫݑ�V)ko����g�}�ԉ��Z�Z�y��Q�d4�H���Rc��+��	�Z���8�I��k�tX�s#M� �]g�@f����.�;�$��XL��l�JUt��9x�����~��]뺸7	W�4�T�j����������J�e��j�ی�FqS�����(K�j�����։u�OK�hZ&���$l������W����akZ��[P�N�a��_}aZo���!�n�� ���;Q����A$�ش��x �"��

�u��X cqo    �A��S��t��ܨ��j�V�|�G�<ڲ;���;���1i��6<��Ww�xȾ�q����w8�~�8��/������y�E_;���K��U�V:��<*�v�OP��Z���!�� IT1�(#J�e�Z&*q#^����
^Ң�T�7P�s�L-��^j��>��6�%c�+`�F���&NP^�HΦ�@�$�S7M6Zp�:-����_e�v�V)r�yp����H��P�7���y��5˻C3�.$I^�<�w;��ǽ�ҝ��X�pZ�&E�������P"t�6���P��h����@�S��Scw�)����z%����Z6ř�A*�x�X����3�P�q*䎐���E{D�6c��}ܹ2@�Â/@@��I�!�t˾;�P4̋�����K/��6���R�(��^�n]6E��l���BO�~#ɨSE�7�.�������/�ppᐷe�+���T�?��Ҭ�����&��a�'N��c��&t���w�B�M�~7J��Q����C½�u�$�<7E�`4����M� \i�����O���8m@$�H	z�>B�}c��������rz�~����ߴ�WA��m$�7 �6M ^�����C ���igL~��7�Fj�X�xQ�[=(�o�D*�z��(��O,�a����!ǝ����+Ʈh��(��Q�NY߀J��<\��iU���_AQ5:�Ei[~h4��0a��{�2|� ��-����C��k|��n`�����P�q��H��_�C!���tU�|�E0l�<wA�N�-��� Mz0�5�{�6�˝wˤւ��o��@�X��^�
0Dn	��N.�j�?�<�����<q-kd{���F/�5��O=�:����e���� �к�A�)�gw�v���Ey'qB��ұ^�vZ{���������Mb�&4T�x`�3�F[M��u�=p��VaJ����GB�;[��$ݵ������E�"�s�w#��*��>�����x��N���xxe�B����T*��Šբ�0Lw&`X��l�U�o�4�F��A�&�j�m�@8�l�~���V�@9����p:TF� �5 Xțb�����NS��?$�n ʤ�V�~
�q��2צ�QX�e%�3�[�_FFo�Oo��ӥ�ZJ�}�Y@ᾀ�¤�7����a񇴑k��p�7�i��GX�HF�Pe,��1h|��J��[���a����tL}3v����59W�]�U-k6�@�E�X�0 �n�5S��kY��+3FF�o��Ky�-���
<.mk#�MF�kګ�.c�����D�r�+�d���JG�	��a@кrah$(g�,C�A��I�4�1"��t(w��������ȖP�\��`�
�G����_")a�uʨ �`�5�q1����r �oP��Pe��1H��An��=e��wz~�Yʜ�"�ə�`˖�Q�_8��B��b2�S��VaH<R���
a���n�����C�"5 0z|9�k��U����[������dW�V�vE1��@�n���L��6\7"j� m&8��SwQ�qV8������_�w6���r�a�__��
��8���{6�St��^SIP6����Ìm��)�G^��H�"F�[`iP]��g� ����������y��g�ϧ��۩8k=�<�hk�
�����16Sh E5����3�\&C�T)	U*�R�cu� ~@¬��ey
?�5H�R(�R���P�oݼ����6i��5�$l��PW��[�l�Q�ҫ����Oe��\t�&m8�̛L=Tp��+�o�kZ�L�u�#��(�ђ�C�����\�%w��\��#]���R���A���"�[�G��ے��/۪������d��`�D��8F�ga�A��k�İ|{s<�(�%`ʪ����p������\�p8i���lP�q���lF9Dmq߆�$�+W�܎�ă��V{8�SJ�Đg��v��)Y�F:v�*�E�P�h���f�G�uu�jc��m�ƅ�C�UV������}8e&m������N_۞E�����Q��N�ө`YS�J.��~_���?,+��΢�4���j|(�f��ejK)�F�8NO�p[��H��x2�ǰ��g���va���cI�V��c�e&P>�Dw+��}]kT��U<�E���z80�b�E��K����9.׺NO��R�ԁ���U��?��&���\PU�1ä:�Nå	��I�d���.����X����r�q����%sn�H@7��<����=\�N/�U�4�+����4_��,��wB��>2�6�Hm�W�za�?��S1�%�z�-��K~K�1GV�x��e�8�tPAQE;�t�!td\�ٝ�;K���"�3��UW��ŭ�&�R;�av�����l�2��kg��D$�oG�
Ƕ ��Ϩ9�>.����
�|����������u��
�o<�or^p*�w}��� �,��5up�RB�N���Q��o���J���7�dTn�nk��Цu`G�E��u���������ZÐG$\f������\��h�}G�L�K�x�	��m�#ݝ L�7T����K8W5��#e�X�����"ɽ-R����e9�%�_/������ǩ�aFrPaW�(����vx�# %�]���-��X6�����vѦZ��}7U�Α�D����WUi��Eh��*.��^u��r�F�11,�x^����(��k9�	�A3P�]�W����Q�°/��0�m�`s¼�j٧h ����B¢׶u��Aq2�n���Ӗ�Lb}�k�f�ף�� �I�A�ʧ���HsAك�S�QB2��*�Dq����V��5�l�����~:'���TH��&p��p�}��p��pf�(i���B���x!�O/�
�	*�e]8�D|����m%h�$fB�ST�]!�!֍���������!���rȷ#��"��B�5A�|[\�ζIb>n����V�A���]�XPx/T���D	��"��7�����#ʤ|�����~�i��҃׸��VT7M�I�Ч3��"�6�іK���e%��ݘk�5,Q����(@e|�� 	��IE��/��uRFR����u>	D!eIo7�(�E`�PA�uV�a�s[E�}D�B�ݺߏ�͛E��b��IrK̘����L�vb)J���rRGh�����I���+�Z���Buu\�h�gfʖ��<�(�7�p��.�&���	�}}��`�X(�L ��� "}��У�eO�U����+혱����t|��>�N��m̈)���ܶ2*1c�|R��G$J�N^'�s�~l�U)LT[v�_�^9j̣�uy�d��k��LZg��H6��>�5����܍���L���f���G����J����6����Vwm�?�F����?��^Ef_�X�YC$-�� �0��O 3��.0X�R�ayu�w\SpO^�� ���!ߦ���t�Sm@R�)Ń��׭��b���>�<����ug{�el5� �(SW=���;�3�?�߾%�Вan�r�)�w�^Z��F1N��v�Yv�JhdQZ�������b �-�t ���遶B�5v�,O��Sxk�г�#
�N4	��j2��X�( p�#یBh�כ�QF��=�bʴ��خ8��� Nז햒N5p4�F�b��z���H��~�P���`�����*y��Tj�����N9�2t��&ߢ�|�@w)�.����Ri���ƑH4�4��ͩ�2o^sϊ���`-̦�~3B��J2��ޮ�j�&�fco����)�W���P�@�N��+t�m�L,\:��
����XJw�q`) l =�Y���?VR�BI]���l=ϝ�i؉c���i��i��6�SY�Bq�	A�	D�[��~Uf��X���\� \��yM�Y�    M魺��P�ͻ�sǏ�����rF�D�N�B<�K��j#�q��W�_��u�VBGʯY��n��.vP�ۇ_+vo��;&8�����<��K__ȰY;�?۟�D��ec��̀�Q�KF��4�E��"usC��W�����WK�}c�I����^���;���x�s��.6�s1b)]�Dm���+�qC[N,X�n։>>��r���� �������1;���7i齝��/�U��������'Q��А���>�;�R-�;L|�@���	���b-ٍ����-�5$0o}�C���q�D������{X���<�*�z��l�O8f�w]E]C�G[z} �˓�{@�R�a{m{���f'���Y۸���kT!d���d[�#/7�P�s�ܓ�����;��4�Bgx�gm���A���N���e-V��(�M�D���t�NX�d;�T�*fi�e!cb��/��$?�.���o���Ц��+�|y���F%E��<_>��oe;�G��h��?UߡT||��AJK}ˎ�C	��~�]��3�y\��:����Q/��U`��h��L��I������C�\[��؃iv��W^�
�]�]��m�Q�?�� n]8� ��Q�uTЫ��|�9O�̽D��1�|[&a/��
&��<��2t�Q��=�tc���,�s Ym0M�&�T�J1�~"LW�]s����[1!Y�cڹ���W�p�騥ʧ=;�͆��mj_"%�s��˖t��6%�J�-�N;��>mՈpO�Mqz�Uڲ �����G�7̕��\���y0ۛx� �&V���8��X�[3H��bl�zaJ�7g�b�o`�i��[�Q�7�m����i1�@   7F���|���G�˝Æo����p9�P����T�&����nb+�K��y�8��7u0�nay�n�!}Lb?NQ���?R��i�+q����n�7�]"�Ν!�1bҼ�7 �� Z=&��^ dT�����u]-)S7�����V��A�0˰sf����Oz�C�*Ho��|'#aS{6�F����7��}黭!ӈ˖��-N�	N��磲K�J�l'�j�����5c��~�hƅ�R.�+�L�X�i(��:�&�!uRK�	c-'CGd]���v ����S�k!�Ƙ���!�B,t�<��f����-����o�g����uK*�eB���e��3�g9��Z����10/���c(Q�57�~Xnz���k������@�k��6���s��D�u��d����dQ}����L��ёTX�>�׈{��h�/õ�����l&Z���.��6d�'���s㮗��H'�X��A]MÍ��.�Qt��B&�4$�;2�]r��)�h3�X�A�`˺ �b)���l�n[a>�ȳ&���l`�[M�x�}��1�^d{f�g��؇N�ʌ�P[R�"�p�}YZa����@��=���"��5�]��4�T������0G0��8��pL���d��(p��6��l����q~�A2iȝϧ�u��M�W�b��d� �/�|zA�0�B�0dn�~%����ܵMR5wyK(�Ӱ�*;�^��̗
,����M�-���8�Lֲ��i:�A����j���������Bh��ء��A���pP������u����4���RQWbB`a�9c��:���5fzIn������2w�S:�N��MwǬ��;����nN�6�e�'�Z��QQ�-nL�"g�cO�4��((�+�Zl%�3;l��է�����R�Z{#,��HG��o�֡�V�jȽN0�Pyk�M�ɍ[ ��wf�z�1�T`��@5��Г�f<t�Z8��P�-&�ݲ+Մ�H��ۢ��bQ��4h3҆'�Э���[�*;S>�Xj�R���ڢ�Bo3w"!�Y��8!�]�i�^:U�w�t�3�y��`�;&�L��i��sl�l!<�WJZ#hR؟)k����ߵи�����A ���qٮ����ᛢ��1B���lOA4j �{�����.��u^d�#�~��@��Ȣ�����l�Jr	R�2��B��%4�';V��%�M�B�`ug�����~j�2�/͇`s����
	ڙ0f�x�lHMUсq���j�kt���Nu�Hr�׀�Ƣ�Cj�[���>K/m��t�=�q��(��%]��p2�OX���{�V3�-�Jm�1z�
�1���FW���'��,O|����P�L{V��lq5� ������R�R�KY6g�xi=Y' ��NI�@�9�uY(������]	R_a�N_�8���Е��9G�5��A����M��DOAy@��i4.|L�����fX[�q[?�月�y6ǯ?��箂v�]��n@*�}~�X�r��w4�0<i�������W�]���m�1���
���x�D|f��\�)P4s�e���^zJ�ۉ�d�fj���E"�z�*5]X�#�:�\��F��@���.hh1��Ih�Ԓ�u�m���kv&�>��'���Ҳᬵ�Ջ��!�0mð�����c`4.འ��vz>����҃6���C�[t�`{�Ɛ�l���m�0�tN�P9$�2�5��ʌɬK���8�k��WZ�����k�8л���<̃�Q�S��f�����pL�M@��n��ѣ[:+'���eMZ�0��r'���߾���B��f�O�������t�WV�����%覜t-��gh�� �;���Zh}8�G�ɨab�J��+L�E�Fyp;�V����U�|��$w�9�����R�����g*FBR��Z�1��;�`
�	J��Cm��˷c,-�ђ�s���u8�ހ"��,X"�N˙v�5���)�l7�1݈7��^�W�{ bРрq��+����;��<�l|-����[^�����J�ѓ��)rII�M��b��b���}[{�4�⭁r��� ~ӋO�׋Ej6_ۯ��mۇ��tM|��ًL���F4����m��^�^� ��(rE/��'V�-)�UC���H����̫�l0P���@9^o��n�Z-�r�W�����#%��Q�B��g
����/ 4�O]o��r�-�D�i.�`u����q��R�D&}���e��2��е��H)�wtW�@�ֱF�m̥߭��������1��W��JM(ұvo��dV>ڪ���nQ�
$Z�Tj-X�{y��R���R�2P_���z}+�;��lv�ut�뗤@V�0�sT�����j�c[:���d�h�q4f".I�<�5�
=����g�<����s�:��<���_� kv�mpu��G#_~}�~jT{ �p��P��y�wLi'�u��.7�>�Z�g��}�5�I��v�M+C�1�ɔ1_S3ߡw�8}���J������kћ�F+�v�£���nQ�!+B�P㖮��Z+��ulc� +L+���	Ӯ���GB{�SG��r�zl������.�ÿ|�Q�ѦB�{WUc�k�;��D8���%���Pi��S�z�{��}�>}����n�h�hE�v*���7
��6ֳM�5xj�4��P�x�Q�hjnE�NhT�p?2��`�ѥ��)������a�)�^���:��,��\�F���R��@����|$�ꢯ��џ�&�]� -����<� )v0s��Jxo����4�#���i=P є8������=��َ���P|;O�.��ƙ`
�)�n�Yz�:�xp��b�g����=ZKI=��t0\�ҵ�lù�hZ�:�(��o�x��/�,�d�qR�
���-'�Y����O�X�N�*:({�n z�*���b���M�Z�!�4҇L5}gSE�dU�;�7I�x�ڌ���(�n�(逇A!nܠ�{�m@�[�"�0��`qn�/n�/���Y���te@$T+�^ߩ��3f�JvrQ���d�Uq�]�06���]�]�1�Ӝ���^��"<��(���h���$AV��+��=.�F�cP1|�TJ���N]jiJ�e    �u�5q��A�n˗/�N	t�A[À������o�� ��$H���W,鎚30ǟ�Cw���/�kU:���)�����1k=�h�K�c�B�Ԛ�?�����<f��w�"�p҄�үeKlmd���-�Y�Z����#]`�4�*���~�B�w|{?�G�DP�t`߶t�E0A��53e�����I�r�J$*v7e%�9��Pr[�i�pXڟ��q��D̫y�w�m]��5�{UH)E*tf�0�O%*z���@Н���y��~C5GY~;̌�6�1S�9�xy'E3�~�hQ���Z����[��_'z�0|!�[$�*��y�/y|c�ᵨ�/��7�oZ���?x9^�Ks�_����lP����6BX:f,	�J�1Я��1֗��@
|Ja�OYR����-B�w�ۜP\{
o���I(Q���(vA�&��� Y/^\�:�T|G��±���,�5Ƌe)n�#ʹ���ݺT;�1n�����
A�o��/������
�+�m[6j���P<[}jл�N�Of�dJ E 	�f,?�~~F��Ā]�cNh���Q����o$__�>`v��υQ��ܘP
��b�H_aMy��QЋ�q�5���*���!ݺ!r�N 6��ĭ;�F�[z���1,>P�ȸ�eL��t��Bi�{�v��ء������5H`R��h�O{3˦ Q���t�t���jN')#%>=]��{hV�*�ؠ�+ �(�Z`��>GnZ�u��\��-�=&1T�CfSp��o���j�U���v��F��i�Y%?w�<1R�f������C접iCo
r9,jY�驀�����}T��jk�M�cs�6+S;׎�3t<������o�׷K�m�/�²dA�h�����/�}�@+k���>?d�^��n����O_ٌ�%j����}n��\o�S��J��Ӊ
���سA2��z�@'z�1�F#��V0��f�jC�7Q�8�,���U��������7Y�$ɶ��x_�eoD�a�x <���De�p����(l��o��=Wm�����fVI�!#SW�z�3�u)�nU�K]����5��֏9��|x�f����쾔�� ��I�
��aҕ\=�OD�AE�LNB�C-�U���b�p�z\�k��	��#01��\��f��(������80�m�PƾT,_�:���� �	�d��30ٵ��9���1F�p�c�β�IV�-づΦ�޻1͆p��y�1���\o�$A_6�,�Pk�JDx�	r��!OE�����v:��uqW��b����r�EKSN��ց�-��3�&��\�/��X�������Y�D0�PȀ�&�T�С�h���ӻ��ku���d���H���@�p�ި �[�������DMY�S��SW��&�q�Y�NR��e���X������P��ݭE!Uvy�8 ���J�3�����rQ�;O�	w���k�q�dj��6�-QFA	T��^��D�ˁ�s'C�%v�j�w{�N�ɲ��!Ǎ"����)�R�V�٪`�ϧF�y� ����1�:�"/�˃���(��P]I���c�ڧTњ@��6���r
�j����2�t+N�M0+��x}'^���[�?n=R����m �_ٜ����v��<���2�/���o���=��RZļHw��.v�~�����$�j��k@��n ?�>>>߾�p]�N	�F�W��Z�ߣ�fA�O�p8�#b��ȫ�NB!�@]ZG��"��.Y���Pi�x�5s����͎6����}ײ���j*����	P��q��>��I�zȀ(�١������Y�;��ƶ<J]��9���6���J��f��"f����k�b~e}�w�q��F)65��bCBU�3+֐m��I׃F�Ǣ7GQ�rA��/�e�<3�	�33\C�����x~Β�?o���{�c鍥첵�j/

�1%�6���H�@��9	H�pNZ=l+�.��c��=&�j"��$x�v�� �����X�s�wX�ځJ�/xyEH?�N�*�C����F_�6~49%n�@���M�|s�L���Dˎ�Tg��R�I��,A�,����R�Jr��j�y�?  �
�W��J�P��buO�=���@!��ɗ<YPx߹A`��%�$NYZ����a4-'P8�۪��*�!�=�R������m��x�hV�k��T��$�l���Zs�bk���2�eM�rl�j�P��Ǒ��""�d��֐��Z�I|�]��w�d@�(���{����0Cs�[w�Y:袘��o�.��܄�j��
�F�ְ
0}�f�y�����U��V�.��y��|z���iR,G��^&��b[���P`��I���A�mX��hu /�9�M�m�i6��<Q�P&��M9/�|>�pk�� -��P��$� ���#f�Y�M��(�
@0I�<Q/�F��H�`�&�M��j-�������h9v��i'��]���[���-w�A�`�G�K')p굧#��P��q����i����s�\����1Z3��"!�9+t;��:�v���f��ΙI�vS]:#F���s'i��j.�Y-���:�C`y���P���:�v�a7�������]mA����8��p�P�QTV��Q�`�`�w���2�U�f��rK[��s�J��*ԭ�P#��d�ӑ��RK��;��*Q�*�,���B�
�<t������Cy�(��2��z�=�鄼/��k@\�Pؔ��C�H*�#���V���m#�Y|�Pz��lC�l�JS.��A� ,���g�-Azjd�|2i�o��@;Q�4Cw$P@�)C�,P�	�æOs_Hp�=΋������lr����n�}���2��s���4���d�F�m9&�r�B�O�	|"b9�%�.���/P����RU��2a�Q�^��� �����	-CB%�a$�PC���W�2��3���F��@�@��Y+��Z� ���^햪'#��������r�������<YY}�
Qt��:PR$��w��3,5&\�fx(vE�m�3��9������j��������	���s΅�/oޠ������z܅#�'K�z��14-�X]Ub�ۨ�k�A��: �j����D�f�*���,� -��O��VL2����!�
��d���p�~rQ��y��6X�_��Wn]2�-��g�>
�`$��Y��/���8�в���RwM`<�J�MH�6�;���f1þ��p�.����y�|Пa�����v���4�F_|�
�զ��*�ϿA����>S��-|�չ��r
6��(��^L.2��V�4P�bV�>�9��t�2b=�j��kU�?��Epgꦴ�x����bF����۠�'o��ٸ��c_Ŝ��6Q�N���:Z���(�sN����ퟌ�{��C�k���F}���]i�c�-D�^U�4�0�C)�Ķ��ZƋ�A� ��� jH#͑$+���1�a~�h��U��{cK]F��1�
�;�Ve�l��SBda���q��6/O�J���d'�=��W$jהK�v�b�itHZ�%Y� �Ŝ��5!KMQA�`ik� 35 �Z��GZC�)񗄫���Z�S��zf��+E�y_l,  �HӺ}v��\=�V��8f���� g~r'��,��.g�8*&�ր)/��3"�����v���<۟��[���o�fXR�Ra�"�_D��u�H�Y�MF�	����X^xi3��.�����'�>\�|�Ԗ�Y{�t�������X�N��:7m�:U�0	�ИjH��J��?�)2&9q����J�����xNb^(���myUy!2U;��#�*���%W��*h-����
`�J�O�omR�U�
�Z5w�/i�[o���'b_a>��<)��H9ԉ����țQ"��|\DH�w��<Yփ�b>O�T�߀D��2����h�����q�+���c<�#P1{�8|�*SVJ�Mýc���K�Jm��y����nf"�|Io>MF��������6�    ?"�v,��F;�BQ�+��|�~8?���_��$����t�1p�v���bf,��Mz��86ŌpDxWU�|���ªN���~��̕g������p�2���"E=��S��|ez�.��ܕ��7g�v��w3O�a_���i�(��>��c^�tI(Nt%��΃S8M��	Y4a	#%2<�|��=���`����cS������V5/gJ�����@���2٥�MM�_�#�`�Y��J����@,��`���i_�=�bQפz�J��X�MeU�T��
�D�J|�KRqw�ek=�4��X6�m��|�e�E]�Id/�4��N�-�֝\r��S��M�)�*P"���~���X����o��i��G�xͰV��7O:Pm�<�n4�5&����VG����� ����B4y�������� ac2�{<da�J�����}�`�{c�޷0<����UNׁq�YɮN��*x�'C��v�1���
;�F� �����hW�=��1�w4!�����z�pHu /�9]G�����b;y��_��?��Kx�\��^��7->�|dQ� �qO��?���7%f1���������ܜw�}bK���~�#�C��[���0>�����Р}��P
q�#p0��	Y��#%��c1��5��Mϵ�����T�bE��R����	\q��H��������΅��Z��v����sv��jL���Ј�A�|D�zF`�'��t�B@>�Cީy7�J�&;ҵ��ݐy9��OnY���+����|0���W춋9`0w|f��e���>t-�jKh�����S�dps}=�N�R���$DG��T��K��C
Pύ�둺%�S-�wp�"3�@�X��4W��z��qs�<�_0{�o_�^�d�U��	�*�_������m�ǌ�K��mʋAх �'h��]C�Ps�Q�D��▖�k�_z��Y}�v�M���v��Wf �%[����.T���@j���5��H�B\v�^�ն��Yx`w�q��(*k鈋CoW�
peO��Uˈ=$vz��4�����9[H�B���|Q�<aܒU���� ��#E�,zf2F�tS��.c�j��
�5�����#'�9[��W�l���@B��Z3
r��PN���hG��,J��4��{A���"�\�V6���j���X�A�WXD[���]ˈ�^���/_�3�7��Úzk:���z9�'Ǹ���F�oD�@�Mh��5<�jd���xd���,F��f�'��=?� �3�kZ��xs�#.��&�:�������}��y�K�d��ڢY
u-��R,�����L]}?�����VŨ:��BH�jX�q1c�i�����/���� �'m��������a@;5͔6��>��-�Ip3i���?*H�ol@�)�����@�>E�yL2���q��YX��z���6����n�X�z�k5ܗ
`�-4�P<�;@D�k�;@���bϾ�jgy�$W>��n�ZyM�5�M�šp�l��8w.I��(wntC��V(���4QC�Ҭ���Jl���Fp�ǅ[���vAw�`�b��kЦӲ�&����M�#��C���9 מ�[;)EJ�W�7�Eas��ՆlmJ1l�Q7E�$���T����!<G��&��۝�/y\ߏ�Sg:^�@>��ɖٲ����*�R^�$��v�SM�mC��0�<?��9�e�5Ȫb��Oo��6�5�#��z�Ǳ�6���]�c�6��y�� 77-Z=(k�CN�F��p8<�XȲ-�N12d�w������o�03�UAO�r�����ؘТ����]�F�F�y~���H��)uj̮�ý]��w�TU�jI��:��hY��A�
?��R���J
t��DV��e!��,���.u�����O4"Уa�1��S-��*�;���FB2�] 8+h���������29NbO�\�h��}/*��ϙ�ʪ!K)��_�8q�\�����|�ׅ�JԽ�$����R��KS�6����8ԫ��F4妑z��/������rz>%�?TI�ؚl4��N��lsI/Uߒ
��hN������.2W�QY��<Y1�'3C|~��Δ_J���k���)�l԰-�8�6g�ڲI7O���e�;`����9i4�P0�5̩�vò�w؁c������|�:lN��Jg1�I_�`�����Zؠ13�П�0��t ��P��|w�#�p����
з�v���5d��ewKlPBtM�����ɔ4E)�� h���`b�ˍn=����N��N��ED~(X/��Z:��.�,`2-E.�_��]C�TEu�F��`���1�|�ǹǶ�7B�U��=�
mqx�:tiS�q�-�ѬJ��	�ZPb���I�P���OQWY��-4>j��6'�'׸�����:Վ5U=Y0>��`j����p]���=y�s� �Һ���Z6�����^i�g�/rL�X��06\��P`\t�B���::3çy�	~���|�6u�V�G^�k{Y遚����lD��m�A�>1���i��� �U��R9<T���D���'��'�������q�q�=�OZ���_��(�r�Fr#(�+���~z:�<?�
HˬKv^�0/�[2��+�q90��؎1F^�te����.l�|�+��d{��$������X�ڇ:? 	p�2t��aO06,��{��qS��&��
�Q�{l�� -�C���J;��.�H�}Θ�P��0�((u���06;5v���~�����r2�xG0�աk�e(�����:2>zU��`�4�-"��vX�(v���&�LqtӦ�%��tKm�[r��lwj�W�u�z�����(�k��ڶ��֢�5@���6�vT>�S÷Jd7��?%b�f]q�`k-�<%�9�{Ӝ��÷��E���yz�v�8�\�8������r�����oF:��/Qs� �}]��%���͞�������𱠔�ޙn�ES����x�\0�w���%�4EJ�z!֫��*t�-�[bN!���$l��E��A�i��"CFg�����;��t��䦻>/Wz���e�	ߕ��6�)5ZN���T��ў(`|+S�O�*�RVT(�WJR��jc)-g���s�k��a���)Sԙ�v�g�:)
*S�u��R�8�dV��!Nr��K�%E7��K��2��Qc7S�=^N�ǎ�C�Nu&"��%��Ա�#�$-B�@��/��Fʁ�A��$<Tu�T�dU�|�q��K���U��3�u;���eNwR�U�|�{��@@��l-Y��^��t�2���_|cT�]�{�W�ʕ~��A2�l �*�V��+���s4u J�>���Eʮ|H�ؕO�J��^���y!��pw�T�NH�3-����Pjg�"�1�g��8Lr%Ǔ�qh�*Ӧ�,�$���
-bDJ�3��zFof��1E�%��~�}4�cf��"�ڝ+�)�B�p�<��#S����V8�刺�=�=����y��(���\�Y-!b�2������&�>�0�����9XO�m+�%Z�(�8V.�2����8�U��>�!���<�������ɶ��}��<<�?�8�Y��	�=q��A�'�5 ��'�mm�fhL.Y�Gd�s��l���f���
���p��p<��$7�
��:K��2�r�R��!�/����`��x��"�oo=����	������&��	L��y�����ɵI�"�C�V��C�	±�*��~�.#����U�F�=�8	��y�``IF
��j�G	��m�Ay\CR��{�I�ޭ��G�FU�8i����݅U�K9��J�1P[���]���1�;�����:9�V�*�N�r��.�LKT�DL���Ę=`(�p�S��!��ƨ���	��O��������f���0mK�3�0��M���
B�:}��-�ܳ, ��A�eذ:��խ�����/��٤�����v/���ް�m    ��th�Z1z3�m3^�aJ3�)�&��ؚ_����Ψ�\�.~����B�,�sdwʰF��"�BzT�Zc0$+����j�"�Z��⃏TVշ���3�._�<��Ҋ��b�KV�x�.7�0�hYp�|Amw�����*
�=8�d��^�
���S6�Y������=s_���A�/�n�.���^P&��jF�e�	�!b�L+=�g��l�@��H��B�-Qkr~�EY����h2�%�#�\G��9ƛ�.�p�m��0��y��Tx5R��eI�ʥ���� �|L�|�'��󁥌)�!�ɹ����6`�}p��#Iҹ/�.���g�ԵZ!LL�Z��%"ojQ���E`A5#�X,]�ͅ�B�%��f�����N���[���]�9�"*m7E�Ʈ�e.c�{Z�t��C@�ZQ�(f��;m!�����FZ�^<�B�R��vXҲ��cR
�-�]t<�P�˅�E��V$�˖�h5%��a�(#Z��Vɏ%�l45�q�C��~H��	�1�R�lvcW�F��~iN?���?�A�n�jX!�䁊7!��'4�=�*���:7��Y�B��a��ީf;?~��^��`����O�5C���A�E���bMs��k1��g���� ' �◒uz�L�XRrbq��¢�c�S@��+���/�Ji�Y�m0��;r� �fٝ,)���>R�o\E�k`����r�z�TM�l20���)��$8�O�Ln\ٍ�|��@���R�G��ñ�EyBН�1����O\�F�`p��1B�4��)J��\jAn�JhZ�ERl.p݆>lDqW+cto\��z;�}��6I����8V[%��(�ܑ�qUYM9�FQ�2Qu��R��������Ixj!-(��6���oI�E�rG��}R��F�aJ5�L�BI��tɚ�^P�G(��;�d��.q?s�.�[��q�>𿙹��u��#���C����G��=v}�rQ���-���G�8A]��H,�o�#���OB��"I1�eb�Ͳ��Mz�(Bh��/�A�HMi�`�T:!#O�,��;�4�N�FZFi۲�ɧ���Q>B�+�/gM�e~�v�.<>ؖ�%J�t�c��r���UGZZ+b�B��o�S�%��B�YF����Q�t�|)��ލ�Y�R�Wy}�'���so��^ߋ ���٤��D��4�BZ#X.��۵�*���+T})f95'lH_ 픶�\���'�������,LW��'�w�ےH<�o#S:�-�V��$�٪T�#0�ӂ��(cY[X,��Y`=cU����tm�l�6ϝ��.��Ox�ju��?��O��q��ޮ�:�
��K^���v:�iUR���U0:^l� �g-�9� �ږg앝�����o�f���0q>��{��D-��@A��-T)�VAA۠�<6��,����HWY�A��v-[�ߛ��������JI��e�"�ۖ��xd���U��������l(��G���!�P��6��;	`���Iad;a���I&����S� ̦3;�kTqB)*�V�&���)}�i��$����58���!�A��f��KU20��fH�����L�\�,ì/O%S,7�1*M��4�2�"�༂ae��2?�}�'��G�Su��#dX�%�{�'��M�d�B�Շ�~x]a�A=T�{���U�&�����Y��(� ����TrΑ!l"�{��n����6:8�|G��#�sТ}
D��ZM���ޝ*O����
��;a��RS&�D]�Y湪��3�>W����s�vf�9`s�	��B�9�Ҕ�؁�KϜ+��XN^�xՄ�iJ�� `9�����"�:�|^Ɔ+QX��MT�$t��e��3^��^x�L*�fe}�b7IZ��-.M�7�F��U�Jږ���C�w%[������T�S�Xъ�M>�%A$o��/��l4�����J�X�т���Ҍ�	�<�hi۪<�M�gc{��LzN���Qx&��[���X��n	9��-�B1��F~������li/�	�r�1�<&ͧ�o݈�He����'#9����qEc���.iS�c*�-����7�Z�2�'*���f�z��Z'���S6�(��?� P��a���6���䒶�ɶg�$J&�C��P'�O0�Ϋ�4�f�=��薥����3'[9����*<s{��i��y�"�����mv��`�XMw4����P�<�О˵���q�;Vj��y��Al|�g_T���׈��^iۜ�9���;u����@�ka�N�����r��j��pUb���U��h�nt.BԚ��,逸\�
wO6t�?�:���p��?��P~Ap� �l'L��"u�9�pw���zh�6 ��:��3;�j��+x�Ĺ��IpݩЮ�+��ܶk�2r[4*,��'Lǣ��P���RδDyk��j���7�E���7���V��y�ƚH�RW�Qt�Fg��rH�
�$z���`�-$֚�,��a���������xK0��fп�6�妡D�5�J���ホ��C����s:���;Ӷ"cN�؆�=T���1J?�����I�w'rR9�������Dxru�F����%P�ѐ�ܜ�.�~(Z"�5՚_�y=45����XyԀ��9Γ�������@oME�_�E�_������Z��S�rX8�$��!�rF#bͣ���vVf� 8q��%R@R���" �N�k?�_ɝɩ�q��b�vY��(	�!Z;�d���/As�ua'�}�e'����?%Pm��7�%��t�d)�Yl��8Uڥ@(3(?f�]?�Rr����EK�p	�%{�7�x
��0@� ���L�|AU��E��3-�t�Nd�A)@�k��%h�6$EC)w�g+�FS�#�z{ ��eCjk���6m4��Za�yE��eI�����l�x9|�X�9l)��}�7���$cQ�t�Yzg?g�5�'��5�34�'_��3��|Xf�{4h���R�<�nz��Ԯ�6�	i���;B�	�x�{���D*9��M�qR��=��$P�.!d�b�S<��5)�+M6|���ӥf�p�ɽ!Z&�+�����K�5ƭ���)6�/��d6��$��	,���a��=�6��f!ᴰ���J`��XJ4)��Xê�h�n��5��l㡏�gP��ǿf�����oW�uw�d�
T2p�nf�R��k�V %55�kX4���е�T��i�m�)f�W���2�&��`��AX�g��3ZА�Y��q7�[o�І��r☒1�{Q���9�o8?�KblgI6�኱�p���y:�8��r0Ɵ�ˏ��]H���ʮ��T�;�������%�Lj�m��C���#�*l"[��4mw�ưs�6��`B��첼Z9� >4��nx�[�nh�~Fz}ڙ6�"�Re`!hoR�B�(
��J���D:�"[�u�[��ךǴB�ӊ�g�R�#��_K�W2>銚�-�4f�dn-CWĬ�7P(2��`��a����x�13���|�uѢ���ѷ���@������S㕺jDd���<^j[����� ���ԍ1E[�~�TnK_@	�/ɒ#�i	#�	����ݏ��.�ڋy��J��˗��n�?O0��LU�����ƨ��ph ��=8<�I?TR"L�jۃ^�F,RM�ȝ����I�y��Ƿ�OMtRF�^0A[/1��H�M��� u�;�B:���#���@a�pb����;?/�UT8��{k�2����t��q�ݣ���=C�t�9�a&�4r�� 	Ѐ�A�n� �nJ}Hy|E'�Ե��IhSĥ�	�s��T�4��(V��Q��eB4%�2�Vc���D��T��p���5�kW��)��������X�r~�R�8ٳD���u�R�5�cUH�c�׷�gK�����')sn�~될E�F������RfAA�~�~��`辦2�B�gɲ���1����%����2�`���Y,\��>��`1^�7.��_�ͪPBFc&�    ]�n"ֵ�F1����U��KJ{:�phT"��������h��b���=ư5����[e��̋B�ι��΄F����zP�%�B�a��.�-�lN�c�>�<*(�ס���frYY���VG���4Zy���_��%ޣI����t�����6r-�m�(Y�*Þ��ץ�e�s�S5G�:� M
n�����\�mg �7�L��n����O+����I���nsn�X�"F��kM�R�>��(k<����5|ʁe�vc���q+?�_j L(�9#ɪ����V�c~U֡&���z=%J��R�`��5���� �E�h�_�~m�83\ G���;���螞)^�␻ڢ =�eBC���H?1A_�#�p�%eE���3Ҿ�9vi�w�$7��[wLZJ��Տ���7E�#�pX\:���(\�G�S����U�t}��z����u;�-O�*�na��a|¼�p��/�>F8q��Ҕs�(C-
�pݨ�{ z���gL���S_�0���;~��-�V�]�4̐"ֱHCQ����
&+
s��a��v��&s�m"^Qo�~����
�$ް�-���̄�w��g��ցw� HA�:�7����v�g��:�2b(p�}*�*��`1�{T�2�(ᮌ�0u�f�����e$((`E�`��p�i!y8��]hM$ݟ6?��
�	����V=����I�����C�+���Cj�v���n��|@�4}�.Ӷq�j�B�t�N�%b	!���������E��$"�س)ͼ�#]ݣ��#��H�/��Ygp4�@�[�F�pD�=+UێƏϻ��|c�Rx��y�Pd�q��媦������U�5����L��~����/�5�2����(��C�]���� �\�2���AY�벱��]Ot��7�d�"{��;��q�hd:�p=dw*$B��T?�0�rS~�)'�:��[~�؏&�t_V m�P��~8��c:.^W�øz=Т\ -�l���r���0=�����o�d�h�Ǫ���*�S���;@�(JN��a"�w�-��z��I��1y�W�a�
^��[v�N� w���@�o_�縓���a�����Z�krȴ�����e�3�pG�c�Q$�MJ��!#��-��/�*F�F=��;@�>���lyX��e�t��'H�W��~�?��O-�M�(FSڙ�.��h=�B(l�Yo#�
�M��
�R�Tpx(�+���� 7��LH�jgt���x�0&���j��M�e�6�u�vF-;JQ��x�a6�b����|',�k�1�?&�r�D?>�" ����9Tv�cV��9TOn����� ����0|ƗJ���U -���7՘�%��Q���J�m�9�P�B�>j<T*�h�f���ϣ�����;���-Q�&�˟G�ɂ�R%Y�(";�V�F�[9�&�z��~�	��I�� �8�L��]U'̼z�G~�����ҙ8����ѡ;�҉���e;VRu�А'�K��T�@YvGɩ��v�mn�P��u�G���8^nh����t(^[�Hʌòt�R�AWww(SXd3mP I�m��; �J����L{���YǠ6Q(�pa�~cd k7��Q����yɥ0E��M������U&��^O"_M�H���!������J1��3�Ӳ
as��������&N$�T��aR��Q�9�:�Ґc�����#F�Ҧ F�~�q��l�)�tr0��՞K-Α���P��x;m�C�K��x�����PJH��,�|�;��c#�NK�A��s4�;<@�X�e٢JϜV`��5%%��?(��B��/�8&+!Lȟ�?<�����<h��w�'��6ǌ�#95,�;e�0�N)�Kϗ`W�����0�!�;95�>E�w�����S�?���]N��o9�U2��� ��������|>>^��h�^���x�����y֟!��������^B��,D��˄�򵖨�YOc�gpj���Wps����xth��fm S�nM�贁p
���G�.�� 0Z8�P,���C&e�r��|���FY�����<n�Oܵ��?��Oҧn����	UzEt�	Z�j�l�[ S ��:Rj��n�ț�����|j��֊dmO�0��a{m�(C��b�����3�1���U]�dmF���X���1gϠ�8�J�@_��p�J�:]N�'�пS0�{�C���<4�;54k4��ؓ�x���)~GG�'I��Z�{tb�ܐ��7��x��.���f��.&�*�>p�ݐ~�cT��uK��«sTG;n=�K��Ո��cَD�Jd��C�N�>;(*,�~�ڎ���]q�D��3�&�X���r�M�la�X��x��������z��Rzz]�FUUZ�C$o0�jۀ�b���,x=����o�Hl���_k(搧���=F���}�z;~?-��|s@yb�8�]Q�8�J�G픁rZ������av(Oz)J<�E��m�&��s������o�z��V̼�_D�t5zTs\ (���>D&���mH�����>���|s���)�����:�@+���6�H�h�*�	3G1��i��<Hm�;C��%ņȠ89�:����i��������3r-�|��3��%kʗ������zP�Bq���T.��њ�G��Q# 
��M�e�uv���6 ������s[�Ӡd��#�*���H�*��:�'���@o�H�-�b�%gڛ�,�&�`&��>~@�=QE/3�	�F�M���kMBW�.G���)��6-������$�Kb���A�3�\�ɭIێRV�u~���V�S7�A�o�*I)�����6�D�l�����P�8 ����2z��&�R;��	����3���� �:�\��`���?�	T�e�v��2�0Tg�Rg�� � �H����}p� �`��LG�}_N�eH���?j)��Fs��㩬�$��v��O�u�u�!��x�^a/Y�QD��w����j�ɭk/Gy9^N0T�.K�}ی����Qn�o�Y����	�ъ� ��H��[Q[^���\�6�k0_B{��[0n�e�uF��^�ü$	u�b�� ���.�WZʯ�R�Eu1�d=bZv3�]T=�9�Vg�~>����N�i��С #�ckϚť�1��g@�ig� �દ��4��D<����l�?��1A]-��F���
|``����C{�x�����MD�M�ꞇ�Y=/L� ���	S��%
54�3�|��q�]���pz�^��)�K�^#QFd�k�l����iJ��D��Q�KQ��o��/�P�G��ѹ�7�%Q7b�ݠA��|>�g��?��T��y��'m��R��/0�]b�JO�l�0���Hp�V��Fw��9�_	q�X�P���?�#�F'|0�=���"y�������-���y���u�%ܔ���!#uv�.mv�z�3�Z�Bӿa�G��4��)��VXQ�=zLZPҘ�švM��� C���Uu�*Vy�)����.�{0���� .u��>�;`~���&e���`sM���*���4h ?�����N��NW�+�$�V�Z<K�:<�"��ʶ{jZ6ȁ{��P��)˲2s ��u�q͘��{��7>o���vʙ`�����a�+[)�iW�+@*l����`m�$qIAʁ�#�#Px�/���@�p��OԤm��35�7JBO�"OD�n�k��a��k.ďjN��� �	n����KHǇv�a��Ѽ�Q((�ѽy��|�6����N�Q��"1���r��R�0e��Q�s��شd�%ŀ�lQ�X�֗�J���+�u�jy
��ɵ�J�y�BJ)��)�L�ck��6	ЋsT��{B�yGݸ�cg��w��50�F��O� ��ai�E e�\ښB�e��i��ڢ�Um�$�
?o4+u~��,��0��x���Y]�[��T(�    ��l�~��;u�˂���<�?���s�����Y0���z8����~�rж����v�[ԓ��R�I&(72�:� 0���t)s����>ں�50���ごj��[�9)-��ՙJ!�����!�Ap�n�S�� f�"�U�W��-L(�x���a
n:�7E8J�n۝矟�����t���^Q�84E����ȷ�zVB��C����̻B%u�� )�d���ď�3b�۹�NKpg��L�N��x>³{_�{�43�p)���Z��}
���m�o�	$��A&Ka��L" X���-��ld�}R_���wq�cF�u����hIK$�Kfe-�PuF�yj3����Y��4jF �T�:���:F��~�_s�t;����޼�� ���8ĵaò`K�	�qC� v���*&��h�Nt��ع|e���1��q�};�>f�T���ʯ�<@^uug::&�����̖!�%�e)�BN���hv8��4;64^�½3l�߁E^��l�ݫ[�[*< �B`5�VL4���FO3�r���`I��H>��r�	�d���g1c�V�&��]s������uEr��P2�.��If+�Բ�saG	ߧ�ł ��bt�{�o�V�����A!���Z'a)�泘�<��$M� �~ӈ���:R�
���D�l�@Q��~��SunF1�NN�Ƿ0w-���K	���/O�F*)�V�;�H�G��_�����2��2&TI2��/۵�����H\��Ѿ�m_��� c��G�����U`�!-���aS]�;�A���5W�����-ͅZkXIH3b�������Ӹa,�uYVX<����Za�aD�ԟ�=��nBj�.�M���q*|�~�,����'��_�%��N|�yR�ƿ'�z`�!�)k���6@��ɣӎ6����n��zi��J�踊a�IA1H�0�&���|��'��m�^��� ��Ԟ�B����(7,W���V]䥢ע$SETȔxG p��,�KN}�I>\��\��w�_���gZ�o����	)X���V�5]2moWp%܎l^�@*��!��P;4� �Ӂ��x�9���%�i5XYX >����t��rHd��tt�����tD��XN��+�Qa�R:�0�YZ�:/�����8LjۋTRV�[��`�#�4k\|J�v>CS�t�By�M:쮖���f��q���JZ�������/�GT����vKH;Q�L��$��d/0�ĲƎ��W �[[��`3�2:S�8��+���5
���\
l֮��3WEGŦ�6����$�:xh�qh���OK<��\����&����Q1+[/�`�^(lG������Ӟx��t�B�\���$��BE�� G	��Z��2��'��	�훤`�z�쳤�8�����C1��P�x)�1c����t[�>�Z��L�c-ثc!}�f�'�h�۶^U�.A`7�:u�����C8��u�O�'��|�{�@,φ[��6��@wD����<���/dy���U��>��� Ef��^Or��Ԩ5#��X?yF+�Zɓ@�L��L����y02aI�7�Ζ��	o�S���=��m\j�������P.X��(0�d4��ZGp��oj�����C�['�̄�]c$ӿ�DC�[����T�?Ayb�;y�P�^Ro:�2o�T
垐����]��3{�I��e�ؖ��u���n���� �p�<t�6z5��|�5��s��l.:
@�.�5�E��/������}dXaƷ�J�Z��
�V���me���B�]!G������rz������S�c4��*�
�҄eLI~�|�m�Np�
��+�#ή�����k��|h��nW�A6�=ҠR��Go%Iw�	�a��؃�a.�Se�����Ҁ��t����xY���M��a�e�B��{��q,���avD<�km��w�wF�Y�=!>n���#�e���L)���թ`���cW5�%\v�$�+|w �*�i�Y�Lw���f'���]m����@���Z���͐����7�2�vr�U"�@���Rk����W}�������0������ۆJe8�,��L�6N�c;6xɴgR4�	K;���F.GDҾ�E��5lV@�����Z�ܾ�].|&��|Xky�+�24�7ͼ4����j�J�l<���pR�T4�2��;C>xƠ�"x�cDO��Q��r>h��j>�áॻWhς&iyP���'L���;�7�/ MߝtPA*�ٴ�%|U�Z��=�I�N:ڳP��,k%L��(O�����}Z����Mˈ���Xlee;�bؖ1ߚ[v�d	���^W>7gd?O��+�e#=�8���W&C��?��k!{�	Ws:���uuf����2<XF���,��ƶ�z�*t�$Z�1�^�'Sa�����D[t��4���#.���3F����������]A����럥L���N� )8M���b|�a�)Qj�Ei�d��NW'B#��[pa"�P]45)��D�bLM<��I�9�vM�������zo ���H@iXr��k�]�}�8���<FW��}�^3�Zg �D���~�&
Y�J8G/.h�fNq9���r�o3س=�~XU��p����I�"#
w����N�;��{y/��ij�B�� �,�(75v����S���9�*ք����6��'�����L8iK�垅���������SH�N"t�m=�dB�����VP�����94e׏���	��6M6#n��]�g�rz��0"�=�9��+��G��(���O�7�[3Ȅ$0�	{a � ���qx;����=��O��Ti���A~?����N�)� ��Q�P6�2"�Q�D��(�t@���3`=�U�Cs��[��S@�s��{H�=�����:cV���fx�+���umO��e���C��eKi�<�S�7T})п��֑����V��CG�hy�7�{FTM�~)!�m���Iv�	�|>�0�,��0���ʉ1�����M�;�f�PBgB�.tĔu�R+:�.�ewݓ�+0��(0�;�v��r�;����TNY������r�H�!s|����"Uu�ҭ%����h�"T��5�I1�Jt��x�/l�M�
L~����K��rp+=S��J�M#1^�(���\s/��"�:��(�ن��/��z�U]�L��=�58��<�bZ��F,��
�4Do�#6B�55vK� e�ݐJ8^���gUo� �Q�@nlYk8}���OPx9+*�L���A���K/f��$�:d6w$L�(�CB;��,��8L��N>���NP��w;�|����C��2?���<��L�K��|vR���hL�ts(�Ԡm��iѯ��S�!1@_��I0�u�)*q��8�q͏�ۇz_���H$X�'��D���H%V�!�^�T�����|�Fwq�����@hY�^ӶpE�LTgsk��~�`;��(�D���)x.h��,�`Pf�����TȈ��.��PJ�rв���U%-`d���t%���M&���B�s"a|�r�W��qq�Nl3�v|���x�����^ぃmh~&bl׀΃��L3��J��ѕ���֙r�x��^�6��:�x����/��7�+m�_GHG�fp��-ǾE\T�+�2�"���fe��@l�~�Ytx�u f����({0�p�/���0@%���E�u0���v������\�n���EBeW�+ �U�^��A�è�ښ2af+p�{���]��k+Q�fa�,,�5�^�����{��gI7 >�_OH��L
K������0�%R2i�j�GWU���;&��j��|����}�u�ȉ",#�Y�`@�u����
��D�~>P]8-�-׆{����r��Ά�$��>�.(�h@X�|9�6W�E���ֈq�ggIW��Q��U�"��Q]�g�n��Ol���7�sF����g��t�U���--�G]&<،L0�0}��;p1\k�0��J    l�{�s�-��FҞ�n
�������윐E؃b%ŋ�[F lR�s������(�xxZ���p]�:K��2�t ��=��=T䅀1�hw8���ګ=��1�y��ۢ�p|�t	ּioX��N_r=њ�@��F5��n�E�e�S�s,Zv�	AX}O�5��%* �Bd�I&��<?\��;i�SGj�F�#]�~�*H�2r��xN�m���`X�נ0D�(ç�:V�&|�KZʮ�?=����ϰ��P	�u<~��k�~���&���%qt^6�}��B��=:4ٟ���n��QI�� XBঘs�(����b[=�BF���A�?ܰ���+�bjtx�]�1A��E������|�=Lw�cs�2y6B�jU>�/s�@[닥�N!��_0�j��B���Weώ��_G8�g������I�ۻ�������t�J��q8�q�em�X��T�D��mOou�q
<	E�t\�t��!�btIz.B�i�����[�j��t�p������0���h�s	���=]��k?�a�r�S��-}����y1�E2�hi��sS���@�A��EO&!�tZ��=8-a���{�W�'��/��z�2�܉�B�o��P��]�Qtd�p
�b�m3���v���n�o� �[տ�5a�8ܮ��!q����v���/����N3U-��$:Bdך	��9ɢ�YH�I���J�̺$(8A�8X�u����CiA��Tc>w+TN���1Xi=χ?��>/��_ C�� -Ԯ	Fӕ`���H��q�R�H��`�W�(�^%��-�H�lK!6��8u(n{�۹9�ǅ������4o���L�z
x�V�G�B���UNѡn�r�������
X�Ҫ��WӨH��Q�`������kc�\9��Ki���R�?�b�{��x�6~ru%��Χ�.osx�uρ`͍q8�hny@���������N���A������Hm�W%�>���j���`�iXu�Ō��E��1�q��J�@���k��4PC��؉K"v���O��u-B%��W��;�*�S�f�Og�˃�%&4�eML�����ZZ����,�;(B+���/�}t,��ΓO�P��jtY�Q�*�{�ێ<ߎ0�[u�Mb'k ����k���������f#�"��`8��o����6uǎ��(�����K���~
;�Z��Q��SТ\!'S0�?u	����ܥj�4T�E`���5|'H]y' [	��F�Z�Q��, �t?>��CH'hjޏ�	� a��GH����u�A�N�n�����o=7;��t��/ڏ_�Q�~���'�~?�������I+���Y��CP-���E��hZ�Eo�t
!I	}��I|�D��>�@��k˼�I�m�v�~ hr?|�F!��1w�GϧR�o�+�%6�a��
�l�%�$�v(g4b@�p�ܸK��;.LJ!"z�p�p��D/�Y ���������?Qx���XʉΗP?R(�w���D*:��p�Y G�Ί
�(��ɏ��
P6ǀ�w��Y�	�jj�E�rg�V�d-�6�S�W#}]
}�`r�͓-`��RjD���މ�'87��y��ϻ��>9+B>�ѓ^$|Y]�|'(���y�}�{)MY�ٸ�v}�"�T_d���By�({�^wa4����]��aI���C)F�^{#'j�`��	�Ͽz!$��ϲ�=�f؆�j��gi�P��E*N�C�{9��yž���$�4w}�^�H`
"�*���k�Bг���LjvP3C4�b�H�êk��,@;��G:�<�<�5H@����v�4e�.����s��7���~�%��"���J�X��%������zrzY\Z��^��; B_1���z�T����������@W�����f���z�	�pU�(�Q?��$��G�T3�$�����;˱=�i�A���Z[�~o��D!nG�H��|�����E���]J`�9Û'"�Z;#����i�L%�(w,���� [7�@�!�n��&�v�Z�rnv���;p2L���6�!�e.<xY�c����1�A7[�n,~�%��0�W���.b��i�sw̝�EP��f�	<T��]Y�)'c���q�Ƴ��6��� 7ŷk��w,����C�1��~�#��W\)ڮlA'e�"頰?+�B�&�lD�����Ts7*탕�����1�y�2Y��Ǖ��)��e��M�J%�B���g� t�@�ni�Y|���Z+z��JΎ}���$���w}gY�Ê����v�座��r���`�[�!%�B���h;��XG�$�Rj���PQ� xz�,���V���!��}��Bw��S[,@x�mh��U������<]Q�W)Ll)�Eh�;e������kh/�D�yqe�0� M
�:������du���y@yZ��&�ۑ���LbN@D�U�,�ǐw~@5�9.���Q��j ���&'�g����]����mj3��F�Db�m�*�����j�9˄�NǑ���@㜭�R�:���|h�#e��$��f�#����҇�����b��<NnG���~h�i�{Hc,�ǙT�/�#��t��m�510s��E��QD�����!,��y4#�_0Z���!>~@:��Ư���u?93����K`�[�k�+Y�Ԍ�yU�jp�* �غ�%�
��Țԍ�+�x��AAUu܍�����yn�l���lWo�[�h���'Ys� p�)���L���N�&,No���uEң}����c�jch���5�쏾�F�jڇj�n���Y'�b&]��	;��0���{��=jf-F3�n1�@���ȁH�iۍ��ڂ��Nq��`����p�?{[Vpr��	1�,����c�X*�B0ʰmM�y�4���P�Uu�Mg1�j��AT��4��Њ�Z"���+\а��Z���?'�����h��� ������iTs�.Xѫi}�>�lK@�X�	�$[O[��
Rj@���14��ݔu��~*ƕ�'������JH��J�`��iNU��$���qK_�eN U���XH�k`hk��=9WƢK ]t��u�+�#�c�~�\�ƨ���M� j$�[ȵb}���N�,[n�b]��Z��)�잫A�F�lN���	��;ݵ����c���d�$X�'���k�Mb3�oǬ�/:�?>ϧ�<k����jY%��(3��p��~AJ�5�������<2�!�ޡo|4�8�h�"��2"��1��Dwg9�L�>����Qg��Ua�)�*"k�~gk� F �S�2T����]Fh� �g
@�E'?H�^\r<�,�T:;��f��tXvu�}�a]���~rM���W}|�i���U����M����dF{8�[�3ϻ@v�QelRP�
Rd��=�Ǎi�Ю|�x�@�b1I]N]b[I2U	�N����8�G�9��7T+��L��zwa����e�����5Y�֍��bؒы�Оi���N���%���r�>P :��$����x�j Xdb�#��M� ����ɒWI��䃧3�ALe�rp̲�9+Br�iK�P.v�Ԏ/��n����W�r��e��K'pł���b�cK�:j����g��YafIKL�!���D0��Od�����S>0�H"��~�T�k��a�H`#+�9ۡ�7bZ��g��O;�vaߕ���1(�DtȤ&E�;�D$IusϢ�G+�'Ŭ`;*�Q�����sX0�u5�o�Ƨ4"��k�I����͋�8��EŸU�
9x�Y/�
LDH�{�"��G��iJ?�_�t�}�� #�����I*��˞�=���؀·z� �#szSIgh�9Wj=+h-i�|j��e�G�����X�e;�,&�Ng1���d�`�h\m���z,h��A�ހ\:����|=iBs+����[v���q!�ߝ(�xCatpǶ�ZH�2�"����_�P�5�iA�§`�K��Z    ���|�P��ߢA�X�f!J����T�J����j�����9�ݸv����r���%aƷ�
4�Ƒ�c7���ZBϩ3Ʊ�:��	c�Be��C���:."�_A��qz[Wec'I/��)���5F�it�)�}p�;~��+�&hEq�q#i��I\8�'f;�9� ?ؘ��-}V1�9�õ;H�cY\�?Y�2���KH�:�t�'�ǒ@����d������r���P�q ��#�l��7��J�#l��������3�QN��Q�bH�F5>uo|����Ё;ӶᆺS���t�<��D�3d���v�bl]N���)���RL���ĩ}
��3��S�zfMv/&�&<:���I᡾���3���%�{銊_"C�ゑ\���^�OP�6Jem.ibÉ�"2�D:�����d=�M�
�}�{
#?�
�L��0��a졷0�.;���P�Џ�Ě�/N%  -�������=� k�\5��:}St�:h�;��d��(����t,eL���z�X��Ka��^��4�Ҭ�b�o5�g��h:־���/����P��:?��Ck���-�bZ\%�)�����bLMO�C-�.w�����Oti�C;��r}\��,�W>d�N�%8�M"���*��g��I����$10�ǣ��U�8�mE�7��A����k�n���?L������Й˥eY��%$ɂȶ����6�;\��Z(�/����Yi��ˁ��R<��N�q�a��ߙ�N����
�-Ǔ�U�l��*7�|{tԵ)kH�3�IT��:�DN"�E�3�|?̑������xrD'�V�֬�lAz���RA�\=�)�@�-���.�P�675�)��)A��0ɮ7~(vG���jn̰B��AE�c�4]J�> ���o^:�/��j4��mf��b��VT��?P�ȥ��
�~�P!�_P����wt����?���x=^N�${��)QjeJ �O�|��|%BR�e�,����1PT�J�bi)i�v�C>h�����|�Y�M�}f¢�������A8�p���D�M����a��j�t�Ԃ�
��>H�-J�B	���Xk�z茚u�:����d֎�W��y�+N��T�=<�8P^@�����#�c��!}Ֆ���T�0���'�';Gѽ~<�]�)�-�h3<��n�l F��=��_������}���ml�''�D���t��{����
�b��u�9(���॑mc[��@߀���<���8���E�:Cb^��a��Z5��6r�I��	��}A�Ϣ-�,��&/"F�ڭ-,x���^?/�i1�?Q15��Nh�%D��13 e+�.���<�<�~��~8�� ����K123�Q�Q�� �.t��%����$�ӫ�N3�!�V�,�����0<V��q|���Y9lP=�jY��7�<���B�ԃ1�KX��ɷ+g����
��T���0YN����i�n�1lR��N#pe#*.��f�h(B��e�B�4
؝��P�ӡ��5��B��R��J�Ei�V6��Jbݼk�<��_%>��W>&D�E3�1E�:�@��Hg	��.Q�����H�j�� ��&ՀK�x��`k�W�#���k9?�kU����)��b��=6,�R�U�%�@�j���F%��CQ�He�. ����E�J'�����P�|x���x����Q��%�-4���@X������3+�qʙ�ٰ��z��n��k�bJ��K�n����X쭬�yʲ�%Q,y��s�L�MC�~�����X��gד��vw�!�%,$�/��T��1���U���H��vO'=h�ڢ57��>p���2V�ҡsҊr�(��&��rqQ���7h���6�e7H�8�k�4��_X��H�7a ��\8��6
�b��r.��\K�1�����qg�ô���\r76����>"m�U�0_���#Gd��[��r)�&����<~@AH�n^J�ei�L㰘���UK�6y�JG��35������Z�6���Q�"@�W+���d���2��`��V&� J%���D�v�;�`�1�@%�띂	�e��u�K��Se#"�I�~l�ڔ���VK����D��C�к{
sS��u���)�G�Φ0���)x���X���f�[�
��AtVas���n�Ư����j��Nݚ@m/�S��\U��V�V�����T`zU�ѻs,p� r��9R�<��P�����֔fdjϧ�?_�A���\��H���RY�����}�?�I�A�
�6�lH�Y�g�����r��0��8�)E}�~0ug�O�#D�X�nAA���̀_D/�z`����@��Ǻ��'R���Ė=P�	��f)`�qR̗�������Ƣ.�����J��k�l=�{��M΄���/�^X=Z���h⳶�"r��!��&�9�Ǐ�)��mC�y���54�s�E,��`3��+�<.��.�"�=�re��L�{  �A6듪�Vj���5e�s�w�=��a�q("�-�mᒵ$m��I�<A�j��:@�R	Xs�R��)��V��e�0���rd[�cK辔�&�K�_�.k��Ԁ���'�u��&���ń ���Y`2eU�!�	��E�6:��N��_'�o/L�y�0��"�z{���H�$�0�Vt>y4F)��Z�"^4F��s�b��0��Q<��ڥ��0Vh6�C����tn��Ph�wn�����jQ����m,C�~#�(Q�ϧ�+@E�$n&��pU(��~m|a�
ϸ�ou�<%`�?�ǭb1R�b^�0F�P��i��(�+�B$D.�=�#����� H(��'����<���D�{��.������x������X�1�\1�v��Sg�wF��4�E}�@���#�� ���9�8l�@,Q���C�o������o�����> Tg��yFoX L�g���H�PrQr��:� w�S��h���t��홡�K�E,%�s��Ə3'f�""��j�Khymc8Pu8�Sw��vX��i�Nq��CRt#��1������^׸�qy�ψ>�|>_���1,¯gGZ�˹ot��:;t�U��a����l�q�Px�����\\�����A�]��=�s.���Gg*.�B�N5������������'���t�
�_;7��,��(j�8�W�S�5H:M��2�&�˷�e�+h������G�n���%*�-�^����N#3�r8v�R.��m��9���i�'-�q3G��\X9P���z����:s4���iU*�c�LQzY�e�����,b�٘�d�pd��ßO��
pps$�l��(�"��� ���?q,���X�B�V4M���r�2c,05�V�v����}%��vC����)���p7"����+���y.��D��%�2���U�ؐhxHn:�*�	=�����^`F4�Iak~�E����'�n�dr�|��$����u�"���i��<_\�+\�F�����l״NO-�`�ڣ"3�@�
��ϕ8!�8I���C�,��p6�0�p��u��4���A�t�${��("�.W=(|�ׂrQm8>&mM��~9}���J��*��Uƹ��Sԗ�W���Kth��q�ΝJ?J���4�w�����j��}_����7)pRP��A5���$3dc(���h5I��.&%ŵD��@���',�������˗��ƏfK��T`:����@�e$��q9BK�C�Ch�*t��v���&��A�xp����%S�Ly( ?�S}��6�u�ÂZv��
bEM�6x��5�)�e��%��ע��1��I!\;�m��o�
.���EM�*<YHu�r��o��;(���������'�T�V"�m�6�-EI7�:~���D!�#s2�����L�ȭ�+��/=d�P=��Æ���3X��~�G�8/
�[��#�\s����۸��$��|�
J��<���6�t f�� �: �   "W����Rh�(��U�GA��&��n&j��Rڈ'4(P��!�	�pv3�_q�/g#l�u��1X�	>�7Fgm���Q:+�"j�y��W�;@w	�$|]��an�KF�Vů�"P=Jw� ����iS�v����r�-2�j�M��(�^��^�r�?&c�r�禞p���}�m���ļ��9�n�蘋2+�K@���3~���hTK.��_O���;/׌�K���,��A ([ ���o؂Z�Á	&�) �x_��ʭn������'�Đ�>� MS!)��D��o�^}u�� r]>j�?|ȺC�eZ �ۨ ��ɘ��z�މOę��|����~��8���@�����ڸ}%{'1`�Y�G8M�>��Ћ�Cn�ˉ�c��,
�zTu@�NIƇ���Ͽ�<\�y�;A6p:��w��8�%�Ӝ�1Yŷɥ�*���(��N����<tӔ�{������м�         |   x�3�L�O.�M�+)�O�/I�7202�70�7��w�����-�*r�+8AҺf��
�&V�&V&&z�&���\FD���4SC=###KK�i�Mvs�k��������	ȴ=... K=�         N   x�3�L�O.�M�+)���/��7202�70�7���-�*r�9A�f��
�&V�&VF�z���FF��\1z\\\ B�           x�=�ɱ�0�3̔�p����t��><Sfl�Ħ����W��\!�d&/ᣋ��͕%KW�-[���b�
qk!|���)q���q�md3(��Q2���L+�J�ا>�r9�s��t��u}��f'�lb�ip�Kl�g`=���S0�5���ி�#�]�&6�g�2k�P��9]�͚"5Q�=��_��(�Z���<�X�5��4K�{kwK���c�q[^�A[�fg�S�g���:k{u֎꬝U�N6����g�?|Q>������xh�      	      x������ � �            x������ � �            x�ܽ�r#I�&x�>`b�?G'�A�	Q ��������Z������ԧ�y�9̃䋭��������9F�lWudV�0�
��O?�\��˗�#��B�/�>Pi�y��!6�<<�<R&얽n����3�vB���t�������ks=����9?�������y�6O����֜����y�����t޵����QV	��o�7~k����[�ǿo�O�N�Ìa|#�c�n({ Fܯ�.����/���_���7������/ykߛ�~�<��s�4�����|�_���C������_�ׇ͹d�����q��(����x�/�Jj�ރRo�z�z��2�;�=��~=S�9|��P6���>��o ��qw�<^�����=��ݾ�_}>�^x ��d�@	����-
^'5	�#��ᛆ'�{;��#:�Nr���[{x��̘%VPmQAf*#3#P׸Q|C�����#U���bh/�J��1�ǸԱֵo��r:��������3��9��e��ej��
�@��(��n�oB��l4�׷���=4�� �'T��K�0#��V��yi��2� �2��e�/�}v�z߿7G'�-��PM�x�f�м��N ���ǯ���o�\�h��ڵ�/Pߺ2\�;����܀�`���p����fV^͏�����ٝ�����ǿ><��rz|9�+���~+U�r�eh*0�t�z)jx�^� 9Р������|x��-�y|�|o��'�d���Gf��T���cۗ�k_๹¿�b���)#)5R�� �x����I���}��� .Z�e�N������H�����ߒ�`�\�[*t�p�U>0���H���t\#|8��o���P�h<�h%&��Xя��8����=?�Gݹ}n�h��H��Upl���J�UJq�l�酸EK����ۿ��_sߑ��$z����9Ї	
8���^/���?�:�{����o���8���������;�\M��Yx�:!2�	�GB���rL-H���&C}�`�AL}
����u�����r��2��Q�c��<��o�ilO���K@�۷�[�xn��3x:��}�x:�����έVDd�e4��J-�(�go�x_�?���Yk���J��LÇ�}g��Y"�ez�4H>��������#X�����ߝ��\�����`����8�!ZC��u궬s7����	��.��b� �|.��w��u� ���!\��W�=L��Gu!���L��0�T�w�Ɩj�TE��X����I�bf���V;����j�a� �ė]P?@���Z�똍�?�LY��a���q?����o���
T_엕��=p����P:�� !j�O�d�*�+ٰ&�)o����M��:*-�Ά-ذ���YH� Y���Ҝ1�@��
����i}���|#��X1��\ze�<��\�c�e:��t�sAnP�Xns�T��#��q�bz����+J�|��c��DY��L�l��e�7�ے����:�\h�p�B�?���[nW�o5!�c�%��m�ȭ!M� |-#[���5�����������̷>F�+%O�Nֆ*�ٍ)Ui\[��u��vwm�;o��% ў�7���+
�@H�0��Ͽs�B��̤^�X꼲�$���
�1�3!1t(����H����,�4�n��[�q�u^�T?��g�ۧ�G{>7��A�& ����(�a��Q�1��]6d|�RX*����1���%-
�RI�Y�7TfI����_|�5�}{�����:O�R�u�ւ�܋z	�'g�X��+�!(@T�NH��DH��ia���F�9!I�JB�����E~�`s	>�1��"1�Q1�r_�X����}�����:j�@)u~-�Z&|X�~���=��:C� �1
[.����S�G@և�+��ƅձ�a"#�ѥ �ߥ˄���3y�,�(8`- �,H6n����̷� ����,��s�k���f�v=�N}Ob��ǗӃ����&�XU�W�_�~Ü0��ey?���lX�/�2|?X�J�xS��A|Ky��ݹ�,�Х$C05܀�#���Y�6-��P2
�����J������-�Q��h�F�B���w{P�ʜ>/*�����۾Avr���v���0�Q*����b#ٸw7�fwI����TD��0�r��^���*'�6�^�l^溜��us,��Ke�D�=�wt`�G7�$e+����D%�p��"ֻ7U�.�7�!�թ��uv%l4�!�~�Q'�{cF|eU�{����P3FF+5����Y5�K�
�\��B�M>���N����Fm�δ!ɳP�Z[��#������"�~mw��_f{���_�*�a����9�8HH�x%0���Y�'0_[ݹkw�%��lC��[ �xO�K�'������+u �� '
�����(W�jp�9��#��/��A�_�y��h߶B�r�o���5�����[s>����v7c��qI�O�To�}�R���uY��ǡLd\+�����Jt�&br�O�ܟ5�������|\}0I%d���L�;f	�Jx�=<�ډ�ak�sBq.P�ހ�|��>**������ '� >ϲ��a}�X���.5۸复J�374qBF������f��b�ו� GH�1Y~?�o��儣!0���4Q���ˁ�;�8����q}�N����w=iH�2�
H�|�ia�(3H��G�K2���H#�As(	̽��>Yjо��VL,f����x��Q����L��:�yhFh�XH"[��y>�gԛc�b��^�S�9#P2k����t�M�p���)�!�[�v�-�mRq�!̉L���)?��Ȃ�	���1e>�^N��A.��:�aE��AbV��Q�"b�b}����_����v��*�Q(525G|�6^��.`�$���ά�:[˅�qTu0�᠎�PG��L��X|IFi�F��f��=27e���$��z���a���XM7p�V��t��@�Ab`�8��^�-%��ʖ�^�&H0�&�QV#�����L'##&Σ��H�R��z�\�.���
PQ�t��JGB�H��J'�6Rg�;%�sR�Q��1Ԟ�T�o��l�ޏ��]l{}>�坒2ZjSfԩ$�{�d��S��(4b-��0���!������b|�����N�,�)��� 	��b��,b#t�9�U�*�Ze��(�H��G���y��7`'�n^X������eH1:E��@l�T���عy&%G���yh�WN�ND���y��h�A�IF�����F�L�:� äY�$f�I?To]ү�Pw�e����c��O�,��^h�T���j>Zi����=�����G�E�XXo��˾�t �[-u,4JgE���u��Z|���G����
!ZB.�l��J�Kީ�(��Z����9�T�u��(�����s���»�� @
y�Ÿ(J��T^�2��m��e��S�9����%є�||�θU2���	AK�,��Q �~?ſ�Jq��=��{s-6v���F|�w������Ӳd���N7��a���3$��5�ԏE��B<�^K�x��䢑��SMx��g�<& �����~]�"�~=7�Q��.�h�J�����_�2�\7m��T�|rk0�jҞ��C���w
�?VP�������0���'�C,7�䘓Sa���,�@!��2�&�G���}��ѵ9��t�2p����{_'?Hq$�F��O����]����C�C`2�^d��ij���\o�}�(�v�oSeP�{��7�=�j� ��4���3q4�Vv���\��±�[J@����Ѱ`HE�5�a�gA����lwuh�K���6�zi�料KziY��T��}��t#e� �!���C5��S)��N�@��	ɋ��m{������}k�3y�2G�ո���u�CS��B�%*���t��,ï���Ee^)��o��^*DP���}݃v����խ�2@�    �:�'y��5�7m@=�[�7�*��������Pr=�KD��K k4�xV�R�Ƚ�/���Z�E����3	�^���(<ʻU_��Q�Z���V��p�!���\m������L3�xMi��?u�!HX���b�{��R�)'=�����h~��.W�ݫ���L�;j�2�X�%.�E��$|������r�$Qg4q%6a7������������y?��[��9xeV�L�b�^#����������;S���� =�Jc,�V~i&�WM���;7|_q������1�H�	2�*ܞ��t���$�V�`�B���\�3W�b�_7ms�*	׺�\{��{����|��!w�[���ZY!��j��[/B|vϓ�՟h���Y:��C{��b>�\�.3g�M��/��g�6�/�+$�L�BB��l���ۡ��aa���5Jj���A�,+B�)"4?���p��6�?O�������[l�V#��b����w�q�Z�:w�5�dFV��蜬 ���
t�jGk�>�*����r6L��-��`mXs|�Z�QU��}g�9��%�ņ�����R*�y^y��|����up6n4b�����YC��>k������?������0�Q:�EW�3���6���TY��r�v�KH]S��[�p�(O|�TK"�ßٖ��41��8�����Z��M?�P��j W�P���;uK]8�~��
��!%���FM�f}O�,g"�?CzA���b6vr�a����+��t��i�L"23���N]~w�QX&,������F����M"R����p4/�8A͓~ot ?ƹz+i���8��@:a_���znN}
���B�r
����0�_�����p��*��(���0�*��}Ɖ��R��ߵo�s7.�H�pN��a�z���T��d�ܔ����2��ྶ����e��d*����������[�@&�bS���	�󧑎���yQ�}PZ�.1����!�d��6�����'0��O�-�"�/���%��($�A��YL��;�}~4����/C1�{|�h��B��Jd"�P��_%�;�&�Z��N���%���k�=_��%(��g�;�����|�^��C)� ��Nq�,ٿ�)B!�a(��&`��/Wv<��F<�P6k����ᘤ���mI`���E %!�-E���鳶���˘��:���|��_kK�:�l����K�5��F�����ax�P�Q�a�+�����Fސ�lj�4�a(vD�@�6͢��⒥Z`fz=�/ׯ��-�HN� /(8���ؿR#��|ڷ���������3����"|vx+�KV�F]w��\w��d�-b)�L
#[�4K�]�=�5���ޚl���b��������K>�A�� 0�"��~^Kx4�NZ6�,u����=�z5�#�^�����dV#G����t�nM�0��z>n��7��e@�]�MV��W*+r���Ut�����a������)F�R�K�	��Җ	R���?��i;q޴C8b����qm�d@.�o�X�1��0|%iǔ��	�L�n>|�2��2�g���ǵ>M9�iSډ��<Wi���B��U�w��5��
>ɲ�� 2d��nM�Bd+��ۜ���L�
�ul�,s��Z\Z�d'� I�Ѐ���ݛj���ؓ��scT
$�.��1��Dó�H�VC��Ԝ�8��s=�G�� �2�	�i)@�!R�;E���M,V�4�"q`�e)J��J-)<�6#��[,Mqt�X����� B�F\���gx@a�W�������,X`6�~i�o����|zv!�z�7]fI���q��a$��-2P�+�[jk�,����2�)��2WOX�k`���u�
7�Wd�DR�+��5��x<��>ĸ��­����׏w��UD�L������n
D�� ˱�_���6��ǖJ�
Ѩ���u��]�����Ro<�06΄��f�IX�#�-�.DW���{��&~��4�#��|�M�6Ex�b�<�{Զ�7�����(/��
bK�c�X�4��`��J�A�9��B���8�u�|�a�{��u�����D`s�'��PXr$֣+�T�q�n��\#̀oUb�����l�Xg�V����h�MĲ�q�7:RA:������Ɏ�I�(�(�\�x{�d�����]�,���p�-(��;���,Ϻx'��k3M��T��J_W6P�8KV�Z�= ��Z��!L�>���߯�_ܤ;�.,l�pYޱv��3MG��[�a1�6���1O�����_Yr�7�o|l�_��)Z�䐇3R����5�h�î	�N��I�%�7!�GI����ӂ{�rLl��#��4�QM*c�B|!��g�J�[$���o=\��!T��pcOP��,�Y��]� �^��q�7C��{<����	�snM�OC��-�V��&�}n�n����|VJ�dߥ��?����	�!��R�{�+L�74�qc5(a}B���O-Moܢb;�(��P�,?|���JFs�s�1g��H	dn�K`
�5�[o��v/��~���K�����Y�7�8ŕ�ʔ8�рS�R��_(�M�Q,'q�3�u��7t5�v�V�*a{\׿�OC]���|p� 	�(US}c7<���'��XL�r!4!�ːj�/�ЕE��h����T �����}��e�׷�C������Ǻ�;��8lq0ϿO�"xN�B�k�<DIK'�-���ș�Νu?܇�v=tX���K])��$��u���DF�yJ�]�����t�O)��N�{�V ��]f��� Cm�>�r�$�Q�����{1�T�����Pf�sN�e�B{�GqF|�n�������AB��<�O�uRh�7֝w��89d��y9b�ף���š��K��:ڴ�
��&Ny�d���;��:�P��g)�1�C8��M/>/Ǜ�o"A7:	2?�%�����Zn�GN�����s��>�
�Xr��G	��w�i�(�����ſϕ	�;�����%PZ[t��al�6�g�*)����P����,�=��q��W}ΡL��IeF��H�o�í���|�fz�v쮈tQAsH���_n��o�R�Xt��}�mB�M�Ɯ�D}t��N��٪���]t�5���ڔq�Z�R\��,��Ͻ��G��n��P�C4���(XQ��	��l����.l[Pb4��Kq������ 3Q#��NxOEG��s��D�7^{K��ȏ��7'��ZC�K(��y�� ]d�Z�=�<�kl��Gu�W(:�>7�Z��";\�`�6�^pb�=��C��h�L9�?p #�P�/���
{ݳ�%�4��pS~��y8�ܰY����q9X�/��:�������u� ��ͷV+�����L]I����:�Ϥ_.gp.�d;H+�ͮE�����%�0�8m].�{�:������� �o��G�s��㞯�&�]ױ��(`-�!������;�	"W�)����#�v9�X�JL9��ΥP�`S0Yܵ,���5������\t�c1n-ҁo��N���~��������:Х�CN�z��"S���E�J�e��@��_���Ӡ*U�LGG��ܪ�VH׌K�٣�axf�*�ヵ��2V^P�]s����`G2��
'AT�T����
#�4=%I*-")��b��H����ΥOtQ�<�'����#�:���Kd.9{��ׂ=޶�E@_�_a;��i֡\����=��F>�`���l���[<����C�{ٟ�SD*��[F^��)1�ׇ���~�!"�f6^��]0���ס)�I�q�6�w����׀�X$��j�nH�q��V�)٨v�6��TZ�4�x:��jߛ��������9�
�����]�,�PP�;:��u�؋%#,� ��k���Lbg4?���y���t�ڐ��f%�\㭐��r���*�m
ل�W���9�L�$}!���b7�XpZ�a�-��L!nnG+�    5!*]��2�b���]
/pz]��ݓ5��Q��L���G�4ޯaB+v=��an����~��G���H11;~o�����ĉ/ �w��&��J�л$F|'3��$2�mt�QU�6*!�W2.����呐�iO���IqP�ǹm�~�p���萉���5�<��SH�ݧ��td#-HM[<��M�ތ���<D����R���QG��)a�[D�L#�����I�Æ�?}8|Vz8}�	)�(�Q���Y�/�y���\77��g0xB��l�q��p�+f���_�Mab��P��c����2R�e�!ù�<�g\q�dt�]�������3���i�������ɍ�+�A��J,SQщ�>��l|���z*�<U��gtcEE�M���������`�}�L�iG���H�復!�ǅx��B�.9�;����9���$
��'Vzn���L �淕���r���M�F�� ���/����t��R��g�Oxސ����r�̓3n�|턀p+��R�l����S�0�v��\�� U����-�f"��-���];h�b�;��I*t\�Nd���e�/K�b����̳P`�5�� ���!FB�b�1�O띚���w:50���D��l˟�(�~��6=��h�ʁ�B_tl	jN��T��
����W�&VHi)y+���ݨy��+�2`��<L>;U��k�6�ph���a��8|��i:i���� o��%����4��8�q-:���H�S[��^�伍���≁B�a��z5W���-���nk@%�p�w^��z��'�D�t�z��fҘ0�K�{+�ۈ��S����L9RəD�"U�z:�ؕ�r{��|�Y��Q��+X���ԬU�����0��'UQ���t~�/�?�TK�ws�����ss������_����?����������@�G�"����]4�+)n����a<�����	/��h�"�
;V�J)3Vo�{���v��O�nI�9j#	ɦ�rL�+���W<��y�-���i�.�s���<��М�e�x�Bdh��?��@n^n�Y���Ц�B�H�,x)8d=��@V�~o޿��E 7Q��ь
���`�,5���?��ߎȉ�~J!�HVd�� W�"��*�e
����!�|ṕ8f2��－��2������9�9yy�2�PQ<ŀ�W�����'�;�C�a�[# )�vO��@V����N���� ,���6�sD�P46NۖJ���=������`c#�[5(Q{�7j�\D�1ű�?opj��%s�9�����o~���n�v�5�)Z�G�;��4�L�/߹W�I�rH:L�y�?����̤��XN���+|�|�����榞=B��r�����"�h��@���E��iKwm������Q
R�(�C�$�
�(��H��d8 �qg�^�]/&?
�BB^�IR9��S˽�O�LjN2rd��#$�92c�-�*9���O��Ma�fHu\��L$�hQ�7����9��4��d�R\���{w�r��!��X����]�k�z�(��(��m(�f���5Q��am��>S���mp��@{$t�[C���A�<E9cME?a�o���z'�U+��X�`q���qL�;�{�*��j6�u��௧�#�b>�����2�x�½M�Mm����-'�����m��d�γ���í�Zr9�!�qL5��B�T����9.�@���%����8�h,�'�����zs}j��T�Q��/�+��y�L��[�Qۓ��:&��ȠU!���P4[��O��R�㑃[΄D�/�G�Gjvl��GMa��<�uxZ�n��k�}i����|�νi���(���T`�h�pDZ�#������X^Q:��dے���c��l;���*�I�'���ٓ4+/4=��3�����vײB����
�E�煜��5��"�S*7�`�Wl�t�KWm*6��)���9{���_���>E�i�U@��`��nL�#�1Oߌ-\߆dd��ע��fI1/�3��ho�k+oD����u"�8�-��j�MzB�T�7lMn`Mψ#�/k��v�9�a�Pi)�fB��j	�L��4�V�w�}{�,~�HPg%�v�q���Y$������]�74�/����>�Db���W�F)�����u��)�m��RI�x���RK���5���'DI)��Ґ��
�&go�c�i }fv�@�����i�d/��#�1�s�i�R��W3��.�\�}�~L�Z�-��+ 3��!ۇrn�~/�Eo�$(H�Lȟ�hX�s�c�ټM�O*���1�6O8���6Z��NX]C�l
�wJ���[j�֤��1�u�2���E\�3z���������/������>�4�}�[���h�jim�UC،/�=�I�Ƒ�Å9l׾�ѱ���	s�<��h�!�iT.�e�ra��Ֆ�2�+�'(��+��Ѡ�,��aKw�D׭`h��)�'X!�B��	��A�T��I�a�����!���C#�2b�(r�E�fT�.d�]��iF���X
��_$��X�C6o�_ύ�d�ˌ�E��BS_@�:>��1w��q��2�t�p����C�x�������c	��f���Ջ�F� \G&I�c�<)2�;-d6�,������-���ӳ#x��~U�80YS�;&�S6E,߾�9�.�tr�Bc�73�c#����rR��~�KMN��dG�=~���܂����q!�p�<Nkx��Np&(�T%����Nr�������H��<��9]n��(퐋V�ޢ"9�s�J,�X[��_�h��0�8v�?�K��^QɅ�v��� �X�ƪΌ}k�S��wdA5��yFE����_����-L	ܞ%hE��r�����9�֞��4�f�a{ų����T1��ŝ����]Ϭ��o�N�{Z��K�7>9���I5Z*�n��]���K!�ւ�qJ��s��w�§.�WXw�����1��B�+��F]�S���d������i�߾����d�i�QQ}ߌv}�����[�_5�`*���\���X~Jh��; ���F�<��,x�űX��[�h�q?�����xe�[<]k=<��$��� ��I��`2ԯ�s���|f�ZŸ�ݾ}vr�����i�����h�,N�#RP]�mni�[��?��Ƒ��_�.�˅���ͦB�`�<�ۧ�;�5�")-dNǾ�#�)�W
�>���=��1l���k��R�oܛ�.-SA�Yz0��J?��E��w$�uC��]8^^E���g�[��_���v1��i�;;��su�� ƱcU����a�|��Zj�.��/s6(80j�/O%g��!�ly{�ߖ�Mef�izNe C�άʖ�x�2�g���	L�,/�ψ(�������|���ll��컰RO� CR�aT �u��u.^[=y<^����,�bS��&���5z���^�O�&�fi.V���";!cZ�n�z &��:F�[n��'ʦ{�����\SzÒ��h�����,C�Z2o�`�(�4DQ��c�.SO� 3A�{d���n���@uj��1���C�*6@1g1���.�?�2_�kH��߶�@#�1g�j�(1�,jQ��&F��_�p���	�#7D_(��&��w(~��NY��� ����*\���{9Ʒ�?�Ȥ�2&�nSw P��N�$�r��k9dZd�ހC���I��H�厤i/C���g���#9��<��Yz���)�k�®f���}=�3]��AK�%���O�9H��@]�>���[��G�J��f� ~9�+H{��7}��t{:�[���ix������s�`(���3^׳,'<s�ѼB����*��v�x�Z���jT��M4�-D������c��Ԥ����~�|�~�O��R� ������I��z�f��J��S�q��l�~aeVl�C�d����	L��n�����jS<msh��s��=����8!���������w    kx��H��M�l�:C������)��(U*'�r�~��6-4��E���vE�C$9�k�Z�Cj�=JZt��r��=ު0�*Tk�-;JCWSV��d�=ҕU6�%������9a��·sz�$���]ש������E��t���?'����qu��6+P�Ȁ���~Vz>��o�ڼ�s����A�׊N���IP���J�ܝG��Ь��:�UY���[� y�5�����6I�TO.o��G= M5�LE�g���*�J�;O�W���Ƕ(*�#��'Vvtw�wP]5��fm�g��?7o�c�S���B�V�\%������t��_��]2:[ey�,����Ti+�K���쯸��F;����)��@Z�LW�\����T{y
!�Y�Z��U�����V�9�l�]��éUH�T�tC�KL�?#�����z <���<������s�o2-���ݪAB{�j
z��)"+���ج»� wQ��b��]�s%�%����xKHH�*���A��C{|�H��Z���9W���(�y!�ϳ��n�̧�-������9�m�
�ͪ]������mym��w'D��pZ�9��КqME�$$����ͷ� \"!��e�ou!�o�m~�ji�s:�~�ߞ0�kw�c�f^�`�ī�6�s�Ɯ����q JfrO*he�UY=��Vޚ����r��&%�^�q����7 �Wf*�ͧ�SN~Dh��,^?�M@�s�"��W���zNѸ�`1�V%��T�nT�Ix�n��)������V�[�a�]u���,|��|EpW���'�@�niy��=�`��Zh���)��z���rm$<��(�;�f��P���.��~K�|>�߷N�|	�A�eP�D�m��̶���|tT��Y��+E�0��3�*v7��'+��NSw�s�
/g"P	Tc��U.�#��x\�2���UeC)D�
>�(eA嚭R�����]u	k��+�3 Rn�.3��'B6u ��N�G��v:xO����%	I Ǖ~�4����Fg�dpnٚ]��>�_`�J���ᆲ&5voj2ӡ1c�=��x<���EG��9�Ĩ��"P9/F�h��ǋ��o�<1H��x��hY�FR�ɻr!"���zDB��=]���Vn/�'������[{�FS�fؗ�8�v���E������d���r;N$�	K��{-2�^��o(��^b���F�UIb�!�0�>������Ҁ�������<}c��H�/�X$l����[e����!r�����+f��jd�N�T�jX�#�Z�̻��$�r��ʍBJ^m\�Q�q[3��!���"vn�oR�C�tN��9�/�?�G{��ax<��O�nd_�=&뙏p���6��F���U�k�m�W�O~��&���QS5C�����H��/��y����}%��pU����*T.#V*�`&j��nY��5��F<��M^�_�ϴȭ�ʲ*LIRB�36?���afT���@��-tY9w����B\�_�~q��&�v�mN�v߯����Z��&��]�A~��Ý;Qǎ킚��YD@�v�`5��i�f� �H�����SB�6���q���?r`.6vc�8���w�פ��X����d�P����f[�&���l�e���7^&��hq�ܽ�?��c2'���r$�Sqe��[��`�H��B�XR2�P�$_�-�No���TNb�Ts�	��me��_r�Lק�u��	 �1��xQxx��y����������j��D��l�O��WN�C�Pj��VC�$My��=m��x�s���� �r�֒��q�W��)<r�R���%>j�w��UxC�
_g���:>j�XW���&-p�]l��)\ղ��+����]���%b�V�֪LE�^��F�����7�9Q��G.vSLq����Fԟ��z鈐��H�k��%��3���'ЙI��V�D�-F�R�e�z���]h#� �#^�o�����'�#bv�ʩ{Z�\���Oi@	����uw�S��.w�H��B;ŭ2u�s�y����2�}W�Shr��Ӎ������o�H��	�KK�-�Ĥ�f6ѷ���Y�s�a�D��.�^�}�����m����G�T�"ŉ�h�/i����8�n�_�����r|X!�����pBv�m���PğU-�-�g}h�U{Tw%���,'6�sY��C�����t���i�&�ÞN�n��m�sk��<~u/��aLu u{� �v�f�An��gX��78[,S�fa|�C�I��%�k"�<��S)݅L36x��[R�UtN�x�����	�]���<GS��s#my]?���vc� �����~�;�S�#��� F�u��}0�!O��a
˘)�Sw����؋1e*=��p��FMon�����&w<zq	я�ev�1@%{p�-��&T7�����g��E�}D$W&��<Z��u���q)*hZ�ZW��y�5.�.�R	��R!�
���]R6,���e� �U�ym<�Ƽ{22��<��'D:�rd�`ɞrU�6�	r9g�Ca���t�o��.��I�Z�Kp��+[��ҡUiOh��y��S�|�~i'��XG�b������u��r���n�P����!�R��ŅDTȒ����ٞ��G��P9��z|:�MA>�>*L�d|�0�ڴ�}8��b�#�6����^��q�:V[�	��'�к"N�T��d��I#I��2_yo��g,,J�ѐA�=6\�?�]b�<�2E�
�c�K��?-c�"[7�ےu��Z[�y��9b�:.xǙUx=�������Yyy�!�����:!L�*����G�����~�L&�`C6/�ۚ c@�TYi	_>Ѝ�	���k���D����(�>uZ�z�'���׼�Ίʯ8(�dy���K��"6�u�#�JXE�F�B��ZE��4ۈ��;�^�����-uBf�Q��s7�bH��(��Ϊ~k���q6/�N�@ǹ@�jE1/�� U<����(�G��I��HNv��Z<\5�V:��y�4���vn��sK��j0����ąN�3��즽�q^�R�;Ƞ�"AjY�<h���C���̣���lH�-5���_!��
R�f��GGn�(<N�T��w7e�5+*N�@���0���A��
�G��RpwB�	�\�<?.C3�~�e�/��T�R��s���E��K<�iOv�������6�tE̔C�.��씏i�n�5�2v	e��f|�)%Dq+���I^P�� ����8����"%�=#�|WWQ�s�Zg2ћ9Z}��v<�sT��qe&�f�E��v��P�F�`8)#Pp!yA �?�Y~��=s(��K��t$w��sdHs2tU�H�#��d8�I�X����f��E^4�b��%q]�����0Q�;u{s�=�=�s|�8NI�+3���WSO�)�chV�kGd�@:^�f}ث4n6cn���-��ȍ�l���Cx�;f�����܃,�ΌSc�)����[�y��C���S������s�:/�x�ڬ9���a$�'�����9W���A��2ⓔ׍���$c�2$+3�Yj����,ui��V������yS�0ޑ�Iym�W�#{�
��>�x�`hN||�*|r�b6�k����+!����ɭ"k��'�
ò�BmSv	�@u~W<��xm�O�u\�1{»~'>h�#n�hoG�_v��Q-�a�a�'�3��!6�X��k�D�pi��rO�}��pw
�[p���Y8�T]�N1����VN��V�u�����La��BE�q�T8RP�+(�*�`�v2B����8 �Q�M�F�Y����h�e�9�����j��n�.B���D�ڪ,���i|����Á�gDY��"���tU=��'O.����w�=��p2�3$hd�VD ��fR��<T�K�&�y9�YP�9��l9 ���u��ܹ1�A����O:�7�VT�j57��wG%�,L3�u|G��,��jkHWp�l��.��k���a�&+�y�+����C�����H�{\�0��H�OXv�N*�o    �{�~����B%T��i����%��W�h��rAeǽ��h&)GZ��cZȊ���Z9G�E"�+�����f����B͐���)����]C�$4n-D��];���M�r�g��u��̑��J"��撴������/�f��*�r�ߚ��T�0�s��IW3�J�n뎖lHvm�"��������q��'W<%MCTEΛ\vS*s�l�����M�/��Wq��X\<@*�S�f��o���W��e��q� ��xM�oS dV� A���x�7� ���e���~Օ�9�yjF0`���h��xdt���t����IB�N�Fƫp�|�����?�E	�Dg5�<�`���=<���j
_ú@\�2�D'���|,E�4os�������s2�2���j���p'P�9��*�m�=���OlT�!�����_ri������«®Z�h0E!jC �	����2h��F��RG����D����q�~~P�5�QTT�*���mN:w��+Vo���xTZ���g���"+���>�M������KC�K�2-.z�_��{����?B���h�K�霌ֆ�Ƹ�T.{�s�s�$~���V9��3rjG�WL�q/Q߈c��q����Cb�`w��zLv*E������%�9Es<��s��k�]��j]��;O�/�;�b�U'�峼_�=Hkw��T�LNp&�W�'�K~M]�bܶ�K�x�!��b
i`yR�p��Qr��z�K+qte��������x��üغ�ŴjՋ��E�����֠�b"rf!���8᧤��f�|�\��$31�Zm+'/;f����dI}0��4��mO�C �fMB�'�� K�5�K4(��,�q���pJ�ŭ�w��{{h�b�HU'��8P��L��-�t\��w	.ы�\r��!��zG�"QXSqY�a�Iq޳g9ѕس��V;.�<[{�E�ut�_<�6>Z��UQȈݟ]w2�h �!U�+���b���R�_�V�dS�@@)�ƈ<���溷��"����
�+SءZgd�UA`���,I�����X�kH�4�V.O-ZJا�0��+OԢdj$��K���
��Q��4n�y4�sj��yr=".p^+]�˒t���Ǎ���;t"	�V �A Y;�PӶ��\w���d/l�=�+T���d�J�+@�1%QYQnS$/篊�6��Az�]��o�ZP��k���M,�*�+�?i�'�ΖJ�@11�]4c���]{xsK�/KF��Mᓩ�uO*s<جbr�����VK�7��qp���i�O?�����㥥�*!��()Uj�ӣ��9��ES<C��a����T�$�0�?_^�����x�f��@f9E�Z������O�3�O>#��2i����|�Iq�~>A	U���|v���֝J�p�*�dT���,Y'�C���I*2�I`I���B�(��y����QS
,�	�TX�X�f�S6Ɖ,�9�y�>�U�_s.���~C d������rĽ �kMI�1esd03��O:I���î"'�%s=����f�³n�8xچ��p�Āh��
���4�i@'�č�ٰx����*䈜��	�K;s�9̶!�^���8��^ ��6�I�����kB�@�U^ԹmvҒ����S�J%���صXr�� ���r']��� u*�~1`/da5@2���ߤ�U�( ���Jo۠����o������]��V�]�h���[��G���P��`snr��?"�Y$�D�,+K������+����te����4��!�7���O�x~�ߧ�U�.�b�l�8И�YO�����T����g�Nxv���=h���S�<ݻͮ@} �-�q:�G�M��0�Tk��gɹ���!{�������� ��с�Nd�Rd���v���;��x"'�X�@W5]Ƣ̲��{
Lf���X���M����4Y�!W�t)Q���~����ϣ@�f�	�S�n����AD�Ҫ�Iq( �W>�t�`\B�ܔ��ek��U݃ܲ��r����W2p��^�����I<�JX-�/�?�]fY�u\[J�[I��č�aQM��ל]�乇�	�j}[O��Y��nǤS���I0�$����%����k:��9���JC41Y�[��W�-Ҥu��|���s�s�����E�OGM��s��D1K�[�B��\�����=�?�
!o s]�Cni�Mm��ewq���D��@O	 ���@w�+'Ź��o�C�tk.�IW��^�W����i��:S~ݾ:��>fs���+ʺ<��f���9z��W�P�	$x��\r̕Z�+��j��'9����2KH��@��&s����nT����p ������/SH.��6�ȍeSd����;��U�~�����}��Q�,&Q}���('�d8�>3�g)\e�fc ��̦�f�{S|l��+,�4�8��Q�Ó�;KP�J����V�EH�	�TzI�{N��$���Y;^�9���<Ѻ`�{�a�V�����F#�BŠ��c��MR���YМി���,{5��-�켡ݡ�.�]��h�U����I��rE{�6�C�Ѯ�y� 	������h��u�.�[�K�
԰:S����)�?�N�:���X�2'*[�`ٴ����Ì����JCvq�n��p����.d�5.|��X�;7�g���v�������9�t�z�𘷜�}Y[�3���'DX�W�g����n -Ϳ�$i4����ʵ)9�j���VA�����{O�+dz���p�~#�Q��&֨���)��?��]��'Ez��+�)�rSM��г��k����EsW�#T!����Lv�tqQE�@�:��������X<$/M~r3g��{BZ�.	�E��- ��Y��Y�%��o(�Ullk37�2*�z6��"��o!�Y�=�%�PJ�Ap��U�xm��h��v+��z&��*�Y�Y%�岳��f��#l�D~P�*M����$�2�fh���#`����z��l����/��p���$t�iS��,� K��HC&�zIrڱيc�%^ɘ��y�H&A6���T\�*�C�f�3�X3]�w�ǄYR����!R��(�۪�����۝�׾ޘ�d���-��F|,�ߧZ��0���98���:g�ϖY ?;f������ᜡ�E�K�Bl�U9�-=9[�Fɧ�'H��Yg���-�Bi�TM�}���<�D��p�`�Z���盻����p �Kǉ\�����_Y#�f�w#�Iv-)ܸ5eu�$��r���;����&���T"��$3�t$�?�{18��6.����H�)�9N���~H�n�Kւ%T
��gAP�)� ��Y2�KR���`�z�[8�P#ྂc�AH�k'�慢�f@��e�f�ӭ��:z�����I�es�H���fJ|�jū͡� G'hW�:�I�eđ�T\iE�uu<T:�������FG"��\
��|W�O��2�E����T�	��]����r<����U	���uviA���i9���phΧ>�E=��ܥ���:ne�_�g���1պ��ᙟ�qbC��6�k)��B2]�H��X��!�%�,\���P�B��ia�Pj���)��.����+d�+��k��%����#��ޑ����=um��*�F[S��Tj��U\!ȯX�UG��X>�/O��ԁJ�C��T����1�O����~����&0E�*\�57��In|g3������"i���k�m���'��=>C(��^:].V�#��<{����&w�7��p9i5��ɋ��[���֠p��+*�8�B����j��u�ȉL�����O��_E�ݸ�v|�zo¶���4��}sv��-��b��w�� >^���B(�_%�,�㻑���\o��>O�>�
�/��~p�k��������x��?=��?�����_��_�Ͽπ�u��U~i��n�`U�i���7wx3º�1��8"?R���zg����'�N����l��M8�=G"X7��`�5aE.�gL�5�wQ��̀    �J�º̤�Ij��g�����B���H�ݯ_�&�:.��.��`.�/6'f���/���2�M��U?a-���e�?i�'w�|�I�/j)aW\g��i�v���~y|m��ɲ�8FBZ�K��&��D���O8�0�t��!���%8��Yؒ-�|��ZG�ّ�t��V�h�Ty�Ľ+"��x�
��ip��b� 7WY��ɍ�I�ܶ��=�vg��K��j�D�:�{V�͡��]&�"!��z�.�$�K�QRr��S���v�}���k�i�|�\RZhH*�noV�Q�w�>p!�j�鬪����i��o]���;����Sy������H�����?��9��꜄�"�K3��J���3��Y+5M��Ӕ�4�4�9�q�LP��
F�c�۟!!yn�
rR�?�����to^��3g�da�3�b��������j��1�����Y��a}2�w4��ϣǬо����7+/Z#��Tl�S��.O3kt�I��w�_lq�+�k����a^���-��s����(K��HIdt*�td$�M��%JpZ>^�Վ��������
���`nq�d�m���A�q��}&Ri.۽W[�s�U6<�C�-��q�sk�M�t�6�H�:�^=AMZF3�52tq'�ˏ\Un�a0��Ád{�X(����$����d���^a�Ԡ@��C<r5_�bϨ��?�W�_���2���#V�XS��݋�"V�������b����ߝS�����;���*�%�P�+��`"���E�}�⍊��
��*U^�G��Bܛ٥���I��`���zW��3��IV�1�ċ�!fP�Afm*"E"�</���\�T_KUEi�/��_�ZMJ!9�"!m���C|{CX�V7��/h?��!s�ZUW��
OԘ�a<�Ll8��t�MZ�MT\I���<�/Py�/n��R�����t��?{�r����$/ykv�~$!(x�2 <�k��t�)H�hy����qfEc%�,n*�36
���M��?<��5�����V� @a����<�'�&lsߚ���w�)������M���33�k���J�9�k�T�OԲ;����w�D)����j�	XS4В|���������ܵ���K;�]�%��DA�����!b���Og�"з��|(���o�V�$|:��N����$ks�A8���F�\��a�Ylx���"��G|ۊT����L�^�umL����_ ��\��n_���͠�Pv�D����bop�sIV�ƽy��[_�v�ޠ��#�G�
]�Q-囩�=�5�Y�yBw������2����6%��rT��!(�
ݫ\�aK��l۵����iB�泋|SwQ��v-����z.�b4E�2�ox靓���U��*G�a큆�j��n�7�`H�����i�]A� ��^���A�L���=l8�+U��<�O~G�����)���q�X���Ch�ЇS2�,w��a�wT�K	����*���8�-!��V��*��U��J�#P"pl�!��"�)�r�\�*�f\�e�D�:8k�1�I3�>��tbJ�%X�
HD���Ҡ�y����~m��/{�H���Q�CYȔUU{�F�U��(5�pבM����TM�v�33qb���]Լ�����á_���3�n�$�ģEh�/B'��y�tE�6�͜bC��D�\�n�ߧ���^ʕ�a- s�c�!U��*軀�W�����%�"���l/�>5�Kkt�5:sr�D�v���\B�+��v=�G��fM;���!�qW�1��S���KK��~ֽ��ԧ�x��ul�Oo]��!�ӜQR��V@�rx2f@`�'�a@e�&H?l)���ؒ�|q�	�>��ٝ�tW�f(�ŧ5>s��z:��O�p2k<aaiσ:�V�s����7�$k�5�6��`�x�_��p�)���Cw��ф�d&��b��ty;9ˊJ���\h�2W�
r��_�

�	,R`�7EE�Ƙ�g����LS8%#��t$���F�*t}X���O��O�JnhM�� @b���.z�� �i���E�GY��+߃3fl����c����-�#���ҁ�WT�)����3nT*j�EB���f�������tg�O�������|�� ��D-c^J鵕v7�L�+3ޕ����l��xZ�(�l֋�U���N'����L��U�{��B��9��w�s�6�s	��i�ĮI@��NG�y#v�.�;_��7�j�Dũ�4�xjˉ"���8�"�G.L���~*g��N�$n�ԯɠ���f�Ⱥ5#�5<���y�C��ӾIi�$tܭ�$+=���N.NMᗄ�ּ4�o��F�%�
H�ʄ�i~�?T󓗌�viJ��d|c\�jI��*S��=������B�K� X?�%�{�����<�
���R�O��y{گ�kkVnr�3��A��Ѽ�	]�G7�9��)�2�*(�6�MUp�1��Ӗ�u'Lo�\)6���9~\>�ã�s=Ɗ���������;\EU�*Z�����Vy�)X���?�WA�2��;�ψ�� @Xǆ���$(�9���
2� H�5G�ZiT�$�67��g�U��[���D�]b8k�a��� x=%7�YH^ �D���4����Չ�/����lA1�U��ȑzvi�9�yv�)}AU��+r�v�E�/�|CPZ�!rT�X<đ��%-�1_�T�	��y 8s�&����E�'z��;R_�����yn.ͯ��RÞ�ё��Ж���X�x�!�3������$�ן���a�d��Ɍ��1��%��%�O'��n�$Q��Ƣ���|���Mpd�+A�B��K] J����G�E}>�߷nΓM�����q�� �x�10>�w���IG@ʬ�E9_h���u�pK�\�.
bէv�+\^�߫��Ɣ������X�	�N����p[n��$�[@�s�Xzү�'Brakz�LD�
�y������rJ����?Q���Y�����]t����=pTԐ��l���Ґ��o����o�Ʈ�Y�S�V�E�*��s��"�'?�x�)��UV�me��#�j:"��x��#t��"���3^�\N7���9��ȴb9����/ �@�Ĉ��{x�WNj?d���H����UKY??̃�!w]����t+��dO���@�!�j��E�$�r%h��y�iv���V�й�����"����� �ȗ���b��P� �Q�:,�;�`!*Ѫj��_���Tr�_�����/���ar9��ۊ�,���Ct�-��] ��!9���
"�x�Y�*�Y�K�������Ô"���E��Xp�������E�W�Ҹ� �R�<�\�F�p
)�Gh���O�:�i��iw2�x�:�ʭH�+I�&�mu^n	�7v�3��F�/�M�����.�NħF� �a\<�%UX~f��	�rK�u���h`��1�vw+���cU c�s�ir{+_��5��񗻐̱��Ԗ$YF=�1Uz�;���h�!�z:��j�rUy6A�M2���HkZMrr�����xj��^O�_���~�ߜ�𶔁�Ĉ�����_�a��&��ϖ�J�V��(=R�vݲ}D��!P��j*U�E'����z�ᰐ�����b��}r������9�/�Nto[\�w~+���s�.�c���wE��+$M��2ɣ�'�q9rv�8���	w��q5��fʉ��aEj�=H��63�Ë?��b/>T ���V��f-�<�gG��j�3��P��%#�E(�i5HIб����ne{�~��$A����Ψ�H��{dW����j��wp�Nd���s=yᙜ��祥m���l�c����S&�<#������Gv���<��MK�w0�����u+G���^�f3�l�:D<����Oc�8�%�ﳺ.�qx������a�1a'<O�+5��lVl�����������w�ij�S0T"oD����bCك�Bb_u�l�����e{?�5������J��H�4�U@:�'5��3�r�    ���5xǺfR�K�x�n�z��5�Β�Y���6�0Ul�(Z�0�~g$\����))��.R^�,vD�_��vZ�Y������6�sZIa��2fY��Ɲ�"�)T�U��tf��'����h��7q�f�ڶ]���Uw�n���/���{�@y�#jG(l��U�ߘ��n
g�l��TVj���q�1󹜶6�]��ޛc�{i� 
��p�_*��f	�jD7��A�[����Z��ʗ���p����$��O7��D��;��r=���,�2�d���+����x�͚7>߈dl��sT]�lhՎ�O��f��]w��/���AZQW���k�?/���1&�y����%B�\��	0xVP��hD�n�=`��������i2Go��k�J�l��7e�=`nw~K��	��3|G/-X0^�	�
?-KY�	���L�Pk�����b��J�6�J� ��x:;������#T���а��7p�F����W�7Օ/��X+V0$--�Y9�ȵp���R�C��ꣅwkWx ,`���l�ى+���ҽ���XMj���
g~�U���f)��E���		]�W��ц��Մ�r�	�S
|��,�'�9T�,��rzõ�-vO�/�.q;�x|�B�uƹ2FblD�܊��\�U��F��9��pU8�� (j]Ʉ�zjz"�n���$����H��O���o�ֹf����F��� ]h����%��4���[��Ί�O	n�ï�`��s��Ӹ$�	�69�㡂��ble�Of+p����AG���7P��ڟh^S��g� �
}'�� S�߲k�pVe�G;�5��'8U^�՗U����|��Yb1[���t=A�S^i�"$)4����ݖ��K�����!V����9,��^�=3Ȗ�nC�i�D4l�SY��ɦx��Ӫ"bmV7���/�@x���59�mt�b�����Ы��?Z�#O�it����.��[���)���rR�}|-�u�E�J+�$��{����"sf�|]���	GF{�:!�����4�{>[���C ��	a��3���;f��{�CC�������I�hXY^K�+��h*���I�xE3���F�,.�OFg�X%����S%�H�@�r�c��/\�^o���e�<K ��z����2��dd7�-�AR�b��j����d�І�l%Û�5�{���.#{����W7�w��� *z"#�f�f�J�M7i�[�-\�Wn7�\��w��zh����W�{"�ʇZFK�XA�*1Z�	�xbciRl��õm��Ǌy�2u�.H�������/���!1J[c���R���?{�eEVh6LDU���?���_x�PۚC��,%�yÇQԳ��Ι\��ل�̲4�	^Q�^��l����$��H�
š��՘���`�F��q����q����4L��#[.ȕA�T9�ǩ��煙k bb).��bu���ά_���S�B�s�4�;Z�_�3�C�����jju�n�g]��D��0�� 2�йޓ���#}�J��D��Wm��@e~D���z_H9���kq�˽�� +4ri�z��=X;r�:�_Ћ�x�#E�\ʜT��Ȯ��:��{{�B��kjjy�w_�G�%�ȟy^u�(�R6-.!ܭF��*7����ydɊ��=�������y���-��s�8]U�L��]�6��������=��$zm��,�@��Y�b�u�;S������hG���׾p�މk��a��"e��:V��t�>Z9�yT�Z�KBzR:C٘�5��kIb��=�n'4\.��6��w�jh@�����$\L�x��7�O�4����9�ݒ	Z��YB�Ԥg/33دn�p�o�O]q6-�C �ae���n��Z��,%q$�uةKG�p?��x&����ߥ�7Z��|�i���j�#�@�_�"xp�	�x�TOmc"�G��viz��	���j��m���Prh��[A1�<L����#�:φ�y�m��3痷f�`~,"Ċ���i���J|f.?γ���k��V\ɗA�����:�5�e6W�w~��z���\w��{<!�e��2��V�q��FVN_����H^&^/�2���-��Ph u�o�g!���]�jAp��8�W&˝R�Gq+��C�9M��)y�W�D%]C��B�@K��I��"0X�b]���Ji`����3p��������;'i7� c2�B��Q���Yȏ[��k���
��Df
W���@w�N����s�x��'��$*��F�8鶽�%<����<��M��6�K�
DA	�KV2���t 9Wrb՝�o��Ѯ^D�dm'A��m�/2yv����ptPמAf���-#��� Mx��]�1�I��D킻^w������9�+��������,ų�h��S��Rp�m�i���e�L%"ʅ���5#9�)�Վkl�9b*�I>���ñ �}{�@���s�Z4[T��-~Z�d�Z�%�U�lի[�1��e��a��wv�Њ�pO�
H!*�"�j'�rn���ҴdXC�3��/r��7�L����F���\{�&�ʮ#	�as%�Q�`��d�*�����e�ם���>�V����<CN���!��&o�0L��y"��
29a���H�i�M�F��&�8�&	c8���Q������� �~�A�66�)
%��$&*�y*=�t���*���#T7�N�P:Vq�ޣ����^�=�'^����r#�y^�����py���r��;�h���h�+�1����u��~
]���M*2G�&I@��� ʩ\�P�A�M{8D���#�K.�F)��4٨��ΓŹu���V<�ѹ�AR���z6�m���4ح}�����)іH�&�6RrKH�\i5M�ڹ� ���
�~���-Ǌx�3����z=8z!!M�w")'�+�l��^����*�h?B��L�(�M�����x9�P���W�U��#�H
ܡ[�|���1ZN�������Tg��*�yC�B�X�(*�Q=���#�]�#I�,�5�+
)���4�=�p�r Q�k��ňp�)=-�.f��p���=�j�fj�jG�ts��2+���}�{�i�����n�S����1*hh��fB'��}�sҿ�3t��F���/��-++Gż�������)7���Z�Mt�
��S���v�����Ite�O�KTz���b����o�B�x�� pڌ�^�9# 8�pgȺLU_�g��4/�-��#JW�OS����G�tG���s�mL9 UN�̓<)CˎޮO4��4��U)����Ӯ���C]	^g���(����\�}8�@L�����^��S=�� "v��i]�~��Va젆Y5���aG=��P@޿���Z�GK��J�0KNt�~ۨ1}�&�z�_�(�%����G7��S�h���K��������6��Ś,�03���U�i\�����[ؽG���rE�܆iE�DRBp[�)	F~��M�Z5���8o�	-S�ev
c_�R�.עp��W�D]��*��H)L�Z#ok+@��9 L�Gv�$X����	�-Z�P|���$̼��GK6<&~����3sMZt� �f͆�w����qݞ'9�y�������r�rG?:ȡ3�He!0�`����U"µ����O��1�Q��]��6L<�@��q2�������.�ۙ\�Y7L��K���״��9�1劵YD��K}b�>6/��������~����%MR�k:yYa�V׊����}��q����d����k&x��)-<��~�\��EE��-	��'t�0w&t5��l8ax)�CzB)L ����Sd�V������'��^�)�Y+#�WI�t�ĩ��$��[�S?krLu2aKil5S�J�V�@���7!/�xK��6$��d��������4�?��dt�ZE�tʉ��2��ͦb_�o�@��a�=j<�	|Pk�"9��΍��K�͌�4��BA�+݀�"    ��X� ��;��x�kAH�M'�O���T ~p�0�����C�&I���Mz�n:�_lobz������� �uI��e�K��n�j��1��}i'��.�s.�`kPs��[!M�<�;��Dr��4q^��X+�C�c8_˽�R=�<Bn>T��$m%ԧ����:�F7���@cpJ[�2�j�*ͬ��x<�ގ�g"-�2�o�D9/�W��$}���y��:��,�(F����~X�k�Җ
����;��d�@�|t 3�ӱ ��=�l˜plI $�%�G�s*ʳ� ��<n4}��7z$k ����Ë����~%XS>N��7DX}V����w��|?��olĭ�����>ua��}etH~A�#�*}2eP�O!)1�$Z̩:�b4.�øpl�g���!ZYWR�PyPJH��z�N.��AtS	��a��OU�����B�_SX�C�������� o����&��Q�Ls1OO�V`�;�}�]9\y$ن׷�2��r�~5�uQ�vV�[V�[,Lc�](L���"/@Y��lvTV��ᰥ?ϼ��|l�K��ZN����Fj��ӕ�ҋ��	�՚R��C^«cA���#+���$`.<ͬ�L���B���,a�K�:�Z_��O���q��[�t/�O O��P"㨃�CO��U�s�KN��:�*ߴ������(��1O5+(��$N�%���պc��!a��B9���Jg2$J�>�}������$t`�(���׺�XVC�q!��]��kW��,'��wJr��l��We��I	�p�I��jLsEY�d�ҙ5��Lgd:�IH�{�edUd����c¦?ut@�;�c�d]CIV��Nnl6*u����N6ӹͰe(DO�jt��7�4�'p֯p{1�>4�Y���i�'�z]fB���ItV.o�E:+/BJ;�t�mMN�R��To��T߯��
�ǀ��u8>���(^���x�aISz�_+h�?�n��LP:�xԡ'�ݢF����H��J�ŉND���5AhJ�X����.�}��1�����/V�i����q�L8�>�*�K0Z�~&�x��k�[�`���FQf��4#)\� 8z�6���Up\T�%[��C��<t(���'��xz��vA�L)�����ߺ�cb0��V�~��$��a���tMD�0E�I��$6ʻh�f���
����/:\�3t�D��T�#�'�0���O%$��^d�7H���jIYۏ�ZfC���~����.�8�8١G�=Q�|�5O�#9N�N�s�d��tU)����/=i��j,�ֱ"���c\{̮[ &���ū鯤�;�����-5ߧ�:�K�56��*>�zO��`������q��|�6���R�3?�%��%��"-�H`�����0�M������ҽ('��Y���޽��
��~3a����d�OdSg}��R�c9�:�[7��n��qY�/�{�n���������_�ww�8N���)!c��W� NS>��L��mu����_﹎=�߾��7
����r?��# �A��kw��?�S�F���uK?��Y�4���!VR�7k��� ��c�7Y��[��>�?`����VA
ѧ)�bK�q'����:�����#'B�B�l�p���̍Mm�FA���]=7aЕQ�/R�1o=���b�P����~�i�{P������X�^���±F=��9�X��9 ם�xӌ�nX�ua�}��ݾ���WS�&,�X��q�e&B&����1����u��:�w:��w
��+�z�Rė.�r��T?����R<hMH^�R�z
���ֺ�m���i"a�V_Om����MOp��`(� AZ�!t�R��3	z�S=3�+.��(D\� `�S�6��)b?�to��������r�T$\���h1m���(�V�o�P��n��-�6ϻ��C��<O�d�a)��G�a˦Ȉ�_,?�<���SVo�y  �r�+�d{�j��.5����4��K�Z�3��oQgJ'LHQ6=�Q���-^촥���5�J�N/��Bq�z�6>nQn��c
	�>Nc[��LF��D���<a�\�liIN��.��I�jZ9�rV�A?�q���r��Q��h��M狦3�t���X~���4�AU�߳lB(m�$������M�B��V���㼘����AV�
��U���ܾ�$BC��xڽ�F;^h����MPQX��4�qU�[�S&���zx�Q+��� ��D0�������7��/}���h<�Mz8�Fp^\}pqzZYMX�{��:+�f�C,=5�����{$�s��F)>��
t�j����
�&����	�{5�k ӎ���*���E��?����(Ɋ�9r��B�$���P��X>W�ۉq�������"����7�&� ���7��L���V4𓆃~jϭ�,��c�1 �0��7]5PL(�VX1���V��{BNC����٪�0��8����Ge f�S�y�����ly�/���Xv��\$Q��dt픬����Q��2�-_\0�<�j�)���s�x�!�=f�����Fz'�"���u�o�i����G�-�t���blq��Z��_�
��ק�:W2c�ޙj�`���\蕿����=n�ۗ;&�s�<��O����HQbQ��3��.�6A��m!��\����Wܵ�����ؽ�m���\~����	��uC�?��8G��0گhD�[��	D��t�&N���A�˅���^{��O{���.���;K܄��@{X]�<o��"���]ÜV���$/YM�r���]:/e4���@ܒ"(܄�R/���ä���T�����̑ݨ�Yz�R�Y�Y�e0Kw��P*�Y�폟���~jo��T���˵
���wZeIU4V��po\�si���1��/�e�,�I{�f�s����SkQ�;��=��h���s;�.��.�1H�ݿ�����`��'�"�*�c@��b�e,apn)I�Cȑ5l����+% bԌk1�h�;� �ض4&�Ol�B�Ҏӌˢ���C�2v4�Z!}$�ʑ�|f�s}�{a�����	���I�R�'�\�s4h��Y��jz�o��ʺ�ᴣ�}v��AM>�ԩ���F�x�6�.R}P�wک�!�)�m�����a�y_�5�F��8���42ݕ��.U9����U�gR��&���Ö��j<�8K�k����T���m�@Z�Cf��ޫ�l�d��\`pRg�?2W#Y� q����%g��z�DwƲ�(H��?���j�7��v�]���ɦ1 y�4��8��>���t][BU�EGuF7�Ry$A��t��s�z�e����g�or��B�[���"��қ���oݮ;�������;p�H1yz�~��E:xq^��ɣ,YLM����(K��%�q��D]��	�S����0�L<��O@�ΩP`�M�5]�*�Y8��z?�ږ�A�h����z�܆!ӐŹ ��A���QCǍ�ˀ����Ɵ�ϊ��g�(du���W�ь�
Lz�2�j�j̑Y�X��l�LC*+�Z�>�0�2�^3��=�OE��q\��t���͵��:�y8�р�^�i�4��!�oU�����f�U�q���(z>�F)=�;�P[k�R���#���NƧ$gC3C���|L7�wt�a�^�l�yAPe(ې�&�)C�_Н��쨇�T/2~�O�_�m�pe�^�/Zm�g`k��W��$����1ʋ�<�r� qn_"_���_6�8m 57�e��2�XSҥ]�<���YX�ܾ>�_�������_�뿤�i����:�/Y,�>�KJRO�G��{��OʧY�S��2�Ϸ�#LL�`Q�2Q߮
�,,EY�H�7��a�t��M����͒�2��#�T:�L���ᐻn��L��ϾG��4�nZ/�x	%"�|}mq�d������f(�KeA�$t&����$Kb�0�0~�nT*@v0�������?�DJ&|���	�sF���.����^u���ɗ�-�,�N������3;����Ol@ ͖[" ��e��Tt���ڽ��C@PXr5i    ʨt ��Ţ��4���J��"�䱉�|�2v!PD�����.O���G�G����1�� ��~����Z�J��T�ީ��k5���g�:�{5V�p̿�>1g�57]�і.���O�c)���)��RTn���jH��&��?�o(�v������,WD-��q���<�x?�y:�}��c]f��_��	�Zi������%����ɗ#�Lc�A[�o��X(fs��0��r&�i��P�/�
��Ѭ����O?��VjO��m�x3of$:y�7楞�L�z����@���" ��^��-p�>���5.�`�Un�WW�ϋ�S��U���N�;�$�Cw�����KB&���=�m��ei��!�e
?װR/��Sd�qES%J����1L��;�3NkA8c5�(Ѳ�56�2p�I9F7��k	Q������63H�e�����a@^�[�^��ӽ�ϗ�r�>�u.���C6���ЫY^�rE���1����8��>���U���\��i����ρ��I/�#b��pL��}�>��JU_(�ݗn�=���Q��vfEɐ������ Ր��+"���!�zV�w�V���s_W$�]��Z�S4���\",��0��Bq�ʰ �L{���(H�㞨~}};����b�ָm���H��I��p_|0�-�1]4\�@ym����cl�E7�#'I�x�}bZ�[e΍OeU_�˦��[�tF�$��b�����r�Oa�ւ(=�����e-���j�hG|�T�>h>Mh?��rD�1� K�7��(�%���X����9��G�-,�c/��rfR�[� ��=£~�H���l��x{��%C�H����pa�%��#S��ਡ����J{/7�!���N��e��ݦ���A��9�P���ga8+�W	���Ё�:!����ܲ�~T�	���j��ȷus]r�tɔ!ScJWL)����A��t��7{
��D-8l���Rf���ccy��2���$g�}��bJ��+>O�\�3�%�ō>���h�����y�@N�X���`�+��I�t�h,�nR=x��us�I�8����;��/G�F׊)
�T�Vu�3o�],,�L`o+M�6�p�R�ǜ"��0�y�Ҹ%�-�M����>�z�E�*vЌo���h����Z�7��6.��_X �A���$fT� ��=k���v���K����;=��
\,���Z&�5��*�$�Pl�9Wp��輓�L(@n^�*������g�m�̱�C�H�����{����|7�U��??��Y�m�T"�Q7�0�m*��d}�عt�
t54C8鐓�a�*O'V�d�u���{�I�K~G�P��	��fE�l�rG�&X��ːsU	��ن������ic,�g��Y�6C1k�E�5t�.J�PQ�A`���zu��	MUa-(�c��R��BXMF_8�M�_���6�#�8 j�-���J6� �Ы��*h�y�2l8e�	����-�x�ȩMS|�T�ѰSBi��\+�HW�m�#n��)�Ǣ��%�ɢ�:��WI|,�Y^��V�y^��������ӿ5��YTw��\0e\�)65*{��2��%A����6¬��XI�>�j��N����>0Q�̖�gt���f!SӦEt�m��.N���T�1�n�l5�v:M����q�77W��f�^d^����c�+����3H;���Dc�p��DႽ�!r��߿S6�z��i�g�vg�Evr5�:������-���������=@�,(93��^횱p�]a2�1��j&�0c� ���T�Vr5}�+�Lב|��}$�G_�B�s�Az<۰��������M�n�$��ʴ�q�a�[/���E��~{<�F���D��p�
L] �ԓ8^�W���TLa�~R��!�d�N'�uEX���{ٝF��1�I��.��{�w~��*Rw*2co�]i�jUjwz�Z�ю�Ta���%��Wn���'����X�EK��×�_ez���k��"GުaZE䔊#�K��f|��*�	�$%n�����'u�zF��қ����>�x��|(�Z(e ě�.;����{�V?xc���p�k/\k��x�<Ř�W������<��r��v�J,=(<��k����U��%t�,k�d����䋬��@�08�[��l�t�'Ew
L�S��r8��y4��n~�ni��)�kCb����~K����;���%�`����64uY�|��m9ѝ�)=���h�_p>9/�MWWI�yM҇��M�{�b�Q%E��u���]�j�w�����UyM7	��*}pߧ��`U�d�b:k�"���$��E��}��Ԏ�LK6Ț��wQ�����3�.��r�2���KlqB�o�>�^Q¯_yEg�M�KF�_H�-�w�k�����o�іJa��P��ɾx} q�֋Ivb�5�y��b���l}�47���1?��r<���_�II�Uٺ�Z8Ι���$^ZQ���P~2-�b<����kU{�y�4))F��u~��T��
�xü&�o��Z��4��I�Ȇ�d#,O�n/����p�s6@���F+�R�!�T���7�!���-�C�< �%k�Q�,��|�c�Ds�x�e���z��+��qZ�3gb��;�U]��fWo��>�ե�{}�����l�o���$?���"PcE���#� |l�>SѿÌu��z?HD;����#�\�h��k�r��&�<�P�fZ�AU׃�2�q�A��= 0����-����4e��Ωٲ�'m��$ܗ*���B���2�B@��I�hO����|c�I
>�XʉV�n�A�B��i\��7hQX�5��Z����K:$J�藺��7��t):YAУhpyuX�b���#������*�/�M8�@��61UH	%u�U�w��`f�+r�'�q�p��5����兙�LD�.�C-���\�%	��s��5N��+�^z˨p��쥱YN�M*��������)�l)L�Pr|٦U>���ӓN���XAŝG��b�*�a�������J�&�ysb��c��ٍ/0uE3Y�� ֜��ɀ����@��s�q�&;~�2�puy�Ko8fϺ�[l��V6۟��s���2vq(@�:hzb1=dǪ%T4�nAwb�m�3���8{a(H1}�Q��t琉�>���v��q�t��h&�Q���§��NN��a���V-��X�q�,e*q�!0����� �A����tͪ2m�{�?��Mr����\���ţO~
�(+��n��Z�pR��ܴ��͝�|:! ���e��1�0�p�
�v�T����X����N&�*}�����g(5��B*�q��|�Z��q�����0z j5a��]���oz��0F������M��1��
�^��b�)O���%��b`����q<k9N���[Ⱥ?��8��}ӏ_��U"�����4��/u��ٴf	˚Rw�������CW۹�BRTo��y�M��<�P+M��=L��Jg�S�)MJw۲6�����a�K�1�QM}ʟݸr��Q|��>����נ���լ��bu�w�h��`W�D��^⺷��uS\ks��\�����Dۭ3R���Aٳ	K#�lw�u��L&2��b����ow�C�:�����	^��fK�5$���3���� F�;~�1�
ʤb�I -��X@ln6^2�X�ôvF})}ۡ�?+|���(���y�$7�B������p��I,��nA�j� ��Q3��8����|P��/Qo};Z�vL��k�A���@ -�3ią%�+G��Λ�qs��8�"۱>�Vܾ
�M��[7Jw�\�^)t�eK�����|�T�T��=�ߴ��E+�^u��+n�k����=��d5N���Ƥ���ś?,�[�`�ԅ�C��W����'�
�<��Ѻea�WQ-�F�H�g�"- K�oR��W�/�Nq��|vv�L�{ ވ0��Zz�ZY���KN��ٗn��w/@�I�BZݒ�    �����y�l�_k[h��DC�ă�G�\�iq^�u�8AP<�)_�r4��@<��&�����-R����*Y�:��P�Y~��Ͳ��fK�2����¤7��$������,�gY�}�Y�f|��Pi�9;M��aU+�!��΍�7�ߓI�7��quC��i@Ul�yQ�s�n-��O��.oh}��G衐�{}��Z F����V��c��躒�f)��.fy��م]s�@��ֻ�)���O��3�����5�e	Y�n�>�Ӧ�g��ɥ�	���]�~�owO�����hr�KN�Ӡ4�7�45�i:���BWP�/��aOYi�ߠ�".��r�\N�yɿ�^O�v�Sܝ�* z3M���ct�,Ozu���n��/�l�G�K�e��o�1�V�4"�ѻ�f�Gy��yn���Qކ��
�x,u��fJ'��7��3`ǥK�,&́�����q��� d:�7,�\/k���17�I,οrV`t����d{
�c�LKVb�-HUv�S���5!w��o�Z6�p��*�ˢ�&�Au���)�,���������~�����۰$�_?��=���w��v8'
�*?e<pe-�P�^�q�mc�Ɠ�D�J}�%��a��Cޝ��9 S�f9���r0&&u���R�Ϻj&fa��|^z�/�\pi};c�&pD���9J��s�X�kA��8@�4��bn���d����[�A.�t�W��A9'�>�y��kk �jh�ȱ𼒠 ����+27�>OÃ%SE�O�Z�O�/A!�b�T�}��,�Wg�M�ۿ�܄����n;ֲ�I�ヅ��ФS��]�f�Wk"M�g�*�.�4{VR�0:\��1|0S�g}�A6��bA]�:��~,���}5�ި�;���<	��wҧ��80�V���m�ن��߷o�r�j�Ղ9��FǬe*��~���ly"�摺Xq�Z�ׇ�����:!��v��P�E*r�"����qJx�U-S:��8�L�7��
kKfK�eM#dfZ��3<��+��]`Fk�)6��6<�w6��h5��jŐP�|����p��(��?��|�z��F�,8;�ĩ1JA��j��nϛ�ѳW��=�Yi%U��m�����׈p<����<}�~�a�C?M\W1|{�������;�&��S`����rDpF�>��ɒ�An.�g��%kƵq.,��k�ٹֵ����ާ-���iV蜃��h�"�v ���o_��a���F��'��L_��R�S�w_����P��Y��R.P�4���{V�tu��TLo��0]��9+��������D�PJeЇK���y{������@ۘ
ت�}LO�n���e|x�~Ԭ�ne)w��"UQC�a���a[|�1��b��F�}V`�F4��5y�� �wy
�nggt{9���u�i���@4���"��i�Y��@az��HR����r���g�	�K�마
�Tu��"��O^��?�W�uS���t�V���h1�1�ȁ�$P��lwh	\�P�m�_N��:�W�>=ŵk�wC��S�K�)�iF]f_m�y(�f쉔���L����=�����cҿ�S�a���bGJ�A�VA~\�[�ʥ	`N�)��ʜ#����=�WJ���Q����W{K��ڢ͍.�'C2S��yB��;�+t�8g�=k��.��4v*!UK��aWS?^˵4m}f
>�BT[�T�Y���&�o��K��kB�_��1*��X`u��6U#�9�$O�!��I^��q�>�$xV�R�l�27�/d��+�^�wP����OP�Kw�c�T[�����^M�j��,�$�K�[�� A�v9UP�H��0�OF(��h�6ٳ.y��x�b�vC��e���4��8ZO��@e)km��?�V&�Q=m�ZTu�y�hC�~��'h2k}��0�6��h+�ܚAol)�PBT�q��� G,� r	k��j8�ș��-k�7����Lhk0�cqm���k��U������驋͒��<���re�pQ��(�9Z��n�(S0�Jz����dᚙ��Ύ����u�~E����c?�ߑ�������+�DH�ԋ�~��A[۰w�Y��bA��*�i:!dҿ�G�m��wRZK�D�*'h4��5B.N`?8B,���$Ys��H-����)��\�]�hl�tQg��'Y9�Z�\7.�]X3�e%kN.�w^2_\�L>��U��m#C��s�%6����N%؟A� 5֒�P�zn���ҋ�WIw��������ob�m���Ofϔ;J��La0��c����Z}�&�5��X���u�\����-���ÀmjH���t����]�5|�?�� Y�-f��i �o��y�o������xGAz��^����D�\��	����ӂ��ؐ�%VU����.��۟1�) � ���}E*�s`Ej��%�<g�%���5J���<�UZ����a��t������g����s\ƣP}�6�ԙ}�6����$!(������s7f�3ӱեN�[�J=��H�fW
/�1S;cV]�zc��I�̥�^<�Q�.b�\�;o��'�?q통��>�.�Pu�p�3���H��!�^����3�Sˤ<S��ȗ/�,�l�|�{�JQӓ�#]RrU�<"rQ�~͐��
�����9�v�+t���3�P�?��4��l��
����X�S�:x`}VL:B�������^��Eh��yZ���G9S \���n0ٙw����[��Vے�.9}�<��,�"|h�y�<AȅQ�����q<��{5AF�KK)[����h�9}^%g�6�f*)t����RM`�8�ά屆^������p��bm�F�~B������J:* ��#Z�sq���UtSn��@��YJ�b���gK�Ӿe����
*��n�:+;q#gH		JW݊G�Si��!,G;���~�Ոy�Z�c�y�=�e
�[��ʎO6Z��8؟���y���E�F�>�5e9���l"���D"C�pF��E<3�)b=�|��N=?��F
�%Aw4�ia%�3�ȑ���
K�lNZ����cT �Q�����v�Vz̏$�8;GŔ���P,��RM���|t�Q�uy4Z��{���k��������Op��r}�����	��V��C�����sb�l_te���=�����q˭]k"آ�#�B|�d��93h����K�EO��m^"�Y$5 ��X�C�`u�͆˗x >^�fZ��/�Y��nh2} N��@�m��m�J�Xh���e�juW�į�Y$�]�Ra�E�i�it'K����/ ^z��;� �0)��,�WW��^f��F���q��\4�m7JRjA��A�����.ҧ�ݜ���M��> �oN���������y�2Z�4��(Xj��{���tq2J�A����⛣ohR�gj(�~=�TX�[.��Y�.������Q�4ʌ��~�:�(J��/J<�9\^��ֈ�A<3��/�F��� Q�A1 v/֧����=�>h���^~����[Uߔ�T�v�ڧe��h?z~	U��wU�3�]Q'����jk���m�Ý��f�^�F�5����TV׽?M+�[t���ӥ���)���U���]Dꡁ��%�M�G		_%�v��a��f�,�š�N8�6NrC�������݋��0@.�g;���Yh���ծ�ܗU �u��?�������?s }��J��»u�U����	U6|-���7Ȳ�=��#����"����.|5�:��Ze�nE���reŶR�raY��V�����*�r�B�y��N�6��tŹ6-����D�VΚL7�+��ID�ƅm�@W�ʸK�k�tOa0d�À��{�R��~�{���'KfD�X�S�p����\9�i#&�I�H����"19]0T�����Qn?�W�����.���l<��м�w����j��
;��ק��Wԭ�G�&��FP�{�����|xS�l��^#�\�w�S������E�e]���<�TlN�_� ���و?rЍ���]�B�^���1��:cM    ]���dP�W�#�ת�N	���i��z��jv��
�{-°�L�?�/GBb1G���g���mkY��Hh�V=�|�`>��X���hI'��|G*�˅,vw3U�aM�[m�de��$�E!�+���&:�%��j��-Y̮�0b \�a��ءt}=�����ec� �'�1��Κ�=�u`�T�Q���X�0B�-�H��`�r�|<���
ɍ��(5vqow�����>ZGaW�f,:� ,��c��:��3=3y:��0��E�HFfI]кo��n��Kqcb#VJK��K����Wg��Yc�!�-�$,��hp�Kī����Ӟ��<ɩ��{	���M�/��L �܌@�j<��|^5��۰��e���rQ]�[������,M16�����x<�QaJk�����:���,�y��(!"�:�.� a8��=G~/��N'�N D�h)Ɉ�\@��O��)Q�bI�!�HÏ=edY�DU�Z4A���sP��`W�$�cM�&f���'��h�5	�Ԯ>c�F���kw���S�>���Xo�m�r�'�Y�*�ʭ �1��4b"N�o_�7�!\�Tu!e��,�Ʃ�j?7��ύ��3������4�HE��"�$�C8Sa�e�,�gv+O�?�n��AH�!�j�%pz�)P���bl}�>��DV#N8J|z%��I�0��b�G�7���d�T���ϩ֪,c|ܾ�M�3�wTkt}�w������-�<���G���X �}خXW���9/���EF˹R�)�;�m�(x������K���[��˓R����ڟ����I�C����HƓgs�lpn��QTf	���8�}BA��f}�s�ˍJ�TOa�޻(&�.TXJ��C������R�ͰX�9��^���@�G�';6=�0��4���s˜{.�F+����g�kHs���隷�}\)�*v�N��Qb֜mhY�P�~��o����`3p��v�z�<�-P��?�]�aIܕ&PJ��ti�B�J�)S�!�X����c4ʺ��V7 Z1�b,��^1V������M�IeD$�u�w6��"�i���u����Z�Jq*ۭ�u�/�{2tI�ŏea���RɨR22/��j�^ X.1��I��G��X��D�V��}MR�a�Y��D���6MȜҍ��&$MȰc�A�|�ȼ�X7-�-��x}����m#��n����@d�`d|�}Xh8�*�ؾ�Z�4�����O9�W)���	�����w��m��b���&�˙߳y�-H��C��l�A�ez�j�I'�v�4$�@t�e%z
�M�P�l�xbџ,�2��*��{�y��^.fm�ِ�m7t9�����l����5�o�2ӷL�裌��)Zl��16/�&�?�#��!7a�[�eh�V�R������ڣ�i	(��s=�4�� t#C�V,ߊ�a
Ʒ� �R��ԋ�#�UR�ZEe	ﶟ�@�l��+h�6`?ã���5�� ������E�%h�ї�7k���N���>��	�v!}��`OD�� ��l	{�\5Bn�p��9���{�u<�d��n���=�fMH%���1�;WL���_^		��������X���,y2�bJ`�$*r\�[�(�B�́�T��+BVGC��Wry2^NX>�OPT#�ƣO��4.K��^�3�L{�[�����L��y���� �Y���HP�4<���p��m;�l�\��`{`Ӱ�@�;���+���{�NΪ�����=�.�o��Sz�I�
?x:�?�ɥ���)�M}����I��glg�3��|4�F�
2I�y�v� �T��u�#*�t5���4�)a��i�OƵ��q�͔S7Ɗ�{�Ɣ�.[)�����R������k�Y�7������͔�����E�hӛ�q}�f�R�i��@b�w��\�ɪՋTJ/���F��+`|��˷�I'�RQ��:�Vk S�YQ�����x�Ky�l�����%ژ�eD6ʭ�-̄BL�/!~״�WOr渷Z�	�z�
��/�������	K�����ʬB
M�~=���i�#��y-f��X�'	sah���0.:|�����K�=�ꢮD�5
�Oq��F�J3�ˑ6pr��E_��Y-Y��-B�u��kU�����m�3Z�4�E.��׎��)YL�����9�ja�C��l����=06���SMA�iX�o���)N�׽�;ѕI�X�Y�I��������ǿ�|�����Z�� �p7�g��Ǣ�e^��Jk�93m�YT�j�MKsi�쥨�������B�s�.�j@ck�G�3��0�����`�������.?��������/li>c�YQ��U��5�Y��n�bmS�i��f���_�e}��<�*��Ԋ�	���O��fy-a�%�L�p��m�M~�Yg�p�"¦�_G9�Tula�Ba��H,�7�a���a��q�P�O�Z)\�Y4wh��g9�R4�q��H(�l��@�H�}�k�Ho�k��2�~��af�I)v����~t�n���M�D:,�ii����C�6Y�<�v�W����?�-)W����L�H �3�A9lw8���vo'�
��J�J;BSC0����#�X�����cp�/�o�R4xk�l�Ҏ��# �X�f6TL)�|˸�\S����>H �>�����x>�l�`t2t�&f%�%�Gg5���O�\���l�?S߿�wes��K��d�!�`�ة@n�,�-��e�ȴ�9n�#b�
����y嵦vd���[���΂D���q��a� χ�a�����!�>�����^���I��
+����ȹ���TN�,t��l�|<���1���^Pmބ�t�ѳ}p�J�������u#rJ_��<����2���ҷ<J�ëjW���l�_ߟ��@���7�
@��C�i����},�hY��<��>X.VR̘z%�8�W̭ȾK>�;UYahO/M��p�Ƭ�/R�t�u��#*.���"�^�h@i���𿇢�{A�vHȂQA���ML�0�ؒȀ��("7U�<�C�C��l��}h�]��X�$�JK	�dI[����DR��ֺ�����?�����h��g*���x1%ڀ���K�����8�/��N+|.\��qW�k{�)��Z!5����޷{��z�%G Ic�s*�s���eY�b.�u��:ѵ'K��%Uݒ�X�)�#.��g֓c��	��Q]�����3l������)��g��DXf�v3b�;��x��b��z������t)��߱�ڝacY��b�bgx͵����Ϯ݅�wjx46�F>i��0"����/�BK��R�6~CP�~�������F7� �8�������~��� ��(�aAɯ �j@�,W�����2}��mZ����*�Ц�������� ���_3�M��e�dJ�z!��;$7�X��,��俙<�&������[�49_^���ja����mKO�g*ɞ��d34�6�j����Y����`���,x�<����?d)c�i�ZaS�"!�K�w�����ν_�P׺>	����Ԗ+?��;a%�fI��x0� F󰧲��C���,�X˒��y����y�֧�z=޹��+�;�"<3 ��Ef#��qa�{�E��}�N?��y�}��qT=��q�ac\�Q?*S?�Rd�r�2�D+l���ǨE��p��o��d��n�J�A8`?���1�
{���j�d�	 u�����vl��l���pR<]XkHs�~�&��Eɘ�تv�D#�6���RO� ]��%x����8h ��u�� n�WJa3�i,�^Y����p�uأ�>f}ԬrE#E%�b�T�r����J��۾���/� ܂��9U©�!`�ɜu�����KP���E6.�"����p<},�+X��c��Y�V����Z�O�;9	Ż�~	r�6�s�d�>�1��R�,�4LY��P�Q��S���Rݢ���n|��8qv�u<�D,�2^���%���0���Q�I�����-�1ǥ����!o    �9>�Ch�����E�!XNA>�&e0͐���,p�����Э��3��1b�R^�~�v9���p"Z�ȇ��j���%�Lw�\%p�U��vd���+��'��@N�"1�������A*�L˦�����Ku`�z9^�%�7mq,�F�X��{
���9�P�M������d�.�Ic)\Tu�j��w1��q�X	�b}pM��lJ�XbEZ� k��W��ڗ���RY�U,�S��"�y�F��*��Uq����p�䃋�+9N>���&4��b�+"�K	T�(0l���m�Ģ���C�^,���8v\�DjD���L+v�>Oh�gL��l��j��J7۸��#$+����:��:�.*M��U-�18Q�߁�<}i�(��iK%(@0҇�������MH�C]����u%r4�뵝�j�Y!'[�慁��OYiݲ�1���j�2��t*VB MV�g��x���߻|��(��Yvh�6�b#Ql�LB�_�ڭ�if���ýq�.y���	��r��x�=�6��c�c�	x��ĺ�f���Z��ɍ����/Ѕ�!�A�S�T�O�]}�c2n�x�[}��:
5Y�z/�		�n��l=ٲ��n���3VYT�鑦u5�B)P�oc�&5������a�%7o�u�;���p�����wS/7�s�ee;����y-��tq�R��#���u#�"\��E�c�W���E{���t���)O󭫱�LC���E��tV�
�m�[�W5:�^�(P$�g��^Yotp�5:8N��{W�N����a���N�Re�o�2�w�mP�Nثs���Oѷ1����NV�s��Y�fթ1�{���?h������L,��ؐ��� h j(���Ό��g�ޗ��|;�U).�<�a��[�-�����t>m�5L�Ȓ߾v���촇�J0Q������j	�֜?��#�l^G�s�O#r-畚�>)E{w�+����{4EN��Bh�kɨ��-#:��
���3higO����/��J��cN�l�	�~۔�tOۑ@�c���.����_fX2^�;>��g��\`4�ͥ�p�� ���8��ޟ�_�Fj�>��@2Qj}��f�O�ޱ�Be�/P�\�#ZKa����#C(-9/t��SR_��+�9֥0��-������2�6�l-�\��8���|H�c�����qh��4j5h��������Z�$��J�V�X��!��1L	3��f�J~sn&��1��у�oV��fD\��+8N�r�kq�Y��'�X�|R��|c�mj�%��i�f\!��v�my��{�`&*8�v',0<mw�TI�Нz��g�yݡd�ՖMz�3��;+�[m���*���45���Dڬ-��̯綕BSȰ�W_�1����bQk�V�C ����Fq��s�@��#�^wø������p�jK�w�{�R�}�J@N�{۽?}m��"�l�ҕ��)�ǧ��4���v�����3؞~�@E="T"�rg+�e]�G�{	��zg����G�t<>�ǾH�y��1��O��\���3��K7XMJ�F/u�}�/��2���Q	�RQE�]�`�o�)j>"�|`�(#���O�v?n�Ƽ�K�ڵ�"΢tԃ�q`޲:�[[�[$����E��Cj�9�������A/��~m7�^���.���Ę��j	W��ܴ��(8�D�wΕ�k�r�=���(k��~$񋂖Tx ���N6\9#J
ڷ����R��,x�B�:v8`�]�LF��V�>���a����C�7�?�~�5���!Z�E�x���j5�}$:�}�N�-�����t΀_�f>P����xz?d���j=O��睊E�Ye����N�r:r�6�a�}>�n2�%�����[�
8�kX60����L��wȐJP6�����ĵ��Y���$�>���gC�dw�R��_�]�9R&��~��{�r���O���&Z�
�m�F�B�'��^%D�)o$Ԥ���#�d���wMÌ#}���Gg�������R�h �S�,��l�!�>%���U����
�aQ����*����� d�����(��vƽ���H������RAw�߼�L:��R�'c�'��3
��?}PoQq����,y� j�L7ݮ�_�,���y�L��
���M������^c�����\L}�%���O5�n�cR�?~�"m���B�^-��*wfCJ�U)>���͕�|E��#���@��K�f��b{}��=aSK���/�}d𱜎U�
������W�'mt�r�'B�j�(%}�l�0K��� ����6!�����rw��~��\�qШ2%�1�+�1q; ��G
�aq��HT�`���$'5������d�M�"��"QRkz��ԣ?LН߹� �^z��\���ܖ�T1J\��|�Ӫb�}پ��a_�~ّ�?�*��U:�p�!JhYj��qo�����fu֤'��R�?��*f)�Z��������v����Ni��re�ұ�ސṪ˻��Rb�{U(Y#��u����1��1�u���3<�
W�&@<�N��+x�)��고	�XdrM��t�K9�R���^����) �w%Tz(��"ݐ�ܨZ%���C�/Y1�L�Z���-��b�ٝ�l�0ՎI�[pܙ�mб����N�}n-���-k���{ʙC$��h(������c��F6���;�=���N��{�X��u��x:(�C~��D���L7`3i�	�Ƣ �<�B�
'?�e0��ݞ�*=�?�����<�m�iO=|ΉA݉��_^�ʶ�������f'�2<�guQ�VH�t�������f��9ma�u�Y��u_P6�,��t�\J�[��"�X�������M�<v{�2�D��N!$X�Dۈ��$�I^˭|�/��!�ld	.JU���^�j��,��7N_w��7L����-����ּśi�m���x��rA�D�5��&��D<1�
�l�M�;��X�.�� �-�/4a�\�v�I��K�c�XeR",�9���Ř�qQ��w��c�h>���0z���u/9&|��uV���J��A����{�E�q��1��K�B��lA�����KH/�m;@����������U_�k���H�H�b�ԩ�cW=gȑ{�17Z�Y�H����_������ҧ���� ��c�C̰q�9{p-�vUƏ'������]��8kk��ޔ��d5ɄOb4��,���.﹦p������Ǌ����g��o_)V �L��=/W
I!�X/�s����O��G+��Ę�>�Kx|�ρO���9d�cq���7r�o_��ݹ�<hu��(_�<����L��`y��6�::�i�e��1/D)nL�o��v�$����xp��%/G?����g����+SHK�ט����I�9�5p��p����e�;�O�&�%���j�*���('
��O�����z�8[���IJn���	�~�XBNz+�e��2'Vt��g[,�mIo��)�R&���=�8q眓�B�meV�Ԗ�8*jj>Q����5]߱�^�o�0[K�Mg"g縥 o�Sz2a�e
��"j+�SĄ'<�p���|U��G�Gab�:����:����O5\غ�����z��
U�0�G.P��K.��`�S��ذ��x�X�����[�NϜ~1���P��� ��{6A�`��)I�����![���	Q�m�P��[��#�x���x|�S�SH�AdӰN��
3HA��IYʆݚe���.���}�5���v�ެ�*��,�SZ��)D�&��gYPM)O�&�E\6��r�e�Xz6 wvH��R�?�
`�af{!��X�U�|I60�[fc��
�
l�j:7���,�6@S4>"�t6���G	򃙵B&&����TJd�	Ԏ^D6�#'�R��q�޺ׯ}I�mv�l��LUY<IGX'�Y��*�yƦ]e��3�a[���S�|����c�Ed��YD��ŶG@AQJ�پ�] �F5\�k�ـS@�!�v��{�B`\��ZU���@AQ�D���    ��ʹu������24,�����:u�126�)�Z�M�Y�~�G�"ʹ�]°s�bdul�=�g�XNYg�N-�`�\%H�y�P��ʜP�,��M3�;(y���HŦ�t9,�0>�n0;H�`2B����U��Y�q.�3�؆��xx�b���@��m
��$�Y��"[�(Z�l�߾mG����8�����>&�{����k��s��R�"�$�X���題� [��;��ƾ��)�x%�q��Nd��hL�KJr�g�̝�tv2E��o*S��
\u�KS�� &�����~L �o�p!3d��N<�*��\�4Gʌ�V��%#�ɐ֌��\���0�{��i��v<l0��0�P��B21��C�z1�I��K[j�[�azuya�{����	��v/T���Og>F)��e�)
��(�Wuk��O�hX�}�z}	SMw�Y ����� �=����>���s���k`�x���䯶۬�,Ξ�����ZM���3��N1�ņ�v���vÙ��@S�Zu���̑��֗���`Xd�X0&�����b� �X]�(��P��yy�/������5������͞�y�G+���3ϧ�)���dL� ��B�&��1�>ꫣ~f���f��Ty �I7ߦ����3f5��=��'�zt�,���ӗ@Vȕ��D��?I&�).7\꼞v!o�߿����pG)yS�,Wz?�p��8��+��fh����2�\�Y�U�<ٵ!�u:����[b��rU�`���:8l)K��Ny{�e������TX��FCbDpg��#��O�s�X>%Ae@5�ioU��ν��k{z����o���q
.&��"'B��@��7�/�o��qeJM��(��X�ZXII��iq0����f)P�F��f��lc�l�I�1�q��|�4��<���� �x��?o��5)��m���>1�{�=Ե������� /��Ef��G���@˒�8�a� J-�+T�7�P~����T�(��b����
R|&{�+w�[ga�u�{�˺Jн��Z�H��LLe�����7k�jWJ��2�7Sv'�_:.���*��i@9�����;`�bD�sOF�Ķ���b!_�|*9�R�#�	,ݺ".-BQ,B�Im��z�1��;a�-����	�m:e1�譋-��`#�ٛM�[���0"\*��tP�Y�ҠI��A:�y��9����Y�͔s�H��Q-�r`���w�� ���J�:ը�<Ύ��B|��8n��9ɏ������2�7�QK��6P���i�2e��?���=y�G`��.�c�
jє���%-YR�%��mܐ���Q�#7&M��+]��LBE���n�*��j�nb*��co��1K�L������pk"5�\�2<U��"�ʀ�5���N��Pܿ\;���߆�=��2��d�ղ����km�1���:�V���b�M\&�Z��Ӈ��:W�U���	^���v�p��2��3�?!�̆����fv�*̗��$U]�6Gܿ?��\�/B����Aʪ��ZR�C�/�"ډ�s�Xa�
��dy(�<�n`-�u������|+�S1�k螸a<�G�tz�
(L�++����?��������v�������?��?��Y�����G���(`�BO@f����3��iC%Y]a�B?�ٖ�*��wP���	�aI굃}���ą�$�n#��K0'f,L�g��{>��ς�ݲxɌQ֨�(��TVb�i�osEm$�F�����b�V���(v�����;���r:��V6u4GY������m�Y�1��7�Xm��>����*��8��9����{A�\�3�>��I����
:Ԕ�g�.�:X)�P_@u�lH�<�h��NG�Pw��� �=�!�]���<�} �S���-sd���95�/�¸.�x0e�`z�b\�.K�t�[cO}�����"T�GK�k\$]��������=R�۟ƫi���X{�~:�8���Ӳ���1�Zp�L����^�R옺>[�CA�6T��B�0fW�пW��6A���o�xcw�r�����sⶑc�l�1��D���!/K> XP�7��f��#/��U�jX
 �W)�!{�!��amx�c'�wݾ_k��M�� �q�Ϩ@ál4�v��*��p�v.�^2��{*�GW��7L%�`0�dʃ%_���@������H���R/jd�Ng�����F��w�I^�Tؿ#�G2�$�%>���Ni�W�0������A���7��C�_�i]�gI�~�=mO����6� (� Èg�H����՝�t�J���\�L���E:�N�����4.`�@$���-�6ɚ����$q�F9=�
�B�O�`�
V���r&�������d��r4�h�:q�6[!*��R��T�>��� {Ų?Ŧ�d��*���T�Wk�-��~NY�\�k��!��(5�y-��W��B��i7%���褴��
���mI�X~7C�3��6��y[H 8�~�J�bF�s�\�ۑ��@T�:B���p�s��ƶ�V�޾��S�V�o��򐟪��7�w#�����*�K?��ZpݲK�Y��)��m5Y��N��Hp��h��*�|�.Ҧ�+5�Y8C��¼�Y��*�Ƽ,���E�M��e%��S=Pɴ�ڍԼ��{6F��`Zu�%H�`�g�'V����,5�X��{�VPڊ�S'�ؔ��4�ْ�v�M��*��WۦK�G��i�[�.�g�7J6q���	:.{%zDϫzf�(PCK=eQ�!��a��WY����'*=��[���$�;�6��2R/L�|>�uW������~$�������~ڄ�{���G� ݅I��t�A�!��� �o=�b�lE��'.u2�,�K���%�/e��J�����e�􇀸��@GiA�ѹzw����C�qܾ�`k����	�0����M�m��nI��ַc����K;���w���F�qCb;�xZP��fڜVĬ%;u���*�\��j��#ek��!v��a@��l^L	u��=O��{��[�:���J����~�����wi�c�&/�_�̣�w`�&{b;���<幈6-��!���A����T��?���䑆9��e���Y��\H4=c��2c�#˜���4D֜R��M\l��<���Ni` ����ɽ�`wS��eB'�j7�L��J>	��SN_��KG�Vk�z���$J2U�Ot�aٺ8���Um�IS��;�����5=zS�2*H�"FA��F�M��~~Li])�6@N)N. ��o�w���񎔴c^�l�m�<m�eʋW�W;%s%��X�sQm<�u������t������mz~?EE���&��VG�~��bjB��1�NqG�I:k��hnU6�0�jfLL=�m��~�wX�4T+8�=��v���V_5���d2�B���As1.�K���|�Q�~�� �?4��Tn�%��J ]T(�.�K>���X��j*�I�!��)���|{���vBIƋ�ARx��H�r�:П�Z���uu�ٌ�1�5N�E8\���[�D�����fw�TVq]�@����iW)�v�����#������������g�&)��!�=����R'u��Qr��0���L�خܽ�A�ב��5B��h���#W�ەJmg�J�����s��b��g����,�c�}HN��*����FM"�S90v�����_M�hLm��Kė���i�����s�c���/�`�-�8A���j��8m[�mf@��O5�D�X�q]@�5gC����g���aٖ�y����ˑ���5����t��9�\Ї�1.f��B�t���?o��fsE���S�b�(+���b�-�/Z��b�.����E�����b������@��s�� �����
ԪT (�P�;5EA��T��wQ����^��X��E���x�޺��.LV�|l�߾�m�%�L8NoL��
� E�z��Z����+�M�Ԍ�T�K���H�V00�QU�yܙ<�	H	���AK-�ac���i4GS    F�b�,7��l�d�M��T���e	���x)}��_�f�`FmA��1rt(�?�m�C��$�$�|^��6�����7��tt���łF�f� <��[I�!<�I}%k�P�5�z�X`�;�DH�?qTj���Pw(�zƅ/�t��'�b�{��Y�=ƍ
�{�;T����t��-E�
#��-e�A�va[���T� Y���,9���=�?r�%1����-��Z�`r[_�T�Η���������.�R���Fb��7,m�l�}�=e|��`Ick�9�/�ģaA�_���4Z���.�ĩT���c���&{VT![_�����0�L��0�̦37�q���Ӄ;}�ʣT#) �RrV���n���-���Oyǩ{
�er&��%�F�aG�Bp����.��L�"�Gf�y���n�4�S�:t:p�����V�F<Q���/pw�u2�A�N�
2
'��Oz����d�U�b5Xp9JL{�*OAx���اT�47��5��
�����q{��TU�%�7�0@W�i�x�ﻇ?��L���^-(-;RA���8Y;��������������������b����)%��{���]ͳ�Ɂ)�:v<L���~Ƨ�fw;���7Ǒ��y"O����ׁZ��ý�pߔ����|xU1����EɈ�j��cň"�T��߶�����Y+�����s��@!7���3�.�2sn�g<97oV87������~}�P_���8�hꔫ�L�W�q��)>.#��C��FԸye'�s��bnC�{T1�`,-�sT5r�p���s����R0RO⨊�(#gΐ�Y��� ]�\�&��OD%��*L��?��,�|,K3Y���>���Y̰���=�-9iO�k��u7pvxI��gu�?�W��D��>z��Z��Q!�8��4Pg���5����[�Տ���v�U�����xNiu)�-cK+Ѳb9.���Q�^$�-����r�Ar�F���QLB�+��I�7����cC�
綥2�,<ҋ���Q3�0N�L����bDuJ@i�Q���c�6厑�|E����F�P1����F�E�jSrsqL
l�ז�p�H��F��랏gF�aAӻДw�����S�E-L7צ-�v�f�#�W,��R��T3��L��B҆ �s���j�|U�Q~�q��>��f�32wy"� ����[�@���q�|Lq0�:�XT����ZnDiT�^�K�)��Ļ\ݸ���Б$&`�ӡ���z��%�h��/�ʁQ|2"�[���h����"Ҙ��D��>���Kl�.^���6 ��ц�1h�S
/�Ek(2�*�N��g��_���ܻ5y�/X�Vq���E����3�Soh8�|?��,�3����?���tmbk��g�T$���2ee�%��|�v��ju�.������N�pJ70f��߇����	��)�*s�5��	� B�$�qo�=����<��q�/��x�������y8�������@�sJ[�ڨ�����g+:���^��G�#)�=l���3��^�G&�J�AW����뻖`��O���r|�F�oڙ�����O��5�&N�m]�{��%q)9��Zϩ̳u�O�	A���h�Ѩq(/Z*m�fN3�
���Pũ�Y��� YɈ}`�wJR����>E�Rv^�4�7I'KaM ���=�>oO��Li3$�!�82���ԩ���
k�Ȇ��}5�>�0M	"��T}�V�5������S�KOSG (�Y�.@)0@�K@v������I�~kh��@��n�:}����!�S�f����j]nI��5M5��w�ՆqJ�'Pd���3��t���!]�;3�1�c��Y��UΓ�|���T��
�|�:��Iʏ���D�s�*]��QvZ��>��Z��S�D2�u��Ԑ1̷�`��SB��F�Cu�_{;�ViE������T{z���o������_�7u�����J�&}��n�b��PH[��:L�kNͭ�h�>��S��+m��g�_֨�
:�,Vyb���x!���p�����P%2"J��1�?�º�ǎw��uc)Υ���|x~��Nh0c�!K��뼟�=voqK��gqٶ�J����k92՚�hSR�kyp�,�{�]j$���m_�_G! 99�� ��R���郻��u�v_���b�j�sry{ll$��P/�߇�r5��b�������,�:Q����Rա�ҼED���>���tV�Ι@R����8���OI�-��#c���]T����VֱE/�8�g����[�%�ɕ�N>x7}��=V�\��+��+���|z��91c�r���b�J��4����ω��,�>B'X�����ݭ�+r�8/��0�ht�3R2\`gB&��F}��F�5wY�,V��?��F@�d'Z2!�eC6��.��I���͠@�n��-6'Fq�k�VK���[�Eb��/���Mi+T�6&��i��~z�J�[x���Ȏ b�P�h�l|X�r�qE�퐵2�mJ�(5R�)
�1�����8n놲b�d�8:�8���X�
�0�")	F..�*�u<Pe
�Q��D�8�d�M���?>�J���г2�h�/�ހ|oOC�@7r�T+T����x��tS$��>rn-U�aq��_�Y7S/[�~�}�:���k7k�h�Q��2�&�7[�q���n20v�_T*�g�N�Hs�:6���ĒB-��-��ʰt��.�aQ��R�$K�m��X1R�Iڸ����(�:�+����z٥xc���8k�Ff�J߸�L�W�Eݫ��ɠ�z>��KJ˽R`�M�T�J=�HeDq�B�"F���~�F��>8�������̀$�yJ�7�N�Ж�\X��U��7(z�d5��J9�U�jk1��O��,ΨӨ-�`������O>}Y�4ˊ�v�����AP���
��[TFY��a����.�+��\8���uT�+�R>`K�B��&?#�𮔮�h3�5��z��i�d�3|��_L��L�<ѱ��𡚿�
�y�3�˚�a>��~2e���;�閻���Ƞ�:���cb�f�O/x��#i���b ��b�VW,��p'T=uQR������"4��(�q���P{�SՔf�%1y�^��{���6Nt�':",aɤ��0eK=8K_���{�G��E�%e�l2B��3�<�x�z߷P��x�?Er)��r���v&��Fa?����Fv_�iO�_{��H����c�"VZ̈́9���3��L�M��ʴ�E/�L���d���,���	�Ѓԋ�� �'�$#jLv�1�iUfgy��}GUf�Q��q�牆K瑶��t��Tq�@�T3CuU5h?�T�l����\��� �0�.�̅��9�i�&Y��D�[$Ti�h7sh����"B8��=����qp�+Ddy����@���y)���1zs������ԓ�ߨ��쨛}� ?dV�K�505�d��e=Q����?�)=���Ά)<wc��jAܓ�T�+�}������3�]�E�!�RUCu�f#͉�'�?��'���~�Y���=GW�2���]�!{��D��Vr��BS���0��3�ձS������3Tr����_3�;�R����v�t�����h\�D�qym��[��rO>�uC�m.���`:U�fn^��1��wh&C� ���q�I6�ؼ��v�B��m{:��o�O����Lt���������L2�0tP�Zs��ޑ�t���$ڲ��΍���CA��y������D�d� �	����0�m����7�����1�z�B�SJ�c��V���s_�����pWEGo@5#jV�ŨYY�8� ��f��!8FZj�0���18�7v�K1	��/��$�R^���2��X�k�L����n�Y�}X�W���ly!�YN���ų��ŀ��YLeҥP���=3�Ԛ��@u%ZM'��l�fIpmYlJᕶ��}F9U8*+�0~l(�����'��T	v2�B��c�	�J�a����E\��+��NԽ��$q̨I    �ͫ=��ɟ�U��P�\5+9fz��K���U:������T�rgK8����HX��?SYhk6^H�� i%*YM��J*���"v~��tGx��i���K��´��̄�'���E����3���
^��%��u�Y�,R"7�Ś��Y4 תf�zli{=H�{�+��(��m��4Yha�ve���,�*���f�W�~�9[A�鼯�r������V��w���(��k���=?��|+5Xd"�F��q���Ԓz�&�X�J2�ҟceM+P����K�J�h��&��D���+ܽ���^��T4�Z�ެ}$��V�}`x4�L��l`R~֝̈���G��_���9=���[f�־�ګ<O�YTxq�	Vp����8��$ӱ��l�&p�_�'�	�H��K���*CX	���vnQ����g3���"�Ν5Ϧ����K��j�BP�"����q�N�7�G����ښ�7���5V3�����.x�}�Ɣ�%Fz1�b�F��\��Эh��Kq�!�Rj
$�z�Tn>�{�K!�Qy<Qu�"L_�RDj&�s������+?þ�����7�Sv�=x٫{��p-�A��A8�܁%����\w{�_��Ő@<y|�O��ѡ����� ~���I�t�M(k2�^V�r1���E�9�mL��d�Aхjb�3���OE��#�L_��-#��K�sa�$@��"�Fp�X1r�������H8ür���k�A�t[]z��kȆLemP��G`:"e��ыCo��7�ݸ���
��A�׼b�b*�\׏ȗ�jiC/u�{���qA�L4��N�������r��R��tc,��㪐��'R�� #�4��D�K��K����m�_&���9��p�fc�]��_6{X�@����}�_&+�٭5����SO����썽ҹ�_�>+g��J	w�r
�,g�
�K5��u��k�I�)�vRϽ�ا��X�	-Un�,;���?�K�|}%��� ��M�0�(�VmN{0��Or&��U�WW&"7�ծ�0T�ϯ.��P�w���s�W��	]5 �=KV/wQ=�?��\���j-�����TAY�2tnE]0-�s�C��UuUA��5�4���\U��z8��˅n{:���J��ci[ӭzk�R����6X���V*S�"卬�؟��7x~rOQ9�#W�	�rz��ڨ�d 쩃�d��H��KA��B�@w�����RV��G�Wb#�2;�n���xS���!Ttz�]�е�Bѹ*���a�o�{�NH!�Y
����*褐e��]!!iA�D�Й��0S=�\�y��N��[�K��~7R����C�I�\Ђ����+�Ŵ�����0��^�睤Q�xA�׿eO�ۉ!��+r������\�0��.�;VMǷ���se%hRA����	�]�|�S�n��:r�C���-c
�����qc�S55�|j�,�û�N��^�@�S �'�+���n�5 �,�X��+���-��t a��0�3,�����;�'��Ν�u��ߵ-�aQ`��X}w��rNz��6�}Ac�Kn`�������������
g�8�׭$�5N�eK�3�Y1�J���;�����ʍ��πC١����~UKAK����1󃦎�d����Dz|�3�	�����YJ�ױ���k�@��p��<wזn�SƔ��:h� ��a/�sn$��N�_J	���?^��N/��S��^*S%����.���kq�~����o�
�aHĻ2;�`Q��}�Z
ado���T'먹����6�nv��W
/��@(�\���H���YsO��fx:�[�X�69XŐy�/�s�^`zX���#�lOo��r8_���?n�7��ͭ�E��T�~��_����7*K>��ie@?=�^_N�"gW����]R����Z'�3,/��QZ�$t��6G�z*#�u�I�Ϥeڑ�<o���q}����D���ʨ9����(}���4��2�L�.mK|�z.�J��+�\ӥk�yi�^�0 ��L��g��V���n $�JA�E�n��e����V�nz_+��t���pW�bx���&U;P���"�*�����)l���*��i]�Gl&���ASV��וݑ�~�j:62:�O8mQ�Ps��t������v����x���3Y�Q��D^��c�j��.r0��0��T�����5!���^���a�D?U���i_U�5�<i��7?kV�}��4T&�ݦ}������,��r&����T��:��ΟuF	����LA踓Χ^T�I꽆p�?�vT_��@��u�Z�m"|��u˒��:�>k������H��otf�=�M�"N�p�P3�=�������$��͖VeS��Ԋ��~���l��V�tN��v���l<��&��0_�����d��y�7o�
���`jx8�KR1AbE}Ǹ����k61�6ǲ5s,�D�D��l�<�ԭ_��Q%:��CSג����&���F���ow� ���������� ����(8�˞�?�����󹝧���LX`�RUN^���<2m���5W�~J|�IZo��-�^d�彍��f�ݻ�6�L�t��sG�e��Uɥ���6B�NpTl2n� R�Q���c*�W�YI���}����I�}#ޤ�Y�l�$�������C7�Q٣g;��fq��1�f���]�=�̛^z��S����T�i��"3
.��v��S:ʤd<(Q[ٵ����^8:�ׂ^�������~oz�~�@�^���fϟ�1�'V�Y+�̡��ԑQ㓫_�B��V�R����	]��?�PʵF�ƻ���Zn�o,��QaQ򝺋�Ƽ�s�V��KnA֛������N�d׎�;�`�1	�Lj�l3���v����lk�Ϻay���d&��
���q��{�~ɊBMWȡ�o��8hao�>�D���Η\�V� �\����l�۩������u�r�s�gm;�bP���ʣq$�����H�P�}�*�0�!&�*68eU�u@�H�������$�̅,\I�k<i�����p%�n_�Qߑ���v���P~6�*HZ!bl�kV��/��E��=��IK��\��B��K�T���5�O֐XW�r����Ɲ��3��ˎ�x����cc�~���;A/Ae%���D��袔���W�C�_=��_L7 Y-3������k�+C�j�ԛ:�R�5�Hq9)68{r��{�{,�W�8��\�Z��ʁ���3�=}f8췣mš�*YU�÷~U�p�R�$���(�W�6�b.����4���1�\�i�>�W�&M���OѓV@5�Z�y��:ƈFݸX�*[�<���^�����J�Z3e�8FF��u��z��jb�������9�2��^�����&����1�|�[��O0,���<|��ߓ*��/��f�U-�]=f�����<['ЉwN	m+vZe���+����gI屪�[�S�Ps����33j�6 �S�u�J�@r�A�� >q�h2W���=V,ɜP�p�)( D�f��Dt�/�;�_��&�G���@�W�)�E�}̭0��U,!���`�]��Y*�"����'�||�"�ڊ�j��p��o)x	S�d>���L[�����*�Rh���m��Ս��c�C��^h^qw'B.�w�99v0�����V5�d�2[3FRN-Hf^C�k&�3��4ܺ��e>f���r�'x�(�����k��!�T-s�5��S�����ڍ���ļ1\@p��*.�l<���/��v�t2r�\�$�L��yG���Ez���2Y�Z��.T��sx݊0}ER�Y߰�ؤ?��@R�v�G]l�G�Ǘ 3�]����T�a�~�zj%x.~2,���va�%��Lv�	N���*�]O����O���ȥ���N�XN��c�Х�P!r��9_&�ULdk�b{�?l޶�����>4�k��W3Ьr���Z�}�F2�f��cq$�U�p�O����舼9��l���h4�~�΃qj���x    J�޴a�^V�Q� �f~�l��#���?j�b?��P�J�w��ѳ�~��7/����VU�:I�d�	��Q�H<����e=~�5���p�f���+v�ԕ0��u�_@��:a�p�.�Ɠ���s�׍L���85�����l%�2����5���P.5�)�*S+��y�/�P�R���]!hF�������g�p(�r�����f:�Kb޷�g�4F��֫��f���5�R�G�~ёU�EȈ��%[j�;,��)9W�0����a�Օ,���V	�%۲��������w��3u/;��Za��d��C]�=k��B��O�;�,�0?R�/)��"cB)�ZCd_3��53@�,��t��ޯ�f�۶�>��R�U�O���3���zg��1'��P���gNNmZͅ�L6"������}�f\;S���h���j �hB"qzџ�۶h�~#5qrW"84>t����̦E��F�k{7����� ��Q�S����w�+�Q��w6ߐq��!:��ʵ���als%�g��t@�>u��Q	CעhG~Γҭ	���<K�9|�O;N�����X�'��a?�QoNBw����&L����f"?���T���M���Qz*�r�JF�H߂�
pn��!�Ô��U��jLz�>by�:÷>86N�rCʹc����06�c�k�j><c�%���O^Z�)�y��
�j(�<0�z	�T���n�07��k�YZ�2�y�����R��xA$})bB�p��H��Ҿ����;�����9��ƿ������ͽ��A�x�<jDz���6�Y�w���J2�J4E��t���ʥy%�?ˎ^�ᣱp���r����̑<F��Q
�X��(?c��b���uM���J'*ޖ��$;�̎�e�{�/�=����/G��t�5Z�b��d�˝��Q=�)�asG͖�p�2�W�"�˟^��k":r�����Vq���Hn٤��lrEp�{?�R�p�X���o� Oڟ@�:�Fϛ�\RS�8O3�3��I��p�����d.��"�w.����L��C
�� ut�z�Zia\ì��q��	܂�{�#�kQW�!@T�Y}�z��Q��Ռ2�W#sVQ�\�Q��UU3%u��ekH��,�+7�ń$����J#%�Qk�11�b|6ӕ�kN�n�&��X"�ZV�0��ux��n��gF�d�D��A�/ׄN�ؓ���>�I:k��/�?Ț��o��j1W�6_�ӻ�{x#�>��o���0�y����W
��ݼ��R%3#�ۃ��F��I�
�>���/_���~]A���*QDW�.^��1�˚y�Tf�D�ױ����o�b�J2+����ڗ�����A;߿�יb��\	C˫j�	eAѕe���2:a������?�.��Ph��V�����E#bV�^��@Xz&*��\G�U��x���^���mւ�&�n�l}{\��}@��^��q��H4�5���:��
����ٛ��Cg�C ���3�Ǌ�ᒏbo�.2@X
��0�w�Ͽ�����������\����#F��1�MEMG�/��Z�G�`$<����m7���b@S�L�K��.V�F��Hh�d����]��!Ul��9��b����bGI�e^�W`]���&wk���2�$�R������`>T��\-~%h�Kp���}�n�q�HЏ�gL�+p�WBl҈�~&j�?5����p7�ũ]JS��_��CԨf5~i�0|jy��v)X���xt�;�4A�3!ēRKK�Q�V���~��oުlP��z����(����P�I�i�dg2�C\�z.��!��M�%�X�ѻE�0=��l�L�n�mKWs�{��>{��0[���R�j�o��>�b#�!�;�F�V� |�zb��M����\=RɧЯ����}?@槗��䅪��$�����ܵ��������fdީ��a�P=�C��οk����fO)��Lb��j�$�.�k�3W�T��`���+�S��M���I�oW���ݮ��z� ��f�e?Kse6$16�t��}�=MI����k�����ln������}[�vt����ޕ�����8��1�Y`�S���U����V0��e�SM�}P
B5YU=5�!Q�1��8�t�[b%"˲�G0�V��^��8β��[t�T�0�z9�k�Hb��1t;�2f9�޾^N��A����0R�\�͂���j�x\u޾a�0XX���NV��Үa�����P�o�\zڜ��S�B�Ay�yr���J�fGI?�?}5k}T��N÷y��~�+��ƻ�� ��qu�o�6{�[@��:�8�tR�1��2��C�+��G�p� �5����W�V�L���V��
���m^�g��~� 5R1��<�R��z�ye�dlR��}�����>�T�Ad�&�pd�W�F��9&!3��/@�/Vp�7#æc6�0?o���kX75_�� e����&�d��h�Fq�����{�Z3+g)��w.����<��m�e]��tA���֔��j��s�:��?���p8��ϭ����y9S[J�kOu�#�p/�	�����%��5a,<y׈^\� �`�D�]֐d#���8=,���l�U���`�f}�Z��=D{�K���� �����\xѫDA��~�h̦}k �.������4�/��p��y~��:X���Q[8Xhl�C�������J��C��
 ]�ʨ�<��M��Г�H'���ьթ�J'.@�/*��\..�@n��_M�[*�T�y+�ev��CĄ7@6V�N����o�vh�_��=#�15����L* }0֯��_Ũ�7�xC4*��<�j�~<n޾����S�7�����Un��)�؝����q�������÷����������������������������}a��\�q%y�|+���c�����2}>� �Օ�_.���(M����F�M������fY���
^Dxy�A[k@^���8��<���k0�x�Q}�xCF�V�<������Oq1b1�0w�<���L���.���tܫn�$\͓�5������k�q�A;=��eE����H��lο0�+�ǐ�(�v;*m%�t���
�:�f�{~;|��w�ƝT2b~d8k�q��j�,�#۱�6�7l��7��,a�,)�
b����9%P���^��s��E=ku��x78j`KY�OZjz�O������a�K/�ؿk��fNA��8�\N�(���y�����~&\z�L.^�|��	�>g�a���޾����-��ԃ)���hK4|ܿ�#�������d�b�4W�V��.}��eC���0��������ˎ��
�'�d޴�)�h��4�=��p�te��Kb��f`��:7�׽ȅ��/��X_�����
}����!�~��oY�u&J\��TP�1`N���]{�y1}��(G��=�=TUs�K��,r���4Y�J��{���=n0JRâU9�F���R=2���S���Xz���ϟ���ұk��O:wrKۅ���]h.K^s���8�0A�5�MC���K邉9��W�u����1�2�9Z��,����2�ze����[S�JN��6�`�"ð#�0h&���E�k�O����j��an���>�2~w�V�P�G�2��b	��Ōq�-�A�6�AƩe�}���myS�ݯ�F����Q��jĆ>�^D�,�4r�lYu�K.����fK�]F톜m2M*���,a@۠��u�����U.FX������)�uV"�Y�7W�b��^;!�y����7�N9z��l锩�,s�2�Bwzw-v�����_9�W����y<�Tr�rdT>Gh�_Vj�����趉n*����^�0�TL a��8�q�"�D4Sp����I⻃'�4��\�9�7�K���]8r����w�ۿ:�YQԞ<Y���u@�������9���h)����p>@2�:Ex�,H��\lb�M    ��v�v�����W�A¾C�[��/oV�SH����}�n�(4��������M�������4�b��
Q�ͮ�qG���y�(P���G!��	��i�v�D�l�A��&G�g���l4����F�r���hw����I��2���n��h��-9s=�Ts�;^"�^�>�)��˯W56v��r
���B^Me�wƋ�����&�5�nx���"��YQtH�;��s�
 �M��� e����j��$ׯ|�&�������N=��w]F	�G�sO*�d˙���r���ҡ�è�q�r]�>������iQ&�8I�����]�1��*=%}�љ�������5�A�����H�.O7���cK����Ա��%$��`.�b�^�zp�D%�B�i���Oy�Ѩ�3�^@�/��Ӭbm0
�q�d��ҏԠIp	h�sS��A�,Ǐ���b�Ĳ
�\��'o��) 5�*Ψ���4n$�4���1�DO��O�\S�7"}�C��m�!���:��Y��J�[�+(\d"��|�TM&�!n*�4'���{!/�»\s��-�2�c��oG'[Ԋ�L�Y�ao6���O������* VZ�ؒ�1����9bj�=Y����ҁߠ�eBx0yM�F�,׃���~�Zl�u�L^.�_.U����Vp26/`d<��-�J�{F�+w�	q�)a��2
7��58ܕrZ�+</z簖��6�O��t*�y��i��KGuGpx�qz��{3�'�	Y�S��>J�_��E��'/�Z�]�UL��,���R����5g�I8�CsJ?(����-��A+S�]j��_;�?_�!�=�~���iz,��D�D�@v� �A�Ff+n����Xo��Iy>�M\c����<��*unP���%��x����*�B�j�ŀ���ϛt,G��N��	��X�Y�����f�|��	���q���I8��Q�I�Y���ۇ_�/�������0�Y�(�};ċ���%I��x^i��0�t��|&#ʎ(Y^(ۂ_S������v�ͮ��c���2ScZ�v��ҹ��<��>X�sV�5��ը�N�5��lI#�2�[�ߟ1,�'H�p&�VQ��.��_Z���� ��I��q���UQ��
�<cq B� ���=G��9��A[�Eh�e���+�!�*ĐNB���W�\�q��ex^:A6�G~V�!R��GJ���	��E9�yk���>�0�SQ�<I^ZS>x�1���Mw{ϛ�?p��jJ�B�;�ⱻ��1Ȟ*�x"��˦)�z��=��zpL/�.n����U��M�����������K>�Pi����3�-�]�J��,w�%�����]Á�tM%��e^Zn�k�I+�8ai�<�԰�ah6,:)�>�ࡥ�?�`̱�X��]{�&w�#�+@"$sZ~�fˤ*)��J�ys�*d2�Ev]~�QU���a[��^'+���*�r/[��� .�B�噰U��on3��L���e��|C��lE��S�t�}����e�˾�R_��=�dn����W8j����ż[�\@}h[�����L�:4��p)hz�s�����Jz�ȷ�ĠC�8ዊ����<4n���gFX)��:7s���y��˞L��d�=��B�}�m��NV���}�+=w��*�ާ��t<�������8�j���9n��|�m�`o5�3�I������Q8��[5��g�O0C�?M����{�
�kR
$e�뤠�b�xx�'vac㬖xb*h�S�&��X�Fs�GHŬ��ZY(�,#��ɒ���"q�M��5�����2W؆��U��N�`P6�%�/sDe���d�����qaP���8����~�=���ZQ��)m��铂E)�@�aMY�y��"����IS�'���2�F�
i��^:�)���r��ⵍP�k$��k̮Ǚ]Cg�(i/���_<�`}8�a~Yc`/.D��{���9/L��L�v�
n�\�GJp�����yjc����P�/�Ǜϭ��ʆ����
��l�X�ۖeDn��_��,v��Ǘ�ۃ�(-�~P�8d~�6��ƪ2wRbO8�&���W�V�j�2��$����3�ϛ�ێ��Mj�Թ+b�i����4�� !|���x�A� ��זޜ���J}�h��o�n61&���u���s��3��V ���A��
=/����Ќ� ��s:�d7�u�����d���&i�#�����Yt��٫$R��P�a���靡7���y����+>�w�7��`�G��W����/#�%���>��a����U)}-�S�T�.�>�6�.o�V\��&��sZ]�mu�<����}�.(��)4�]/b��qQr��r��ñ'�߭�Mߴ�w�ޟ��	+�,�j���U׋̎�R�₲nE�!�=�,t,]�=�!(���1
]������q2��сg��WH@�+�5\TTI�N n��!k�[hl�2Ol���tP��-��}Y�/_���Og���?:e��Wdۉo,s,���ظ���}[�q�h�����{�~��]{?��iۭ�ǁ ��q#��h�Ą�0�Q�|Go5�I��q�9�i�1���� �H���nvo�����h���`%�*���FC'Tz�I����;kj�&7��E���SZ�������=>��ȏv���I��.=�
���}(g�̥o�e٦�T�`Y��g��xZ�?w���^�J5}uE3QY��"<��ki5P(
��͔Zy���eQw�����U(�h5U-�9���s[�5��2�ap[c%�-N�-a�!z�2��w���I�Z�e�������)m�����E[��]�x��5���x-��<%b�=����9�Τ�L���<����mL(f+/��W���������E���0�v dݺ�)N�����!\������D���A�A_/VN�ngK!�����~%px;_\��o�4U���j�$��_M�4�	�<z&n3�r�ߣ�x������g��c�+���NڙL�aYO��O���V�$�pf~���~3V���82�+dz�І�^Q��M�df��k��+�M�_��6��$U��ŽV��>��7�_��l&����A���LQ`='Zn���(D2��$3_��&<Z�祙/G��jh�_7G�B�� ѽ���76����$He��YUP�,,`q.����qi����u�=d.iR�D��{�7����_j��̄-�(���º��Wz�OeQ�KW����v5t��r�(uO�
i�0M2a���h�%��I���"1U��i��Mۿ�O�3���I[#�A�"�w�N�N�n&yu�{��s���%�����������|�o��(��S�8�e-,�+@���:�I6�M6S��ә~`�����ůu������Q�5�-[������S�Q9]k?ɺڮP�|"�5�.A��T�x�w�k�up�~}0��������*���申�x����9�0�/��15���U�:y�"�F1,�*,b��J�./Lչ77N$���E@}����n��N��Ͽn�ҥ���|�M$G���X&0ʩ�;-T7��T�y����BPaa>����}3�����5,+��x�9�pO{�6cVZYU��C�y�(na!oF,��a��]9;m9���E	0�/7Y��jJ_�t���i��)�U����RPs��=ܲ0Hƻ�e���隙�e�B���r�(h���謬��jk:�{_�J%h���g+��j� Q]��p��Gh�y�O�Ļ�Sq��U�J5/jG�x����M�M�۴X�/�UEC[�M�����JU�w�~�P����.�Z�`��u�3��6�zY�����Li��[8����4W��s
ʶ�U�U6z���{��=������ǘF�:Q�W?i	�% ����x�v�X�񋮲�JomTe�2�����oj�ƿ�!�6�P�q�4�4��ߤ�YP[�x;�<�r�&wL	GWKe�>��>`��*<YU��c�wW�w�ju�����x_�>b���K�VW��V�K^�u2q�6��Ւ���e1�'��9�Gql�    �j8�F2'+�^Zt�바��CdFqCaG==g%p��-����I�xJ�� �K���G�y�єbϢ��	�/}��lt�8��ER`S �Z�I�*9APn����2�����<��p��*:ì�+	x$�GX��I��,ϭ�BZ�w��Q|�p����|��ϐ(�D��[�� "��.ӤE���l��b�N]?�g��!,W�Ԉ��O�6������3�ķ҂�*=^�����-��7/T� ��e���C�uS�·��6X^�Cv���<\6�^vU�-L	�&�Kn䟱K��3r�D�}`(hCs:�>(��jh`��ReP�:��% ��4U���������_h�e�]1�6˗���v����ù��,K7�LB���������V�-;[�a�F1����5�):��U撋2iC���u���)�hJ�H�=z�}�ޞ�g�"��� �.����mػH֡ģ,����5��X�[6II���KZ����:�����e�U(6��Z���rr�cĊ��.m|��5,�0��Qy���OV,\���x�h�Al��W<���/t��Z�W�5��(�������F]��ă�\��)%]�R�����	AAzz_���@QM]�G����A2jK��@#���QSOn�_�,��)c�����O�7�I��Y��&��I����1e�����I�*Kw�M�q�B#6�DA�O�MlSCɍ�KI �c�g���9�A~����[�:�;��6b�����3�`�Y������r��b#��M_�R�iqȖ�EZ�y�l^���a��7�q
P��>hpX�Ff:�O��1�����7Lޠ�A�o�r��X������O��m�G�κzm�T[hQ��7�R �^�Q�x+�|3��X���T
5�Et�F)Ux���No�c'���'�4 ܁�V�q��2��+��z�ه���^�b�K�P*�E�e�B���>N���uޕwU������~�72�=�Ě}Ű{�Yǔ��қ��oG���Z�
�PPF2�/�(���|:�*>d��z�(�mf& ��[�O4�]$�kj�ShT�T�k�W��F#t|�L��u��cv=�]PKɨ�;hB�>D�ۼ��X�������?o��,.V��R���O�n*c�����urCEG_j��wejd��;����KI�����EΕ��)�lu;��jݟ�p����*^=��]f���#ɕ"[Fƙ�\\�?�!���A���|i�is�g��ˎ��t��6 w�-V(�fKWA��ߨ�G��O0����}m�ֶ��D���Ż���+��~����K(/A�A۞�@^n���M�t�)VF�����mA�`��e��,���/��	�1B�)�����z����,�d�s*���o��>)�\{�>d�a�!s��Z��jr����϶*�:'xqL	 �g��� )Ce-�ף̀���ə�{-\-�yCM���c~p��\���؅6;�27Ȏ�l� �0M��pƖw��}��Mg@_��u�.ve�]Y�|�5�b���M����Y�߭�0Mp���9/�z�S��;d-��[��ĪblDx$�0q�'n��l<��������cyܥ`�x-xg�ŸM$RL?{�Ē`��/]
�R:>ja������&
<a�7�.�Y{_�a�0Y���*Ϋ҃��Kw �D����R9�=$ﳃ�7(���^˩
��f��8T�ٝ����hS�bGم��2R<>d�o��R�����x��E�e뎀�gB\|�L���ڞ���|�Z�2��A��ec�/[tCwtC���Gf����!y��s'�$�Q>U�\��a�AA،%�$R_�o���J:Y�N��I��*���P!��5��5�����������OB�����E���I��Ϧ�7J
��>���k8n���ۙ�Y�����w33��}��G��m��\����U��O�mO��*-d��\��Q��t�!qs�O����&���j�U�偢,.�<V��(�ٓ�#E�l����m��B����MM����iW,gg(��Z!YG�6\�����~��A�+���3j.�U$�[w�)�T���h�|�Ea��(�y�R���N�D0C����>G�� F��Fn^��`�D=j�dʣIh+V`?v��	�hZ��|Ӻt*4IUݓ�i��y��&��eP]�}R�S�����f��O�V���b���7���ښ�I����Eq������ii�Ш�غ��ni�v��]
��M|Ќ����������������KQ�Sbe�����EȤo��v}x���g�02�(����(��;�l�R�'����z`��o���Q�H"-ro~��B:���x�C��Ͱ}��^|dѿ$�Ut�˗����I��9BtpNߑ�����ZH�P�� �p �E:f�(���6Ѿ��k�?��6r-�C�(,�W�PZy��n��B��v�2��w��타���Qc�0�e^�~�F���F��c�|�ą�`�g���U��wj�~�"�^5�)d�5�c6(Ҽ���w��]�x��Lٺ1zz)z ��j������B���tDةI�Uiѱnc٤1^�W�K�g�6�3�!�4�*�&oԙ���ך(�
9\wz^Q�Ua&
�Q��P
G��E��T&M�|�;��N/=�:���4��]X`��4�/�w�@5)��T�����0+�!"���|���ѹ��q��";b[�Uĉ0p�Y��π��U�-f��,LW�B��a6\U^�!��]m��E��G�b��7�"��$�I���)w7<s�~k�&	ą�u�[&�b����nx�Q<����a����n�K*2b�Ͽ����տ�­���6�x ����(���R�[��v�� /����X	S���ŭ��v�k�Zf+���ER�p��ӹ�&��_��ѣ���v�Z]W(���ݛ�cf<<Ke�E�X)iA^�y^K�U��ECuP=�L�����͙���8�� ;s�#s[��C�?:_"�/L,��	���P���x�B�1b��V����� D������QI�U��N��ob�V "[�����m���ǺU��)�ҁC
��MLy�vW��Ϩ\��<@F?�_T� ���&Q��p�f���Բ1k*Ċ�T`���MU��%'13��RP�ZI�E���V��V~��BŘ��,�]S�'턩���/�� ��M�-kE �*�\
`cD	V�g��=i���R1ɪ�EӠ��D�����{L����&[�/h�ok����3�p7�G�6���iTU��{�p���Z������Ƽ�m�Y1�D�>]��c~�Fo��sR��0�f
���ɕe�"m&c�Gs:C�p����@�D4<c�R��&+0�6T�)L�ˑ*��/n��jmnM�%��
�*`���O ��Ɲ���b][�p�>�����wu�]���8i�uF�~�k���a ��7�����T�+�Y����|�`C�,���v��1�7V�㽥]1:ұ,,fq��K|[�ox�`_�������g,_\|]���:ro����^���ey����*�ho���k���@�6Y��)�7��w.i�m�~��B�n��:���3/J����n������f�� �%��A�Tc�6hu���e�����p��D���y��ڧ�������B�q�b#����ۣ�����&^ `�
L����^/%"��
�����沁��h*!ZW!��:e��]"�O�﹖��ڶ1� N����^�ޡiy�H�����+]H/n�Cԥר/��OnvO)��h�sk���7K���Zk�j|B�>r��_�T���RD߂������D����=�8�Q5�m��ZN�mb��e.��!6���Nx�lΧp�'����sư*���.������bI�Y�&�=#e'+����^�������ñ���ٔЇнUU=qwʛlw�=�r�?��D(��� �!)~���F������P�5w��Fp���*v��2��G�����D�:�����V�tu�����e����    �#�~B%��sz�?�G~`{j�Ȇ�=i��
�Ѡ�8���c{���ҨH��K�#X��5_��Vۥ�"˓��_"�V �sa�+k悢‪;`�9^`
��Z��>�Z�A����s���5�w�&#&˳�7�I$S�G�~`�ݷ�'�Բ[�ѱ�Cg ��ʽ�����?�,�2�����U[\� ��	ɷC����m�P�6���ϱZ���H����l�2���J<��Ձ�O��.j��!�b�)�մ��$�~_�R�̲ܣ���T�b_�c�#��_.m�����~q��{�N�P8��M.צ�m�q(+V�������>�>f�@����/E���FN������ EE�ZL���7mv�n���b�X�p�ܼ���pM�5%�,y��?����6d�	b�n����'5=XQ��M�]>f-�:݂�9i~hN��y��uz[ep�vE�<# ���:� 8G������_M0��K����,���(���/T�,��2��߶v���aT���Vk�jTe�>:z&��nB讄2Xnr�U�!��U(���	��S���O�q���u
n�k�� �˓��)�
̵�"�4x�Cj�B�F�U�}�#�naICu�f�[��x@N��P�v�T�Q�k̓���DЊi'��[�l���2D�
c�T^XH��ڋ�&���(�rI�R��?p��
ɞ�ἔY�[��b�)���R=�}u_Y��nO�Unĩ�۴;��7*J�+�])te��-H��B8�2^����ϡ%}c<D�9����"����=v�j�m��}����O�t��?t�`(�YH�0n��J�'9��H1�t�.��%��Y�T*~��nW���Vp��kЫ�W��
�+vj�l����ﭗ�����)����������p��S�S�ÉX��7e�%�Շ�uR����mS�8���O�ƼAo.�Y�U�~v��]p��0�l���xe�K����7AU6��Y�E���p�[��� ��U��1��.*����=�a�P'�{�����E����;ui�$)��q�p��{�fo1o�et�˲����U��e6bZ㨶:R��]��Lx6QY�E�rz���*�p�����|�i�& n�\5�)2m3 �1�n�Cc��\tY�9
��ߛ���
ΆI%Pסڠ���|��x�ä���0 ��fKڧU�ُ������÷����������������������������}�%(���k�{�'���z�󔺞k��O�&�55��!��$8|a/�*��K�E��} _�й��z? �V���a)��R�yy;c��g���=2�v���0)mD���Z���Y�%���S�i-z��^G��a�ә.�!�'1�0�����,ֿ�P�ܞ�b�e�o��3�e�h���P���$���4��lvà�@�f͉SSQ���r1��g[1>�M,?
x�)	��IJ�`���-d�aS���&���h��
��<����u�X
����>�X��4@?t��z�ra�U�M�:�����0;�ҩ�����DUw�&�Y	s5;i��I�lC��l��/S�	W�&=�o��j׻P��Y1;�=:e=�P�n� U������\���H0�ȹ���S�cU�e�#(���'��h9ųS�j��m�bfx�7Sؗt�>ft�ś������V�lۥKdJz���J)Z����v$���y�9tKG-k��<l��@II\t�^�"ՁK�R�&t�o��;�����
�#�u��\9-Oa�Zš��:Vv�:�`��3X���<`��BA�7tj�*��T�֌Cb1��V���7h���G�Q�"��4;E��l,�ο�/����)O�b�,��dl�޾l�g�k�I:�ꃐ�elM���n0���}= �x�9�~��/�b��B���Zg�\�!����P���ð�å� ,��ze�5s�@p�F����������Q��g�B��S�ի��ރ}lN�u,e̩@Z
Bd��t��K��i�X���!h��_4ۭ2~��}k��+�B}>�,G
/U?]A�,dG�d��%�=���dv�g�Y�:�7�����q��3݋CS���e����~u/�k��DՓ��}b����VDg}eu��V�ƳO�Ԩ��r��3���OE���}.�"��8��`��du��,�Uޒ�be�V����Yi[��e���Bl��q�{�5��]iW�0H�����{=o�c�.� �-�E+<%�3'�|jx:�3���_��fs�;���Q��e�f���~\��6Ëw8b"9.PP���V���UC��y�{����.�ȵ�ֿvU����A��;Wz������0�<��T�?��3��K䫦�bZ0���x�����nv��� ��*X�hxti��/��gg���ɻ�h������/����I�K򟂫RA�
�ñW��FA��2-�ʳ#�����h:�gp��u�5���m�eU�0󝱢f+�7�L�U�t���.e<	-�*��u �ő�l�dd6d�&dy��e��M���p�J�q~<�����[;�3*ۏu;-)1�ZX�6�^?��ңΌ���]�eg*grc�B�,m��O�T���]����s`�Xo5�E)-@[ D_w�.z����5�?|݀~�ڪ3��80��pk���v���'�/����e���4�#Ntϴ���ꪁ�$5P���t��*� aZ�X4������#MT�,-t��|d��J���re���=V n5ÿ��*�EHۤ��ҍN�B*���I�"w�x�Џ�~�|��y��w0E��ʿ�NE�L����
�Q-��5����^�Jj6�$_�,��^��[+|��F���I��E/�A�:������2Y-е��>VH�ұ����m��ҎUFX??ЙQTj�����2��C/���1��a�`]�~d�8T��-����[6�	]�҉�{ͅ��E�MB$�����']��Y��r2���nl�$�2�"f"�L���c6���B$�h��l*�{f*�G'~�f]/�h֢;���^!n)��6�F��~�v�M��=�ΩZ�f�b�V���Cw���l<����]Qn�7}�_��hۜw[�+Ź�E7@6Y��e��pI�F>i=ϛ��b�:k�H�k�9�#�֞Bq�^z�^B7:�ں����/���^'���� }8V��Uŷt" �w�=uM\�r?�t�W*t ���A�o���&q?7;�ߺ\k�UV)j��q��g�s9��W�O��4��Lt��b��sWt�V!��?�	���K�r��<"\�/�_(@	�U4�d.�9���}�}�9p:q��W/:]A*mUZ�Z�ⷾ�/��p�` _J� r*!YѤ}�._	�Or�klT2�{�HU�0nK�ϻ������m�=�ʆ��\��B}��v�;����%jPJ88H�n��)�<�Y!�q%}�)�f�O�y�<0�X+jXq�U�s�-�E\��Et
m��eu�L��Y��W8~�?.l`� f�����Y��d��D.D��5�[8I�]��p}l�����􃆮9SM��w�E_�1'u�r���y�ݽ�UnM�tf�;9�-m��3����5�|<O�+���;��Q��*�������'ȶ̻[�����r�mW�CH�)�`U�"����G�ֺ9ݪ;�Q�s粡�V5���r,Ɏ��ut7�	�FiG	�*��*���I�j���A�q�k(ݨN2��x��A�f�E4�3}�_�'J��
�-�Y5pV.�x�B G5�G���*b��4b+ʵ�S�'��7���%U^��pD�q�)oT���hGO��ań�Z�tCq�2
^�������kEe����3ͦ���5�;�B㯺%����R���|=_�]���9,&i���	��Pwf�rwSRM�ю%��3�"��������a��ق2=*�Z{5Y�8���0׵7�%}U��5vI��]JRZ��箛=y��#�06��W$�2��7;����p�	�ɌADS��!�R.cs~���7���D������O��2/��t�V��o]���L^(��a��/�N�B(   oZu�p8������II�Szle�_Y̙_��w�+j��͂�"wA]�<�w=Q>-�X���>�rz�A%�J�CpkR�.(oy�*����X+Fϧ�����V@�7i��&[W�2(�L�����7�3BH�OD_W �E�������~�t�z]�`��Lz'�ԁ���R7{x; o0ضW���\'X6xX5���։��B]�K�@{��2��^d42�	����q��	�ɏ�\�%��c8����p�+2J� �	'�=Ү��6�fZ�`8+�G�b�Y9QF�n�L�PY�|��[ �o��NZ���@ڢ[a�ʽ�B[թ��Ͼ���5�������9�Ɯ�\)z��i]3���R�v��j�������>N�L��� �v������|Mt�^��}�b0������+��q	�,��i�w�2����3��� �ga�Ӎ�����9�,�q��х�F���������
����ĚZP�K�����C��������T#�.�E���W�jGp<9S"��U���I%ɽavl���C�q@�J�
D]�����MBA� ��L�^�e`�md*�AxO���0������s�ܞ�n���=
�S�)��s�SEYB�-�o�t饠�	��΅ѭ�ۚ��㢳���MW��݄�0n�����wg~��RjljR.�6�RD�ɬ�O��_
!/9�v����ӹ��KM�[,E��[Q�T�:�����>z��K$4��U��=�q�2!��Gѹk�΢�����h��g���-�=��=u��4Lg{לz!�W��t��g��26��_�$b���J�N�~�~8m�2j��:�+Fw�����N�wA9G*��5	<!�#c�| 7�����qD��[�q5�^��0�ޤ�g�k_(�S!��j���1�WJމ�t��`B6�hU��ZO��|�CW�,u��U�̅U����ܪj� ���^�r��dԝ׵ڷح���۰J:lTp��zy׾����U�$�V������6Wp�         �  x��VMo�H=�_�e��C���4Zř����l����$h�$�~�gg.��edڲ�W��*H�q6Pu ս�wVB��ƻ�N[ei�4������Ld%.c�x2��y*�k}[g���w�p�	��c
�ApUDH�Gy	��C�rlО�B;���0>�륖%�6^�� T^`S
Ԡ�F����͆*5a�{�[]�2����u�X��~�DT��F�;�˧�
�Yd���q���]���>݆�K��M�vz�g��g<���o�����������Vg�8SI���t�����S�'��܍=Yaj�����6*�Q�b�����O�UBN���s�؋���j<�6��R����\�TH0&dؽX�"�5�q��2^�/Y1�MӬt��A�R�|�7|��T��V�����m��%�|0ZM)D�\��>r=_i�[��K��P�?YE��Z����c���t6��q��P�g�����4�	�x��M{�.�>���=w6:�5��8]�@�4�ɓ��e� K��L'}�F���SԀjCe�=!�2t'�S�h�*�"�E�gX��+�	�Z�e���EԴ��8�lSG}�{�����	�$t��cJSB.���s��ƞ;Q�qϝ��s?��;9Uw2}�dI�e�;��$�>�y��;��������o��1|�����f�L �
p�f����3��*E�~����X+���[�ݯލo:Q�r��l�	B��Z�"ca�6ñlo����WMM�}�uو����u���a�n�W�/�$�D,X��0�,CQ�G<f	�&biV"�]���D���8x5��2(d��i�)m�������vtyQ ������T����=w�]@,6�ٰ?(��˃nȯa�A7�9��9ч,�h�����ލބ?�
!�|�|������$>߲����V���޹w���+@O�?m��Q(�U�`Ejɖ��M"oQ�7E��>͞߆)w�ʿ��(? �-��            x������ � �            x������ � �         Y	  x�m�K��*бk1:�{y�_�##�;��J��
��c��'~���B��Cퟴ��d�>e�����O�$�MʧbP������9�����+m7��(i�08/q.�g^�k�<5�A�Z0P/u4�'g�6��s���:��ip��z�p=�9����홚M�rRR�v)�e��<��D���m~y}JW}��c���9��ކ=���z��	�����172�=���:����.&�OmH�S��Ԇ�~jC�P���?����I�S�dj��LmP���~pդ��A^���~x&1�_.$��A�$��A�Tep�&�I(5	%���I�P�X(� �X�H,A�DB	���Pi(�J��N�J�'S#������Hڑ��b�^,��Z %%��q"iײ2�S�h+��$�)�X%ˡ�T1O�4��Ћqz��[z�[:��KO�KO�5f�J�a����b�w�WK��7��Ƥ�¤���JO+i<����,k�c�a��<S�l�BGlŎ�7���_������ �Bb����E�>�v�H�Ԟ���̥�(1���L�:�IȲ�n�lb8	1��OB+��P��������g�G�s�d1%���'e?�I�)!�P����M�2�iC&�Y
Af8�B�_��lƘ�>�I�bN	YP����>�I}e*��]c؃��d&#�Nf~����Y��"���b���W)��������*��Ē=�nsP٢-���N���HH��.�E���ߴ�tp5f���V�)��a�-�.��;9<���S�ȋ�*]��ӆz�KVћ"���Rok���,��c���7_l�|7������@��E}�����繹���Xa�n�X�w�j2>�����̤ۼ�u�q��y�|�S_�)_20y�0�kQg���E�:�s���*���U�,F�R.�nYz��U����v�b�v!̹���� `/_ѐ��K�x�Y�q�7(���T����\�ɛ�ʛdq{�𐷋�����v�%}���F��H�D�T�$)IR'��4~��{8��@���4�iZ2�V͸�=)�����E�x���"4vLPq����az9}�U��*�,?/��._Y4^���y9 Ec�FR4��h4�A�F��4)IR4��h$I�HҢ���D-i�/��,�r~�G�V(�b�faW6c�(T�z��Pᨽ~�G�棭 �V�(f)�� �j*ecK1����o�Q���r˴���\����U���[p�lfy^7#�
=�BN1�4/FE�9�R�n�d��sBs�'��s�d����sP�y[�&Vt�êL�j�d��^�� K�����dW�e���NsX�iB���U�ܠ5���|��Z�f�Ql�>��)�^�ud�q�.l�6�~���-�._ZQ��M��^�=���[���c%��&��P7C��#
�Q��,�gސ����n�$���+��:Y�����yq-�R7c�b">����^lj�W,�l�X�W�4_�'�1�KL��Ǫ�#���d$���g������`��b�� ��3*/u��/�ROm��!X�6��-lA\<��ꅥ���7�r4j��F��o��-/�x���BX,�69�~�)�U���*-7Z���R7'�.�.m�+��c!�'9�e.yu.�,/�b%,�(��.���������Y���Ч1+����^�l�K���P��x(�V����㉀��r�8���>e�wG%c�Kٯ!gn��� :{��){pæ�qq�eÆ]w���2Q�=��s�Q6�x`e�~'�e�j�\���k%U��Jj~����d��v+u�1���I�,n���U3���Q��_��1�^O�ff3�΢�$���
�� 7q/�\���QaV�Gl�AOe�y�%g������:��.�o��J���YY�m�f+KŰ�X��zG�U�2���ӹ�x����b��%,Psx��ſ�a������&���g1ˍ��/j�[u+���Qc���M�	}s,�/�~�me6�����8������Yv��+#V�B�2□4B�.����u��7=�UZ��Ո\i��GZ�Q�#%U?RR�#%�~���GJ�*�S�*Z(�q�������ڴ�@i��| FCĸ#��j��,�Z���_�/��Ơ�ZO+�v��w[P���#ն�P���.ɨ��`������~0)��`R����췾Ie�&�}/��gx�W��i]��if�~��J)�>�l��g�2չG��~{��k��L55K�۹�j(���k��]?����/�6���,:J1N~�Db�	1ӄ��A��_,��r�~�D~�b������8�.�d���R���-����-B��i������!��!i+�����B�����������      9   �  x�m�[��*�����)������^��]�,S�`H�������!��~i��˿p��_Y�ʿ�H�=��_[������Y����/,Co�s��S�Fh?⠉�4ʽ�����s�ʶ=l�Q��J���M�N�n4;����S@�������&������"M��oB��2-�&�z��\y#����Q��r��o�~lo_���&�|���^����NG܏������v!9�vlM̅�-ɐ�~����,������$��#0K�0K��>K��>K��>S��>S��>�æ��/�Ʀ��i�Ի7�֫>��͛%�y�$6o�ܛ�ҕ�iag�j�L��8SSgz�ޫ]�{�=J�{��ޣ���(y�=J�{�R�ޣ<s�Q������z���z����'��@#����Mq�c�W���L
+#���9ȫ�@�ڌ�W;��пr�{a=[i=[�;�A�ܹ�2w.�ΝKy�Υ��s)�ܹ]�}ϝK	s�R�u.)Y璲u.�R�X�P,u(�:KH�ԡX�P,u(�:O���S�����q���o�uF��z��7��7�:#��SVF�΂8:�Ua��o�uf,��t85��^T�R$'��H^V�TF^V���"yaE�ʊ��qUd`-�����'DP����Fqfc��<��<숞y�!�l���C*�=�`c�,��#��
	d	%��YF�,�D�R"�)R��YP�<�dU2�*�*�d�$�pDV�;1��㦳�rVz��_�h� �g~e�ÑgF���B7�3�N�(�*G��r����Ԣd�W8����vG؅p!9�Mi�clq����W��y�w�㳊��˸=u�E���mh�|8��gZ��z~�BY�&�MdE�Ȫ4��i"��DV���R�y�+��j2�*�gp#�������H�g��;��U��f) g
S�f�i��#�����5��0���Ϙq��k>	���$+g����c��F0��`4��l������PL��x0G(.�t:Rq���Uٙ��s�yBO��@C$M��y{���s���i�t!ax`~�7sF�Gg�55B΋<�@�P�153Q�15Sԍ����RuF�:#D]\,�G7���./��3R�1��Oq7[qg���W���=	U�Kn�B/`������p��׳��w`���Z~nH���%�~�#p��'���Nd�`� �EV��Y=(�zPd� �Y=(�zP�����A�׃2����٫Ȧ�"���lKzm+�)���"�Ċ|+�i���2FZ�P��\�p-������Z�[%�Ҭ^q=iv8C�ӽ�Dۏ.Z)]Y��L���G�9"ނ�T�m�O����tF�y�O��;�����Ӥ��w8���#��G�u�[�@ȿ��j=#Ğ�e�z�H�]#���wFH���4&�fc�k6�<���vM�n0k�^�őt	�se�o���������C؏�&�Ƀ�;�3
���>������Q
 墑rѨ��3�Q N4v�F�7���H�h��|�}�l��w�g R�y �� @��< ��< ��< ��< ��< ��< �� �� Y�@��.�#|�F*�4w5B����L���&�F*�T��ɫ�Ȳٴ��B���t���hS�G}�7G��^���`;8�-_=�9�=�^{��M����W��յ���G�}\_�y�����7�����:��U �*�sہ��.66IM��/a���h�wf��3c��b%^� +�DV≬�Y�G�M
��x"+�DV≼ēy�'�O�A��<�Hd��AF� #y��<�Hd$2�d�%�hK��l.���I�'�E8�-lNd�p"[��"���D�'�E8Z�E8Y�f��h�$%k&)[3IŚI��L�c�$5k&�f��]��ͤEo&�f���,Sd�L��2E6��,Sd�L��:�l�)�Y��g�2�e��Ō �73H�j��� ������ ��$?��/h��74h�+��"�\X@K�9��p�\��vp���X:ۜkg�y����t:��	�_��:8�cD�#��p�U��"�˔�+��ȭx�����j;sa-]y�Q��ν��C�el9#��4�_�{������w�/�_K�����M�i����KϪ\r[,�ňH1g��3z�BDھ5�w�EH�ZD����3K���²��tzٗ���=�Ǘ�iM���߿����/���ބ��Sh���,�G:Z��<Y�,E���dy(�<Y�,E��2�C��a��������(w#            x�u�����n�����iR�A�U'�,��1 $u�U���>k���F��9��O�s~��gjr����o��>���O�����������O���ϳ��ϻ�ϟ���t���g���|�I�?4'
��ǿw�),��E�Ea|SXW
����"���n����a�8,�3�Ex	���+d��wȖ�kȖ���-�![n![:�ΐ-��-�-���-�_1[�),���������J�Ș�PpLy)>�4
�*�IQ2%Q�L�+S
�˔�#f��A3�r�Lz�Х����jZk�~G�"o_�r�~������H���7��E�:j�H����◮��������������1L�Ѯ���(�#�>�m<�U���b�i�w'/;azy��̷�a�y��Ϸ莾��o����f���G�[{=����Q��������r��-�ǧ�ͧr|�Q�ֽ�:���:�n+u�O��N�n��~[w�v|{z�ڈ��hc��3[�Y�� l�-�;(�)��(�5��(�A8���G��(�S���H�_�Է�||������\���{F=�N�F��m��m���a�������=�ֳ��ѷYG����|�����wLeX_�|�4v��v�cl������s�XΟ)~�jIc��47���28Hy���촱��?�7����}��kq������\�[m�����!����V�]p�^J�=��3�(��˩�"�Z�C~i}iǷ�F��$�>�w�ߤ�'?~��Q����R��D���V�?����\�ؐm�_���|x�
>?x!��O^�	�ೄW�q�)7=Qx�*�D�^�{I�J��}�}���C����i�;J9J	J�;���;�־ol�}��S�3�~�X�
��hQe�Vx�P
�J�qB)<J,��c�Rx�P
�J��A)>6(�G�����;��I#���3]�i� ��#Lӈ�<b���X0�F,��#L��gƂ�p��W��B�Q;15LH�&dL
�	��	7f�	�ń�ń�RƔFY���<)qL��,��;�uNSf:��4c�ӈ�Nf:��4_��x�&1]�b���٦3
�1�ו.���!�b0�>�/Ch�`L���hy�p����!X��4��B���i�L��2�����a#.�b�N�e:-�i�����b���d?�W^[A�����}�	��}������/�+^���x����
��|�+/��W��9�e����{���7%���J��ߖ�*���ߚW�7~��d����x��Iy�*���V�65�a(�C�kJ_�P����0T��,w�c�k]�`�#Z}�=�{�� �k��0�ap`�`����oH����G6�.l��|�%�VJS�S^JS�*���1%Q��)�L)�G�\�J&ݜM&UN(����<9\�0����	fm��0�a�i�`҆���AG{6��l�QX�
�q�i8QXg
��Ba|QX����"���~9,��er�l�J8��ĝ�6܍��
P�z�0Ć�"6%�a����f�X��@���Z`7�7A�)kL��8�<�;���>�4� Up�	J�<2%s*�T8�L�8�L����/��*�Z��D��]ïo����X�'��1<�:���7�/h����c�B���q��푵xC��0�.Wh^��ah_���ah`��ala����D�ݢG��u!�QƖw�~6�|�t�Ӧ�6�逧M<m:`����v�YZ�����~l��XE{i�`-�,����W���
��^���)��k/Q��%����^.����������+F�V���[p��b�l�d��ɭ��U+�),cֳRX?�/�Ep��L�N
��Da�),��E��a~sX�W��J"i��5>d���l�|BA�8AA�8CA��@A����H���y���(�D�_,��7ʗ��j9)eLI�5�dJS
�)��)7e�)��Ȕ��Ȕ�Sɤ�٤�urB���;=����␥5R�(�_��yȤEA��<����3ݼ��f�w�ݹ�u��W�ֽ�Ys���u��-���_5�y��:i��1�+���(@�Tg�v��KK��qw������M��	�2c���p/����Z4�
�«��Jw���~���:��n?3���:�����ۣ���?ex��Cr�d'���-�}b}��@��Bq�M/@��H��R� �/@;��P�
�T��M�4>o����te���"�����ai�_q�A��y����A�R�2�x8��g��i��><��3�6�1^����,���{���w?��&ï�5�E;�5�|x��2����J=�.b;��0�~'t��7����w�O;�̓�A���F�&��6�b�(w�|N)�
�I�䓱~�
��^�*�+X�;�`-�,罂�W���
��^���KT�{iZ����窔�f���_3y#O�p�����^7|�z���O\=p���<�4Y�2�8�����>���p�Ï�~Wx�Q��Ï����>�,�旁�c7Y�2�[q7�����ƫ?`[1:�bt�rl�	�'�V^(ct�=%�)7�)�:?�N3��R��(�T���We�)��ɤ��d��)e^:e��0^R����堅q�i�)�;A��B�b����)�{@�
�\�8�4�(,�8�4�(,�3�Ep���(,�o
���a�pX����.��V�+̀�p��n���ww�������p��0.1��K�7�(_3����Z`/]��J��1��1��1�R���P��R��(�Tዛ^J�M&eN(��3.�(^q*�θb�+�θb�+����4�T��q��WN�q��W~SX�
�뛆
����"�QX&�+���Ep��.��E��a^9,±3.��;㊱3�p�θ�D�
�W��q��W��q�wt��WN�q��E�L.wJ��1%S�R(wL�(}L�)�L��D�<�G���J&5�&��Ls'�),��+3̀�06����>z��R7��w��"�Pw��@�0��(��3�a��/;g��:���5�����۠�V
�R8&��j�PS+�zZh;��V
u��L�(��V�ճ�i��B�����p�D8\�Ζ(��%�&8Y��(�!�)U�h�R<Y��(�s%��j���-A�������v�T�^���PA{jh/@�������W���
T�� i�i�PK+�s�Jᘶ�n�w�PF+�*Zi��͏�"Z1���%choHӣ]��P
��ЌV���؋V����P�����s�����P�]�`���h7X�R�Z�`�J�q���*�]���*�U��h���jC-l݋��� ���"���N��^���P{jc/`u������W�y!#���C�ؼX'���y����y����y���ʩy�����e�4��h8QXg
��Ba|QX����"���~9,����r�UD�)d�ߎsȖ�KȖ���-�![�![~B���l��l�x�O1[�1[/Y^�rQdL�)8�T��)�Ȕ��dJ�@��O��)��eJ戙T8h&]7��]����Uy~ݾ?i���C��e��_���&�g��o�Goq�4��?�4�Τ�6��~٘�����G�|�9#���)��2_F�1�-e.�1*��J�<y�-I�����/V	J���O3�/�Q(��a��*_��n��9�F����<��F�7�wߡ[}�_!��"���,_�K���-�}3��?����1U�����v��x�4�Rw�m��*���g�Q��� �3�?��{���[Α�/��ǖ9ޜ��^�]��Oxv
/�^��-� ���&�Wp��
�^�i�%�F��q�oS*����W��g���Q1N��Q9��ӰQ96�/Y�t�R16�cC[16�������ڊ�����ʩ������U����2f�2���<C��B��m�%���Wȗ��/ט/�?1_c��(_�Kta�+��ƔL�cJ��1��1�2�R��P��r*��8�T��^�=^N���Hs��IݴH�f a  �{�wHmt��=8*Ӻ#������7����Kt�����߁ρ�|�\��_c%}}|N�?�>�}\1��b�q�x�D1�����btq���6�|\9���{$W/���Y_�c8�C}�*}7Z7���>�$�VF>_��H����h���_b�.�0��Q�EQ^���xA���{�y��5y�T�)��,��/��2��5��8��;�%�>�%�A�%���j��R��,�-�E���(6p��͢ؾY�7�R�fa���٥b����ī�J�o�(�mŮ͢شY{6�b�fQ�������_�0�k�n}[��2��$�۟�UZ�0����*�V��Ӫ�fN2�F~D^7+8F�x����>]>oVz��9�9����7,��G����������@��BG��B���"�Jd��G���[2���oɸ{�xrP�
g<����,d�;p~�9mD�^oZ�*ș?rwd�����`l)�1y��5b�[*���R�[*��Jal�ƖJql�ǖ�ql�0�-w�ͩ\,J}����u�h�.HӐ��=����/Ao���������䍲ޮ�zS�揙������=�dpza^��JPd{�l/@��(���#O/@��l�xn�`����y��B��\����Qo��)Q�>�"(���	�|{����G�m���n����a�{��Q��G
dޕeʴ�}	�2e��zۢ�J,���]�X��W �өW�)���%~���ӶS� ����H2N����ׂ2<����ܣ�SF���"��+��Ұ�����ʜ��%|7�.Ȃ/j����],q���	��*'�{���o�r��ʄ50�(��*������?�����B��      7      x�m�I��E���[QS;��73�/ 0��>5���y
ɜ������~���W�/�����'�t#˿z�qD	Q�=W�G��(*�Zt��R�Σ���^O?��h��U�=���A�����<Rp�L��{��&s���o���wR�3�wD��s�� *�R�RlT��d�E'��y��DGD#�^D�q�r�K��{��f�埯�������;�_�mw�T��[���?�#�:�A�G�/��v���;�&�; ӫ��M����;�^�|o�I������?��7�~���I>���r&��z&/'�H��I?���s&��q&���L�~���<��9���� ڳ�]��"�!J��j�t_�=��]����wW&���7ʞV��~G�W���{j6*��
�GTW�k�����.��>_������.��KU��^�\�QZDyu\��s��.9��j��T}�\=��J�������{��g�U�	��}�iu^��`��y����KW2Q]�wѸ��}��qĳK�����O�����{s�Y��3<s���GI��S5AY���4%O�|����(y��I���(IA�Q�U�Q�z���Em���NIe=؜g�W�W}��Y�ec߸��:�w5ߘ+*��ed����?���/8�ZH�_���c=��헮��������J�H�_�+�#�R��ɥg5�{��h����L����d�^�O���-��j� *����ro\߽ڬ�&���[�F��0��G}6܂�_^�a���0$+���~}��l�VQ�Uhy�.�TW�k����R<���F�g0�B�$�Z�`-6S�jҕXt����I�.E�T]�&i�M�u)��ѥh��K�$����sYz~�0��)GeS�&*�g��I�EK�*DK��BK�U���U����]k�qд����%gq�v��r�Y�dM�h�e�鳪�ұ?�j��N�Z)����Z��UX����T��-eq�+��]>�j��j�Uѱ�f������"M�*"K󪠯~5.{=�i]��,n���}��=�#����Ư.��yo�$]3:ȺetPt����A����F�^u�`�E�N^S+�TY��'�;�R���~ k�0f�w�hZ�#�^)#��\|�v�h�w�h���t���]c>��d����4NR2g)��.��h�����K��}׌�ϮMǮM�]3��5�8h�5�i��Ѹ�e��UJF�K�V�����%���%��KFѵ��M�c4�{u�i��i励�I�hܥa4~��A0��A�3�z� � ��������G��Ɉ	��]ө}�����'Ί����Ӕ�-�].��.�]/��?����^���-�bx:W1��!\TŘ��K��\���b��s�f�s9C�=�3���4ĕf7<��˦h̒ݬ�)b�D}����.��n�űk<��=�`7x�u�Cvët��-(!Jz�B�<AQ2�����{MDI
���t%%(#Jj�F���(�QQ��Bb<WB/���S7����#�Ӯ#��#�ˮ#��#�ۮ#��4?�#md��62\<����md0+���E�7X̸�mw��}w����"��t��t����.2<���aQ���>�ho���X��m�(o���X�~��l�}p��W�����������'�$#�$o�?3�w�?HR�?Hr�?�J�?�j�?���g����q�<\� ��&n�����8��.����������\� �?��량���8��ή������������?������g��v��\� g�?���pu��\� w�?���������3��}����������Ԩ�������<Q� Q� y����{���(���(����y�4&v"��3Ʉ�J&�\2a'�	;�<q��N&�|2a/��{�L�+e���pw������_�?���pr��]� �?���x���}��?����������v��\� g�?���pu��\� w�?������<��HJ�)�D3%�i�$R͔D���H6S�fJ"�LI�)
�3�g�X9�4����'�6#vΩ\�/'�x~�a����J�$��!��]��9�5V����IXC�gk�B�D�h÷�N�k���F�A;p����m��"�f#}�]���,��坵�q��b��ɮԴ��M���l��d�U:�ߥuĚ�Ī�'����v�A��ڝ�ym��k���6|����Jbn,���ց���$�hl�����s���u`<���։��:�['{��WZ���e6���g+�iM�R;8��v��NAƆ�]�w�������x������w��_S�舽���#��̱P����G� �	;p��noO�?Wy��}�;a�J�Gۊ���mƃL�x2���s}5e�=�ޮ2���xp؞EQn��F�<�*��ɬ˃�d�I�~�g��ypR%�m�S�S�S�S�#)�`:%�`:%ʜ�? !�F�)���D�`:E�`:Eޝ�{w����ջs`�΁�;��ػs`�΁w�s����{w>q��ػs`�΁�;��ػs`�΁�;�9x��'�;��ػs`�΁�;��ػs`�΁�;��|�'p���;�9x�Α��I�Α��I�Α��I��g2Bw�$t�Hbw�(v�bw�ȹ�|O��9a��	;wNعs�׹s�Νvs焽;'��9q�Ή;wNعs�ΝO<n��	;wNعs�Νvs焽;'��9q�Ή;w��;'��9a��	;wNعs�Νvs焽;'��9x��x��)��9%�;�$r�DȝS�sJ"wNI�Α�НS�s�BwN�s�К��"�yn��s�E�,��`��W���<7X�s÷<?^hU��p���=7X��l��%��5n��n��s�ş����ʟ����ޟ{������s`�ρ�?����s`�ρ�s������|&O�ϑ��I�ϑ��I�ϑ��I�ϑ��I����|F#��؟��5�2��kkZvi��<[,�ښʠ���ʏSȤ���nE_5�����
�)m�eJ�(*Sښ�ה����C"sښ��T洅���ik*sښn~��{o�#��5�y����kk�"�Y���2��h��mMeb[S�ޚ���T)o��Ķ�JvkMl#�&�D�3���6�hbA4�� ��FMl#�&���Hm$��6��^_��>z����������@�v�'���7E��ض�2���V��,2������ 5��pUs���mP7�Zv�h�&�A��6���u�ڠ[Qߖ�q�I�������~VX�hE�v(����T�5��lMe˕t�e:[S����YzFc���Z.+e#�f�D#���l�@��hA4�� ��Fc#g�����H�Il$N&�4��Ʉ�LN&v2���Ʉ�L&�d2a'�	{�L��d�^&w2�u2���Ʉ�L&�d2a'�	;�L��d�N&�2����/��e2q��z��,��l������¢�~ξ!<��!����nW9ē��ٕ�H'S�dJ"�LI��)�t2%�N�$��Hr��)�t2%�N�(���:�"�����,��YόX)�9�d#��s�qd��HoG�~��X���]_)ڈ=sp��i伏�7)W�G��qn�\���l��r���V�y~@�E%l��|$&ٻ����*�hwPeݯ�8���O�J�;�����l��Ho0�7�-�{u�j��n׷Zh*i�����~�&be�^߹L��ڟn�/��v+&by���OL���_�v�o]�����l��/�]�����>2F;��m����u`l���n612[�e���l<�d۫<�d�Ċl���:���3��~�π�p`?>��3��~8�f���pp?�g���8���3��~�π�p`?̀�3���8�w���a{���t{��6�w���a{��6p���8l��a�$�I谑�I谑�I谑�I谑�Q�g�c���v��Q���{F{<_���#��f{�� 7  ����6c�el���ܱ+� b���ew�+6�m���.[{k�ㅗ�����=�wĥH,����͆��"���7Xt��U|��{>�]�n+djL�p��g)>WR�W�c�{P;�ٌ96��K���#bQޯ�����r���<�؛'dyD۠g�=ȶK�/�E��D�㔼��I���)���)1V�$� 9%�9%J��=#��)
��)
��)�ΟE?��^ה�����������5���샢��tM�N�X�t��R��s����h9W[��\l��s��ϥ�s��@ǹ�}�u֤��Y�ɭ���[d�H�TD��"�5����tMez[S��B�-]S��*�����+��q��DA��DA��g�"�� ��"�� ��B��$��HB���5:L��:隊GW4�F�T�nN�ţk�=�,]S���?�=��kn��e�5V;-��5���XtM�Fߊ�m�e���5�8tME�k���J�+\�?�Xf����Λ���5u�)���b�5q��xsME�+ڔ5�XIs��3�8ڤ�1�:P���Q�h�n�����D�sϠG�s#�6�F�͍$ܚI�37���_���%��͝�$/7���ؑ�o��DF�5~X����6�͸?���O�,��[��@����6\汛�2���Lc+:�g�e[S��?f�]-�YlMe[S5�����X������g_��;�*�ilMe[S���TF�5�IlMe[S���T�ak����[ak�_2�p������ ܼd��%3�.�A�s�Kf�[�)޶d&�%3�7-���ϟ?����4         m  x�e�1n�0Й9!�%�-СC������m���[�?��:|~��0�*�Bv�\��&�`bl�r*%C���@��L^�:��9����	@��9h4�]�^�e��0U��UGg�����RCH��N%���g�pSA��d}[���-�Է���Ǡ8��ǠxۺG`��?/�8�?��gi��4��L�Q���w����������?�.�Yy)32_��D@�_I[I�oҥ��/�Y�ґՖZR.�6%�U2��gK�5���ǻ�c�kHB�%�����������h��'���7?����ǆ��-|��՗K	~�~��S�|t^�ԣX�~�)8�T��2�*�]��n���ʠ      3   b  x�e��r!�k�aTh��)r3wI��� {�bl��>���՞>��&�(������$���)!�G l�P#G���Z_���r]��y��ٹl�:ׄ�q���Z��V�GqF�b�#��GĘ�Ó#8/v$+G�.h�hq��^����1�ޢ`�2��}u�mv�#o���H�ݹn}���f\N<��+�٢p�O�n?�����d�h�2��LME��xiV'�n��Q��/'dbI=7F��T(C�E�J���/��߆9��ǻ���߂,���bc�p����Y�\�߮K��y�F�pqn���|qu��*c�����a�]�.ʙv�L���3�͈������q���I         �  x���[�㸱�g�*�.��Ȯ��5V�&��>�g?gaޘ3�~�H*lG�a| %��b��q�χ�s܍���e�q��\͜<3~p��|�ûH����^�ŹW��x�OP��3���-N�W�@q�+^�x�6����f�v�n�� �hE~N����{;]���e��:]�$�!W/��}8=�Q�k�r�ՕJ�w��E���|���\_����������/�U]��W��ѷ̒
�l�d��_�"�a:���5�>L����;��~Ir��6�ȕmhi��*6PU���熱���ϫa�ƒ�v��M1|2�6��ZdSe��#�TE��v��a�xH���"|��y��G��[��%����|ȱ� �%�j���*��FA�"PѨ(2*��*�b�*��t��*\�X��3��Q������y��{��t��ɨ�1�5�L5��a��^�L��kL��#�g|O�$!aa$�@2�b I5�
�:K�:4�(x4�̉kL>�If�?O:��_�O�;�"'�k�J} ���� ��Kw�(j�XS�������u�vX]P �>� ���KS{��^�0d�5L��r����|<]v���s��$1�k�B~ 6�0�}nY61��h/}k�	ʺ8�Cha5����4�2|-�$�s٧�6�Q,��o3�`���=@�5��h����r[�J�Y�ȜP��?�%�B$ˑ�1��y��˺K��)]#���ES�FT��Рຈ�7|���n/[�	]�+�&��hj�cmP�*=@i	�u^�2|"CtŻ�p{�0H�ʾ��d�����ӛ�Ʒ��]b{_0�L�|�5����df�mt�*��7�o��,�
��*�GT{�#45�m5��-ж
4�2%h*H�*ȫ
x[E'�����k,��V�bk��ژ�yn���Vq�z�}L��g�_�P$�b���y�/�i��Qjǅ��6'�q�J+�&%�y@&��%� d�����l��Q|?��6��4�	���(�+&gL�[4e�Fg�C�o'ãy{�.����t>�v?���e�Ƿ鬫**�b�\p���L �L&�a�!0�d�b2��,�d�f1�nbo2�t�`kS�+6F���,x������t<Hbo���S��%�+ː��'s�"s<z@��k/ٸls��T#�M��%��VL�?�'��yy��m0�>d6YV�m��/I�̳�
�Ӛ��]c|�2?Yz���9�[}?��9KY�4Lן�s�\�*���OY�2�Fʇ��5���N�il*�������D��+IFYVw���·���w�̡��kj�>���0I?�x6�&��5�.���Q%��������?�\�.�u�xPo�/��v��d��W��N󂲝��vZ�qp��n�d)�Y��	���I
>�Z������؋����9���
6 E��ȆP���m�eʀ�@Նj���m��@Y#!�鸏���\H9��{J	���1���`��?;YK���S��H�'3K��T�¡e����f�ϭ2�b���)��l���,�hu�
ԛ����`�[^wC��>��lϕ��:���p~���V�┘�]C`�
��QEPŨ��g���(��~���dtF��FoTT0��|5�g�ɺ�dmu�j�%Z�s��xj|��5��k:�kƷ�BEW{��O�`���je�e���]F���%`��X����� KVV����8{L 'd���G�������M�h{�d1�ۛ�_���y�L��j�-$g������E`��X������%+����
�leX17�gJ��4�9'��4��Ӽ��v2 ����txג�f\+�tw��%�MVNL�,,�8m��������rJV[,���l������+�m�p����
6�k����v�]���F���^>����9����/;�˭�C��A���+"6�"�(� �A���n���D,m耘����:l=%���I����?V�O�]����n�b��;C�M7��7i�K�da�/u�����M���7Y�k�da�q���Ҷt��n�d�n��j>�������x���~�?�ˠ�Vy�郯�VG��W���ϣ|�o��(������|�|��C�8C��+��8��(�z�+�nC9(�oX�-�atu���t�vo�L:?�]�pi�׍2y�tݨ$��P�V��j��8O��fW6�-��9�mZ]�̖W�Mf�W�e�-��f��?z����{8��7$���2���������;��6ZV��^�r���q��t��J��ʟ���,�������S�<A��-��<w�3����ʗn��k�|m�G�o/i��CK�5?|�~+�~4�$�!�zѷ�e�y�U*4�i�al�������A �A�(�A�@�A�XK� `�%o�����a�%S�C����q�4�8k��.��%��RWr�|���b
��E@ņP���"���6�*��͛�Bm ح�5~H�����|���5uT��9��o�&������Q���X V��}��y��0oei�,+r�R^�h�n�������������=2�6g�Ch������x��rЗ3>���דa��rH�I�\�k���!��ىٽZ�nِuDS��*]�菶Ϫ«U�i1��T_�J7xH��TE�V�{�uų��jUyՂ�jUE�Fh��j]uu[�区U^ϻI��<++/'����0�(<.����1�CL-�z#��ź?�`v�ۂ{ fź�`R���{ �ĺ��`J�;{ fĺ�`B\j�����jij�9&VCk�dX�g�χ��$�-K�_�vQO�XQOY,���ë%+��R�l�9H��`c	/W�b��8�X>ҳl� �VV�s�;p��xp�@0����)s��_���9�~LW(�D�:��o�d� #ȲAȺA�?�w$��d6�2n�$mI�TG~S� G~K���!�y���9)��Tu��!ΙuP�  �}[\ �	@�� �>( RT lh8���������v��q����ە[��>���-���&����h�pv*)�h�iqU�S^|�d�yA�N�M�ˊ�lȃC�%J�%ڐ%|�H������[���T�!�z���A`D�d�ߥh20t�ڔL�kb�a�(��TL�g�&sr�Vu��Q�,$[pNq��t��(����v��$�͓/]�����3f_%p��J�R0�M�:"��/�APG~��u���`���T��ؽT,�ؿT��8��1XZ�A���������������r8ݎ�����p:����+y~���?�QX��G2J{W��>�յj�%�Cx{H
��V����\/x`����/c޲�QU߅K����z���a���M͎��!)�}��0�d�u>�·�Su���/)�اy���|�l�a�����-\D��7�o��C76l����k��u����_�>m��3��?��7�ƭ��-v^{(M���M�ӓr��M2>����iw�u�kw�z.IO�`����'=�+=�;ՙ�(��<�7�����,��|`_��EL��G&����#�'L&���ML�q��7.�\]�C���[]�����3�C�#��De�����gF]X�"�\?2����]ja?3
iq�\r�ȨK+�ό:^� �\?3����3�ny�^r�Ȩ������������A�m�/��K��J���3�|O�M̌��
�����ID�F����̐n������H��t��̎��f����̌��{	��̰.?^�����oӘ�l�`ˋ_&��c�>Ͽ�ݏ�i���������r݉��.��f������lS{M}lmt���>�6��fWV׌f[�dπ�!<��hO����<�5~O���2��q�u;����<��$3ʿi��j?@[�VȟIc���ÿ��?193�5��O`��?�������t��56������d������Jf\Wf{<�2�![~��kN�]����?������      5   �  x�}�]r�8�g�9�� A�|�{f{�co���jO�G����P�-B�ӕ�I~�@� )��ؖ?ί?O/�%��)�FD�����@�� �K[Sr� T��2Bɋ8���K9�!�e8o����"����V)V�;7Ɉ�w�B�Y���ô\/ϗM�dJ�d�N�v����JK�B�A��������	t��Bݹ]\��n�AՎG�`��<�������r��^~)n�5���,k�Ƀ1`q�&�R]�c/�'��ID<i�G$ R=!@�'�0x�Lޠ kʜ����������X��*�m��j�������{X L���u�B���5�37��%@'�#��p�%BX�[.	B�j�G:x5�y����S��k��$1�� A[��j�
?T����^�Qm�(K�j�4���U�^�Qi�]��z�F� ��X<����D���x]�F��O����k������|Z���ۀI�6r�GsnadQ���W4*����B���z֐�J��+_cq�Gf��65�XYG��U�2�6�g��h(6iY[�@4����@�_��^��\�u��)��0q4�x��XYzo��Q��y4�2-K��Q�}NWFT�������ڨږ=�P'z��N���ϫ��^;�.��wk�j��b��G��@���G"�AT�!T="��GS/+�ls���QߊȞ����'m��f�:��{�꣉�ti֛�Eu��H�f�|�ꨴ�\���PQ�C���\{@2 �^Ϊd���h�UU�`� �>X	Ŝ�qH �4^�����r�>�~}V�"W�B�7B�u'n�:�fзE�t'�������3(��������S�݉�-TǭY�������4-��G�y�ښ���f��>ܢ���`!�Nk^�կZ$v� ���j�>;��U
:m�`�0����#ݫ��_�vN���+е��*t�$#��]	�ǖ�N���t��Z��p���j�
���*B�ղ��I�04�L�&;#Ј3��L��:Ӡi���F184	59�#M.�Z�^����q���E�
);���Nd �;Q��NT ĉD����N͉�"�A��ioPX57�h`����nK(A��Utfaje)<P+dGh��&�Zg�9;W��%֭��]CN{��Sﴚ�tJt������s�:ް� 6�e�8�0�����O��B�!aRl�j�z���|��#*�Y��H[���G� ۺ����D�2��*ʃ�@��Xۑ��1`u8g��[���;y��~�BwӖ���EM���G�h���G=!@�'�$�=a@ēH�D ��@�'�.xû��۲���(ƶ wߪ�-��\�[���lU�z++qtB����F۸���	¤�-�2t6󶢯��l�EܙB/�@�U���:��ҳ�%wGZ��@�&� �p.���)��}����V-\m��eۍx7Mt&C��hؙMv�B#K�j�g{�m�vD�?4͙�����Śq��[;�߯��6M�%�R�����W�Y��D�#v�!�1�k���$0[;^�e�+�	�0�:�i�0ap���9�8��֠������Vsm�r�������������������������������I�X(A�� %0�4E�|���|;�<�,��騦I��e�G��Zvԗy� ��HD�I�dGq$#RD�#��H���� �U4W_r��7_��^p��()��9�����"tqp	:�pl�@�c�����e�,w�hęMq�BS�iд޴�c���Q�R���<_��چo 5Z,[��h�Zi�$z��V�B�`'
ى
�8р(��څ��:A@4'"�Yp��Aa��??H^^ο���O�r"�D���2����
��$^�s�X �6�-�B���ې�@��#��x!�%��G�c��d����k�*��v9_϶���K�8n{	V��p9{/�ɹ�\�^Y�=�:@�=�s�\������K�p@F����8{�d�v�w(0���V�7��B�r�o��@Wqy�R�t��}������MF�^J�r_e�J"[�9��S��&O�'�=M���)Bma�j�]�Ot�^ᕞ�'�ښ�y/�p��������YF4�q-���f���ʟe���u:�yZ�]����Ie���YߧhM���R��E(y��G"ߏkU���ǵ�E���Z�"��q�mj� �S���$trzm�bOd'q�)�gO�o��V(�$�W��N�#����DO2 ��=)�dO* �I�ނ�E��i�;�:2Lo��k�(��B��K�`����%����o_��8��x9�~�d���p�S~(�*zU�J���{���X�e��a�=+390�l�m�w�K��Уt0a�\\
Ob<����LrA>Z*�����v�n�Α9���y���w[g�f]6U�l�Y{�U�P��zb���ܜ���&`��3l�0�4���-���ZٸM?;�g��7'�dpw��Y3��Oswy�5��v������촚b`��|���iQt�0JE�ء�Qv�1�2F�!��:T0j�I0�S����j͇�6������.i9_/����4Ŗs~/��Uz{u��P�(9��C��`$��C��Pè�<�q0�S��S��#4	:�~�G�1���!q��)�BL�<"��HN�D";Q�'���� Du��hND��+9���V�$Z���vy��>iKdJ!h��-C���t�U��n�,3���uF��Â��u��i-6s��\�.�\�.�\�!�sCN�����u��ʱh�h�����A*"ё�H�	D�B$;G"�FD��ddl�3���p�]���\��vmn���>��lP'!����r�:7�e�:7��8un�i�� �y��8��Թ�0�Թ�0��sb��8�11��m�!e����������Y+�ИJ�A�oו��O{��8ʄe:~vj���6�һ�]>~�j��P���rt�m0�U��}k�s8���YJȳI>����%����������uI�s����oމ&p¢cyƒc2c�X���X�1q��X�qj�MXu�f�9����Ӡw�}���i.�� �5-Z����^.�7XZb���mٖ��P �O����\�n��2��Bg�<���5���Z#'��j!�\���p.BW��&��p^Ɓ�'��
qFhH�Vǧ��ӷ��u�Ts)5Z1b��_���B�0�a�}�^;Y�B��>��7�;IXn�I��;�����L��� ����"e�0s��m�5�r�:&�h%������.b�r
6!ۆ���t�k�j{��֜wIX&�	
{Sp�K��A��&�xr�R�Cf����I���'/X���u�0s���8I�}��-�<���~}:�m))�h���h�q
��i�
�m��mǾP�y��fw�f���[��m��X��>�ժ��ej�墳uj�`��j.��"v���4a�[�$st��4�޽�z��Y�|���X�         �  x�}ZKr��\C����E�#�8!�
R�bqx��[�>�.�l|
�7SY �Y]�J@0ݏ����z��~_Ο��t��݃�ۃ�߃`؃`܃��i��<�=�q��+�����E��d�e �r>}^/����<�X�+�G�
v�gb{��
�
�j�\�Cg�l_�I�TpƵ���HQlC&׺�ɲX�����iԅ	O66��Ovh$P(H���ܓ͍D@���Dď8�H���l#��׹F����^~�)���z�>9�_N��[�%�����kD�o4"����Xd�4"7�����A#r���a(]ᷤ��߰f/��=�������Fi�׈�F�V#��FDZ��� ���5"� �҆�H[��:nXSZڟ��eE;G̹9���~�DJs$7t�s$�0GB?�9�1ϑ���ׅ�6�T�y?Ɨ��s�㿤<�=jAh{T$q��&5{T$i�r��{t���ߣ�e'�GeJ�R�\�u�R�R$�������rx���b�衂nؔ*XʑrK�澂�N̦�eѳ�`Y��*X� �Z��Cn����id�3�^η����t���?��q��9�sR���9�۷��I�N&m;)u3�k'e�޷����dq�A	h�G�����؄>w����|����� �7��8�$����X �.c�(��X���C�W��a*��a'Vf=�h�2��UdA+ 1��������wPU�6(�Ǡ �YP-l��ho`4J�<xQ ܀�ʥt[�F~�m�O��u��e'��Q^!嘠����P"���p�0�W�1�W��0�W��0�W��0�C���Ŏj�E&��y���i���U��1�	�)�~��l��*A�p U�76�@�`-��D��Nd&|C <���N������k8}��{�Qƽ�mPP9*k�x�^C�󀌆ıx�0
b�"���`%��ބ��T�qK������_d�a����Ka�ŘB+�a1��u��C/��1���9��b����s���L��o��H>-̄8�O��<�I]�Kl�%v�����w�La�	�qb���8-1C�� �A���ʪ�,V:+����j^�ʳ .�������I�,L�
��29(��"� ��΃�B9*)(�x9+h��}� ��((cUlo5Q�\x��7�\����,��z��q9�Wn<��+���~XG ��'�W@�5�
Df8��+�x�[��gc�����h�|�5�ly��d�u�:��鮼�h]�rLV%a��5a��H b�8�|p�
�,��)�Q3�0�!M�V�.�0U�.���u
��0�B�~st
)#t
�@��Syp�Á�9�K
��)$�̙Fy)��2r1���3�Ŵ|��no��e^�K�>ƥ��(�
��KQ
���.�
�$GQƢ��r��*�-}�#a�z�����2�{�|s\�a��Cn�)�m���sm�)
Cm��m��hgsL-�e
�� Uĕa�����X6�����)r��'�)"����2�S�����`��+0�)b_~���'.d��j������_�����sH*Ge�����'�!���j�[Xr���5DI)h���*�"m���/2������r+�6��㳩p6[�.��6�
���+�Eȡ�Y�+�M��
gMr�u�<�!����Z1K�zJ�,�`Y��^�4�`�\�5���2h��Č�"�~�� ��������@��P��l������7b��#n����k<s�(LH�Q(f���7��q��������v���\�K�e9sù��;!\]�UR^��"帾�t6j��oQ�M��l֐��s��(�Q����v�i(��������wn��~��2>�K;�b]ޡ2��w���ΛJ����H��Pj�~�&�a�f�q��E�8��{u�^�H>_������y<�[�2�s����U�1a�˂9]%���U����ψu"I�a�W	�	�z-��@hI����^:#�c<>�/W�d�
a��sE�`���EX���I!l�a[�(�T:lX�ͺ����#ߎ�����|��.��B+W��{��c[�P�r���̱,��������ʱK�>��{���0�ԮL�O�M>N������4�2�&
bS��(�g� ��DA�<��X�qO�QK� V �CSe��-}N���_:�c������n�ٰ�]��'���10�m7�l��'`��n��n�;d`��nX�v{B �Sb
ŭ�������r�5��?��/�(�X+ǿ
⚭���+�r�����F�%���	{����fNz�î�r�祶v�q�<(+cە����hn����������Y�X�<L��n�5;��{g��={8Hk���`v<�x���;fg��Ió����j�ݐw�T�;(�����ȿ/2���N����ͅfN6�b3����</5s�O칙+l�91�ޛf.3g���m�Aads��]���y�+��t�}��8��>>̗�y�O�}~��M��y��}0��|��,yp�Ƀ\��?�
������pm�����oΓ��D��A� � ��.�A�凕{���#�u�,><ރ4k�� -�3��A�|q��=��u��V:��v�_��W�3,�3�8Ǭ$���tp�s�Z��1�G8Ǽ��������1���-|��5���	�V�E�������=�[��U�k%"y��:Y�Hf�Dܻ��JDҰ`%�4��*	�xM�N�y!C6yfS�f�~�?ߧW�Nk��gBa�Ik�I�j�I�j�Ym��9�?0Ts,�`����H-|z��ϔV��v������e9+n0��L�}Ҙ�i�y�7��� .�WM������F��F�Lx�g~�dvB��Ub(��/��d������d���#.x�� 06�d��qE�h4Ə�`g4F��2�\]�B%v������===�K@�E         Z  x����n7���X��Lp~�!�f;N�"�
[E��A�ZJ� ���%�#���b.��^j(�2`�#5;g:��|<�B�]JI�<u�-��7�����b�\-�����o:�`�����sY�����ս���,D%�SJe5u�#�~�ם
����ͻJ9|�^}X�럯��_���N�o
��4Ҁ�
��eSW�U�]@���*[��"��%"CY�]�D\�a��!-\_P�1�[��	:�����㗷��v}w���Sn��G>G|�R�b��υ�#O�rXpc�^�.�gW���������V�֋�JW��a�/q����������}X�\�N���r����~u���oK�T��B)��3@�1��hC��j�%�f�%�-�����M�YP��a
�g�"�S�lhl��]�k�Fm�l��^E�i��	�Z(�1d��dB��[��y!�wn6�ل��B��K�u`|Q������6NŒ��9� ��l���J��0
 �V`{��W2@y]BX�`��Yؘ%zG��k��[ظ���T�5��\`ۅ�]2P���0V3���/l��Q��!�~�-؆ac��9�K�VlǰqLJ�i_B��َ�-5���c���E[2�%�F2Ŋ��	-ڒ�-5���=��8J�;j�-5�)V[F�T�-�-ڒQ#Y��>��.ڒ�-5��"�qSіmɨ�,��N�N�zZ[2�%�F2�j����.ڒ�-5����ڃ��ڎ�Ա����#G�M;gbm�x*٘bNRN4ƀl�Ȗ�������<��l�Ȗ����CZ�C��Ȗ�l�x*Y�f�S���#vG�hK�S��	�`�v�dKF�d<��`��kl�Ȗ���!^K�X�9[2�%�d������َ��1�j��֖�l���dHe|�P����uf
��:�������yi���aq�����ʾE혙�^��m�����t�ұܐ���������<�翜_��.����=���T.��ԉO���o9=M����;E�қ�x��?'��ᫀͨ�L~�eI��Ʒ;9{9�_�.�-���0Ň��(*�����W���/^��D�-h-����X��f�o����?l'��      !   S  x��R�n� }�3��Ϳ��d@&�_?����I��Ȝc�ǡ��Q[b�M��������u�Yh3r�n��ˏ9(=�F,��I��N$�Tj gL���.:��x2ܪO.1�F?0�!3�E�)-�T@i~��Yc�VA���ж@*����
/��3,��G<�<�Ӹ��1� ��8k� ����Y�b���?k&1�<|++� �>�^�4�:�L�N*��H7�H��[��=݌�+�#U&g��Y��M�U����l���o!47U|H��ʔ-ڦ�b�[{�H�W��J��	�m��Η��x���کm��_���ˮ��۷/qݞ��y�l>a�      #   �  x����r�:���S���$[�y�3��@�� l��y�#�`p�^���oE�%Xm������؝VJ)����v�B��M���گ�5�GzS��<�zF��I�HЪ�l��azi��M��� g!J�
�j�����������G^���JG�缾�As�7�)�o�Y�:�7��[p^�Ȼ9��؍��.l��UN�,G��9;;׀	`���^�T+P�v��OJ��V6�
pc0�����n?|v9�v���hg�OxӠ��p��L�p��#l~�F�Z�2�=d1zp7^ù|�'��K!��.~�n�����S*
�}�'�Ç|��Œ}I�-�h�O���[)�3m�f.2z._R@�q���Y�+�l�0s�]{�b�{y��^�(�r�]QaI��s?��ԇ����U�|�,�"b/�|��~�N�xJ��qþ;�ڏo�o����*r���'y��:�-���r�)���<4�Ԕ鑥>��|��Y��Td ����.����̓��8cY�P�4��=op��9�� �I,�B�R���-&�M�tm
-p��h�h����d���*�
m�`?��q�6�z�eK�!�,�"��K^�4{���T��vk�����&��ӞjLh�ɤDXhGKڡN3L�Mt��a�|#�X�I�c���^���*��� �F��6��q��|\qP�S�Xd�3��C�U������Ȋ�S�N�n�۹
�!����$��#5��@hk�r*N+�pj7���ܤcߦ�2�/B�T�0�<������Z�!��S��<��i��ْN�KO��SFZ�z3�Ơ�|v��#]/�a�:QO!��V��L��\���)Ϗ�������W2����Ft��]Ȅ��'��b64�kݿ�vH1����Cڔ��/�wR�<Ku� �>M�׍�r�L}f�	�.����ۡJ�T~S��nA�m���fY#��W�����.-�Dʜ���|�̰<V����dc��)�W%��8��O c�V�K�RIn��9u����ޏ�I����Q҈�KtnA��HӋê��d	��r��H�K<�5`\�*��\��#�Z7a� Ƭ�t���4��g�G��k��k�r���d�۱x��r��ʭ1^<�gn*�����,,{U�GG�����s tS����Ip�%w�4t�<R�^��⨇���޾>P������x��1Nʗ
���ܗt���]d��i8V�N��-��r?�=��R�z��d�G������U�o�      %   �  x����n�0��u�y� ���E�M��@�Q�L�l�$s1I�?��.F����͑,}�uT���}_&}w=_����\���@���,�v�� �&P��o��k}�W4��v����Z�] ���f5����+W�O�/s��s��(����[�7�|�D�Un����g��tqش2���{-��������J�ؿ�ld"��*]2��J���-8��]������ӟ�:�W&Tӫd�J�D-��=��c�*ܬh��{�|-|ܶ��������9��q��Y 2�Ჱ�=('�Ƌ�Z�b���9=�vͱ�!�0��v����u3Ғ:�f���l.LN	6�=IƧ��s oL-�rہ����Dj7�sĕ����Q,1e�!�O���瀦�<�-�8��:�Lu9����ݵ�k7��JT��5O����c�!�Qb1 �ч]�v�;`���@o-���F���Z�����v0u�,Bl�a�ǚ�f�7p�      1   w  x���[�� E�a0�$	�r�?��*�b��!�d�G���G�#Ы��	B*!i7���� BҮ�v0 v��I�q.V�j�(��o�_/��A��9�R�	 õO�,�(�uXg6xP��; �hK"����\H�89���r�f�W,U�q�܄�2�Zh}E	�ol�">h��ĕ� >B��G�{�mOȣ66mȋp.zy�>y��������;%�D$���B�ra�`凪�N�u�<,�9�O��{�ΐQNe��`���r���(PEɐ�ݢO�@�6j�W@��/�L'�8���h�ϑ���P�����	�t��dI�x2Ȭ�a-���-��C���������=�7��K�I�2�+X��&����B�\��0i�S�H�i$�}Ѝ$1�Mr|�t���~�a���X��2o�ޥ�4�F�'�4�W��H�B؇4O�y�}O!�QhOH��H�B��L��\
������^�I�R�[�Z��,�z�Z	H�d3�iP�c�+�<��{����%�٧��ڒYX�/�|�����[����϶Yn¸���|1|R��&Ū���ض�͌�خ��Q��@ǧE�-��B�Q�e�}D�O����_��?�|x      E   �  x���m��8����J|�e����I:���N=a�ӆ� .K�^�|���S�n��5��OL�#�)�:A���O���)�����(�@�� K���R`O6ό�Jˍ-�`ٱ�����oV*X�ltT�,����NGu˓���'i��YR������rd����|=��~���ȋ���ρ
��0I�e���C���v�aFۮ�o�E�n�{�N��0<I�͘�w>)̗��OZ"WJB=�޶�ܻ��r����7��P��R�TL�9<o*��3��><w*�������S�s��C��n��Ϟ
�0�&%dӜ�9Y������싹��Hֽ��}>�Ի�V��t�Y��d�lڞ4��#�e{��~�>���p_]�����9���g��[M�s�)�j��K�3�q�PuQH\��6]�ث=��;�H�m5�Oǫ� ��9%�&��Wrloc0O�I(%��`^�ט�[�]`�-�Օ)��fB�`�H��ϛ~�����:��[e��	�cI0;Au�	fc"�Ƣ`^^�������m�
fϨ�3����r�Ѱ�GPCc�;e�7��M�qo�e�ΊV[ڍ!�[�h¹�R�Q�q��y��Vo\�&�8�Gy�(/��X0,a��jŰx�U�X�*6R�0,ԭ�$�
�UîT`�X�9 8���8��]}�U�C5� T�]�@�ޤ!V#�V���~^(	v�jڒ=�z�TFX=c*#��3�VϚ���I�Z�gNe��s�2��S`3�&%h��4�n�gNu��M����f*�o�59Y��t���G*c&c?&Ǘ�؏���ӿ׫8�Sa����d���R�-J8�L�~8�H�PӖ�Qϗ��p`�$�
I��p��$VJ8!3��0#�F	ϝ��p��$h-QB�X����\}�q7u+<s�Kn�;���ۧ��|-]�"8�Hu*��s�&tՉ����*p�U%&����U����}�=� cG�����G]�!8��We�qfU�*�l�8���<����!H��ApR�j�ԫ��ܩ��0�^� �6�"��!�ۨ�����Q8��ޫ��!����aH�T����Z��>pRW�A��-%o�P1�Dv(g�P1��{���CáG!Tl����0���p��=����*F��B�H×Q�=�"�HӘ�����蟞5���Q�.�"�H#hF�b8�H��bn��$Ak9�H����J���޵�H1DE�� "M���yS�^�1�����]�P�1������k�O�+T�ǲ��qo�!�����:-c���c�7!�%�	���V�X�{9��ǞP�����w�,T��»�ݰk�ڷ:n��Rs!���eo�E � �(�e~~�n�ݟ@�n�b p�P=�E������2��� փK����x�=���CQ �� p�P�*�<=Z��#t����oڣ8 >����G��9�z`���C$ ��v=��|"QG���U{���B, !�bpQ��DQ,`�W���_��Q,��CQ,��CQ,`��U|;ۉb�b��8�l����5I���&�,@	ϗ�� �(���Lf�tQH�E��tQ�iy7B>���wQ, F��aD!�"�b� �H�E��tTJA��dݎu����I��v���jA��!��Η��JP:p���P��t�U���C�P��t�W���ÇP��t ���w�P��t���BU���C�JP:_0BU���C�JP:|����P��t�T	J��*A������I�J�      /     x��Zk�� ��9�������a�M�WK�I ӑQ��Υˠ�!s���i�Ϲ|�@����=B` �B ��<ZC�;��`ِ����D8�Ƌ��x7�Q����CZ�G�xi������g̴��?��M�pg��?#'A)<8!mA{&P˟��@-� ��䔩8#'\�a���v�T� Tjn�Р2s� ���l���-<��"��%�m�k�Vyěo+�
�(��҂`������ �yPy��	,ѐ.i���$���n��Py��<%��5����`���3��C����j�ǫo�} ���g����l�!@���=�"�����t���=E�c�1r�>�ub�%q���,<�! �1T"@�.W���������TW�)�%�C�b:]J8�	!�pk:�Ā4��'��c�A�g��#�5X1�M#}�JH:=wV@/�շX�)_��|������0���!jtH�ʇ�ܳ9�K5�KbMCp�)x�n�E����ٕ՞���<]qͭt�;d]>�v�������u�!��|�O�����.�[����A ��%�y�/��Y� �3~"
���s�0i�l��K+SqF��3n"��Z�� *3�3�L ��� �i�	 @��;�  �Ĩ%8<$��'�(?[��;�6���; �>[��[�Ҫ|�"�+T��"`a�#>Z��!���3��+��*?�����&U%��+��[���V�P�d�O~����Ą#J�<1R�bY�n�@��p�2�ߛ�"��Rr_(a�o6�'�m�� �Ό O�N �Ǿ �.�*��[��r�G���/��>M�1��-��)cU9U"�5v<V'Vj��/s:8��J��e�\#��J�K�A4��ۊGU�Tj$,�%���H�~��THX?�Q
$���(�f�e�.}qM��#b��2����k��1�:�/s�����O���30Y������Y-�ᮇ��0R��I(ߓ֗�2���8�K��/E��w)_C�F�n�D������ �]�M�w_op��\�޳��)����n�[?��`]�X�����XRI��Rig����sj?7a���mT�:L�we�aRZ�B?�����~Z�E�;�Ӛ-�:1J�:�
�E ��)E�C�33�p�h[��O�z7�Z��)Z���V���ƠV�6�w}RD3����Nh��:AE��Ӛݍ��񈙢��}O��V}���p�-����:6��q�Gs{npgW��#vuZ�U�"�{=����1���������5xDVJr�)��Ԓ�Z�Kw�����
�h��kNf��o�K��z���R��I0r-v�V�]���ߎԡ����3J��'E����t��ux����?@	�pF)\�~8�խ�-E�3�X����xݞb��R�Y��VD?qSD?ӷ|>'�q�����S��F?Mh[P�����*���z�?�C�h�ü����U/��l &0�C����`ҼI�no��m��<>6�n\Vyo	����Dfw���!(�+�� C��05�i!"�M��"������5n�A}Ҫ%�~�#�;�(!���pgb�7�'�'�V��H����~���������K�~@���d�_ی��� ���a��4{+ ��.���=#("��n|��?���H���Ջ��������� ����o��J�z�;�R�Bx�ͣPҨ`#�S�2g���k��F�����e�3v���%���l��������V��      C   T  x���a��*��żC7����:t��BN�u�d2�{��,���u]\9ԩ[�zH�����=AAH�	��=!�����[�r|!��xAޟCA���	�C�/#��� ���%2	]�
!Li� �)M�4e3Dr�J�8N�t�c���/��J�:�J�=�H�8�P�l)%������r�!M5���<�3q�<���8@�t�]��#�����8�X�����������Z�����}�<.�4[F��\:8�q\ZRi����m������qPF&lS ��L��鼿��@\����-�j��WZ��h�ᡊA���r��e^��xߎ���'�&F�m8�3)�����#���賈�y*Ĥ�A �@ ��B�� �x���3�*�j��M�F��	F�Ȩ0���셠
!�)��0��fZ���Yo�)�P�6i1NHKa�_~�,�'�B	q"���p�k�W�������5R!�T����-���n���=�4�2#yY�>#T?��$��ǒ&��HF���yd��4�� ��'q;1C0Ɖ�zoΓOH�|��m��3։�z�:W �6<SFj�`&�fb���{�P8F���s�u�g\!��,8!�@�'d�9����� ĉ�f/��=$f�L� t�+`u�� �|��I�<f�dB�� �[:#0fi�\1�?JP�}c���|n��d��d�r5c�����	�i�T¤��K�GLSL/H�b�K>��*�g���T���4�7����;���?め D�l2;���g��:�����#�^�e]YL� M�^���*��z�L�� �OF�KY�xJ�4�`[���ļ�p������rg��{���$����.��y]�^�ߏ�-��o�e�� ��t����&�b���lyLS*2Q0��b���>m�W����Qs�-]�X���>_�PS��Q�*���l�j����Ӹ�"���$����ceZ?jWy����s��i�l�
����֕�_m���o�Ia}^N?_K�h��W���M��h�n�x21}���z�^P�8��T#<�9�[���jo�A+�g�F`�r5�ӉF`�B��>g33�CS̚��C(ʺ-�������j�b�=j���<�~����;���M��8�ğ��s�����������]��x���Z�:[꣸,� �V���5~��Y� /y��r�	��2��
��������h Y��G��?;�Xƌ����௖?7�g����Tj�����*���Z��,��˧2v��2v���Kh�v��_�)���)U%0����i����K-'0�ƫ�����_M�PS��QS�_G���=f��I�?�B�_��yţ|~?�� ����5��p}5����@5v@x�u�{
��=:�^&���<�P���qT46�k�jh(c�^�����"��B�� l+�1���xE�0��r��n@N�?��W�ť����#�L��vs+��Ohd�S�Q���?���4{j9�"���b�=
ߨ�����h�cM��B^L�G!�u��q���I}^��&�|_6�?��=.�냴2]������{��      +   6  x��SA�� <'��"	��q���;��F���`bw#��|�-���ŋuE*l�,�4 <���0b�¶�$B� p��Ѱ7�$�TI�p=�y��c����z�	�3`�AQE�����$dl	��^�N�Qx��udV��P0�3M��0�F��Y�3���oS/3�ݐ��:ND8��z�!�]�P����T݌���Bnh#e	���?5�ek����O�@XF���=1��X3���Nͫ�RO+�|��Qk,��y��bs����^��Ū��	��i�0��R��������L�      A   ?  x��SIn�0;K�)LYޮ=�0/���Q-�L�hÉ�$$-�2���Ic�$E
��R���h����"�,FYvτw˟N��CT�A�f�mS�h\0QŤZHB���b#X���-�R�c��~N���R�{A�x����9x"'�t�}��
W���Xx����P�.Nj�he�H8)�d�a�QϠR�oP���H�<�����wZe��ަIzC��b=�L����xx��~� ���1��~��AeI�ʮ�p�-^����(,8̀e��A��-�M���-�}-�v�j��U?��̀�?��ᱏ[      -   �   x��� ��a*��K���G%��`_LB5�N��qiME���ۼ��z�B9������Qn_�Q�c��ځ|�#ř�z��嘪V�Xx�+20��tN���j;߭g�[Mf�c���t0�JZ�j8���'�r���k4"\d&B�9H���J�f@B�^�v�c�4+x���~l� �0�      ?      x������ � �      '      x�t��n$]����!*Ou�ڀX�d����͌��f�AH����KŌ�q��z\���������m�=�����>�����x}��v����N��.���O��/��o���y�����������������~\{��v�����'a�������p���p���p������J���o����������?����k����������A��$?p�x�x�?��~�3���'>���?����������l���,�����迎���:
���(x�_G���:
���Q�鿎7<�:J6�:Jv�:J�
���߯��_��~5x������W���_�a{����������ȷ�əoW<�x���a/�þ`��^��� {�>�%|�K�������U���.���
�G�v	������%8��Kp�o����.��.��.��.ɧ�����F��c�`�Qp��(8{l\=6
�=6
^=6
ވ��bc��@l��Q�)��^�G� �z�<�x���Q_��^�G���z�ᏫB��|��ϫ�U�Ez�#���g�����ǟZ���[�͟[�=\�#�\�S��/��o%|͗�=_�}	��K�|՗�]_}	��%��hx�/�"��o{	^�-x�|��o�[�����[��o������&�����o���Vr��y����.9 t�	�K� ]r��t��C���-ǀN�9�Ѷ:m�ޝ%;�w��;ɉ����N���N���N���N����d�{'�����މtz^%�?�.�?�.���.�˟]��?�.vM��?�.�?�.{>�N�>;�ŏ3^���M_�gQbH�b{}����Ǉ����Tؘ��3���R���u��G���X2s�ɧ�U�x�E�d۾��g땘�%1��b��'*�̪ز�_߿�]_fu����%�tr�����j����z>�aͲ�Ӛe��5���k���,W?�Y���fy�3��C��S�������H�)a��0�Hi$�4F	#���F�HS�"�h�4�!҈���폒�t��t�g��,���Y����|�G'�<�Gg��Gg��љ|t���꿰�V�쿰�W�����/���aK���d뿰����Z��k9�k��kz���"�^�*��e���u	V"$,EHX���!���!����g�߷�{�T]������-��.�TuI��KrU]���lU�%]�i�W5:��U'd���)+rV$�,�ZY��� oeA�ʂ̕�d���ܕ��+Ӂ��*9��I.|t�'>:��䍏N��GWr=��I6|t�����G':�щ�Iɳd9�4I�KrW]�S�oY��]��G����$��.K�Ӓ����ƒ�02T�J*$%C�Z�P!a��0TH*$�!T��P!B�����Qr�0�+������8���|]����z�������s���]��vy�;���`�O���>���vB�8%��AÂ�aAа hX4J>Ci�Ġab�0��]���V��v�Է����%�.)qwQ�{y�Ȗ2w�Թ�,��NK���R��t�'߱�<�����O>˻?�,�����s��?�,{�Y��䳜x�.<�LO<�L�{G	
�T�%,}[P����mA�ۂ��o�&V�M,��4����s*h�$E��v?�$\t9���P�E�b�+$VtYbE'�
�����`�W	����B�h!a��0ZH-$�F���:n��h�"䢎g	rQ�,�EY��� eA.J�B.ʂ\���(sQ&�L�E��,�EY��� %y#eA.ʂ\��(sQ&�L�E�p�8�%8`Xp���<n�Â�0,<`�x�0�aJ������ߨr��PAI��H�%��K"E�*�$PtYE��P�h[��&�(a�����v�J�*+a���Ͳv�J�.[�����aV4t̊�2{n%虵�iւ�Y�f-蛵�qVr�sւ�Y{gMl�5�{ք.�s/A�]TtQY�E%9�EeA�]TtQY�Eeb��]T&���(A�� LH.�	a0aA�� LX&L&�	*��y+�T�-�l[Pٶ��mAeۂʶ�m+�&V�ECe۴��?��������+{\1��-�p����W�U|���g���/�k���=�G�!~�\�cx�i�������cz����?�T5(jP���!@EC��F���V3$,fHXː '� %%@FJ��� ����Qd�HF	��0%a&J�D��y���
���ac��9���
��*`�����!�T2d�J��S	��;��&8Lp��(!�IB��� ���"J"$[�v]{�v	������%���K���.������|����|��%�����vI��Q/��^�G� �z�<�X��Q/�^�G���z	RJ�d�H(	�O �T�D6I�d� �$RIf�$L$I�G��|�.��@��A���8p2�` ��@�c���	<�?7���Q/��^�G� �z�<�x�����Q_��^�t��|�E��,HY�.� ]dA�Ȃt�颒}�A��.21]d��V�W|	��%|ɗ�-_��|	��K6��K��/^�Eû�hx��m�K�o���/���KX����߂�~��-|�7�����������KX����߂���-8 Xp��`���C�	S���»sۂ9l�-�Ķ`ۂYl��-�ƶp��yl�0�m� �U�A	!$��pB�A	!$��p��9B��A�0!b�x�0LH&$�		Ä�a���0!a��aB4�	�&D	�:��J&�$LtI��0�P�V��5�K�E���.K�贄�N�_�!�]!a�(�0dH2$�	C��!C2��2DC�1d�/�ǃ!C!aȐ0dH2$�	C�d�!dmC�!d��B�!Â�aAȰ dX2,�aJ�Đab�0��o%(D[P���mA!ڂB��h	��-,D�X�6�mba/a!A�J���	k	%'�	V$,'HXO��PQ%"�DH8Q�B��DH8!�@���a B4D����N���|<�u� �dA�ɂē�'RO�,H>Y�}21�$z1�d���U��9	'�$���prN��9	'�$���pr��=LΉ��9�09'��ܳ��sN�I89'�䜄�sNΕ��l��d���s�arN�0�*a��0LH&$��C�Y�0!a��0LH�0!h��u�7�u��u%��<�����I|�$'�u��:ɓ�:ы�:ћ�:�Z�7��uh�Z%lk���U¶V	�Z%lk���U2�����֢�"mBI��JP���(mAUڂ��ui
�T�-(MK�ڴ��i��&N?�%�~�p�A��	�$�~�p�������a�A4L?�����N?H8� ���%�W[8� ����a�A4L?�����q� LX&$/�	a0aA�� LX&L&�	����w��ma��0LH&$�		Ä�aB2�	�&��j�)I'��,IҩK�N]�t�H�:uI֩K�N]�uꢬ�
�cI;uZ�N���S'���W	�N��,H;Y�v� �dA�I�-H;Y�v21�db��đ�w	G�%��p�Z�a�Zj	G�%��#բa�Z4�T�(>%����B�@!a��0PH($�!P��@!��m����u"PX��*ag������J��*aw�������U44�]&�'έ�	��',8OXp���<a�y�����	�&��νi'�N��,H;Y�v� �$aAۂ���i'�N&��L�Q�0aA�� LX&$o�	a0aa�01L�&L(b�g	���%,b[PĶ��mAۂ"�El��&�M,b�>�W�~ǐ[g�Y���:��qϬ�X'�:��W�k����\'�:��I���_�^]?�&��n�_�^]�B����-`m�g�>[���6��w����7�֒�q�d�-�Ű������V�^
[�;ax%��P^[0�[2\[2�[�T3PL    @0�T���'�OL>0�T��S��y*O%Cީ��� �	���$8Hp��!�)B�C��g	�LP_7p�Z��iƧ��`xZ��iF���ppZ¹�alZ�G�� �z�<�x���Q/��^�G}�P���Q/�^�[�^��O�;���O����O�T�o��r>��8����x7��W�Ip>x�x ��@�Á g�^�Hp2�` ��@�c���	<�?x��/`Z��� {�<�x�����a/��^�t���#,?[�.� ]dA�Ȃt��"�E��,L��.�g����K��/�k������K��/᫾���%��ަ�m_4����%x���߂W~��-x��_���������o⫿	���Q����-x����_��' � �,<�x
0�`�n�����$�MW��iw�I��N��tp7�d�M'vӉ��t"�<ܯ�Z�	g$�y�p�A	g$�y�3�a��3�<�&����Y�0�%a���ě�8�%q�K�D�ĉ.��彎SwZ�D'ǉ��@��`���.	](�$PtI��@�dS�X7�*�,���*:-��CŻ��B�P!a��0T���
	C���B2�
�*DC�1T|J*$%C���B�P!a��0TH*$C��B4�
B�~�0�9QmA�� TX*,�
B����Pab��&���h
��-(@[P��� mAڂ�d(@�X�6� mba/a	A���E	��$�#��:o+	��� j	��� J�I�%�0��6ʒd�,S����,%�.I4uI��KRM]�\S�%��i�6u���Y��	'J>�|�p�A��	'$�|�p�A2L>����0� J�I����Y.���S����,ɧ.I>uI�K�O]�|�$�:-ɧF�ޝ6|xϒ����'I�˅�N��G'ѡ��������$|x%k����O���1X�J,$	����B�`Q2T�%�!X��`!���z��\�m���\�m���^�m���\�m���^�m��&^�mbS룄M�6���maS��M�6�J��*aS�dhjM����U���q��}X���(mAUڂ��ui
�T�-(M[X�6�8-��&\�q�%�rÂ+7,�rÂ+7,�rÂ+7,�rÂ+7$új��0��g��>H8� �샄��>H8�P��샄��a�A4�>�����g	��Z��Ԃ-�l!�e�R�� �Bj�R��Z����0�n�.��S��q���.	M�*v���H�%��K"E�D�.K��D�N���<�'}��[���]�~��S����$��%�.J?��YP]�T�%�h]Y݉կNTK8Q-�D���NTK8Q-�D���%�D�h���"NT�K8Q-�D���NTK8Q-�Du�0Q-�D�d��բa�Z�3��)��3�g
��'��),8SXp���La���3�)���|�$TtI�h�LTwə�K"E�D�.�])�,���#ſ�g��Tщ���[�\$� 	WI�*H�UA�
�pU����$ê Ѱ*��3�
q��^rn��p����$�('�F9	7�I�Q�m�"�4l��D�Q�@aA�� PX(,
Ɇ@aA��0P�(L&�ϳm
��-(hKXж��mAAۂ���m�&�M�y����<�u�g�����1�{ݸ��^7��׍�<�u�9�{�x��^7>������Ǽ׭�?�ne��?�е�M��-`m;h�@[�����ݳ%C��-è�������[�K`xl��-��� �����0�.n-.-a"��y���
��*`��9���nx1U�T��*�O%C����G�w��kG�u��KGoxs�hW�p�h��FK�u�%ö�LQ_�`���#�LP0@-��� ��LO8<-�촄��<�?�s� �z�<�x���Q/��^�G�������zIRJ�k�!�I(5H>�A�I�Mj�dR��(��k���%��dI%5Y2IMp>x�x ��@�Á g��
X��\ �@�S���	��<�x���a_�Z� {�<�|�K����a/A���Eh���-(B[P���mAڂ"��Eh��&�M|ǿ_gw^�m�[������K��/᛾�����K��}��_4\�m���z�����w���D/�K���w�k���wɋ���7Y�Н�w�N��'��oG	^�-x��� `�	��#�g 	���,<�x0� `Jkk�	��$��]���%��]���[�e��K[����K[�,�������7�����I3������ѫTs����y�U���n���y�.���y��o�e&�Kf"�,3����N�����	r��eҺK�G���.	]>�(|�$ŏ�@�,��@e�z�m��U��_FirG]N|%�#��/�D�d��7�����%�_F����_;��)f\y�0�HW$�+�	㊄q��b\�0�H��"�h�+"�*��pW���J%�U*�Ғ'w�J��T�]��*��JEîRѰ�TčB�n�p�P	��-�($�F!	7
I�QHB�a��h�($6
�P������j��ԫ-�W[P���^mA�ڂz���j�բ�^mb�a/a�A��5	�V$,;HXw���p��*��� j"K%��pXB�a		�%$��pX���j�%$ð�h��"K�%��pXB�a		�%JvKH8,!ᰄ���aXB4K��a	����I8WW��-���p�N¹:	��$���su�a�N4�Չ�x�~�>Y��p񜄋�$\<'��9	�I�xN��s�a�hX<W4��M	�/w�$LtQ���gךP�%��KBE���.
��B�bԵX�i	���щK��%\B'�:	��I��N�%t.�+�m�.��K�D�:Ѱ�N���G	'$��ppB���6��-%�.��ptB��	�0:!Z�F�apB�J�����mA-[�b��l��Գ-(h[PѶ��mbM�Ģ�	�v���ť���a����a����a����a�&��!�xk��CG	�&$��phB¡		�&$��phB¡��}�C�ahB�@Q���,I��@�%��KE��.	M���H1�*:9T�4Ǌ����U��		'$��pp��p'$��ppB2N���	�08!J�^^�gI�P]��j�,��4ԯ7/�RQ�*5kRR]��겤�:-)�NKJ���w�k̖p0[��l	�%̖p0[��l	�%�`�h�.��E�~�p0[��l	�%̖p0[��l	�%�.��E�`�h��|q|Jp���|a�����.���|a������{c%l���;V��X	�coy>� +a���-���J�&Y��%+�dE9]Թ��Jt�XS��/�l9_t���K�]r���E��/�,�N����r��ĵt���sGR�µt���p-��k�$\K'�Z:	��I��t�a-]�pϸ	��<J(,
��@aA�� PHN
����y���mA�ۂ�%nJ���%,q[Pⶰ�mb�����Z�t�֧��u|e`l�L�^G�:~֑����:2�q[G�:���X�c�x��z����52֕���]?�F�����M�v��	��=�l�-`n�Ѐ[2�ߖ��%��c�a���n��R���J�RS��(����C��<$�ͣd�x���R���/?�X��Զ}}����2��IO5Hv���S�G���o��/���Ə�&K����S����f�.6-�^��5-�V�.5-�N�6�4-�Fӂa�iɰϴdXgZ��� �h0�-�xv���`6[��l'�%̖p.[� �,@ ��-@ ���A@�  A��uÉl� �&rM���4	�h �$@�I�,��I���9&	�.������ \thXB��[0nQ�֮�p�B�Y	��<�x���a/��^    ��}+�<�|�K����a/A2����$�I$�,H&I8mmA2ɂd��$�I&&�LL&�������_����n�	@�#��g 	�$�1@4�D�A@�]D�+jwI��H�]D�"�p����$�E$v��]DEC�ڤ3�:Sw�aۂ�l&�-ɶ`&ۂ�l��-9	4��M�6q.۔F�LJݒF�.i���F؋�N�.��N�&ˀv�t�vY:a;���uJ��&&���ܖ٨[35Z�LtZMt������;u>5=�k�����a��zz�bfU��������ׄ+����n?#T�)�\$E�G���\6��<�=��r�l'��O\n���3�ז��3�?O�f���oI�߮�OE����;T�VؙX�g�%�I�g�AŠY�fu,ڇ������/G�����.cT�0*I�$�JF%	���QI¨T���h�J�!*��J�S�U��R�p����T%\�*�*ՒW�J�JU2�R�TE�*U=J�xԄk�$�Fk*X��G�|���.\|$��#	I��G�a�hX|$B������ւ^[Ɇ^[zm-赵��ւ^[zm-�5����^[K����W�[X̐��!QY��2V4$�����%�P�E���rSrZ���%IjuIV�K�Z]���jx�䵺$��E�����;9�5�ؒ��������fH8�!�`���f�\̐p0C2f����0�!�,�U�Y>	g�$��p�����[8�'�,���|�a�O4��Y>g��%��p����ng�$��p�O�Y>	g�$�,�h���|".S�_�?ܻm�2U	��J�LU�e�.S�p����T%�2UѰL�hػm����W�[pE�W�[pE�W�[pE�W�[pE�-�c����+�M��ܤ0���Q�P�%���B��'&\tI��p��%�����,!��2:-!�j��V�b��p����%,�[P��$nAM�¢��Uq�⦌gh�o/�xF��g4Y�ow�x�:)�=!]rOH�et�PF�e(��2��i��*��e)�wI���
��G$K��K��]R-�ry��˻,�NKż�Z2�i�[6�(l�č.�]7�$ntQ�x�8��{.���9:-��'3�NfH8�!�d���NfH8�Q�:����a2C4Lf���Q�Qϒg��p��O�&#�%��..�LⲌ��rRwh�����&7�e�MuZrS�����s��8^%o<%�Րx|}�0�a����LkX0�aᴆ��&Nk��D�~5��PY�DO�%z.ѓp��dh��!Ce�=ɰDO4,�+ژ�2��q|Jp���a��Â��<,8xHv<L<x�x�0���Q�n[	�m%췕��V[	[nK��J�t+�nECۭh�]�ywn%�������Β�F�O�I�G�Y������{r?�,'�w��;��;S2T��$�.�P5YnE�U�d��$C�%�rZrT]�U�%G�i�QuB��ߥ�'rT�,�QY��� GeA�ʂ�9*sT&�D/�LX�q�%�{[P����mA�ۂ��uo��Խ%C�����=��m:�f7��J��y�ٍ�y�ٍ�y�ٍ�y�ٍ�y��~�J��y�ٍ�+�n=�Xiv���J�[�������[���v����v���[���6�=�%CKo���[�{mx�mo��a���-����Ѷ���>ۂ�:ے�6ے�2�^r��{C
xmHo)�!�3��W��Ɛ^R0�R2\r�1�R�}�\�Z�m�\�Z�]�\�Z�M�\�Z�=�7�ÚՒa�jɰd�s�Wƾ��`�[��oF���.��� ���{K8�-᰷��g�<�x��/`Y[�G� �z�>�%|�K������U��'�
^�{��I��'���y��I��'	�$�w��|�%lN8p4�d ��@�s���	O%C�Z�G}��~
�o�G}�<��Q�@���U\��}�<��a���`�dy�7Y�M�4���oA�Ȃ��I#�F$�,HI8�mA��¤��I#�F&��o%|ɗ�-_��|	��KxA��o���K��/^�E�۾hx��}�K��o����+�����[��o�k��������o⫿	�����{p�ۂ�^�-x��� `�	��#�g &�D�@�	wAmg	�.(�.(�.(�.(ɰA�Ļ�L�ʤA�u��*˨D��JtɨD��JtɨD��J4yeT�KF%�,���Q�N˨D�
�=K(�$PtI��@q��Q�.�])�?.���*:-���*:1T�J*$%�
	C���B�P!a��0TH�P!B�h"���5�|0TH*$�
	C���B�P!a���B4���m"��O	C���B�P!a��0TH*$���}�!T��P!�L]��nA�� PX(,
��@�� PX(L&�߳n7��u�J��jA׫]�t�JNt�Z��jA׫]�v����jb׫�5���E	�%��$,$HXI��� a-A2DC5A4�D��_�O�-��pPB�A		%$��pPB�A	�0(!%��"���g	%$��pPB�A		%$��pPB�A���0(!%Dà���tW	��$���p�N�y:	��$��+�E���I�y:�0O'��D��{�p�N�y:	��$����b���y:	��$����t�a�N4�Ӊ&^%�����,a��0LH&$�	�&DC�aB��x����k�-܍'�n<	w�I�O��x�Ɠp7�d؍'v�א����(a[��m���J��*a[��m���J��Z2ԢMC[�hhk�}l%�G[P���"mAIڂ��Ei	����-�K�X�6�2m¦�c/��m6m[�iۂM�nڶ`Ӷ��-شm�m7m��i��mxG	��I����j��I�O�mxnÓp�d؆'�ቆmx"���~���	a0aA�� LX&,&�	чa��0q�0LH&$�		Ä�aB�0!a���9�]��0!W9�\�d�UN\�d�UN\�d�UN�W9Yp���W9�x���W9�8j�*ᨵ����ZK8j]2�ZK8j-ᨵ��֒a�Z4�Z��QkNǻ�	N�-8MXp���4a�iӄ��	O&�&Lw��M��		Ä�aB�0!a��0LH&$C�a�hشmbC룄���J��*aS��]���J��*ack�s�l�����UĥF[	�I��H¥F.5�p���K�J^\j$�R#ɰ�H4,5K�D�~��p�����$�~'���^Xn��;	��I��N2l���D��;��y� LX&$,b[&,�	a��0ab�01L�P�>�����-(b[PĶ��mAۂ"�El��&�EC۴�3^7��׍�<�u�9�x�x�3^7>��_�׍�y����<������[�?f�n���񺕭���~���l�-`�l�f�5[���8h-`�l��1[24̖��%IF�bł�$�@���L�L&�AQ��j�4T�%�dIB5YrPM��ڿ�Cˡ�b
�5���?Pe������k�K٨������R��RNjD������#���������S߿�������o�$ըܪzÓKU�S��+U�Q��U�O���T�M�`X�Z2�R��5�R-���U�ik����F���`�Z�Qk&��.�%�^\�k	�ó �A�� @| >�,l��	�$Y��
�U�$ԯ+	��C5H�A�P���H�ArP��j���W~?�$T�Ɵ[�PMp�߻ ��	p�_�ڿ�ݔ�E��'�U��'�E��'�5��'���s�<�x�����/��_�G� �~�>�K��$�&�Ly�(�t��t��~?��k�N]�w�����Ӭ�?uI���Z������_KE{�Ml%�]�$>tI���%!��r�x��.K���0����H�	u�m/A]ۂ��um��ֵ-�k[P׶��ma]�ĺ��umS��Z$s����%u�&K]�K��]|� ���E���R�����S    98�rl�-��飽_���.�N�g4��e������\��i�B�IM�ӟ����o�^��͝��fV{�/~�}����4gq~}��C5k1��->_�U3�j�b��5{1���/f�ƾ���Zf��M?��6���ȘY�f���_u���,Uȹ��� �Uag{���{�V�9��@��U�Ibt��_�
H��:���C�����vpڞ_��6E������]�&J�����_W緿��:л�f������j�"�׬������ƿ��(6~�#�����dgG��qW��.�]��U+9Ѻ�Zn���Z���m��Z�5�Z�5���~����}�Uk�]��Uk�]��R�$��pW��w՚xW���]��D�z��%����T`U��U�kV�_�-k��dh�K������ƿef�g>�/󾕜���r�_f˳�2[T�_g�d���l��_g�R���_fˎ_fӁ_fӉ_fS�E�����.9uQ�����*Ԍ�\��%ǣ.9u���r<��2��#R�>ƣ䍏Q���X�b�ￆt?F�k��(%'>JɅ�R��G)Z2l���Eɱ�{���j��>H�l]�f�<[%��_rYrm]�l�l[�%��iɷ5ږ�[�d���^%����.ʴ��I�m�l��s���L��sɶ5Y�D�t{uZ��:%˶��E:�_��]}�9���F`�y�`z�_/��<�Xg�����?�E��]ɟuI�����E)���	=�z��Jz�(��$Ş���CZJ�]u�$�tI��D�NKR��q:��:G��ܠ�E7��Z�!���Q�z|�ܦ�%��wɾ�.�K}�o-��w����'�||�DU��,��.�>]}vR�O��y�(�\�O�D�.�>ß��CK��T�+�tl%)�w���]T�H)�wIſKJ�]R��T���[������̢�c�K2��%�(]2��%�(]2��%�(M���]4���<�2��Q�8�IK'��%�G�>��˕�i�n��{�nݖ��.�	��㟨΀Y�0�2��ii��r��U
�8Kaf�e:o3���`	1 Ř?��
4�:��j`�5�ǰ%�?�P������-�]j���%���"�E�9�K"ME��[:���N�����rh��퇞EJ�=I΢?�ڛ���c����;�D%Ϧ?Q�3�������l'��sI��<{��J�<��Y�$Ϻ(y�����ٶ�>k�i���<0�\�h��D��%��)��Oɻ$��.��l_�jtM�b��%���6�.:��?�S;}?P��d3��O73��3s������~Jr��]QM�m�]�+��z�(�<���4'�.��e9�q~/Z/�:�m�~g�8^oa㲄���.Kػ,a����/K��e���\4�כr��W�s+ɡ�K5]���%g�.:��j��P3�PN5�e,�̝|�9i>��?���s/�A	J�`P��.�p�`	p��dX0(���"����_��^�ΣTae֔h@�+��2�����{�H�e��`�$�@K���2�m��Zx� $gI� ������E} )� ]��%W�tI@�������m ���3�
����Go��Q��yT��c��Go��Q������yT������~�����Ǩ���~� ���`Z_�a}f��`R_�A��aN_�1}	��%��e/�U.��"�E.��"�5.��R�\2� w�x���7�Hx����������R��[
xw�o^�R��[
xqK�m)�m)nm).m)y�_Ƴ�����X�y�_F��{�e��Qp�_F��O�2J^�e����(� �����`�^��{f��`�^��{��%�/��%x�?��Q/��^�G� �z�<�x�{�%|�K����>�W�c�6.c�.�b�&���p��װHx����H0��.��� s/��0�R���`�E��&^x�p�E�q	��<�x�\x���Q/��^�G� �z�>�%|�K�Z�7v�O8oAjɂԒ�%RK��,H-Y�Z�0�dbjI4Ǜ�����_�w|	_�%|˗�5_��|	_�%|�/�7����e_���m/������[��o�+����^�-x�����~_�Mx�ߎ��[��o�˿o�%�����[p ��`���3��� f淳C�L�K�{�`jނ�y��-����w���qx���y��M�_�Nh�c#��H86"�؈�c#�'><	�F$�����al���FD�Q�=K��ւ-����`O�%����Z��ւM��uz�w՚29� b���*�B	�J,�����%\D(�"��%\D(��E��a����]�p!a��0\H.J��	Å��B2��.DC�qᧄk%\CX��B	�J��P�5��!�p�dXC(���5�"n��_�O�0�p���ۥ$�.%�v)	�KI�]J��R�a��h�.U4l37m�v�J��k9�/��쿰����Z����꿰�w���|�/lɵ��;m��5���5������ aA�2��u		VJx����PL��PN!ɴ%�2Y�f� �dA�I�#�dA�ɂ\��&�M&��L�7��p��d�,H9I�,H:Y�u� �dA�ɂē��'SO&�L�.u�0k��>�KI�]J��Rn��p���ۥ$�.%�K���RE�}�&.!|�p	��K%\B(�B	�J��P�%�.!,�̦a	�hXB(b�x�0LH&$�		Ä�a�d�8K&$C�aB4�	��K��P�%�.!�p	a	p	��K%\B(���%��a	�a�x� LX&$�B[&,�	a��0ab�01L�P�>�7�'���-�H[P���&mAQڂ��ei��&�ECeڄ���^���,5�`��K�-Xjn�Rs��[��\2,57q���K�M���8Jp/���Xp/�%��.��Ă[I$�V/�-�%��^�%1�^�q� PX(,
ɉ@aA�� PX(,&
����*a��0P���ma��0PH($
�(DC��B��q��=��QXP���Fa��4T),�RXP���Ja��V&�(D/�(LH<�$�,H<Y�x� �dA�ɂē�'O�7O&&�LL<����]�E�."�p���%\D(�"���-\D(��E��a����S�@!a��0PH(nyq����B�@!a���B4
�(Dlj}���U¶֒�}�6�J��*ak����6�J��V���*�[E�0u�0�vn��pÔ��$�0%�)	7LI�aJ�S�aÔh�0Ut�D\D��p���%\D(�"B	J��P�E�.",֚��E��a�a�<J&,�	a0!�&,�	Ä�a2�y���mAۂ2�el	����-(c[Pƶ��mb��2��5�y����n��s^?�z�s^7n�׍�<�u�1�y�x�s^7^�׍�?�n}�1�u���9�[�@���p4[���v��y����l�-`�lg��ْ�m��a [���^�|� �(�Q$��E	�� %@"���y(	�Pf�$IB����$� �I@5P��$���K4HSO��lK�ɒyj�\X[�}�\W[�m�7�\V[�]�\U[�M�âڒaOmɰ������U��aU��Q�`�n���*�{H=�
�PW���'©�h*y#�J���z� {�<�x���a/��^�������J-���W�
�Pj�����\���(��@�<�?P��������.�A�� �N8�&-��@�����	�<�?x���a/�þ��h�<�x�����a/��^��ѿ�3?���	#	K�$�,HY�0� adA����	#F&���/��_�%|ϗ�E_�7}	_�%|ח�e_·}��/�����_�7�m/�+�����[��o�k�����[��/J�&�����o¤�v�`TڂYi��-���`\ڂyi	�-���pd�ęi��M�x�p    _���%�(���N[�/P�}����Eþ@Ѱ/PĹ���s�=�\�{�p�A¹	�$�{�p�A2�=����0� b��_�?�4��aB�0!a��0LH&$�	�&DC�(���E	a�%a�K�D���.��AK��@�%��KE��(:-���(:1P�K($
	���B�@Q�a��0PH�@!�h"�O	���B�@!a�����`��0PH($�!P��@!��b� PX($��@aA�� PX(,&
�	�}��h
��-(@[P��� mAڂ��hТ� mba/a	A���E	��$�#HXH���Pr��PK�'�N>H8� �䃄�N>H8�P�����a�A4L>���'�N>H8� �䃄�%ON>H8� �䃄��a�A4L>�����I8 W�B���9	�$��p@N�9�0 '�DÀ��r�[X]�p@N�9	�$��p@N�9	�$À�h�+��&��W	Ä�aB�0!a��0LH&$��[���,h"\���Kp��~[p��~[p��~Kx��~[x鷉�~�x鷉�����J��*a;����%�A[��*a;�������U4����vVJ��V�Z��h	����-�G[P���"mAI���Ei��&\�q�o|�:���6,�nÂ�6,�nÂ�6,�nÂ�6,�n���6D�B�N�z8J8� �ԃ�SN=H8� �ԃ�SN=�<���0� �D	%9K&�$LtI��0�Eab�Ñ%P4y%PtI���NK���NW	���B�@!a�(a���@!a��0PH�@!�h"���g	�N��$��,H;Y�v� �dA�ɂ���i'�N&��LI;��x����$u����$��%i�.I;uIکK�N]�vZ �%��iI<5Zg�;q��]�Yj	g�%���p�Z�Yj	g�%���p��d���Ԣa�Z���)���'
N�(,8QH�(,8QXx�0�Da��Ć�G	;Z%li���U¦�NR[��*a_�������U4�����VN�V��'
Ʌ�'
N�(,8QXp���Da����)��z
�����$��%��.I<uI�KO]�x���(lK�Ӓzj���;!P�G	��@aA�� PX(,
ɛ���@ab�0��}�%(d[Pȶ��mA!ۂB��l	��-,d�X�6��m��9���׍�y����<�u�g������Ōs^7n�׍�<�u�1�y�x�1�u��ǜ׭�?�ne����G�<+a�l	��-l���yV��Y	�g%l��ͳ��yV44ϊxlɎ�����Jx����Jx����Jx����J��`E�m�E�S&LP�PX0Ca��%�.��`�1
�($��S�YN�Y
�)L\^*��R	��J��T��./�pyi���./��KE��RѰ�T�y�K�yk�-���`�Z�yk�-���`���yk�M��6!P<%
	��
��@aA��0P�(L&tE�J�芲�+ʂ�(��,芲�+ʂ�(��,�2�+J�aW�	��o	�g-:s,O\h-9utA������Z�>[r>�>kb�����&���@aA�� PX(,�-
����T-����?��(	*P2T���:-UoP�T�d�@IS��<lIT��������b�a�	Cě�C<c�x�0�a�1��s�i8h؆��m8j�p���]�d-<��FǍ�!8B8q�p����#�S�m���P���!�C���P�6Bq<��x�q�P��@c�<��E�H���wr}�)]� �/2q���D�|7�+�L�#۰��6l1�eJ�Yt�2�Ҝ�5X&5@���ά(� Mklϯ��Okd�^�6`���g��X"���S��s_ߏ}p�N�e*��Rԙ�{�p8(���Z"̑珿�}`�>u-�V/��#���J�)�\�%��~@	?���~`?�_r[����-b�11��L�?&�㏉����#ڇ�c�m�?6Ɵ����L�>&F�������#:}L�>k�4��6��l܏�qA���L\�d�$g�Cܒd�$�$��EI�aS�mX�dCE~�D(ɇP�7�(BU>��|u�
�!T�C,��X���8cA�^ܯ'+*&�TL���XT1��bbY�ĺ����PY���k��ؐ3��f!���4!kB�,��Y��2g�a�<����T�2}���)�Ĉ�##&Ό�84b�Ԉ�c#��FL1�#�at�6̎�8cx�8dh┡�c�&�=y!z���&��8kh�mô�m7�q��)�����"�C�94q��ĩC�M�;4���a��6��d�cP��zC�t���V���p@	8�PH珿J�h	:�%�tKA�Or��axH����g#v���<���!�a/x��M�f�W�ǖ�aAy�8�b���S(&�����cqE�B���`�(�i�E��(�aņz���P���B�?����E���!��C���X����c�?�є]���SD��x���)&��8�b∊i�Q�C*�aJ�ƅ���d#@�+�L��g��?������Ľ&.�3��l��?��S��_���?�5�׿�V�ٷ��w1�B�?�����v}�>�+���7_"l	Aʹ��_�u�k�Ͽ3���59�r�8�b⠋��.&���8�bⰋ��!����y�0�b&^lI�U��x��l)��+mN���[�e+9(	7Pn�$�@K������~�?���/��M���&؛8ao∽�3�&ٛ�){�0fo��m\0X����� ��&�4��A��A�K��{M\4h6چU���� �-R�G�5R!�
a�T��BX%�.��I��M�4�1�q�T��b�p~���lb���M�&v9���lb����Fg;�MC��m�u���6n��D\/e�~)L��aJ��)wL��d��-S�a͔m�3eMٸ�pq#��+	E�b>ĥ�&n%4q-��{	M\Lh6چՄ�a7�-A�,�7���D J�)�\�%ʀe@ɶ�c�_Y`	2�%��d�?s�"����<E�"�� �.��B�"�� �.��LCA�]1vĎy����GK�y���9�������<^X���o=�a�6O��������p�~ 
@�,(�H8�oA�ǂڏ�+?&~L���x���Kxq	����6b	o#��6b	o#��6b�p�h��X4�F,J����ny&��%ٶ.I�uI���Rm)��.ɴuI��˒g��4��%�։q%\�+�B\	�J�W�.ĕp!��qK��B\ѰW4,�a���`�߂i��-���`�߂i	��-���p���i��MO	��@aA�(��M��@aA�� PX(L&
ra/	Rad�$a��,H�Y�� 	fA����0`&�7�Kv�7[t0�H�n��X���t6[��lA_��mͦ%��(��k�9�#A�� PX(,
��@!6��(L&���pnB�+�<Wy��\!�B�s�8�B�+�<W�y��\1�.6�&�/L<`�x��&��&2L<e��c�m8g؆��-'���5@:k�=�¥��y�('P���9@ˡ��:`˱�:�Vo���C��P���B�?�:u���!��c��ۆ:�OW,��c��%�&nY4q͢�{M\�h�ś�����ذk�6,[�eXF�H�(�2�ˀ2,ʰ(�2��t�2,ʨ&h��-�20���{�Af����ǫKb{�j@	5��PBM��^ PBH�f߿����pr���Gr�p��?<��*z�z@Isu:x��y&S�L�g2��}@K�-��D�ϻ�d�11��}L�>&F�������c��m�>�k�>6F�������cb�11��}L�>&F���9D�}lC��aTs�0�¨f��!�j�0�¨���pQ@���1G�����Q�X���M�b>(�|P����;-�|P    ����A)惖b>������.�|�9�.�1'��7R��!'�CN��9!ř�_m�1'�cN�ǜ�91t�����s{�k,�����B��k,t�4�g,���{�b��W[��k,��~��B!�B-�,Zi��h!$�BȤ�v��b̥ŘL�ajf�D��	aj&����fB��	ajƴ\���L�ٴ�;g��L�S3��S��iz�4��A�>� EK���4鐳~"��iɨ�.~��'?HC�K�Pcb�]5&��B���lLȨ�jLC����6�F�{���!��4qg��K#M�i��H�F��8�4l���#e�.�ۓ"�'�؞lb{����&�'�؞lb{���ɢ��ړmC{���c��B�?�5���!T�M,�P���c�?�R,�0��E����Pfa@��i�/{�A��e�Y�ga�9�r�l�~��G���������~84-������CG?��~8]�pz�p[� `oc	3�U;��r�f@	3�����>���d	4 ���i@�4��9�x,��Xs�kL�5&�c�����Xcb�11ֈ����klC���zs<E�ބP�	�zB�&���5�7���7!�obN��u�=�W�D�
�ī L�
�ī D�U &^`�U &^`��W؆� l�
�-�U &^ �0�* �0�* �0�* �p�m�
�6\`Á樌��Ɓ&�M�4!hB8Єp�	�@�&����M�M���MlS6�O��Fe;�MlU6�W��f��1t+ۆve�Яl�z�M��d&.(3qC��+�L�Qf�2��-e&�)3{�lâ2۰��Ɲ���K-M�ji�ZK�Z�v�������Ֆ&�4�-m�vK۰�ҖS���!R�y�\@N��t$̀f@	3 ��_7�j@	5�%���P[B� g���� �~��B�� �~��B����6�Ķ?�o������cZ���i�[�?�o}�1-x��i�[�L���cZ�G����o����y�kZ�f�E��]�6EK�-aK���6D�p���vh��-��EC/��:Kx����9Kx����9�,���*g	or��"g�p��h��Y4��,�]2^%#�M2%^$#�=2^##�-2^"#�2��
�p��h�@F���y���aƂ��GN2d,8�Xp���c�!��3�h�ƄY�K�Q~&�-�`�߂1~��-�`�_2��8�o� �	a�)A�� LX&,�	�@�� LX&L&�	�a/	ra��,ȄY���ȃY�� fA����)03`&$���,HI8�oA�˂ܗ�/2_$�,�{���21�eB�����oA�� LX&,�	a��0ab��{]�j�7!�B�+�DW��]!$�BHt���2��]1&�b<Yl"-L<[�x�0�ta�����7��x�0G�pư�N�.�1#�sF�N�끣Fg�!�6B<n�xވ��Éc;D8r�p�0qh?�SGǎ�!<B8y�x�����#�>�ޮ�}�!�!�ЇRr[ox#:�C�D�9�N�;�c���v�9Ƒ�KđG^Ly1q��đG^Ly1q�Et#/�a��6���d�"���A�� cb�11Ȉ��~��i2�!�؆ cc�y�dL2&���� cb�11ȘdLC��A�6��[� cb��dL2&���A�� c��m2�!�ظ���͵|j���M\�l�f0������&.`6�m�f�gX�lC��"��BL!&�B�	!ĄbB1��0�c��1��P��7
�!�C(؇P��`B��Ă}��1�c,��X-�E,��X/1�`bb�D��dbb��Ģ��U�P6�u�P8���C�;*M��Rt +�5�&�Si�E�&�Ti�U���J�pY�m����!�z3ג�}"��8�b␋�C.&��8�b␋ir�C.�kr�q��q���iJ�)M��4q���iJ�)M��w�ǆiJ�0Mi��˧��/M\~i��K�_������"��C\~i�_چ嗶a���!�%b�11ĘbL1��*ob�11ĘbLC��!�6��_�E\~i��K��q����/M\~i��K�_��嗶a��mX~ic�q�R�X����ĶcێMl;6���ĶcێMC۱mh;�5����&B�>��}u�
�!T�C(݇P��xo��1��c���2�"�E�me���Pf[@��іNGF[@m-�-��f2�2��d�!�d���-&N��8�"bE?��'[L�l1�-�a��6L��b�S�B�1]1!��BL!&�B�	1��bb11��z�|��b�11ĘbL1&�C��!�4��bdC�?�D��!QB�,�DY��e!$�BH���(3��(�1Qc�,�Q�����&��8�o⨾���&�ꋆQ}G�Mè�mշ��6�b����N1!�bB8ň�,��p�	��)&�SL���O11����!��#�bL1&�C��!��cB�m1�!���n\o��!&Ćc;�Ml96���Ħc��Ml;6}Ƕ��Xv0�ĸFlq���k�L\#f�1׈��F��5b&���1۰F�6��qY�.�J�U�����e�&.�4qY�����U��e��aY�mXViC�9BL!&�B�1��B�	!ĄbB11��CL�����B���r����!��C(��P���c�?�r��Ǵߏ�L�ݺ�1�w��Ǵ߭��~��L��z�1�w��i�[_L����k����_�~?�y�5�w3[��ێag�����5K��,aW��M��4K��|�g�7͢��Y��av	�jn���bn��(uv�x��E���x)��W��x#�)i�g�`J�5뢤�EJҬ�rf���z�=i�.ʚ�?��Y���[Rg���Y�%q։�%܎,�r䒃��%\�,�fd	#K�YµȒa+�hX�,v"�0��p2߂�|��-˷`*߂�|f�-ɷp"�ā|�0�oB�xJ5,�D��QÂ�aA԰ jH�⾉Q�ĨaBN�%AĴ��	1�a��,ȆI^H�Y��0fb&��D�	���g�(�P,8�HXȷ�xb��ĂÉ�g�&&�LL	aB��a0aA�� LX&,&�	Ä)��Z�o��^��jR��uђ�%�J���(	/P^�%�˝����u{���g&�6L<n�x�0��a���#�h�h?6:léÆ����P��nB�>��}u���&��C�ۇX���nc�>���v�P��nB�>����u���!��C�ۇX���nc�>��cml;E�>����2�R��5XڏAi?������?��Ö�c��ӈ˿1}�W�s���i�e�Ps.#f�r@ͺ��i�5�2�2T	������\eǗ�^�]���O�S��CS�ٟ_��"�ж}?{�B��cbE����_��ht~}�c�"�v~}?q�
K�����
=������pũ�׿���[l/��`���N?��5���2ز������^ß�Q��NE��_�q�ó�l����d@�������Pfb(31�������Pfb(31���PfB�me6�liB�1m�	a�&�A�iB�	a�&�A�ib��q1Y� 6^�b2�������d&.&3q1�I����qXMf� ��B�:�M��:B��C ��:B��C�4t��!c�@�}��y)��R��K!��L�K!��B</�x^��þ��a_L�bB�¾�;ښ��1&��1!l�	����q_L��bbIŉNQrq %����|(	9P2r���@�Ɂ��-Y9ؒ��-y9'6��-�!Nl�8�i�Ħ��&Nl�8�i�Ħi�ش�����r8*z���Q���@:]�%/J^��(y9P�r��� �sO�Az&dC�KĎ [L�4�`�
0�-��m1��/��m1��1�6t�j�����"\��U�!\��U�&^��U    �!\��U�!^��U�1^�c��CĆg�El���Ćg�Mlx6���44<ۆ�g���lC��Q�;B��U �^��B��] �~�b��-1���"�Ԙ8Sc�L��35&�Ԙ8Sc�L��35��0Scfjl�L�-�����@ J(-����D JA��� �>��H s'A۱x��L S���Z�DP�(Q�(��(R���o���g@K��9Μ.��#�q�p�	%�t��@&�M����2�H�&�#M�G�Xrg�N?���x(w�m_�.8�3P�g���@ɟ��?)��_�/B�T@)���@g����;v�R~�5@��K��i:��4�xn�.<7MO<7M/<7Mʦ��Q�ON�zo lɧ�v>7m9�ޢ���)�P�i����i��t�!����Ҙch9���cl��t�)���p�	��)'�S���)'�SN��N9!�rb<��xʉ��!b��=�"�b��m�&�A��mb'�ih���ж���Ee��~<����Ee&.*3qQ����L\Tf�2���Ee�aQ��5,*�q'�.�NLwb���ĝ�&��4q'��;1M܉)VĆ���a'�E���hB�&��ME��6!mLmB(ڄX���hc�&�΀$��S�� PZ@i �5�ѹ��� Jk (� ��}����7 ��c"�����~��H�����D�����L$�z�1�x���D����>��H����D���&oFY���z�^/`AQǂ��%*:t,��XPα��cb1G4\*`���^�,���^�,���^�,���^�,��%�� �p��h��Yīj$��Fj$��F�kj$��F�KjJ.�Q#�5���pA�h��F����]�p���[�%\�\���e	W.K�qY˒a߲hX�,�-�p_�%�u� �e�`�U�`�E�`�5&�`�%&��g	���	a0aA�� LX&,&�	�P�7���%A_�met�Y�TfAO�-et�Y�PVr=�Ofb;���d&�K�K,8�Xp(��Lb��Ă�dÁĂ��O#&FL	a0aA����oA�� LX&,&�	Ä	)�i��
!�eb!?�W)�R\!��BHq���1�c�+ƓE�9_��?ĳ���O&/L<_�x�0�a���!���qQ�.�2������Ee&.*3qQ����L\T&
��aQ�mXTfÉc;D8r�p���©#�cG������#ƳG�����".*3qQ����L\T&�� !.*3qQ����Lâ2۰��6,*�q��q����ч�/&��8�b�����/&�����0�b�_l1�����!�C��!��cb�11ĘbLC��!F6\�c�y�bL1&�C��!��cb�11Ĉ�!�؆cB��!�-b�11ĘbL1&�C��`�11Ę�cB�m16����!��cb�11ĈN�C��!��cB�m1�!�ظ��!�2��.��������Ee�]��9�$�v��'��~{y�_��p�/��
FMԧ�22�#�TEyQ�Eeа��aâ2L����e�򠾤A}I����%�Kԗ4�/iP_��A=6�k���!K OK �K �K L OL �L �LB�'�k���&X.�~�x�=XI��JzV�{��ރ�����EzV�k��_�������r�r�r�r��,�zM������4t^����̫ʞ!�*���,������2ȫ� �*���V�aê2lXU��[y�6{
_r�r�r�r�r�r�r����Э����C�r�@�!9d �䐁2�C&4M�!d�!d�~�?������Q?�/�G�E�ȿ(��f������3��~�_t�̿����3�2?9~����c�O�!?9y^_�c�O�!?9��'�����c�oKHs����'�%��K�ݗ4�/iz_�����}���'���]B���l�Z'j�EԦ��MQ�.�6]D�R��-��;1��wb~�{�N���0���aBއ	y&�}���aBއ	y&�}�'}��~m؇��01m����6ɔ�I��M2%m�)i�LI�d�E�dJ�$S�&��7�ԼI��y�1�#r�@���g�%G䈁1�1�1�1�.˶WH�e%]�A�.�J�,+鲬�˲�.�J�,+����˲�/�j��?*?Cwrwrwrwrwrwrwrw����ݏM�}���O��}��}��}��}��}��}��}������ǆ�>6t�1G�7䈁1�#r�@��z;b G4D6D6D�Ǐ�_C~r��1�Gǡ�_C~v��1������c��c��ʖ���A^V�zY�ee���A^VyY�eeа���aò2��0�_�_��Kއ	y&�}���aBއ	y&�}�а�aƆ�M�o!ELISRĔ1%ELISRĔ1�0�9bj���F���ȿ��I#��F�%��K�C��4�/y�_�ȿ��y��;�u��;�}��;�s��;�{�������w�r��;t����������~?��~���~�q����?��戟6���>���k��Ysį�#~��4��'͡�EsHh�)/ݟ!�>Ct{�������3D7g�.�ߛA�6�}k��,�;����"�1���,������"�-�����pW��B�MYHӘ=�a�Y�Q�I2b0�a"_�aMaa �` �` }��ѧ�}�ч�}����ß�G��~D�G�~ğ���~�����QPD<�G��QP 

DA�8( 䠀t�>e�-�K0Dw`���݀!� Ct�������˯��/H�OD�D�D�DgDGD'DD��0��|�|�t�����e��.DW]�n�]tE���Btͅ���%�;.HW\����WIW\%]q�t�yP_�WIW\%]q�|�U�W�W\5�-���O�������O�����p���S630�3��$�K:i�t�(�Q�a���FIǍ��%8j>q`à��3ǲ�t�(��Qұ��sGI��N%=J:{��aP_����G�0��`B^�	y&���`B^�r���а `b�LL]�g(�������.%�t)i����"�B�����Х�.5/t�y�K�!�
9d �Lhh�C�!9d �䐁���������2�o�ew�@�!9d �䐁2�CBB&�Bs�|B�!9d �䐁2�CrȄ^C�`C�`C�`�o�!9d �䐁2�C&�v�@hllL���Ru���dI�ɒ�����%U'K�N�T�,�:Ysu���dM��u	iT_Ҩ򨾤Q}I���F�%��K՗<��yT_��y���|}x`ybydyfyhyjylyn�l��Ėat��ղ��j��j��j��j��j��j��j��j	����j��V��u�~����n�J�"+鎬�K2h�-YI�d%ߓ�|QV�MY���g��I��I��I��ɐ?�_rqrqrq���P�Ć�$���+��$��dȓ�����������������P�Ć�$6'1G���|f�#r�@��9b G䈁������M�yL��_?!}F�������>�_�g�K��~I��/�3�����?�_�g�k~p���1�ǐC~p��1�ǡ�C~p����16<8�4�ߖ���%��K�ۗ4�m�ܗ4�/iv_����}������5wZ֐;-�;-�ŝȝȝȝȝȝh�`C�:-�;-�O�����;-�;-�;-�;-�;-�;-�;-��i��NKl���1�̴�1�F��#jĈ1׍T`CFԐ5d~i����2�K��2ϐCr�@�!9d �L����CBBB�U��
骬������J�*�^�*+骬������J�*����櫲���������������������|l��cC7s7��Q��|��|��|��|��|��|��|��|h��cC7?6u�1�c�oH瘒�1%�cJ:ǔt�)�S    �9��sLh�S�9��sLM�?B���"���))bJ���"r7���)9bj���#��s̾�t�)�S�9��s��S�9��sLI瘒�15�cj>�Լqry�$䍓!�K�8	y�$䍓�7NB�8	'�a�$6l��1���|�����))bJ���"���))bJ���#�����M�}i�_�����I���%�K��4������������w�~��;�y��;�u��;�}��;�s��;�{������M�����w�z��;x�k���5�����-���?m��es��Oqu��_5G��92�iO�CË搿��'�#���)�F?��'G��䈿��Ǔ#�vrd�trh�rrh�pr��f�dK�:�/�"�3���,���/�"�/���,2ܖ��˲���,���4�x�q��#^h�>��G��8�eƧ��.�а�84l2���������������������qQqrr	RL�"�	D1�(&�D�3}D1�(&�☀�c�%�;�;0DW`��n�]�!��Bt�������/�W_�o� �J>�x~��L��H��D��@��<��8��4��0�,���b�QL �	D1�(&���@�b"2��!�䘀t��_�� ]p�t�U�WI\%]p�t�yP_�W�\5_p�|�U��b	�h�l�p�tq���/�|����Gl8c`�!�2�5�e`����<�/y�e`���A^y4,Æe`ذӉc9Q�<�/��Qҡ��SGIǎ��%<J:y�|����������!/���20��� /���20���BC�6,Æe`�-ϐ-�-�-�-�-�-��-�-��h��F64Z0G�+䈁1�#rĄ�f>䈁1�#"""sļC��z;b G䈁1�#r�@C�`C�`C�`������㈁1�#r�@��9b G4D6DL�;D���1�#r�@��9b G�9��"""SĬ��"���))bJ���"������/)bJ���#�戩iL�.!��Kӗ4�/iLyL_Ҙ��1}Ic����5��k��<+YC�@����	���%�&�'&�G&�g&�04���	6�M07Z�_�o��Kn�@n�@n�@n�@n�@n�@n�@C�-�aL_s�e����������������z�lh�`C�si�riririririri2�O�\����$6�&��4��4�
�4	�4	�4	�4����$��$��$4�&��4��I��9b GLh��C��9b G䈁����������m��e��'�K�6	y�$�m���MB�6	y�$�m�аm�MƆO������ccȏ�!?6����ccȏ�!?6���84��k�cclxl�id�-!��Kڗ4�/il_�ܾ��=��}I���g�5�k����gYC�@�@�@v�Y �Y �Y �Y��ς}l�`�l!�Y �YB���g��g��g��g��g��>6�Y��ς)b��'�祈))bJ���"���))bJ���"�䈩9b��#��y�1�#r�@��9b G�	���1�1X/�Ҧ|�zQ&�Eٵ*
��Lԫ2Q��D�*��o��D�*]��d��2��L�f�;�f>�f>�f>�f�Iߡ��������|lh�cC3s3�r3r3?44�!7�!7�!7�!7�!7󡡙��|lh�c��j��:d �䐁2�Cr�@�!!�!ۆ������{c��!�8����cȏ�!�:���8���16�<Ƽ
l	y�U`�W�A^y�U`��W�A^���a6�ümry�$�m���MB�6����m���MB�6	�&�a�$6l��1�RĔ1��%ELISRĔ1%EL�Ss��15��������%�K��4�/i�_����������0�-7m�Cכ�ߡ�M������w���w���w����w���w�����W�����i��ܵ�^��~�i����?���6G��9�g��j��Q�).�#~�^4��͡�=s�_O����;9�O'G���SVݞ!�nrğM���ɑ�ɡ�ɡ��!_�E|k��)���"�2���,�����"�.��e��,4ܕ��������#^g�6㈗G��8�U�o2�x�qd�c�������FT�G��GT�G��GT�G��GT�G���|�|�|H1�(&���@�bQLD<�G�crL@�	H�`���]�!�Ct�������/D�_�� _}A���t*�Dt(At&�xz��D��@��<��8��4��0�,�()&��,��#�	D1�(&���@�bqL@���0��t��_�� ]p�t�U�WI\%]p�t�U�WI\�0��������OK�G�gȇȧ���狐?�_�	��p���C�S�u���AC�E`��A^���E^y�E`а�a�"0,g����-�c���_��E=y�z���!��C�Ӈ�r��]���D�'ǡ��r)��y�V�y�6�y�v�y�������z��#��G�'��?X�k!_�^�3�^�^�^�^�^�^�^�^K�3�Z��ׂ��A�
9h 䠁4��rЄ�v>䠁���������t���C��*�B������BY���H�Z%�j�t�U�V�[5�l�t��|B��*�rZt�U��VI�[%]p�t�U�W�w\5_r�|�U����y�=�y�$�}���MB�7	y�$�}���MBþIl�7ۆ}����=B^y�e`���A^y�e`�����v~mX���0��%�a}I�����%�K֗4��<�/iX_��a}����'&k�#�3�C�S��?�_������F'�0;���	�^�r�r�%�a}ɽȽȽȽȽh�`C�z-�{-�/�l{Z'r�r�r�r�r�r�r�z-��k�}�^���3��$��$��$��$��$��$��$���I����P�Ć�$���+��$��$��$��$��$��d�������P�Ć�$6T'1G�;䈁1�#rĄ��<䈁1�#"""��O��&!��#�%�o�I��&!�}�ذo�Mb~r|���<�/��1�'ǐ�C~r��1�'ǐ�CÓclxr��5�%��}I���f�%�K�ޗ4�/i~_� &�5��k�����m�0%} �������> S�`��> S�`J� L����05�Z��[-�[-�[-�[-!O�Kn�@n�@n�@C�Z-��j�1������v�N̼^��a7j~�ۨ5jD�Q�FԨ5jD���]�Fv�����i�{�_r�@��Q9j G䨁5�5�5�a�_���W�f�\��7��L�+3Q��D�2��L�+�_Z/Wf�˕��re&sO�rOrOrOrOrOrO?4��!������=}l��c��B��C��C��C�釆�>�>�>�>4������=}L���y�����y���LI癒�3%�gJ:ϔ|���<S�y�����o��=���C~�2�Ȑ� C~��24�BƆgȱ��_�y��b`_�=шz��D#�F���'QO4��h~�s9��.'��D#���5�͓�7OB�<	y�$�͓�7O�<�/y�$4l�Ć͓ذyS��[H!SRȔ2%�L���I!SRȔ2%�L�!Ss��4����F�%��!��K��4�/i�_�迤�ɣ��G�5��kߛ��?]7��C���ߡ�M������w�~��;�y��;�u��;�}��;�s��;�{�������w��:�o���t���s��#~��+�9G��9�'Χ~hx��7��5�?��#��r�_R��C�G���W�#�G�C�7�C�'�C�@���,�볈o�"�<;�廳���"�9���,2ܛ��k��pk�r�wG�����7G��8���5�x�q�K�#�N�а�84l4���<��|D�|D�|D�|D�|D�|D�|D�|ĕ|ȍ��Pȇ��bQL �	D1�(&���@����>䘀����݂!�Ct    ��
���Ȣ�/D�_�o� _~A���t*�Dt(At&At$At"�x���<��8��4��0�,�()&�����xv�(&���@�bqL@�	�1��F�?�Ⱦ�+����J��*銫�+����J��*����+.l��|�XB>Z@>[@>\@>]@>^@>_@>`@>a���׆3620�[C^y-�`�ׂA^y-X�#��ׂA�Z0lX�k�0�8�-�#GIg��%�: ��K:w�t�(��Q�ѣ�G͇��ׂ�!���,�J~�k� ����Z0�k��a-6�Æ�`���/��}Z'r�r�r�r�r�r�r���r-I��v˯-C�sȼB�!9d �䐁2�CrȄ��>6�6��y�2�Cr�@�!9dB�Cr�@C�`C�`C�`�O�!9d ��	��!9d �4�6�6����2�C&�t�@�!9d �䐁������������m����E^y1��`��A^y1��`а�Ů}���KHO�Kzz\��㒞�������%==.��1���㚟�����i�����������$������&�07���	�v�r�r�r�r�夏�%�[ �[ �[��݂�lh�`n��!�[ �[B��-��-��-��-��-��-��n��v6�[0(�_����N�%�%�%�%�%�%�%4(��@>�_s��r�r�r�r�r�r�r�r�24L�kC�
��#�r�@��9b G�	sy����y��'�ݓ�wOB�=	y�d��/y�$�ݓ�wOB��Il�=��'1?8~�����g�%?8����c��!?8������c�o�Oʏ��%��K�ۗ4�/ir_�辤�}I�����5��a~_�g`�5�������>S�g`J�LI��)�30%}&�}�305������i�B�@�@�@�@�@<�/���l�`C�S�l{HSRĔ1%E�*bJ���"���)9bj���#��y�1�#&�9�9b G䈁1�1�1�1�.ʶ�'�w�EYIe%]��tQV�EYIe%]��tQV�EY�e��e5w��!w�!w�!w�!w�!w�!w�!w�!w�CSG:����������ч�ч�ч�ч�ч��}�}h��cCG:��#�r�@��9bBG䈁1�#"""�s�G��!?8}���c�o�!?:����chxw�����1�`�~���ׂA^y-�`�ׂA^y-�`аւŖa-�͓kț'!o���y��Iț'!o���y����0��'�a�$��ٷ�"���))bJ���"����<�/)bJ���#�戩iܿ�!��K��4�/i�y�_Ҹ��qI�����5��k���7m�C?7m�C�7m��|ܴ�]n�~��7m�C���ߡ�M����M����]����]����]��`?m����O\�G��9�w�?k��Usď�#~�����94<h>i��C��rğQ��+�D9�o(G�	刿���#�~�)�����ɡ���!_�E|g�Y�7f_�E|_�u�)_ߖE|Y��B�UYh�)y�qĻ�#^m�f��eQ�A��8��/5�;�C�J�а�8�.�3�*>�&~�E|D=|D5|D-|D%|D|�|�|�|H1�:�S}D1�(&���@�bQL �	�1f��.��݁!�Ct������/D�_�.�"�� _}A���t*�Dt(At&At$At"At At�xn��4��0�,�(5&�C���į4&~�1�+���L�%1�_��Z��W�r	�_��/]��t��_I� ]q�t�yP_�WIW\%]q�t�U�W�W\5_q�|�U�������c�%�. / �/ 0 �0 1 �1�ᐁ����1��W��!����J0�+� ����J0�+�NZ�A}mX	�+�0�9�-�CGI����%�;J:x�t�<�/��Q����G�Ǐ�W��!����J0�+�B�ᗼ�J0�+��a%6�Æ�`X-��Am���h����Q-?=��i��"j�E�N���i�]:-�K�E֐9?�����K7_Ԑ%d��7��	�n؈67�/8���8�K��ڵ�/k��ޡ���#J���P��5rD�Q#G�����%rd�ȑ]"G����O��#j�9�D��r��#j��һ�#j�.�#����:2��7�Ё:�Cr�>ȡ9t �4�6�6��%a����A^rW��%a���A^yI�%aа$��aÒ0L������yt_�辤�}I���F�%��Kݗ4�/yt_��F�5�O֐(�'(�G(�g(��(��(��(��(�u�`�$F)�;.[��������G�%w\���l�`��!w\ w\ w\ w\B�;.�;.�;.�;.��q���6t\0�(�!�(!�(C��~�5J�5J�5J�5J�5Jh�QbC�j��k����s��k��k��k��k��k��k��k��P�Ćel���1�#r�@��9b G䈁1�iV���y�'�=���PB�C	y%�=���P��I���PB�Jl�C�{(1?@~�� �d��!?@>i����Ȑ C~����26<@�4�ߖ���%�!O�K�4�/i�_�4��q~�����5O�k?)��i��������h�`C�%���-��������Kh��׆�6t\0E̶�1%ELISRĔ1%E�TĔ1%GL�Ss��1ϐ#r�@��rS�䈁1�#"""�E��
颬��2譋��.�J�(+颬����.�J�(����拲����O�}h�Cn�Cn�Cn�Cn�Cn�Cn�Cn�CCS���������	�����������������sj�cCS���#�r�@��9b G�	-�������#�Ȑ� C~��r�M���!C~��!24�DƆ�����b�%��`���6/���b0ȋ� /���a�b0lX�y������뢬�퓐�OB�>	y�$�퓐�OB�>	�'�a�dl�4M�o!ELISRĔ1%ELISRĔ1��Ss��15�1���ޘ��Ƭ�7f%�1+�YIo̠�ޘ��Ƭ�7f5�1���Y�y�������u��I���������D�{m ���qm J�kP�^���� ����(~������b?v����u����).�#~��;爟9G��9�GΑ�shx�^8��=�C^ݠ!��r�S��[�J9�/)G�!刿�>���|��{3��fߚE|i�Y�WfߘE|a�}Y��e���mYh�,we!/8�x�q��#�n�r�wG����͛�#^l����ơa�qH��gD�|D�|D�|D������������z��k��[��K��b�QL ������bQL �	D1�(&�䘀���ާ�t����+0D7`�.��!��B|���+����s�'�c	�S	�C	�3	�#	�	�	��Hd��C>�@>�@��oD1�(&���@�b"�i=��@�crL@��Z!]q�t�U�WIW\���%]q�t�U�W�W\5_q�|�U��b	�h�l�'�K>]@>^@>_@>`@>a@���p��t�X�_�o�K:g�t�(�Q�Q���FI���N%7j>o`à��ǲ�t�(��Qҡ��SGIǎ��%<J:y@à��G͇����!/���b0ȋ� /��,�j~ɋ��a16,Æ�`�-ϐ-�-�-�-��-�-�-�-��h��F64Z0G�+䈁1���9b G䈁1�#"""kĜ�BX�_��O#FԈ%b��%c&kȈ2����!#����2������!�	9d �䐁2�Cr�@�!s��1�6�6����2�Cr�@�!9dB�Cr�@C�`C�`C�`^�y5��`�W�A^rW���`�W�A^���a56��4�_��F    �%��!��K՗4�/iT_Ҩ��Q}ɣ��G�5��k�����?��~�����#�3�C�Sh�`��$6|T��N�r�r�r�r�r�r�r�r�%4��kC�:-�;-{ȝȝȝȝȝȝ��۝ȝh�`C�:-�k�ϐk��k��k��k�!T���$��$��$4�&��6��I̵�WȵIȵɐ��%�&!�&!�&!�&!�&��6��Il�Mb����w��C��9b G䈁1�#""&6��1o����}��I��'!o���}��I��'!o�կ�'�a�$�Ǐ�C~p��1�ǐC~p������cÃcLC�m	ij_�ؾ��}I�{ȓ��F�%��Kޗ<��y|_����N�r�r�%�t�r�r�r�r�r�:-��i��N�N�����i~ɝȝȝȝȝȝȝh�`C�%6��k��m)bJ���"���))bJ���"����>���#�戩9b�!G䈁1�#r�@���g�%G4D6D6D�����EYIe%]��tQv��x袬����.�J�(+���拲�/�jn�Cn�Cn懆f>�f>�f>�f>�f>�f>44󱡙��|����IC3r3r3r3r3r3r3r3����̏M�|��9b G䈁1�#r�@��ڇ������������{c��!�8����cȏ�Cn����c��clxy�y5��j0ȫ� ���,��j0ȫ� ���V�a�j0lX�y����I��'C���}��I��'!o���}�Ob��Il�>�)b����"���))bJ���"���))bJ���#����������Ҹ��qI�����%��K��4�/i�Z�q�������m��w�>��;�9��;�5��;�=��;�3��;�;��;ty���N]�}��7��N�n�������;�O���.��/�#~��戟5���>�G��i��Isdx�4����!=9�'G���S6ݞ!�rr�N����69�&G��&��o&��O&�|iv��;����"�1���,������"�-���,2ܕ�������MY��#�o�z㈷G��8����6�x�qċ�Oy{�C�Z�а�8�6�3�2>�.>�*>�&>�">�~�5|D-|�%|�|�|H1�(&���@O����@�crL@�	H�`���]�E��Ct�������/D�_�� _}A���t*��zz��L��H��D��@��<��8��4��0�,f��b�QL �	D1�(&���@�b"2L�!�䘀t��_�� ]p�t�U�WI\%]p�t�yL_�W�\5_p�|�U��b	�h�l�p�t��K>_@>`@>a@���p��t�X֐�%�3 ��K:i�t�(�Q�a���F�Ǎ��58j:q,�/��c���%:J:u�t�(��Q�����G�G����0��y����IȻ'!�{��IȻ'!�{24�k��Il�=���������������������}l�`C�sļB��9b G�I��ˇ1�#r�@C�`C�`C�`��w�9bB�#r�@��9b G4D6D6D�9�o�#r�@��9b G䈁1�1�1�m���9b G䈁1�#r�@��ڇ�����������0�k� ����0�k�B�嗼րa�0lX�iL�.!��Kӗ4�/iLyL_Ҙ��1}Ic����5��k��<+YC�@�������%�&�'&�G&�g&�04���	6�M0�Y�_���%�Y �Y �Y �Y �Y �Y �Y��ς}��0���ϲ��g��g��g��g��g��g��g��g9)K�~�~�}l�`�L>C�LB�LB�LB�LB�LB�L����+��P�Ć�$6T&1W&_!W&!W&!W&!W&C�×\��\��\����$6T&��2�9b�!G�	y�9b G䈁1�1�1�1�7M���w@��M��7MB�4	y�$�M��7MB�4	�&�a�dl��~͏�!?6����ccȏ�!?6����ccȏ�Cü�6<6Ɔ�ƘF���̾��}IS����%��K�C�ܗ4�/yv_����}�}�5�>�>�>�>K��>�>�>�>4�Y��ς}�}�-�>�>K�����,��,��,��,��,��g��>6�Y0E�v��|>1%ELISRĔ1%ELISRĔ15G�8bj��g�9b G䈁1�#r�@���0����l{�tQV�EYIe%]��tQV�E�颬����/�j�(�����V�;�V>�V>�V>�V~hh�Cn�Cn�Cn�CC+Z����������ʇ���|ȭ|ȭ|ȭ|ȭ|ȭ|hh�cC+Z��#��1�#r�@��9b G䈁��������������kc�ύ!�7����c�O�!�9���84��kóclxw�y��0�k� ����0�k�B_���րa�0lX�y���Iț&!o���i���%o���i�Ih�4��&�a�$��ٷ�"����<�/)bJ���"���))bJ���#�戩iܿ���_��4�/i�_Ҹ��qI�����%��K��<�ǆqm�����t��n�~��7]�C�7]�C_7]�C�7]�C?7]�C�7]��?�~/w]��׻���~���u�'~���_5G��9�7�?i>ŕ}��#�{���94�f�m9��Fz�+�>�.�����Wz}�#�o��J/�~�wg�ҫ�_�ܜ�����.�f��k���3�[�_ɥٲ������ܛ͚��Ys{6k.�����!�j��~%Wh��Vn�f�"m��]�/y��)o;�x�qĻ�#^u��G��8�5Ǒa�qhXr|�w�qRW�QUQSQQQOQMQKQIQG���Pч�Ї\Ї$���Q� 
DA�(HI�DA�8H 	� �zM�����WzI�+�#{�zG�#k��~�7d��2��� �����/]��~�r;�K:�|":� :�D<�GtjAthAtfAtdAtbA|`�|^�|\��S<�G��QP 

DA�((⠀�a����a�_���^��r	v��W�5���`�^��z&�5���`�t��.�`��5���%���#�3�C�SHȟ�/�l8�`�Q�5�Ua�W�A^yUX����W�A^yU4�
ÆUaذ*�0�B�4̇<�/i�_�0��a~I�����%�k��<̯yU���s)鋼*V�a}�,�0ț� o
��&y��V�aê�ص�/K����q������t_n��[
0���ߟP��`n�W�	cKf����cԞ>̝�#[/�#���/z�Tc�	�������~�+�0���si]���7�=����M�dZ�?ρ�N7��Z���9 ��?���	���x?0���S �������z�Y���-�������r^f,���.M����w��?������������������f��/Wl�d���_n�d����t��#�n��s��cr̅��9�19� �䘃s�s�s�s��.��l�Z'��e�K�!/]��t��e�K�!/]����ذt9��.c^V�yY�ee���A^VyY�ee���A^V�P��aò2L
�%�%=((�AAI
JzPP҃�
JzPP򃂚�����}�k��0!�Ä��>̓�����0!�Ä��ab�>Ll؇��Z��u�^��Yo�~��@Ի9Q/�D���zN��9t��>)x�//�t2�o��AR��|�|�|�|�|�|�|�l(�Ķ�|������	��	��	��	��	��	��	����_������z_�?��P��D����N��:QND�Ұ��<���re'�\��.Wv2?x��~ jЈ�~ ��Ы���� �+����6<$���X?�ޟ��P?�/������?���E�޿����{��X?�/�|�_v��������o�v���^^��߿��&�(I�l��Yz���,��7����Y��od����������?���;Q�� �	  ���i��	D}M �sQ����������(�]��.o
d���P{8��pD��\�F�m������KK�8�6qD�&���đ]�8���Dn���DBo�����}��1tyf Z��Z��������������H�a�:i%l�����yqg�;fD�Q2gy�����推{fD��%vd�ؑ;7����I��r�@�����J�<�)G�䁆�����Y����eZF�+6��ʹQ��ު�z�f˽���4�s�v�;O��a/����ݯ�U��������wB�Ю�B�p���|�ߪ�[�V�>��*�տUC�/��[Z�oUls�c�����$�}B:	�t*�$T�I�<^�T�9��sP�s����P�'���mߐ�����j�YI��JZ|V�Ⳓ�������g5/>�y�Y���_���o����jȏ�!������;j����%56<���"��t�#�/A��J:���?�t
*�T�)��SPI� h�)��SPͧ���k�!oׄ�]�vM��5!oׄ�]3��%oׄ��ذ]�kb��})fJ���b��ӂ�qWД4%MIAS�[�1Ss��޿?|�=��?��W�X�.�D�v����6��l�����������l�{�s����M�����x�z�s<t��9���}��}��}�����������q�s<X㟿����M�~�~M~~�}�}"��
 } �| 5:�FG���?��#�`t�ߋ>�	-:2|,:4|+:4|*:��D����?��o"���!��߾���7�&��D��ބ��ބ��ބ��9���p>e��8G��9���oo�xysd��V7����!}��y�?B���>A���>@����>?����?> ������b�QL �	D1�(&���@�b"2<��c���wD���>C����3DO��<�<��ѻ3��� �:���қ�ODO��8C���{��K���6C���[3�O� �4���RL|#�	D1y+&���@�bQL �	�19& ]s��r��C%]s�t�U�5WI�\%]s�t�U�5W��\5_sa�'j>Y,!- �- . �. / �/ 0 �0Nچ��ጁ����֐ןA^y���g�ןA^Zt�(y�4�?Æ�gذ�Ӊc�B:r�t�(��QҩZu�(��Q�����G�G���5>j^��������?,P��3��� �?�����3hX��ϰa����K;��։ܐ�ܐ�ܐ�ܐ�ܐ�ܐ�ܐ���64dbϡ!�9b^!G䈁1�#r�@��9bB���1�1�#�r�@��9b G�	�1�#"""s�|B��9b GL�㈁1�#r�@C�`C�`C�`��o�9bB_G䈁1�#r�@�h�l�l�����_��CS��3��� �?�����3��� �?���gذ�,�8bj��ٺ��鳒�}V���J��YI�?+��g%} ��/�A�?�V�7�j�Zͳ�5�a	�i	�q	�y	�	�IȋJ��@���&�06�\��B.aB.aB.aB.a�v݊�\\\�&6�0�����rl�C�+�zz�~����n�J�"+鎬�K��o�j�&��������|�‒����������������ĆflXPs�rrrrrrrr34��kC��#�r�@��9b G�	Sy����y��'���7lBް	y��IO/(y�&���7lBÆMlذ�61?9~�����'�%?9����c�O�!?9��'�����c�o�Oʧg�%�K�ڗ4�/in_�ྤ�}I���g�5�az_ӧd�5�Oɔ�)��>%SҧdJ��LI��)�S2%}J��)��?%S�djް���a�M�6!o؄�a�͐'�%o؄��ذa6lb��m)bJ���"����^���"���))bJ���#�戩9b�!G�	y�_r�@��9b G4D6D6D�����I��袬����.�J�(+颬����.�J�(+����2�닲�.ʶwHe%]��tQV�EYIe%]��tQV�EY�5�
����拲�7l~Bް	y�&���7lBް	y�f����7lBÆMlذ�61G�7䈁1�#rĄVG䈁1�#"""�c�Gȯ�!?7m~o��1�ǐ�C~s��14�:Ɔg���������k��3��� �?�����3��� �?���֟a����sX�y���M�6!o؄�a�M�6!o؄�a34��kÆMlذ�)b�-��))bJ���"���))b ��K���#�戩9bj��{H�����%��K�C��4�/i�_Ҹ��q��������M����M����M��~7]�C���ߡ�M������w�~��;�y��;�u��;�}��;�s���������������`��      =      x������ � �      )      x���M�9��סS�	�r�-%j����TU��l#a�@������,s���ņ�����g��$�9ݝt��h�N�?=~||�����_>���_������VӒ]���N�ɟ���Ʌ~f��<���Ǚy�43O`�g���̼�y��W0o3��n��ӂ���3�L;�a�p���ݯ�o�n^�����͇۷?��pZ��/͍&:�.D��4'B��H�#Q!e�$��:'2mN����)R��H�����E���<v�'��a��tzs�����r��������ݿ������i)�:WR���e��e�����U���5�K����2r��
r��*r��r���A�a�c�1�EǨ)�r�ȫ���������ͫۛ��^�[]6��=}G녪�jN��� ��?���g���
U��U�JՐ�d_/���zIw,�H?n�Z�>����������:��][r}r�p�I-���ݮqw�p�?}�] ��îqB�k��8�4λ��ˮq;�|�Eu�s���+�/�~_:���N���}s�������܍?_��y{��������>%WS)��>-��-�G6X�pr�|���N6!�-l��w��ۮ�n�n�m���|e�^��ln{��9t��]�U�a�}w����wv���_H�����>��ҹ��W.d��u:)��a�����K+�̡q{��#����ay�`�Ȳ!�t�"�tٶ�'�`٢����Ϲ��dI��r��d�����������闻��cU��֜�W��>ڳ .�j��p�@V���d�A\���q=�=V��E�����y�{�=j�޺������w"d��P���YH�S�+�M�n�K��X�Ͱ���M��?E�F�)�>24�┪����G�4�ڕ��[�k�pw���O8��b��On>~�z����?��~{������%��Œs�j���ۦ0�0�aAa�â��%�E�
KV�9�*�pXSX%�{Q�&�O<�'�M"翯���1������?��Ç��޽��n_�z��Si�1,9/W��{�%�d��`��v�|�]#ng3�Ǯ.y�t�Ud�%�~�Ɨk��ڮQ���f�FS��c#�������g^�ݺ`����^$�~������������?>}���������}�s1�>1u����v��8~J�(*�0P��x�!�ʀY��� ���T���W��Tk���EQ�{�A��S���$��_�����}_�ݾ~sw�����iI}ɖ�;�'�)
,s�WX�>�D�r\T�5K���),+�qX�ߒ�WUs�Ún.�=���XOQ��HWq�W�44A�[���48�+`�������i|BR�4:!+`|R0?�
��4LCPV�Bf�٪�󴷝��L�&���5x�V��#B�{I��Q��t'�a
���
Y� ��G7�0"T�^�A"\��$�U�qM2�[8d*���I���εb���F��Aa��Q�\QRlN�ERm�
#��0Ri�
#C�:�F%H5t�XwQ��Hq�aھ"�j祭�ľ,����|_���zv�}y:^C�E�t�1�U�c_�.h�}��j�����}b�����zd�L��������ޖI~���/&�y����I��u���n����L�sV�I{.�[w&��n>�ޙB��}S�ú���os;w�L��8�#���gVG��^s�6�W����'���N,)O�os`I��{h	��B]�k�:]5G8�+��pX�,5�z���4�w�~y�Z{p�ej����k�}�R�}�8�X_s�����Ϋ��ʣ�v�B�"v�v�| �|0�57osWn>�.����w_����6h.{�H$2���)�s��u�[�k�i�Dsɻ�Y8�i `sŻ�ۛ��U#����4۩�-$�ܕא���C$R��=/�H��+�T���H�;*�T���H�;+��q���
����Mad,�T�W�u�'��T�W�([���F��+ܨX��.T��=ށQ���,_�RuV�Q�.
7��U��Љ�pc�Đ�t����+�0�����ՆE�Dl�]mJ�[�Rbv�Rb�ڔ����6#*�eQ2vU�6*�pm��r.��|���ڦB%�lw���H-�+�Բ��H);b�Ŋ�rv����v����v����vU���hWZ$� ���u�a�B��C'
!�:9ɝ!4P1�!$�3"A�		B��HrgA�P;+��ـp�ҹ �t�C�9�����kj��c �մG`�������
:�H(A����/� ~�x�xO~�pn��b^� :{��{�aw[#vу������P]ϬA�8�Y�sq����g������ca8���}��}��}����@|lD�����#A|l���D$�oMB���d$�	FA��`T$�	FC��``�݀�n�~�LHv<�e+����'' 0��D�_�������O/
��EE`>�h��$��ƾ��漗9�c>W$�19Rt����6%�|��#�.�����sC@�O�0g݆���n?&8�o�����*�<�7 *�"T�9DȜs!��I��:�[Bf���v6�dؼs�!�ZtSdL�n�gQ.W�H�v��R���p��L���RN��0(刍��R�����!�(�S��\e�[��t��^y�a���:N�w����M�z?r7+���ݢ��Cv��ޏ�n�z?,�g�O��)�I�0�̹ņ �ڐ��@���[qH�[rH�[sH�[tH�[uH�[vH�\wH�\x�����eOh���P:�_|����Ǌ_~����Ǌ_����ȊIZp��,@�K���d��,�s�d��9@:S���L"3 Dg)���@@l����3H��P���@R�ϕt�ډ���+b��
����"�_���%�1��Ȩ(U�)JS���.�
ݮ���u����<����-u��A�
!$�J�@()�=���l1J�b�2��XyD �>��7s
��9���=ҩ��z�
��#G���ѩ�#rtj���?#Gg�/�щ�+rt)��]JA�-�=�����@��4�p ���?��w5�ojD4���H������x��M������Fū��Q50n�T�ZO�ӡ��p9vf3��Em���8�5ӡ_ۚ�o�O63�A��N��@�L�a�K��|yE�t��!k�j���N�͵6m;V��eY�b��P�AZ*� -�x�h�0G�%��J��B��:��,2��,*��x�D����:<2`�Ԯ�c4@��n ��u#����yN�
��*� �WI�̟oت!�������~������ě3�8�F \�� �FM�R�0�ͦN� ��lZ���� H��BDR�����7��r#p�r㑷�F��v#�#ڍ��ڍz�#��ďI>RooWo��ӁL�xR��Q�b0t�i���M�VmC�6 Z���\�LJ6ps��l�%񊍀x�F@�l��[�!����l���Ȇl���Ics�N'�8:�tD��'��N�J#f�'-9K>i������4�0�^��u�P�TbtS�*]�1CS�J�J�P�TbtSY�{��:���"Ǘ1E�/c�ܼ���XO�{����1E�ySi=/b*��UL��������1�󰟕2Ek���4'
�^��$��yen,e���e�&,�i����K�J�\�T��b��+�J�X�acS�mId� �mYd�0�m)d�5�(�i�[5T/�]�1�r)b����˖"F�,��	[UǱ�`����`���i`�{�i`7�i؛��i+Q*IK�R$m5J%i+R*HC�W]3zЖR�[�R�tKۊ�J�T�QS���=�J�>m�J��_*~ �F�]��^5��jL%������FR"��D�ܭ�{Oĺ����u}e�2��!k�J�����???\J���||�����ݸO�k	����d�7�qjV���y���$�I.+.�\Q\&���BrMq���E���8����$���HZ�(�
���
Q�����$~@ ����=?�I����H/�]w ����]R��C+d�V�>�#!�B    �Bf�h�H�HQV�h@\�֪���6�����꣈����2�EbjQb��h�1�V$1C�Q���Z����֪�l�V5Qe3���*��U�����&��T��-9�k�eG[[z���ŖmE�SAB�i+bK��"�,i+bK��"�9 d�i�VƘ'mex�[;^�ּ�3�g��K?Ú�~�5/���ּ�3���07?����an~6�>6�>6�>6�>6�>6�>����ʏ��ʏ��]���]���U�A���3����?������(��3��O�"-� v@���gpG�����r�3C�����+~<7􊛓C���L�Fak,�����jv`�U#q:�#zş�$z埑%z叔<�f�͒kf��fV��5��ZdrͼYerլ9��f���\5+�eq�ò���Q�H\��l$�v�L/���z�Z��՚��[�g�&Y�m���՚^8����i��N�5�pZ����0���i5?�=���?#������m��H�6p��#G�q�g$q�3���I���$no�I�6��$q�s�����J�Sd��G��H��)2>;!EFgg��0~�^ԅ�䯲�����)2�_F �u�-_�@I/�Qa\���)�#��_)�������ߨ���_�Ɠ�ڌ��Ӎ�����s��Ӎ��ޟk��mXO:{q�I��(Y��S��"7J�w�٨:��Eb#dѱ��X�06:�"En���y6���g��Ó����+�:h���q�A>��1�ǿ&l�����A>�"��R79.$΃�y�q�>D<,�0�pX�IѰ8\����%baq�$Baqt$�`q`$�`qL$r��pH�|U#!��U�D�W�7:V,\:TL0�Ѓ�&�'�QgM=k�ΰ�����9���1���|�^.�nL/�1�\��ra�˅n<ٞ�hL/��l� Ƴł�9�\��raX�˅amP)��2��2h�$
A�
P�<� 3��2��2���	|2�6!0�4!0"�N0x��6"�Onj���
!���B����"�/+���+
!���B����&�oQ� ���u:�wz�������]���~�i�n��3�����ޣ}����3���if��>��3ڗ�}A�:��h�f�컟��kA`����n��ߦ�!kMzA�Z��PT�I�}�(1��d;�ΐUsr�Uwr�UzR�OU��my� ���<W�r�W�r�q�(7o���/��ѹ�=rt�����?"G��O�:sF���P��k=T��Z9�փ���w��@{n�ԒB,_0:�X9���$�,b���V���$��9E@�lb.���I��(�5�I�6$�W,���C�tb�i�-&8>�ض[��b[v1U�i��n��1S�z3��>?n泰)}�Yؔ��Nye?M7��EO�睆O��O���<��r�G�䗯�n>~�y���?����?��Bq����ث�AvDI����x�G���gx�E����wD���gwDB����vD@���gvD>����u$ݷ���H::�/���y;�5,�>v���\�2�s}�����XXsy�����X"t:_Mg��7�����R1�X��l.`��� ]5��}�`t͘t�_!I�Ec�j�	�.�E��1�~B��$]AfC�Ud6$]I橢�D-�d$�דٶi(*���Y�ʬ�M~���2HKQ�*��A���yʃra-�eT���2QKe����Qwl)-���T\F5k*/�;�T]F�+�����1�e�Sc��sQSif�Wj�،B�R3�0�f��0�f֥PT��훣��l0O���v�gS�',�cS�yű)��ؔtQqlJ��86%]V���(�MI�����lV��e��n��������I�f=h����pz��������ǿ?H�Ϫ}�<�_�P�W$���4G�B��
)s$)�Α��6G
"q�#U!n�4�x�+�0���V�� �\`�x~��|�������w�=������Ӓ��b�#�"����V8,(�rXTX㰄؈ e��0�aEa�ê��5�E��űn����dI_�Q�+k<��N��W�QL@���⺩.y���>_<�_��D6a�W.a<Ÿ*��]�5�'��0����}*�0���C��>�0��Ә�p	kV�e�Z�����V߇�=��l�-T���1@w��$$E�9�Uùd�`�Cp�R�C�

���7C����}�$ߧI�Z�B��In�Iŏ8��cr��4�%R]�Lԃ�1��W|ب���<$��ڎ�s�`��ڸm��M���8�d�m�����e|"��d�m�>+��6$�nu��:�۾&6��zS��e2�8P~��k��:��F��äQ~�0CƋ�7�����U��^t�(�)*V��PN���'^�D@�̷�����!bA!��
��Q7Dā&�8"
4k��-�!@�~	Llp�@L��o���i�I������E@����`���P
8C-P��@�3T��S��(p��= -�@��`��	�E��C "���<���"����D��<���3���<���s��9���lg�>N���� 	Y�c������� 6 ����Isd\D��(]St�dhM�4H�4�`"�jܢA�i���Ħ����c��=��Y�c��=��Y�c���,fzl)3�|l)��ǖ2+zp)���2+kZ���Jϣ%6Σ%���y�D���<VB�j��Ih-�	�e4�]��f�+�y��v�2��ٸ^!@{@!�7j(���i��17�:�(+)dj׫������R�v�Jj��+)fjw����}��B�v��:���Jz̕�КuU���iW����5�j��`,�{0*�z=ތr�^�7�T���ͨS�uz3j�z�ެ��^�7�#�m/�ŚXm����ܿ�{{;��oޭU��'v1�6j|�__� ���0g�f✉�Is&i&ϙ��2g�fꜩ�is��AΏ��^U��w�+h_p�/艂wd�6��}"��m'�D���6��12����,nW����%=���
I�uC�M�a�O,����E�P
T��7��P8C5P��@%�@�3�P8CIP����z |YPZ����-,s:��]a�����ZOv������Ǣ#�~�?���o�e���_���6S֓���2�t���8��Wj��%B�n���~`�#q������=	���X�H���G�G=���y��?�O�D|�P��@��)r��T3DlBT��B�%d�1*E�+C��T���)Lb�E1�((L�2�^�$a��W��/�W��_�g_���=Q]}�ӓ����'+���DA�I)����gMY��#��x5�t���:�?�:���p�V�NȀ��1:bt�������/ Fg^@̒uAr|�����`�t¥M����[�d0e[@ҒkIK�$M�d-���$Z@ҔgQS�DMI�R,�AeX@�ʮ0�1%��V�f��
�f��
�`+l�aR+�� &���W*��~2�����ʵ=qZ��'@�A����h���j���w5�y��{Qq�]�w�8���@��#\`���a<0g�����H������a��q#�;0naD��0ҕ0ncdu�]��x4nb��D�ZSw`-ݺ(��*�zk��+�	�W����z�.R�s#���17B�s��17�s��17b�ca"�~=�&��$������m��U��
�d\�;\M�� J�M
��۬ J�-
��ڪ J�o�U2%�Đ9�p���qGҕ[d�X����WyF+(�<��&�ʑG��j�<��F�*
#�gU������سY��X?Q�RIG����t��������W��{�AY�o�Fe�������zV���R,Y��wЫ6��BoʼM�g-�~ҡ�G�d]ui3�����I�%lβ-ac�m��4s�m	�3mKؘj[±O�Ly�6&�Fؚaikzm�������Y`!Gbƴ�5�Ֆ(-�lPG�:O��5;3;3;ㅝ����;����l�N�Mۑ�E��p�N{��#I��#I��#   I����Mݑ�E�پ_��#Q��#Q�³�iN�I"p*�$�'"�i<��rgK�x$�eΖ�� �I;����~)m�)e�N��m�N�.��A��=V5hF�>�9�q�?o�Ѹׯ��h��W����eT�F���.��Wk��SN���:�I�A��&��R�	�t$D�A�<�����VM�'r$Ğ�A�=��{G=ׁ#8;pg`������8~ӱr�����؁�7����4��� w�������y��/^�?֪�<      ;      x������ � �     