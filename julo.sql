PGDMP     !    '                x            d5d1g2hvb9shd2     12.3 (Ubuntu 12.3-1.pgdg16.04+1)    12.3 �    h           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            i           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            j           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            k           1262    10849433    d5d1g2hvb9shd2    DATABASE     �   CREATE DATABASE d5d1g2hvb9shd2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE d5d1g2hvb9shd2;
                mgwrazdkuavmyp    false            l           0    0    DATABASE d5d1g2hvb9shd2    ACL     A   REVOKE CONNECT,TEMPORARY ON DATABASE d5d1g2hvb9shd2 FROM PUBLIC;
                   mgwrazdkuavmyp    false    4203            m           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO mgwrazdkuavmyp;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   mgwrazdkuavmyp    false    3            n           0    0    LANGUAGE plpgsql    ACL     1   GRANT ALL ON LANGUAGE plpgsql TO mgwrazdkuavmyp;
                   postgres    false    794            �            1259    10854608    account_perfil    TABLE     �   CREATE TABLE public.account_perfil (
    id integer NOT NULL,
    cargo character varying(100) NOT NULL,
    regiao character varying(100) NOT NULL,
    avatar character varying(255),
    usuario_id integer NOT NULL,
    cpf character varying(100)
);
 "   DROP TABLE public.account_perfil;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854606    account_perfil_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_perfil_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.account_perfil_id_seq;
       public          mgwrazdkuavmyp    false    219            o           0    0    account_perfil_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.account_perfil_id_seq OWNED BY public.account_perfil.id;
          public          mgwrazdkuavmyp    false    218            �            1259    10854622    account_planejadouser    TABLE     �   CREATE TABLE public.account_planejadouser (
    id integer NOT NULL,
    planejado numeric(7,2) NOT NULL,
    planejado_moto integer NOT NULL,
    planejado_cota integer NOT NULL,
    planejado_visita integer NOT NULL,
    usuario_id integer NOT NULL
);
 )   DROP TABLE public.account_planejadouser;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854620    account_planejadouser_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_planejadouser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.account_planejadouser_id_seq;
       public          mgwrazdkuavmyp    false    221            p           0    0    account_planejadouser_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.account_planejadouser_id_seq OWNED BY public.account_planejadouser.id;
          public          mgwrazdkuavmyp    false    220            �            1259    10854504 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854502    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          mgwrazdkuavmyp    false    209            q           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          mgwrazdkuavmyp    false    208            �            1259    10854518    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854516    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          mgwrazdkuavmyp    false    211            r           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          mgwrazdkuavmyp    false    210            �            1259    10854494    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854492    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          mgwrazdkuavmyp    false    207            s           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          mgwrazdkuavmyp    false    206            �            1259    10854526 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
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
       public         heap    mgwrazdkuavmyp    false            �            1259    10854536    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854534    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          mgwrazdkuavmyp    false    215            t           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          mgwrazdkuavmyp    false    214            �            1259    10854524    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          mgwrazdkuavmyp    false    213            u           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          mgwrazdkuavmyp    false    212            �            1259    10854544    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854542 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          mgwrazdkuavmyp    false    217            v           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          mgwrazdkuavmyp    false    216            �            1259    10854772    core_cidade    TABLE     �   CREATE TABLE public.core_cidade (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    regiao character varying(100) NOT NULL
);
    DROP TABLE public.core_cidade;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854770    core_cidade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_cidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.core_cidade_id_seq;
       public          mgwrazdkuavmyp    false    231            w           0    0    core_cidade_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.core_cidade_id_seq OWNED BY public.core_cidade.id;
          public          mgwrazdkuavmyp    false    230            �            1259    10854751 	   core_cota    TABLE     1  CREATE TABLE public.core_cota (
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
       public         heap    mgwrazdkuavmyp    false            �            1259    10854749    core_cota_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_cota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.core_cota_id_seq;
       public          mgwrazdkuavmyp    false    229            x           0    0    core_cota_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.core_cota_id_seq OWNED BY public.core_cota.id;
          public          mgwrazdkuavmyp    false    228            �            1259    10854863    core_documentcota    TABLE     �   CREATE TABLE public.core_documentcota (
    id integer NOT NULL,
    document character varying(100) NOT NULL,
    uploaded_at timestamp with time zone NOT NULL
);
 %   DROP TABLE public.core_documentcota;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854861    core_documentcota_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_documentcota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.core_documentcota_id_seq;
       public          mgwrazdkuavmyp    false    241            y           0    0    core_documentcota_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.core_documentcota_id_seq OWNED BY public.core_documentcota.id;
          public          mgwrazdkuavmyp    false    240            �            1259    10854871    core_documentmoto    TABLE     �   CREATE TABLE public.core_documentmoto (
    id integer NOT NULL,
    document character varying(100) NOT NULL,
    uploaded_at timestamp with time zone NOT NULL
);
 %   DROP TABLE public.core_documentmoto;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854869    core_documentmoto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_documentmoto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.core_documentmoto_id_seq;
       public          mgwrazdkuavmyp    false    243            z           0    0    core_documentmoto_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.core_documentmoto_id_seq OWNED BY public.core_documentmoto.id;
          public          mgwrazdkuavmyp    false    242            �            1259    10854780    core_equipe    TABLE     �   CREATE TABLE public.core_equipe (
    id integer NOT NULL,
    cidade_id integer NOT NULL,
    user_id integer NOT NULL,
    perfil_id integer NOT NULL
);
    DROP TABLE public.core_equipe;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854778    core_equipe_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_equipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.core_equipe_id_seq;
       public          mgwrazdkuavmyp    false    233            {           0    0    core_equipe_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.core_equipe_id_seq OWNED BY public.core_equipe.id;
          public          mgwrazdkuavmyp    false    232            �            1259    10854831    core_metacotacidade    TABLE     �   CREATE TABLE public.core_metacotacidade (
    id integer NOT NULL,
    ano integer NOT NULL,
    mes integer NOT NULL,
    meta integer NOT NULL,
    cidade_id integer NOT NULL,
    modelo_id integer NOT NULL
);
 '   DROP TABLE public.core_metacotacidade;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854829    core_metacotacidade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_metacotacidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.core_metacotacidade_id_seq;
       public          mgwrazdkuavmyp    false    239            |           0    0    core_metacotacidade_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.core_metacotacidade_id_seq OWNED BY public.core_metacotacidade.id;
          public          mgwrazdkuavmyp    false    238            �            1259    10854823    core_metamotocidade    TABLE     �   CREATE TABLE public.core_metamotocidade (
    id integer NOT NULL,
    ano integer NOT NULL,
    mes integer NOT NULL,
    meta integer NOT NULL,
    cidade_id integer NOT NULL,
    modelo_id integer NOT NULL
);
 '   DROP TABLE public.core_metamotocidade;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854821    core_metamotocidade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_metamotocidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.core_metamotocidade_id_seq;
       public          mgwrazdkuavmyp    false    237            }           0    0    core_metamotocidade_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.core_metamotocidade_id_seq OWNED BY public.core_metamotocidade.id;
          public          mgwrazdkuavmyp    false    236            �            1259    10854716 	   core_moto    TABLE     1  CREATE TABLE public.core_moto (
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
       public         heap    mgwrazdkuavmyp    false            �            1259    10854714    core_moto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_moto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.core_moto_id_seq;
       public          mgwrazdkuavmyp    false    225            ~           0    0    core_moto_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.core_moto_id_seq OWNED BY public.core_moto.id;
          public          mgwrazdkuavmyp    false    224            �            1259    10854812    core_motoperfil    TABLE     �   CREATE TABLE public.core_motoperfil (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    avatar character varying(400) NOT NULL
);
 #   DROP TABLE public.core_motoperfil;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854810    core_motoperfil_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_motoperfil_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.core_motoperfil_id_seq;
       public          mgwrazdkuavmyp    false    235                       0    0    core_motoperfil_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.core_motoperfil_id_seq OWNED BY public.core_motoperfil.id;
          public          mgwrazdkuavmyp    false    234            �            1259    10854904    core_planejadomoto    TABLE     �   CREATE TABLE public.core_planejadomoto (
    id integer NOT NULL,
    regiao character varying(100) NOT NULL,
    mes integer NOT NULL,
    ano integer NOT NULL,
    cidade_id integer NOT NULL,
    modelo_id integer NOT NULL
);
 &   DROP TABLE public.core_planejadomoto;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854902    core_planejadomoto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_planejadomoto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.core_planejadomoto_id_seq;
       public          mgwrazdkuavmyp    false    249            �           0    0    core_planejadomoto_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.core_planejadomoto_id_seq OWNED BY public.core_planejadomoto.id;
          public          mgwrazdkuavmyp    false    248            �            1259    10854727    core_planejadorealizado    TABLE     n  CREATE TABLE public.core_planejadorealizado (
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
       public         heap    mgwrazdkuavmyp    false            �            1259    10854725    core_planejadorealizado_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_planejadorealizado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.core_planejadorealizado_id_seq;
       public          mgwrazdkuavmyp    false    227            �           0    0    core_planejadorealizado_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.core_planejadorealizado_id_seq OWNED BY public.core_planejadorealizado.id;
          public          mgwrazdkuavmyp    false    226            �            1259    10854896    core_sazonalidadecidade    TABLE     �   CREATE TABLE public.core_sazonalidadecidade (
    id integer NOT NULL,
    mes integer NOT NULL,
    percentual double precision NOT NULL,
    vl_total_anual integer NOT NULL,
    ano_base integer NOT NULL,
    cidade_id integer NOT NULL
);
 +   DROP TABLE public.core_sazonalidadecidade;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854894    core_sazonalidadecidade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_sazonalidadecidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.core_sazonalidadecidade_id_seq;
       public          mgwrazdkuavmyp    false    247            �           0    0    core_sazonalidadecidade_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.core_sazonalidadecidade_id_seq OWNED BY public.core_sazonalidadecidade.id;
          public          mgwrazdkuavmyp    false    246            �            1259    10854946    core_sazonalidademodelo    TABLE     �   CREATE TABLE public.core_sazonalidademodelo (
    id integer NOT NULL,
    mes integer NOT NULL,
    percentual double precision NOT NULL,
    vl_total_anual integer NOT NULL,
    ano_base integer NOT NULL,
    modelo_id integer NOT NULL
);
 +   DROP TABLE public.core_sazonalidademodelo;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854944    core_sazonalidademodelo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_sazonalidademodelo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.core_sazonalidademodelo_id_seq;
       public          mgwrazdkuavmyp    false    255            �           0    0    core_sazonalidademodelo_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.core_sazonalidademodelo_id_seq OWNED BY public.core_sazonalidademodelo.id;
          public          mgwrazdkuavmyp    false    254            �            1259    10854938    core_sazonalidaderegiao    TABLE     �   CREATE TABLE public.core_sazonalidaderegiao (
    id integer NOT NULL,
    regiao character varying(100) NOT NULL,
    mes integer NOT NULL,
    percentual double precision NOT NULL,
    vl_total_anual integer NOT NULL,
    ano_base integer NOT NULL
);
 +   DROP TABLE public.core_sazonalidaderegiao;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854936    core_sazonalidaderegiao_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_sazonalidaderegiao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.core_sazonalidaderegiao_id_seq;
       public          mgwrazdkuavmyp    false    253            �           0    0    core_sazonalidaderegiao_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.core_sazonalidaderegiao_id_seq OWNED BY public.core_sazonalidaderegiao.id;
          public          mgwrazdkuavmyp    false    252            �            1259    10854930    core_sazonalidadevendedor    TABLE     8  CREATE TABLE public.core_sazonalidadevendedor (
    id integer NOT NULL,
    vendedor_nome character varying(250) NOT NULL,
    vendedor_cpf character varying(100) NOT NULL,
    mes integer NOT NULL,
    percentual double precision NOT NULL,
    vl_total_anual integer NOT NULL,
    ano_base integer NOT NULL
);
 -   DROP TABLE public.core_sazonalidadevendedor;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854928     core_sazonalidadevendedor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_sazonalidadevendedor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.core_sazonalidadevendedor_id_seq;
       public          mgwrazdkuavmyp    false    251            �           0    0     core_sazonalidadevendedor_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.core_sazonalidadevendedor_id_seq OWNED BY public.core_sazonalidadevendedor.id;
          public          mgwrazdkuavmyp    false    250            �            1259    10854887    core_totalmensalmoto2019    TABLE     �   CREATE TABLE public.core_totalmensalmoto2019 (
    id integer NOT NULL,
    cidade character varying(100) NOT NULL,
    mes integer NOT NULL,
    qtd integer NOT NULL
);
 ,   DROP TABLE public.core_totalmensalmoto2019;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854885    core_totalmensalmoto2019_id_seq    SEQUENCE     �   CREATE SEQUENCE public.core_totalmensalmoto2019_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.core_totalmensalmoto2019_id_seq;
       public          mgwrazdkuavmyp    false    245            �           0    0    core_totalmensalmoto2019_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.core_totalmensalmoto2019_id_seq OWNED BY public.core_totalmensalmoto2019.id;
          public          mgwrazdkuavmyp    false    244            �            1259    10854659    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
       public         heap    mgwrazdkuavmyp    false            �            1259    10854656    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          mgwrazdkuavmyp    false    223            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          mgwrazdkuavmyp    false    222            �            1259    10854484    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854482    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          mgwrazdkuavmyp    false    205            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          mgwrazdkuavmyp    false    204            �            1259    10854473    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    mgwrazdkuavmyp    false            �            1259    10854471    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          mgwrazdkuavmyp    false    203            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          mgwrazdkuavmyp    false    202                        1259    10854958    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    mgwrazdkuavmyp    false            '           2604    10854611    account_perfil id    DEFAULT     v   ALTER TABLE ONLY public.account_perfil ALTER COLUMN id SET DEFAULT nextval('public.account_perfil_id_seq'::regclass);
 @   ALTER TABLE public.account_perfil ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    218    219    219            (           2604    10854625    account_planejadouser id    DEFAULT     �   ALTER TABLE ONLY public.account_planejadouser ALTER COLUMN id SET DEFAULT nextval('public.account_planejadouser_id_seq'::regclass);
 G   ALTER TABLE public.account_planejadouser ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    220    221    221            "           2604    10854507    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    209    208    209            #           2604    10854521    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    210    211    211            !           2604    10854497    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    207    206    207            $           2604    10854529    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    213    212    213            %           2604    10854539    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    215    214    215            &           2604    10854547    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    217    216    217            .           2604    10854775    core_cidade id    DEFAULT     p   ALTER TABLE ONLY public.core_cidade ALTER COLUMN id SET DEFAULT nextval('public.core_cidade_id_seq'::regclass);
 =   ALTER TABLE public.core_cidade ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    230    231    231            -           2604    10854754    core_cota id    DEFAULT     l   ALTER TABLE ONLY public.core_cota ALTER COLUMN id SET DEFAULT nextval('public.core_cota_id_seq'::regclass);
 ;   ALTER TABLE public.core_cota ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    229    228    229            3           2604    10854866    core_documentcota id    DEFAULT     |   ALTER TABLE ONLY public.core_documentcota ALTER COLUMN id SET DEFAULT nextval('public.core_documentcota_id_seq'::regclass);
 C   ALTER TABLE public.core_documentcota ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    241    240    241            4           2604    10854874    core_documentmoto id    DEFAULT     |   ALTER TABLE ONLY public.core_documentmoto ALTER COLUMN id SET DEFAULT nextval('public.core_documentmoto_id_seq'::regclass);
 C   ALTER TABLE public.core_documentmoto ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    242    243    243            /           2604    10854783    core_equipe id    DEFAULT     p   ALTER TABLE ONLY public.core_equipe ALTER COLUMN id SET DEFAULT nextval('public.core_equipe_id_seq'::regclass);
 =   ALTER TABLE public.core_equipe ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    232    233    233            2           2604    10854834    core_metacotacidade id    DEFAULT     �   ALTER TABLE ONLY public.core_metacotacidade ALTER COLUMN id SET DEFAULT nextval('public.core_metacotacidade_id_seq'::regclass);
 E   ALTER TABLE public.core_metacotacidade ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    239    238    239            1           2604    10854826    core_metamotocidade id    DEFAULT     �   ALTER TABLE ONLY public.core_metamotocidade ALTER COLUMN id SET DEFAULT nextval('public.core_metamotocidade_id_seq'::regclass);
 E   ALTER TABLE public.core_metamotocidade ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    237    236    237            +           2604    10854719    core_moto id    DEFAULT     l   ALTER TABLE ONLY public.core_moto ALTER COLUMN id SET DEFAULT nextval('public.core_moto_id_seq'::regclass);
 ;   ALTER TABLE public.core_moto ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    224    225    225            0           2604    10854815    core_motoperfil id    DEFAULT     x   ALTER TABLE ONLY public.core_motoperfil ALTER COLUMN id SET DEFAULT nextval('public.core_motoperfil_id_seq'::regclass);
 A   ALTER TABLE public.core_motoperfil ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    235    234    235            7           2604    10854907    core_planejadomoto id    DEFAULT     ~   ALTER TABLE ONLY public.core_planejadomoto ALTER COLUMN id SET DEFAULT nextval('public.core_planejadomoto_id_seq'::regclass);
 D   ALTER TABLE public.core_planejadomoto ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    249    248    249            ,           2604    10854730    core_planejadorealizado id    DEFAULT     �   ALTER TABLE ONLY public.core_planejadorealizado ALTER COLUMN id SET DEFAULT nextval('public.core_planejadorealizado_id_seq'::regclass);
 I   ALTER TABLE public.core_planejadorealizado ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    226    227    227            6           2604    10854899    core_sazonalidadecidade id    DEFAULT     �   ALTER TABLE ONLY public.core_sazonalidadecidade ALTER COLUMN id SET DEFAULT nextval('public.core_sazonalidadecidade_id_seq'::regclass);
 I   ALTER TABLE public.core_sazonalidadecidade ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    246    247    247            :           2604    10854949    core_sazonalidademodelo id    DEFAULT     �   ALTER TABLE ONLY public.core_sazonalidademodelo ALTER COLUMN id SET DEFAULT nextval('public.core_sazonalidademodelo_id_seq'::regclass);
 I   ALTER TABLE public.core_sazonalidademodelo ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    254    255    255            9           2604    10854941    core_sazonalidaderegiao id    DEFAULT     �   ALTER TABLE ONLY public.core_sazonalidaderegiao ALTER COLUMN id SET DEFAULT nextval('public.core_sazonalidaderegiao_id_seq'::regclass);
 I   ALTER TABLE public.core_sazonalidaderegiao ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    252    253    253            8           2604    10854933    core_sazonalidadevendedor id    DEFAULT     �   ALTER TABLE ONLY public.core_sazonalidadevendedor ALTER COLUMN id SET DEFAULT nextval('public.core_sazonalidadevendedor_id_seq'::regclass);
 K   ALTER TABLE public.core_sazonalidadevendedor ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    250    251    251            5           2604    10854890    core_totalmensalmoto2019 id    DEFAULT     �   ALTER TABLE ONLY public.core_totalmensalmoto2019 ALTER COLUMN id SET DEFAULT nextval('public.core_totalmensalmoto2019_id_seq'::regclass);
 J   ALTER TABLE public.core_totalmensalmoto2019 ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    244    245    245            )           2604    10854662    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    223    222    223                        2604    10854487    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    205    204    205                       2604    10854476    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          mgwrazdkuavmyp    false    203    202    203            @          0    10854608    account_perfil 
   TABLE DATA           T   COPY public.account_perfil (id, cargo, regiao, avatar, usuario_id, cpf) FROM stdin;
    public          mgwrazdkuavmyp    false    219   Wc      B          0    10854622    account_planejadouser 
   TABLE DATA           |   COPY public.account_planejadouser (id, planejado, planejado_moto, planejado_cota, planejado_visita, usuario_id) FROM stdin;
    public          mgwrazdkuavmyp    false    221   �d      6          0    10854504 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          mgwrazdkuavmyp    false    209   e      8          0    10854518    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          mgwrazdkuavmyp    false    211   6e      4          0    10854494    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          mgwrazdkuavmyp    false    207   Se      :          0    10854526 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          mgwrazdkuavmyp    false    213   Ai      <          0    10854536    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          mgwrazdkuavmyp    false    215   �l      >          0    10854544    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          mgwrazdkuavmyp    false    217   m      L          0    10854772    core_cidade 
   TABLE DATA           7   COPY public.core_cidade (id, nome, regiao) FROM stdin;
    public          mgwrazdkuavmyp    false    231   1m      J          0    10854751 	   core_cota 
   TABLE DATA           �  COPY public.core_cota (id, "Cpf_Vendedor", "Nome_Vendedor", "Data_da_Venda", "Prazo", "Tipo_contrato", "Modelo", "Status", "Cliente", "Municipio", "Telefone", "Celular", "Ponto_de_Venda", "Parcela", "Data_de_Vencimento", "Grupo", "Cota", "R", "D", "Credito", "Data_da_Contemplacao", "Tipo_de_Contemplacao", "Efetuou_Negociacao", "Proposta", "Digito_da_Proposta", "Vl_total_amortizado", "Vl_Quitacao", "Plano", "Porcentagem_Amortizado", "Porcentagem_Mensal", "Qtd_Parcelas", "Seguro_de_Vida") FROM stdin;
    public          mgwrazdkuavmyp    false    229   o      V          0    10854863    core_documentcota 
   TABLE DATA           F   COPY public.core_documentcota (id, document, uploaded_at) FROM stdin;
    public          mgwrazdkuavmyp    false    241   �*      X          0    10854871    core_documentmoto 
   TABLE DATA           F   COPY public.core_documentmoto (id, document, uploaded_at) FROM stdin;
    public          mgwrazdkuavmyp    false    243   +      N          0    10854780    core_equipe 
   TABLE DATA           H   COPY public.core_equipe (id, cidade_id, user_id, perfil_id) FROM stdin;
    public          mgwrazdkuavmyp    false    233   p+      T          0    10854831    core_metacotacidade 
   TABLE DATA           W   COPY public.core_metacotacidade (id, ano, mes, meta, cidade_id, modelo_id) FROM stdin;
    public          mgwrazdkuavmyp    false    239   �,      R          0    10854823    core_metamotocidade 
   TABLE DATA           W   COPY public.core_metamotocidade (id, ano, mes, meta, cidade_id, modelo_id) FROM stdin;
    public          mgwrazdkuavmyp    false    237   �,      F          0    10854716 	   core_moto 
   TABLE DATA           t  COPY public.core_moto (id, "Empresa", "Data", "Nota_Fiscal", "Serie", "Valor_da_Nota", "Veiculo", "Chassi", "Forma_Pagamento", "Vendedor", "Cliente", "Cpf_Cnpj_Cliente", "Novo", "Quantidade", "Operacao_Interna", "Data_Compra", "Custo_Medio", "Margem", "Margem_Porcentagem", "Ano_Fab", "Ano_Modelo", "Municipio", "Valor_Tabela", "Emp_Funcionario", "Motivo_Devolucao", "Cor", "Tipo", "Telefone", "Celular", email, "Placa", "Despesa_Oficina", "Despesa_Financeira", "Valor_Venda_Gerencial", "Base_Comissao", "Forma_Fabrica", "Sub_Forma_Fabrica", "Modalidade_Venda", "Grupo_Pessoa_Vendedor", "Vendedor_cpf", "Cancelada") FROM stdin;
    public          mgwrazdkuavmyp    false    225   �,      P          0    10854812    core_motoperfil 
   TABLE DATA           ;   COPY public.core_motoperfil (id, nome, avatar) FROM stdin;
    public          mgwrazdkuavmyp    false    235   ��      ^          0    10854904    core_planejadomoto 
   TABLE DATA           X   COPY public.core_planejadomoto (id, regiao, mes, ano, cidade_id, modelo_id) FROM stdin;
    public          mgwrazdkuavmyp    false    249   ~�      H          0    10854727    core_planejadorealizado 
   TABLE DATA           �   COPY public.core_planejadorealizado (id, planejado, planejado_moto, planejado_cota, planejado_visita, cidade, regiao, mes, ano) FROM stdin;
    public          mgwrazdkuavmyp    false    227   ��      \          0    10854896    core_sazonalidadecidade 
   TABLE DATA           k   COPY public.core_sazonalidadecidade (id, mes, percentual, vl_total_anual, ano_base, cidade_id) FROM stdin;
    public          mgwrazdkuavmyp    false    247   ��      d          0    10854946    core_sazonalidademodelo 
   TABLE DATA           k   COPY public.core_sazonalidademodelo (id, mes, percentual, vl_total_anual, ano_base, modelo_id) FROM stdin;
    public          mgwrazdkuavmyp    false    255   Շ      b          0    10854938    core_sazonalidaderegiao 
   TABLE DATA           h   COPY public.core_sazonalidaderegiao (id, regiao, mes, percentual, vl_total_anual, ano_base) FROM stdin;
    public          mgwrazdkuavmyp    false    253   �      `          0    10854930    core_sazonalidadevendedor 
   TABLE DATA              COPY public.core_sazonalidadevendedor (id, vendedor_nome, vendedor_cpf, mes, percentual, vl_total_anual, ano_base) FROM stdin;
    public          mgwrazdkuavmyp    false    251   �      Z          0    10854887    core_totalmensalmoto2019 
   TABLE DATA           H   COPY public.core_totalmensalmoto2019 (id, cidade, mes, qtd) FROM stdin;
    public          mgwrazdkuavmyp    false    245   ,�      D          0    10854659    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          mgwrazdkuavmyp    false    223   4�      2          0    10854484    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          mgwrazdkuavmyp    false    205   m�      0          0    10854473    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          mgwrazdkuavmyp    false    203   m�      e          0    10854958    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          mgwrazdkuavmyp    false    256   T�      �           0    0    account_perfil_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.account_perfil_id_seq', 21, true);
          public          mgwrazdkuavmyp    false    218            �           0    0    account_planejadouser_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.account_planejadouser_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    220            �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    208            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    210            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 96, true);
          public          mgwrazdkuavmyp    false    206            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    214            �           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 21, true);
          public          mgwrazdkuavmyp    false    212            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    216            �           0    0    core_cidade_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.core_cidade_id_seq', 44, true);
          public          mgwrazdkuavmyp    false    230            �           0    0    core_cota_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.core_cota_id_seq', 1649, true);
          public          mgwrazdkuavmyp    false    228            �           0    0    core_documentcota_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.core_documentcota_id_seq', 3, true);
          public          mgwrazdkuavmyp    false    240            �           0    0    core_documentmoto_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.core_documentmoto_id_seq', 1, true);
          public          mgwrazdkuavmyp    false    242            �           0    0    core_equipe_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.core_equipe_id_seq', 67, true);
          public          mgwrazdkuavmyp    false    232            �           0    0    core_metacotacidade_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.core_metacotacidade_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    238            �           0    0    core_metamotocidade_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.core_metamotocidade_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    236            �           0    0    core_moto_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.core_moto_id_seq', 2939, true);
          public          mgwrazdkuavmyp    false    224            �           0    0    core_motoperfil_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.core_motoperfil_id_seq', 23, true);
          public          mgwrazdkuavmyp    false    234            �           0    0    core_planejadomoto_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.core_planejadomoto_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    248            �           0    0    core_planejadorealizado_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.core_planejadorealizado_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    226            �           0    0    core_sazonalidadecidade_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.core_sazonalidadecidade_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    246            �           0    0    core_sazonalidademodelo_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.core_sazonalidademodelo_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    254            �           0    0    core_sazonalidaderegiao_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.core_sazonalidaderegiao_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    252            �           0    0     core_sazonalidadevendedor_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.core_sazonalidadevendedor_id_seq', 1, false);
          public          mgwrazdkuavmyp    false    250            �           0    0    core_totalmensalmoto2019_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.core_totalmensalmoto2019_id_seq', 528, true);
          public          mgwrazdkuavmyp    false    244            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 10, true);
          public          mgwrazdkuavmyp    false    222            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 24, true);
          public          mgwrazdkuavmyp    false    204            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 52, true);
          public          mgwrazdkuavmyp    false    202            c           2606    10854613 "   account_perfil account_perfil_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.account_perfil
    ADD CONSTRAINT account_perfil_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.account_perfil DROP CONSTRAINT account_perfil_pkey;
       public            mgwrazdkuavmyp    false    219            f           2606    10854627 0   account_planejadouser account_planejadouser_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.account_planejadouser
    ADD CONSTRAINT account_planejadouser_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.account_planejadouser DROP CONSTRAINT account_planejadouser_pkey;
       public            mgwrazdkuavmyp    false    221            H           2606    10854712    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            mgwrazdkuavmyp    false    209            M           2606    10854574 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            mgwrazdkuavmyp    false    211    211            P           2606    10854523 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            mgwrazdkuavmyp    false    211            J           2606    10854509    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            mgwrazdkuavmyp    false    209            C           2606    10854558 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            mgwrazdkuavmyp    false    207    207            E           2606    10854499 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            mgwrazdkuavmyp    false    207            X           2606    10854541 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            mgwrazdkuavmyp    false    215            [           2606    10854589 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            mgwrazdkuavmyp    false    215    215            R           2606    10854531    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            mgwrazdkuavmyp    false    213            ^           2606    10854549 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            mgwrazdkuavmyp    false    217            a           2606    10854603 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            mgwrazdkuavmyp    false    217    217            U           2606    10854705     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            mgwrazdkuavmyp    false    213            s           2606    10854777    core_cidade core_cidade_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.core_cidade
    ADD CONSTRAINT core_cidade_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.core_cidade DROP CONSTRAINT core_cidade_pkey;
       public            mgwrazdkuavmyp    false    231            q           2606    10854765    core_cota core_cota_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.core_cota
    ADD CONSTRAINT core_cota_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.core_cota DROP CONSTRAINT core_cota_pkey;
       public            mgwrazdkuavmyp    false    229            �           2606    10854868 (   core_documentcota core_documentcota_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.core_documentcota
    ADD CONSTRAINT core_documentcota_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.core_documentcota DROP CONSTRAINT core_documentcota_pkey;
       public            mgwrazdkuavmyp    false    241            �           2606    10854876 (   core_documentmoto core_documentmoto_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.core_documentmoto
    ADD CONSTRAINT core_documentmoto_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.core_documentmoto DROP CONSTRAINT core_documentmoto_pkey;
       public            mgwrazdkuavmyp    false    243            w           2606    10854785    core_equipe core_equipe_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.core_equipe
    ADD CONSTRAINT core_equipe_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.core_equipe DROP CONSTRAINT core_equipe_pkey;
       public            mgwrazdkuavmyp    false    233            �           2606    10854836 ,   core_metacotacidade core_metacotacidade_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.core_metacotacidade
    ADD CONSTRAINT core_metacotacidade_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.core_metacotacidade DROP CONSTRAINT core_metacotacidade_pkey;
       public            mgwrazdkuavmyp    false    239            ~           2606    10854828 ,   core_metamotocidade core_metamotocidade_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.core_metamotocidade
    ADD CONSTRAINT core_metamotocidade_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.core_metamotocidade DROP CONSTRAINT core_metamotocidade_pkey;
       public            mgwrazdkuavmyp    false    237            m           2606    10854724    core_moto core_moto_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.core_moto
    ADD CONSTRAINT core_moto_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.core_moto DROP CONSTRAINT core_moto_pkey;
       public            mgwrazdkuavmyp    false    225            z           2606    10854817 $   core_motoperfil core_motoperfil_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.core_motoperfil
    ADD CONSTRAINT core_motoperfil_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.core_motoperfil DROP CONSTRAINT core_motoperfil_pkey;
       public            mgwrazdkuavmyp    false    235            �           2606    10854909 *   core_planejadomoto core_planejadomoto_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.core_planejadomoto
    ADD CONSTRAINT core_planejadomoto_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.core_planejadomoto DROP CONSTRAINT core_planejadomoto_pkey;
       public            mgwrazdkuavmyp    false    249            o           2606    10854732 4   core_planejadorealizado core_planejadorealizado_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.core_planejadorealizado
    ADD CONSTRAINT core_planejadorealizado_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.core_planejadorealizado DROP CONSTRAINT core_planejadorealizado_pkey;
       public            mgwrazdkuavmyp    false    227            �           2606    10854901 4   core_sazonalidadecidade core_sazonalidadecidade_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.core_sazonalidadecidade
    ADD CONSTRAINT core_sazonalidadecidade_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.core_sazonalidadecidade DROP CONSTRAINT core_sazonalidadecidade_pkey;
       public            mgwrazdkuavmyp    false    247            �           2606    10854951 4   core_sazonalidademodelo core_sazonalidademodelo_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.core_sazonalidademodelo
    ADD CONSTRAINT core_sazonalidademodelo_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.core_sazonalidademodelo DROP CONSTRAINT core_sazonalidademodelo_pkey;
       public            mgwrazdkuavmyp    false    255            �           2606    10854943 4   core_sazonalidaderegiao core_sazonalidaderegiao_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.core_sazonalidaderegiao
    ADD CONSTRAINT core_sazonalidaderegiao_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.core_sazonalidaderegiao DROP CONSTRAINT core_sazonalidaderegiao_pkey;
       public            mgwrazdkuavmyp    false    253            �           2606    10854935 8   core_sazonalidadevendedor core_sazonalidadevendedor_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.core_sazonalidadevendedor
    ADD CONSTRAINT core_sazonalidadevendedor_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.core_sazonalidadevendedor DROP CONSTRAINT core_sazonalidadevendedor_pkey;
       public            mgwrazdkuavmyp    false    251            �           2606    10854892 6   core_totalmensalmoto2019 core_totalmensalmoto2019_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.core_totalmensalmoto2019
    ADD CONSTRAINT core_totalmensalmoto2019_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.core_totalmensalmoto2019 DROP CONSTRAINT core_totalmensalmoto2019_pkey;
       public            mgwrazdkuavmyp    false    245            j           2606    10854668 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            mgwrazdkuavmyp    false    223            >           2606    10854491 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            mgwrazdkuavmyp    false    205    205            @           2606    10854489 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            mgwrazdkuavmyp    false    205            <           2606    10854481 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            mgwrazdkuavmyp    false    203            �           2606    10854965 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            mgwrazdkuavmyp    false    256            d           1259    10854619 "   account_perfil_usuario_id_b23e6d20    INDEX     c   CREATE INDEX account_perfil_usuario_id_b23e6d20 ON public.account_perfil USING btree (usuario_id);
 6   DROP INDEX public.account_perfil_usuario_id_b23e6d20;
       public            mgwrazdkuavmyp    false    219            g           1259    10854635 )   account_planejadouser_usuario_id_d3d4b699    INDEX     q   CREATE INDEX account_planejadouser_usuario_id_d3d4b699 ON public.account_planejadouser USING btree (usuario_id);
 =   DROP INDEX public.account_planejadouser_usuario_id_d3d4b699;
       public            mgwrazdkuavmyp    false    221            F           1259    10854713    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            mgwrazdkuavmyp    false    209            K           1259    10854575 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            mgwrazdkuavmyp    false    211            N           1259    10854576 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            mgwrazdkuavmyp    false    211            A           1259    10854561 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            mgwrazdkuavmyp    false    207            V           1259    10854591 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            mgwrazdkuavmyp    false    215            Y           1259    10854590 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            mgwrazdkuavmyp    false    215            \           1259    10854605 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            mgwrazdkuavmyp    false    217            _           1259    10854604 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            mgwrazdkuavmyp    false    217            S           1259    10854706     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            mgwrazdkuavmyp    false    213            t           1259    10854796    core_equipe_cidade_id_7841757b    INDEX     [   CREATE INDEX core_equipe_cidade_id_7841757b ON public.core_equipe USING btree (cidade_id);
 2   DROP INDEX public.core_equipe_cidade_id_7841757b;
       public            mgwrazdkuavmyp    false    233            u           1259    10854804    core_equipe_perfil_id_4dc22eb9    INDEX     [   CREATE INDEX core_equipe_perfil_id_4dc22eb9 ON public.core_equipe USING btree (perfil_id);
 2   DROP INDEX public.core_equipe_perfil_id_4dc22eb9;
       public            mgwrazdkuavmyp    false    233            x           1259    10854797    core_equipe_user_id_a0d90f89    INDEX     W   CREATE INDEX core_equipe_user_id_a0d90f89 ON public.core_equipe USING btree (user_id);
 0   DROP INDEX public.core_equipe_user_id_a0d90f89;
       public            mgwrazdkuavmyp    false    233                       1259    10854859 &   core_metacotacidade_cidade_id_f5ba1c0c    INDEX     k   CREATE INDEX core_metacotacidade_cidade_id_f5ba1c0c ON public.core_metacotacidade USING btree (cidade_id);
 :   DROP INDEX public.core_metacotacidade_cidade_id_f5ba1c0c;
       public            mgwrazdkuavmyp    false    239            �           1259    10854860 &   core_metacotacidade_modelo_id_9fc9a085    INDEX     k   CREATE INDEX core_metacotacidade_modelo_id_9fc9a085 ON public.core_metacotacidade USING btree (modelo_id);
 :   DROP INDEX public.core_metacotacidade_modelo_id_9fc9a085;
       public            mgwrazdkuavmyp    false    239            {           1259    10854847 &   core_metamotocidade_cidade_id_ff14d219    INDEX     k   CREATE INDEX core_metamotocidade_cidade_id_ff14d219 ON public.core_metamotocidade USING btree (cidade_id);
 :   DROP INDEX public.core_metamotocidade_cidade_id_ff14d219;
       public            mgwrazdkuavmyp    false    237            |           1259    10854848 &   core_metamotocidade_modelo_id_965aa791    INDEX     k   CREATE INDEX core_metamotocidade_modelo_id_965aa791 ON public.core_metamotocidade USING btree (modelo_id);
 :   DROP INDEX public.core_metamotocidade_modelo_id_965aa791;
       public            mgwrazdkuavmyp    false    237            �           1259    10854926 %   core_planejadomoto_cidade_id_09f22229    INDEX     i   CREATE INDEX core_planejadomoto_cidade_id_09f22229 ON public.core_planejadomoto USING btree (cidade_id);
 9   DROP INDEX public.core_planejadomoto_cidade_id_09f22229;
       public            mgwrazdkuavmyp    false    249            �           1259    10854927 %   core_planejadomoto_modelo_id_28f380ea    INDEX     i   CREATE INDEX core_planejadomoto_modelo_id_28f380ea ON public.core_planejadomoto USING btree (modelo_id);
 9   DROP INDEX public.core_planejadomoto_modelo_id_28f380ea;
       public            mgwrazdkuavmyp    false    249            �           1259    10854915 *   core_sazonalidadecidade_cidade_id_87273f65    INDEX     s   CREATE INDEX core_sazonalidadecidade_cidade_id_87273f65 ON public.core_sazonalidadecidade USING btree (cidade_id);
 >   DROP INDEX public.core_sazonalidadecidade_cidade_id_87273f65;
       public            mgwrazdkuavmyp    false    247            �           1259    10854957 *   core_sazonalidademodelo_modelo_id_ae4a9c0e    INDEX     s   CREATE INDEX core_sazonalidademodelo_modelo_id_ae4a9c0e ON public.core_sazonalidademodelo USING btree (modelo_id);
 >   DROP INDEX public.core_sazonalidademodelo_modelo_id_ae4a9c0e;
       public            mgwrazdkuavmyp    false    255            h           1259    10854683 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            mgwrazdkuavmyp    false    223            k           1259    10854684 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            mgwrazdkuavmyp    false    223            �           1259    10854967 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            mgwrazdkuavmyp    false    256            �           1259    10854966 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            mgwrazdkuavmyp    false    256            �           2606    10854614 A   account_perfil account_perfil_usuario_id_b23e6d20_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_perfil
    ADD CONSTRAINT account_perfil_usuario_id_b23e6d20_fk_auth_user_id FOREIGN KEY (usuario_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.account_perfil DROP CONSTRAINT account_perfil_usuario_id_b23e6d20_fk_auth_user_id;
       public          mgwrazdkuavmyp    false    219    3922    213            �           2606    10854630 O   account_planejadouser account_planejadouser_usuario_id_d3d4b699_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_planejadouser
    ADD CONSTRAINT account_planejadouser_usuario_id_d3d4b699_fk_auth_user_id FOREIGN KEY (usuario_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.account_planejadouser DROP CONSTRAINT account_planejadouser_usuario_id_d3d4b699_fk_auth_user_id;
       public          mgwrazdkuavmyp    false    3922    213    221            �           2606    10854568 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          mgwrazdkuavmyp    false    207    211    3909            �           2606    10854563 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          mgwrazdkuavmyp    false    209    3914    211            �           2606    10854552 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          mgwrazdkuavmyp    false    205    207    3904            �           2606    10854583 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          mgwrazdkuavmyp    false    215    209    3914            �           2606    10854578 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          mgwrazdkuavmyp    false    215    213    3922            �           2606    10854597 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          mgwrazdkuavmyp    false    3909    217    207            �           2606    10854592 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          mgwrazdkuavmyp    false    213    3922    217            �           2606    10854786 <   core_equipe core_equipe_cidade_id_7841757b_fk_core_cidade_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_equipe
    ADD CONSTRAINT core_equipe_cidade_id_7841757b_fk_core_cidade_id FOREIGN KEY (cidade_id) REFERENCES public.core_cidade(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.core_equipe DROP CONSTRAINT core_equipe_cidade_id_7841757b_fk_core_cidade_id;
       public          mgwrazdkuavmyp    false    233    231    3955            �           2606    10854805 ?   core_equipe core_equipe_perfil_id_4dc22eb9_fk_account_perfil_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_equipe
    ADD CONSTRAINT core_equipe_perfil_id_4dc22eb9_fk_account_perfil_id FOREIGN KEY (perfil_id) REFERENCES public.account_perfil(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.core_equipe DROP CONSTRAINT core_equipe_perfil_id_4dc22eb9_fk_account_perfil_id;
       public          mgwrazdkuavmyp    false    233    219    3939            �           2606    10854799 8   core_equipe core_equipe_user_id_a0d90f89_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_equipe
    ADD CONSTRAINT core_equipe_user_id_a0d90f89_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 b   ALTER TABLE ONLY public.core_equipe DROP CONSTRAINT core_equipe_user_id_a0d90f89_fk_auth_user_id;
       public          mgwrazdkuavmyp    false    3922    213    233            �           2606    10854849 L   core_metacotacidade core_metacotacidade_cidade_id_f5ba1c0c_fk_core_cidade_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_metacotacidade
    ADD CONSTRAINT core_metacotacidade_cidade_id_f5ba1c0c_fk_core_cidade_id FOREIGN KEY (cidade_id) REFERENCES public.core_cidade(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.core_metacotacidade DROP CONSTRAINT core_metacotacidade_cidade_id_f5ba1c0c_fk_core_cidade_id;
       public          mgwrazdkuavmyp    false    231    239    3955            �           2606    10854854 P   core_metacotacidade core_metacotacidade_modelo_id_9fc9a085_fk_core_motoperfil_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_metacotacidade
    ADD CONSTRAINT core_metacotacidade_modelo_id_9fc9a085_fk_core_motoperfil_id FOREIGN KEY (modelo_id) REFERENCES public.core_motoperfil(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.core_metacotacidade DROP CONSTRAINT core_metacotacidade_modelo_id_9fc9a085_fk_core_motoperfil_id;
       public          mgwrazdkuavmyp    false    235    239    3962            �           2606    10854837 L   core_metamotocidade core_metamotocidade_cidade_id_ff14d219_fk_core_cidade_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_metamotocidade
    ADD CONSTRAINT core_metamotocidade_cidade_id_ff14d219_fk_core_cidade_id FOREIGN KEY (cidade_id) REFERENCES public.core_cidade(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.core_metamotocidade DROP CONSTRAINT core_metamotocidade_cidade_id_ff14d219_fk_core_cidade_id;
       public          mgwrazdkuavmyp    false    3955    237    231            �           2606    10854842 P   core_metamotocidade core_metamotocidade_modelo_id_965aa791_fk_core_motoperfil_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_metamotocidade
    ADD CONSTRAINT core_metamotocidade_modelo_id_965aa791_fk_core_motoperfil_id FOREIGN KEY (modelo_id) REFERENCES public.core_motoperfil(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.core_metamotocidade DROP CONSTRAINT core_metamotocidade_modelo_id_965aa791_fk_core_motoperfil_id;
       public          mgwrazdkuavmyp    false    237    3962    235            �           2606    10854916 J   core_planejadomoto core_planejadomoto_cidade_id_09f22229_fk_core_cidade_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_planejadomoto
    ADD CONSTRAINT core_planejadomoto_cidade_id_09f22229_fk_core_cidade_id FOREIGN KEY (cidade_id) REFERENCES public.core_cidade(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.core_planejadomoto DROP CONSTRAINT core_planejadomoto_cidade_id_09f22229_fk_core_cidade_id;
       public          mgwrazdkuavmyp    false    3955    249    231            �           2606    10854921 N   core_planejadomoto core_planejadomoto_modelo_id_28f380ea_fk_core_motoperfil_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_planejadomoto
    ADD CONSTRAINT core_planejadomoto_modelo_id_28f380ea_fk_core_motoperfil_id FOREIGN KEY (modelo_id) REFERENCES public.core_motoperfil(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.core_planejadomoto DROP CONSTRAINT core_planejadomoto_modelo_id_28f380ea_fk_core_motoperfil_id;
       public          mgwrazdkuavmyp    false    3962    249    235            �           2606    10854910 T   core_sazonalidadecidade core_sazonalidadecidade_cidade_id_87273f65_fk_core_cidade_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_sazonalidadecidade
    ADD CONSTRAINT core_sazonalidadecidade_cidade_id_87273f65_fk_core_cidade_id FOREIGN KEY (cidade_id) REFERENCES public.core_cidade(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.core_sazonalidadecidade DROP CONSTRAINT core_sazonalidadecidade_cidade_id_87273f65_fk_core_cidade_id;
       public          mgwrazdkuavmyp    false    231    3955    247            �           2606    10854952 L   core_sazonalidademodelo core_sazonalidademod_modelo_id_ae4a9c0e_fk_core_moto    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_sazonalidademodelo
    ADD CONSTRAINT core_sazonalidademod_modelo_id_ae4a9c0e_fk_core_moto FOREIGN KEY (modelo_id) REFERENCES public.core_motoperfil(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.core_sazonalidademodelo DROP CONSTRAINT core_sazonalidademod_modelo_id_ae4a9c0e_fk_core_moto;
       public          mgwrazdkuavmyp    false    3962    255    235            �           2606    10854671 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          mgwrazdkuavmyp    false    3904    205    223            �           2606    10854676 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          mgwrazdkuavmyp    false    213    223    3922            @   �  x���]kT1����g�3�v+X�
�QY����]��]џ�T����\�$3y^���z��^��+7�7�p�M��}9λ��x�,�Wð|=�.?�iu?�����p8���[�� �!��ϫ6��8�G��{b�qϡ�zZƩ�pC3���{��b8�Ӽ�ٝ���v����y�M�V ~�L�T����+Zg�h�M͡b�o0�]�-���_���㽀��'>��?��zy|n"��X	˧/��楛��R��z}�nӧ����U�H�?d%�*}{]��kkN�Z;k&-#F�Àjg�<;��fL��b�0l�m\����� ��Z��z���3e��+Bg�e�Z@H�XM�`g���(C]�2ب3����F�"w�U.�eI�W�ε�����u��yUk��2      B      x������ � �      6      x������ � �      8      x������ � �      4   �  x�uWˎ�0<[_�/(�G���q�~@��4E������k�!��tٵ�i&")�,��ۦ��e<m�mz|e1������U 9��o'oP8$������qH� ?����-�ew������x+*�&�����)l��,	TؽH4HШp����_�����ʭ�q�E�Rkb�!H%R *(\��X]���)J�#`�W' -��V֦0,��.�|oӼk����(��eĕ{-$� �?h]��i|���lT?=�j���U&�C:�d��H^��\�
���8�Er�GW���(	A��i��D�0,�A��������0n�����O���#!�j��i*�_�mr>��L�U9��X�	f��u���Ի��	
ѐ�`g3 !@�SzKP*��<�/�� �Û�M}��T��X�U�A-��
���u�ˤĎ���5� Bje�_P��Q*�j!���?~�/��%M�*T��]cj!ª�`����*��N"p��Jռ��\����_��A����K���#�����D<U#):�8�u�6.��WK>3�Y��Hʕ��V�"�r�ym�*bW�#�7���u9�<K<�x�tg�p�'7�bjrE!#�Ҫ]����k����8���VI�� �N:`J� )M���K�O���f�<�s���g}�'1�!ך����Xr��3����5d�`;ɖn������4Z2ss���CV�(u;�42\��$�wd�|YI�Uɐ���J'���`o��i#kF|�@��!kR|@�j k��6 �K�݇�~�Z�v�{s�>����A���C=Eb��mf���z���t�Ǣ*W�1��Uֽpޙ^g�=��MƵ�W���K;���r3�Z9ƈ۷Y��M8fz�u,�c��3���r�T�Px�)��?�����4"��6�L��|ZJ���G5 R��=��v�=d�3�L�`R�=���L��߿8��v��      :   �  x����n�V��GO��w�N��B @h���P�Jʪ(�vN�K Jr�]W}��B�~�)Qm
Ղ�Fߙ��#}L�#"�IUJ��tW�x�f�uO��BBv�F�D�������Ś0�!=FO$J�т
%
��\��`몝[^V�6`��3*�f5��o_���s�������jp��b��������m����6�F�n���~���85)d��u�>�ߞ��s��|��>c>XkŸ�� �b�r���]����m��O��-��
�����%�I���8/��Z��DA<�Q�zYt��a�%A>��a2M;T0>� 5O�m
3��`z�(HRo[b\�	h�Tk�k�j���<l��s�"�2ȼ,��>���y7V�Dcc�V����!U�0��Q4�A�0���>!�[���q�����5W}m��v_��5��-
/w�C�	�)�IU�g�ņ3���AY᪪�b�*���H��T�1;=����Xph�@�0�M���z�t�����0?+&��z� &1QsUAw� L4�a�^�s8����� ��ݲrIc)�M�)k�Tb#8�V��F�( �8�� � ć����i�'� P��X��F�Q�~��r/X�Mw���f�M�>�vH.�1�v�@f0��ZJ���0���A<#Hu̢0��D�z\ӣ��A�ot^[��Ga
�5Ӽ���ہ'����8��3E
�OB�m��{Hԛ����Q<��܇q�EA�qݝ��Jɦv���Q���OY:�� ��J3�,%j�[�`�
[5�k0	�p rv��/5��Y3�!P\ 03�o(��T%8�K��[���N��>�X��8ֽ�'d<o�l?��"�ѯ�KC���/���0��0�y�>L����n�~|{��(yS�C_��W�5���m󼼽�;�#��z�S      <      x������ � �      >      x������ � �      L   �  x�eR˒�0<�����Ǽ��xM��1����TN9�i7_ďE���l�t���j���jdOOv����zv�����a�W-�Y�|��>N8�9?��if��h��$���3�gP�1�gV\@o���YM�w#_]A�Ǝ�<+�7$��X���,��;NƊ2�+L�J��nu��������Z0U������X�I����:'�����E��݊��]�W�Ҥ��9�����`#�n�r���	'��s�
t�]�	XP��{8�Č�AI��2��h~�AL�+��N.�2%�$j�xE5�_dv2�r˶�I�f�lH s@����ϲ-H�l�����?�#�9=�RqI^>J�a�����i
��ߞ���R�i?���{I�(����
�x1�>rK�k�W�����~X�$���Un ��#���$ԧٳJ�]y¯�]�P%�^��q�W�������8�{      J      x���˒#9�%�f�-gA��������A#=I3��ޔ��̤HOwMW���nd>�~l�P�*#�=%���e��sϑ;#��Q��v/���N	�w��.�/��t��x=�^�����z}�~������q�<�_?O/���a��p�<�N������1J/�6����o�ܮ�w����z�~J�"�/��
6����N�������e������)#�����;���a��������?��o��/;��*���N�=~�]�]�����E�T�H�p�w�h����~-��������b���������y�?�����ݷ�؋r���Q,[F��}���@�=����2����wJ��;�ӑ�N:������ӗ��������{�R��
�A����k���[�~��D����U^O��Z�����;��O���ӕV+V�CpA�b��ؽ��j��9��ʝ��Ƌ�j�} z�����h�����������?�������n�k��X�p��/J��vϧ�k�<N�������z�?ݱ����L�}~����IW�`��1�K6��R�S�]�Q+Ʊ�ؐ���l�C�zu�����[��V�@8'���nt���%^p��������Z:-����z�Ѣ_�����v��קoW�����;�Z^tP�-�-�z��W{��-��=}n�D���	�/�����Ǒ�Q���trw�ǽ2������(��Bh؁���П'�-q���L��^T�|a;~?\^oǧ���-�p�ڕ�����v�_J�M��r��9���c��KOG���|(e�A�vOӛՒ�=�'�����3��}{�<�'�x������ng��{���q�|a��a9�>:ს��E�2o��Үߏ���2~_)�sC���O�	���`�K�x}��/��#]�����vx>ѭq�6�G&(�������CGW���,o���w��+r1t��7n�bu~���fh�墉x��%�_)�7Vm��z{?����5�����/�ۅ���ޱdյU�NX2|��;A>�^1NM��.�"�C��nK�G�E�]x���"3�˰\�",�6�HM�9���O|���}\�
��<߮w�4�.����o�����>aI�˕/?g�Tb�V�
���X]��R�ӆhCG)}\ޯ�#�[�3d��D8"�5:gŅq{c�&����zi讦�"϶u4t:��w�=}:<�<��p���|<ю��}�q���0�Ҷj�(FնU��1�7C	�l�_p<pr\��"��Vh<�����q6?X�����5����j۳��r<����!�z�0q��kw�ICaEq�u)*����2�4�/x�#+��&9P�N	��X��BV��_<���}'��D-��2�0r;fƮ��y��s����@P D�+M�����W�v'�@�s�%�S:�r��o|tx�L�����z� ����q��o�3ŷ��H��9V|��ձ�<^�7ڽ�?�A�U䙦 #J�����x���[ ��Sd��C��P����CD�;�� ZҟV�)��$�.�?·��i�k���8�nx�0�_���O�����+�R����'=��k�E�j2�W�Z8��N��'<��Hw��M[H.P��f(�����|���$�������#���%W���O���$��2�F����K)ʬ"mk������@�W�s�)�_�8'a�\�0x蜂���Z.5��[����~:�-�ݧ�$En�||��w�d@���k�l���2,z-�M�v��tu�NJ����`!��
��l�0���������t����_�sx�B����H����u:�B�����^��- op_;��3���[��m븷���\m�Y�����(���"�߯�W���-��؉�#�U�.)q���E�ဦX�<&�������6#��Nr,+����v��u��Bp��O��\=)b%r����J�x�ߏ��G�	�E��+���>��(#��H�0 /N���38ʴ9+9J<ْK��}O���+��)�N�JimҊ��r>|��F;qH�C}P�rm���em(�Q�]Cs!�M�ȉ��>�A4t�� �I�t�s(����&
�)���z;�s�a#Q>c��ë�l�Zʰ���� W��W�I(m&Cf��,�rQ�����AL@-�2��/腇i�ק�+m���c��U�Xo��R�_(
0>V@ ���'A!?�pʑvQ#Y���}�%��=+$t�i��sm��@�v
y���A-ŊS�\�P�X�����ӏӅ��gU�x���?�4��t��
"
/�2N�FPZR�a�(��M��h� A���2�K+��]�?֐���uM'I#�)צmZ���6��[�㉏N�]�5�N M����@�~��<�@6�p�Ku�w��4e*�����h�p��m���:ZZ:�T�����f��/-#�r��z>ܞɆ,'ڊ.�����l\[�-�)��K���󠚓i��hO�b�,��ȳ��}��3_=�]
@���t|���#�j��;�?N�Wj�xܗl���,�5�
&�
��ǿ}"/=���:y3S�$`;h�t�M�B�Ɗ �f"yDJ,��OQ�����#�b����h�i�z=A��T��3�z �:T$��������~���tn�2�S@J���/P@�E}"J��?�l�����xZ��Q�P�2�B(d��)�[��P���^��z,���2��o���'�|YQ�RT�wC�_���J�Gsk��O��D��V�wm��������q��+��[Yb�.�f��B��������F���)�H��?���(̗S�HL'�9�BE���atL7�{Q�)�D�X[@M��<ܪ
l�(#��w-�|�^��,<�Ǚ��]���t&{W9���@^cɥ�������-�8$�8!�QR�(!����;���q���F�Zo/h�S��-ظY	�6�����W~���ѫ1Rr��7�.S<Dn@��4��i�4@{��]���(��M@�\?�Δ+=S>���Zp�)N���c�伵�%�c�}�?o��$kb:��HѢA�6ЙB)�G����f�C�؇�>�Maއ��t|z9P�����Oڹ�k���Ӻ����dfn���)m�.П�v	*�%�Xk5N,���{ ���n�Om7g���)$E��\��U�1�:���-�MEF�/�C���GWҰm�m>IiLB]k����a��"��;�߮��tfA���O�T�lU��]���X`��9�7F����q5�)4�@APQ\�/ޮ� �iB-��|8Q(4�/'�0�P,��n�	»ٱ7f��n֨�Ӝ����4N=w�H���Esi/4�W4c��7j���8�n%	�?�ZB��QB�++R�吏�؈�qa��؇��#�����"~W��i�r��4�b�EE6rl��j��|qL��%�������u���<�+�� ����uUV�i�dҢѹC�X!}�#�f���.�j��|���C+)��F?(5�����Qm�OG��������{aF�ҰtCK���0�P�_�l�6+t�,��g60�KD^����L.=�F�B2>��lt���|Qc�}3M>�Oǟ��������y���@���K��XV.!R��.^_��7���q���p��o�u����8��%dP�v��>&��ЇB�Wd��[�� O���Uu1�����9S�D�l����d��O^�|p��Y

5z�����F�1�y�*!�4�! ����P�7��H��B�黣:Đ/:�(�*����C��ӔW��ʨí���&�r:��Վ���_�E��v����.�Cq��/˻������yP1d��
v�0m	�t��X P2��P�MM�7:��ٰS*o�j�8 ;o���'�U�/��/��9���2^�d�C&��F7�8&d�v�� }4�8���k;�Q��D��i���������̀?�&�_^�ZOZ�z2���HZ�Ty_��Q}e��X��U�e��+武�0,���`    Jl��<����*A���0��"��YmR˘.�&����-ڎŠw�d.龛*��bo��
���)u�ŕ\^Y6����S�C�;j`k�0��FQ|��tQt*��%\$��!���\����
�����*.j�ڃCY�I������nJ����3?̳*5˪�FI���Ӌn1��_������J��`L�	�1|YB�ܬޮ"��	*�u�h�Z��I_r�YD���x���5�A�0��q(6כ�$ߎ7F�_���8����^(Eo)�i({0U�V#5��Y�ų��� �Qb� �Z/��p�v�@���Ԯ�o��lr�`�ގ��q���O�|L4��N�PFfo�;�`Z��6r(f�G>}S��lDy�N��H[��%����kS2<X�z;�0�|p��{�Rѩ6����O�mUt�XK�b&�����/����L1�0�� NjYVޒ+���S��¢�_OX?��WLI<>��,S�~�{`[��)U�0͊�]�����HV�׈_Z�q����׬6+��3h��u�!n�WƗ-��b���.�.\����/�5��Z9� 5�������g�����Fl�U�dk���N_N���PUV�{W;�
�)�(�,����F�Ԓ�����C�����m� �P���AK��12X�5���'>	�u�?E~�P�ܧ@�F[�F��5�Ta��gփ�WS��Evo�<��p˖;J=	}=ܮp�i�C�0-�q�b��`5b�*r��(���\� �b
 ;�h�h,�+�`Y{O�.�{���ظ�6^�k�2z��0�_��
s��$��Ila|�+e���(Ľ�&d�)Ӥ����h-:�ݯ��T�����39�j��å�-�_Ӌ���!�DMGޠ�UJ	(���ŕ�݀2���R��zp!��ȶ�`)a�F�\QZ�v�҅,�z|���З,���NYяS>��GMK��?��o�B}ʛw���zG��#��P�쁱� �Z�C3�=��	b���]���j�8�f`m�j���)�`C���Ⲫv�rB��B⃐�W[�,�#�f�]��=�����6���i��Hl>��C3�;�:��q������=��
�?���hz�������6
�9�Ӑr�tn*WG�ֶVН@w�?��~|:���=���o��T���O2���s~��P�����O�r��̇�{���udK��^����:qrmtC���Ů���GL���vx��q�Y3Y+����~G�^i���v�!U)�-���xF�h�0S�PK���49��Nt+�K�ӽ��6�a/Cz;�����~d�� ݠ�����u�@��%H�4�C�&& �>Xn�YKg%Ի�1I�I��&����_Z����Ц� s�CBv�z�X`� ���S�^���&2�ވ�F��
&=�(��zrx�F��Z�`�D(
���x�HW��l�TN�N~�g&����a���z�q����̼i�A�rM�|/ �I��
�M��0h���%��u(�v<\�I������։�����l:�I w�̼��N���PI�9Ԏ2-5y�c��Ϊ��,,�xa����|��t�cO��DA�3�+-&���+�!T�X���v�)��8�5"���)���-�6��=��[�]��A�u_;r�!�~��\i�J���E����(�������F�����H�C���:�2L
�f<
�K���ۈ��%7��pe�6���t�P�}B�ہ�E�d �t?U�Z�����WOTqA&�i�m�w��XB���������1Q�9-4��>.�sˎ�����~�\��ο>�d�N�x�i��S�-z��JET���0��Dןp��p�:b�U����th����J��h�S|,:YQ7B�F�F����fl�J9@)o'T��t%My��Rϧ9��8,F�����3FkN}vJ�clK��Rt�� �X�G���h���
��ErU�la�F�2�ٽ�툴�9[��,G(��J�r�rs3�7���xs�'k��T���9~2��*p,!��u� ��OK_�[ yO���U��I 0k�U��XUÛO�� tyLr��.Q
���DȤ)~�2*�X`��ϻ���!�A��c���W̹J�v�f�ŀ�-�͜�L�v\?�c�q$?�W�n�5��v��H��I������v^�ai�5����f��M~��K�ц�造��4b��Gs=�vZI
��R��vm���Y�	Z�KJr�H��r:�;��(UN>{���kh�~�3h5�	����IOִ�'#�%/|؁�'��ʩ̔0&��)\�<���=���*����^�/��e� �a���s�pxΒ���+�mM��Wo�͒������#�Ϣ�6�gK�0�R���'/j�6X��.6��@W�(a6�O!%��Zy����x ��&2��:�@�}X<�Ce{�g��Fޟ���O�r���S�c+��T�ʉ��.�kg�,РM�@����&�-���?�8|`T��~�h�x��?߀�3�q�j�w�+(�ڋ�b.9��K^b���&_��)q�5��%U�)��F��H�Pb��*fǡ��=��\9�A[F�i��j{fɛ���Kc�d�t�$o�CE���d�=�4�lgv����F��aꫬa��<��M$�?xP���3���m�Qs��� �*GN\aaV�e�j�a����VL�R�r4�k��������6��5�3]����2��`(%��g�[?!I	�rc�����D��p�g���T�* T�T �m�ޚ{c-���ފ��6�%�e����M�Cf��bD�'g\eJVtF�{j��s���/tݎvR�O�X+%��T]�����a��V8�	]?p>���p=�%zeӋ��9D~�lk_���Ō�A�s��a� FS���8�j��wZ�-��R��"���9�K�Qa��B)E=�bOuS-dE��+�e"�Н�L���ʹ(@R�P׶l̤��L���7�����o���0oS��A���K_?Qˌ&_����R���F�&AK	64R�ߥ���z�\r5Ph\�K�_�0�:X��aaV	��R)e��c���������0���ީ�]��l�6�� �L\b�;�?�a$��:�&#2�� �z&�"X����GQ��t .( 3}�wz�����y�Kya'"�孚�Ł�j��bsy�A�Ǵ_N3���ǐn�%Hٰ�c��R�������|�Q�%����O���|z����8�(��V�axh;�h��ћy�'JR�g�����h!�)hFPr��s�k�^A������n�����jIDj�
|��T����h��f��Qˮٚ�FIu��kp1�0�Pr'x�Nib�i�e�	�|L�N��3r@I1@����ݎY�����z ����:�h�O��c��?��$t��d%��N�(���ۗ':O_�W�� ��m"Y��X�P&`���d�K�i)�q3J�k�d���ێ��$G��
�p(	�CqU��`W���Z�z,n�[�f�;s��&��^�}�f]�6"��{��V��Lv ߉Dh��%�v���ѡ�1e{IG^)�J�q\b6b�Ahg�`�VJ��`V��(Ht��3��0��hঁ��<�LZ}n�R��*8�{\�21L-�hV�!�|��k0,y���������&�d��L�(��`��M3�< F�Aн�fV��K쬎~�b�#�G]�j��x��h��c���*������1�?ֈ�c�
?ӧ�c'
 ���M�L�*|���K�D���N��|�W���#� 
�7��:6U�]$�Q1���i���Qm� L���،QP8m�B�b�"��1F��\ȅ�5v�V��YGi��mj�y�7M��9��+h ����m�*��<����Z_/��A�9p�? ���N|wך��V���Qt��T+���u�-fw���!��Y�5!	�<������x~    �*�|QS��'^)�x����h����8L�&^5��E<��E��
t1Uj2Z�tuL��Ù�>
�ȠS)�*����cl�g�#hZ3P�q���U�F���1v�$���t�P^�2`��h+���U���=X�(������L�ӗ�ϛ]��Lm��%�.����։����Y�̀(�d����đ����ˌ�j=8��Aq��u���"e�M|leOS��m+čQ���c:�L3��쉻
pt���jݖ=0��w=cD�̰B̵2rD\9-�W�]:0#%�r��\�Fm�׈�n=-@�Ox�.�8�e>����#������'��4�j�@���H�� V[�~S����c�)� ����pB`����ʗ죄�cw�����(ͱ�:��L ��&�C���J�05����F��
d�Ug�>���,�tʽ9r��9[9)tc%��3�]�$͔�ɣL��������[O��]W�74#��׽���q�*�O�}b�9�%�j4q\��� +b��p4�7h��]��̃	��/���D(��%��:)>*S�TT��|h���8�-�5r-B��A	��� x(zr{��j���Dǖ�ր�"}?��^N��<m{�ۡE06�1�UM5��M0�j��6Qj���M�j�����mhA���T���XM\�����{
(�x9l�`�(I�����!m��̆4*DÕ���yё�&���3��̛�m�͇$����uE��z��(����r���'�g�)'�_r�+>�z�t}�_9�1��	F��N����,tϢ� ��Bp�B*�,Dp��u\nP�1��vag�@��n�����B~�y�&�+��1��r����^�k1�ʑ�Y4���o��������N�2���Y�WC���N44��-��Lj�T���7�͇��[O_������������[����.�m,t��ڳAh�fB�G0�,���k�Y�^de��d��\����������?v��c��&��Z,#�ˢ�qFy�Y�F �j`<?4�oI�@s�����a�?p��M����a�����}��ԔcL����m�j�
e��Y�g�6<�`�N	�$����Ni´��-7�t[�鞆��@�����CO��欣��3�8ǻ�_ܺb6Ra�XԬ3$)�kK���LCzv�\�i����(�Y����r��ެ%�=1$X�T~���+?A�.�O4��iP2	F�$��m���dQ�˃w��Ez�` DP&XݭW����y�y�e���w�X�������\0�}U8�a�+5J��S;���yy�ԭy=��U)�.<�oc�N1ECU�Dfj&`���@����f�'�tG��FkDL-��uuآO�_���2z� ���'e(>O[�z���!�4�5�d�*$�/�d"w�+�A<��s��Vֺј�������%n�"�u"��^�.�MV�n��/�]��\ٖ�1�ٖݥژ�\�u��-��@ <��(<\Z!���4��8:�vd�&�G�D1���*�v=�M><fN��F��v��m���R�s��:+�����(JޜIh���z �UA,��G�ũih��`�"��<��T��Ď�R�0��-��|�:w���o5mY� �4���8KvFu)�?�)�"�RYP$4���>3�,T�rU^-{�K�M�͸��y�� (
xdŐ�-����@	ώQ\%�ݺ�/C4�R�*�c[�5���=�+*$9
V�Q�Ml���vD�5�):=,O98���c5�&{Ѵ�A�1P�jg���̈H�*`_Bo�r>�j�s������_r����}��k�mU�`l�%�3ҤW�'�t��G�
a+�J��	i"�a��,A�F�/܂{S<K��i��Z�Z��"�T��\��W��4��9<�:j�JJU����,PT"����g�r=7�6����9������x���Je�s�&�Y^��+Y��"u�N�O�'��v����CE���f� �:����I�ޑ��.\2#�����c���B2�x�����&�r�Q'�#��?-gȣphR�j�g�J�u��$F��z+Z=���џ��������� V~�^��;���tE�r�I�G�+�� 4�¦-�CG���m��i!Tf-(�]����p���t�m�R?^N�!K�>t8^)�%Q����Ky���@&�n���LD{]@7
�3�25�^7j47:����d�'�P�t����r:>��u%�i�c�^F�~/�)I��">P��d�[	��07����
+���Oْ��� ���Đ9F����#i�f�I����B���C�9N�]4sn��T��A�`Ąv�����MEN��`@/����0:��ZS
�^nN?:���}~b�� �x�j�J�U���|�7����fT���N�ΔOw������y�8���'3�v p��;?�QaF)�Iz����kDxAM�<*4	R�4��r�w�3=Y����P�md�2�I�����B�*�o��_A�D�q���f��b
�{z���
�� �X �i�7��r�4DVx�Ɍ����L�I�C�,l�^ Oh� �"�ԃ?���{�^����t.%���$�>d�V(����F�jQ�G�`D����b���d�#�Ì1���UN��hA\o��&s-*���v9�"�
�y��莄zC�6V0Ö́�3�I�(u
��D�p�F��`���9UK�g6[�<=6���vf���;R��sV�-��U̚�8�UY�m�b�a0��Rt�`\��K��sgs�p?�}���^�H�t�~���c^۰�̢	۽s������R�)b�AC��%��-���w���fm�{r���?�	e41H��ol�8_��Y���9N�t��!HR:��0���̣��k�"Q�4�Y��p� ���z�EI��%b]S�u^6]�e�1NG�v�S�O!Y&���_
��@	�2�����n!��zc>���~*�:�*k°$�P5���f������Q��[��4CDȗa���W9���):�E��}�Y
�x�UJ�ү�f�������������ZfzJ_��CU4��[�Bm���ۨ��XC���)E��;1#�����?uz�Fm��z	6�<����fG}ڭ)n��������:�?�@0܅':x��~B���8#�P�	�޲}�H���kD��Rň��Q���r6G�fLh���_:��tE���z��|c�)�E,\�j=��d�$�:1�Xn�E� B�Ȯ����K��-��a�&�8�A<�c���O/P�Vhu��J��X�@\���~�>�_w������~�C��&Z#k�����7Y��q(��:O��[1RZ�w�����Ǘk�	��h$���M��:��D�!����kФIα]@��)�D��N��h�����P��予]j"ONb�>��"��?N�ۆ"2�~P^!xkt�?t����
*��Q����� ���F�� ��إ����. 2��@J���y��+�j+�}vo�qf�!�����0���Y
�%a��j����k���(�9��'n�>��V3��D:C�oA�S�j4q�qF��5���������@Hi���4��
��؍X�eWw����q���޸�3M�<+H�@����C���x��R'��ˁV�����ҟVRq�4x��t�Q��(|�!���?�8?�<~;�?��.�;�$1����T��<��d�w*�<����A�G���4�p-��, �,Da/ԇMD1��x��~��Muz�)<��A7J�l�Ǡ{�\�>�T��p�u�����U3��A��zPt��.�S��0���|ڐF��Aq��$����X�x�� ����@�5�	F1�d����CD+�F��q���J�fC�WF���B2F�
,kG�c0���_cv&�����Qn��G�V�{Q����c���C�3@��' Z�	��`
���SMo�a����c �aɷ����%Cô    VY�� ��l��Mۣ���lI�ٰ2�b�k3�v���(�>�ϛ���j*�.]qz)���l���U��dV�V�h(bi����C�:�I"Q�����(��\�{��>/9�113��7d�&	E�����g%=ef���C��`[F2�Q���jO��
�"���Cڂ�o�ё��-�>��+�:�Q9o���i�6D6Lj�R�V��� �md�'�՜O�j���?h*�;}�$�#�������V�?%��L�Z/|i��w=zC6�\�K�/����l��^H_�h���t�N�!��v-��7o�]k %>g�&K�<�=S��W`�h�ı(�jx�,!�1�
�n#4#�j�C�r�>}=�=�O�ï��Z�4�FY]�z^�����v龷���0��B#����A�ij�מ�w`�F�*0�?�۷N:%���a��ʂp�@��S���e.Z�gP���T%�����"�~�l>�@Ք�δ����L�5���n��~C�%R�f'�V�d�(fk `��y�<d�[�U���������c��SE�'cCQ[2�f�	o�3F�/�Dx�Qt�� w����V�6q��������q�I��d��`F=�V0���j�<��c�Lp��/���b0;�J�2���R"�0��N�3.$�(Z�yd��|*�
�!4�]�|6XMV��&�=>_oE�	�#a��QO�N��p�\B>8$��@9��C����ț�юN@+��"hGA��l����Qw���s>"i\(�BAk���� 2�D��CǮÿ�@����3����gZt<��3{�-��#���%�Fޯ�[�]GA��~��bf'��g�'t��N��;s5�:Xy�jy�m��oM_����
��%���xt�*W�����G1J�o,�$�����������ۗ1�����/��H�c����r�c�i��}N_@|b&����@�K��a0s'�A����������a��.�2��>��up͉����Ѣ��a�:�u�P�O�ˀ��!��?�7� Q��@��	d�G��a�+"�t�̓�x;��
J���M�~jjt�����_j�`��۽i�<��Q����z������0���ޠ7B�M�Dvd$@O��D��; -">��a�Ih
���T�\ʀ)=�r���Cͽ��4�pL����@���V��ri���%�2�w�+��gba/�prVƅ0�[@��5��kv�Ʊ����qaz"����OĝyN�;%��Ӽ�TP�ݐ0;�y��+�2|" �ܶ�_ϧk���"�X���H�~*x�⪒�5�c��yS���ߕ����V�08Z)?Զ�=��zl��
�|$Z�6��bf��(d�X8�͑j�rJ)��3�S�dtD�,�t�۔~k�bL���H"m��IJ5���])���D6$��(a)�W�q���������z(��k�g���@J�Q��)G�cN��R[؍��!����5;��X6��lTQ%Mpz&�p|t�2�n���ؒ�)�
2b�gG�@F�J�ЎP�-�P���|�V�X%��S��Se0��b��5�5ʠ��۠B�,J33A�P3�g�[��)'��6�ӤԈ^#}�&�J��)m)z�C��;���C|9��N>W�UM"6k��WE�O�#9?
�A㠉�4�Q>x���x��m;Zh2�B��G�iײb���y1xn�sζzꌈ i��P	�G,�i݁���B9(
�_�Y2������zz)7�v��\�8eJ�4�ZJS@��d���Yq?Ǚ��7�i �8�T.Yct ( �R{� �� ���ă?�L��ʢ��f��0��Zn�y��;��wͧі�����S)��4�@G��h��x`��
T��.�Ҍ�랈��8� ���l��(}��QAS�q����Z��v)<�m ��2������S�, C�聜��tF9!�QF=v���O&@�af��(�j��xbA���u�qAt!�K�<�k�q1-�t¹��%��0L�Xo��t�*��֚�d:��[I�~��V #j�������Ao�{h�"����0�%� �"������z�U �C��U�2����Q�t�LΘ��pR�:N[
�9.�S�r�%�n�+�8t���r��2�f�����q��jJH��?{Bz!UF@�N�6��B/��А�g������܅�V� FƽMA�����,��,yۄU�}��2��>����`f����$�F���L7�Th\��Ly]��Z,����mY�(+0&*V�e��0��E;�Ŷ����\�L���[/��W"�t>�\��5��,�)rvD��B�x��(>V�����&�p��<�Q*�𡶢6����j`X��Z$(wZo;�X�E�zg\?��\�C�E�8�_Y;�	��� �h!����/��'x��D;�5���<0�9md���!��n9�2"�´p�K�'	x���I�<(�F+yP��
�J���,�'?PZ��l��˗�9Q���)Fj�Ě�Xy(shK!�O-;�Cu�0�8F��ad;��2
�d)~�keq+ |HB�pe����r�7���(�"`���k����P9�Z%���X8��D!|A�53�s!tZ(q�:�C΃7�Si�G�ȌJ��ĥ��$��)�`�V��.��`/��N�a$�c��|0L_;��T9&̃�_�$��ٜ��q(?����۵W�ق_4����!�m}��Us�A�u!�sV/g��d$�@�͐Ԣ��J,�����k�i\�B�ω�����|�fg�t�����~���_��JWunn�6����Ff���P.+�'v�\�5�R�B�`�KB�sE �XJ&\���*8�]��]X�s�<��|cy��2���$!"Y��!���_z��+���E�X�!w�]�u����8�L�].�,9�˽ǿ�\���f�Ve��N��a�B[��Y��E~�P�d�2��Z7b>.�'�f�>/�|-���@#7��ݪ�!I����T�N��2d���`���Nu��D�}ށ�ڠ��(/��e<�q(n��E�֗�o1K�˫f^������
bVm��X�d`��5_�.0����Wu��2�9�6.���1
�i�b�\��8WP��Xo��py��� &��kx���[�6Lq�;�7ۛ�@��JWLT!�D5l����|3��^�_��c̪51�U>^^�D�;`����e o91�shQJc����*�y��~3; V�`��2?�����h���}�k�� �*jc�d&��������;DN�~��7k��	�9m3�� R�#I�B�@��c�$�M�\��t�=��/�72_&��v �M/�hm������y��P�!�S{-�2f��Om.#Dx �|z��Q�a�I��R(��8�ۿ������<N@a0x���7J����,�6��$���;T���.+�x�w�A#�@�ވꐥ��z�v�́\
�l�tk����p��t�#�^��B�6@�n乬��S���(��>�K�c�8WWG���g���`@n�ƴZ\����q�Q�B��S��&c���j��AXc���]���^T��`��FpaF)��*m��1,~{�d@Cd�T7��x>�R�|]���u��j�����!I z��3z��#�)��):�s=E
����`6�����Ø|�D�Hb^���P�J)xw~�D�=�>�;��G�#�(T���ؒ5I��/ʉ8(�=Ɨy���<��tm��|��5����c�^�e2�΅�T)���*�q���}�Eݬ��b�݇+��'���W{����N�"N�
p�� �s���!��`�E��P���Bc��@cԖ��y\����r`%h�	���\{�U��f��"&b�=�d��z��}(����P|W�s�(7{�2̻"��;1����1�/���B� A^+3x�9V�I�    >�є`
�L�A���MΗ�l��A�F����bZ>�/8K�f,�.'���jȂ¾Y��(�9�N�<���BC���:��7��6�(ޖC7\��ޯ|5��S�F#7^IA�D��~tE���K�`\�I��f����b�� �Ĳ ��@F�B�I�;x�
z�\&S�U�Ax`�?
�(&0o�m�y��:;���J��u{��`����S_H	�#e�f�J�U~=�� -��Q�2 $�]��8��TxT��nV!�1���#e�|
���c�"z���C�J>�a�f9&�7b7��Ο?�ф|�`������K�"è�N�9B6�		4��k����DlZ=���6��c�շ5a��	�(���c1��ա�J�%�~�Փ��D�rJR��2�(����C�7�'j�V���J`���0qKII���;B��9BF��R^he���y_xzb:�1�h�c>�r�lʫ(�A��i3��ʴr'��4��=@q>��@I'`Ck����+H�T.FA�p�֡[�:pMe��Дؔ��� vJ�U�����qU�� ���Pv�5.��UX�a�i��84��,��N��B����������zbL���Z��� %^��
]:������VpG��[RlFQ�D65WP��H6L�->H�1}�k�<F5�;Õ�(Mb���fLA�`Mø����1�����+�����5� F����ά��.8Ȧފ�ce.0�)0Eģ�BZ�Y���*o((6���Rz�Kls0t�n.����+�O��<��i���V5Z,��8�<@#��eh�FF�?$ώ��Q�Uـ��a��s�`KQ��b�8݂���4�h�ꊹK/+�	p���f��ؠIw�(,w�adIH-Q�}�1��(��t"�C�p�\�cC�����3b��Ar����b)�tgϹ��@3�T���,�BD���bT��_��C������Dp��jQdì�\� �>����tI����lC��!�&];��g�{�jQK�3�J���^���AUӂ��K��{ݴ�o`��獡����@0 ѯ�P���ڦ��낡3��a�Xւ#h�vY:qS�$ڭ�E�1���/O�����5Er�ʀo�h�Au{�����������#�H�xEg��!^�%���fh(E�ҥ8� ��CX�Ļq/+���A�+�(�1�ŝ":�s0(!J*�	hE�Q�2��)�� �K�6����G"�=�8�ʋ��;�aSN�%�I9��	N�7J�6�ݶ��)3|�+�ŵ) �����dd5q�,���#��F�/��/�
HyP8@~�B2nˏ�9��J�W��W9�o�/��"��u
#2�<Hd'P��u���E̛T�qIۄ#��c�Ѝ
m�!�0�!_{��7#�c�B��.�hof�i���p7#��D�x�-��<ˈ� ������N>*E�]����,��!�ĉ�z�C)t�D&/@�9�qLJ��z��������Z�r�\E�L�C
�nCKʦ�t�\(XT�]�����U�����N��%�y����O0j��5r+��,/+tx��'`���G�5JJV��cj�
+�#�Z�,�<��,ݎёD�o+f3 e�iNW�dꄿ`��&����V(����z��E���4��@#1�CC@Cg�`�DH�rj|�>D�ǉPg`�<~Th���b�<��E�<������P,la7FN$
t����t��cNG}�CԔ��z�B�꫉��	�\#�bV���#
<]Rt`EUq�LF��DdJBeVZ��-�����>%����y@a��D%�UX@���C�!�W�^�Q�^x�{f@�At��2	��L`����#v�:𦌥q�����Vw�6 �����|�K�..?E��C��??"�P����9"�r���xEx�d:�h$����P�&�$�����͜�M�ʪ���y�7 a�[II�5T+zFؖCE�IV�e��yA��x9��vK$D�	�(X�p�����u9��2��I6���X$���"�N�)hl0�F�;pB�w
��ȝZS(�u���{���ӵ����b����&y�f��D�H����KU�'�!��i��~Ct��bkބ�xt�qE�3 �U�Yb6C��i�N��L�{�������9���0�U�㠒6�y��e=�'�H��n !ӝŘ�����:O�B3�zq:AQ� �(Α�Qp?+��&'�ʒ(�q�FeI�~m��ZEtYL��espˁ2'2ye��u�� w� �h��I��I>�r��2i�vm(��y#�*������))��z ���p_Fpнf)��e��@��J���x _]��X�4��G�^#�����v�hiG�в9�-L||�l$K��Ga
tv��U059p0r^�<�ڇ/�a���KV�&Sq�1��a�gg+}�U��ZL��ʥ�e�,�� �C7�J\E�^�^�wͬ]�(�R��&"L=@�e���A�9a���) �jQ����.uqpV�L>X�}��Rh)�֓��g�CZ�|����F0���$~��L����.��������=���>2d����xJ����h���i��qm��yY ��11�&�Ўc��8�]�s���l��F/��aL)�dǟ�ԦP;�
�ꃫdSŁ��LQC�i��0�h���߽C���F�C��GrSC:�=Z� ��ƪ�b��0���s�@�G̒�S��@6�!1�$�i�:Y�
�)D�,������.	b��aN,�܎v�d_��vH��@*Չgrz��w��ۑZA�f�ߢ|K룀�@�<N��"����V
6�`ԕ:��^I�])�F�=Ny�U	���o���v�̼�:�fo��&<����<�t��8��tG�a86��i^Bd4��Q���g�Ո|/�?2	�Yȅ��'����}��D�Y'����j�`�|�G����sA�TS���0/���Q��̋*�Aiz0v�2P�Z$8V�;ށ�H�Q�!��<&�Km&X�����IU�w3BD�Vdu��l������2?�m�j�L+x�f�lN|~>����dv�8!�0�|x�0n��Ó�'؆ �R�E��,����n�b��@&�%���1?�h�mTtC�����J���E�"�O���k�`A��Әr(@N\�H�4d���ߛN|�.VsQ^Ӟ`�"��]�ı[R%�=�P8��[��Vn)���䦈�����s�9��&F	f��|�Q���G֗��b��C���M����C�w�J���-�o}����-~L�Z�ı�鼚�}M��kȓ��,J��tp���bC���HKAjG@}�� j/BDhVlpKp�8NHl��(���{⊻怔��(���#�C$���Y��@����(Q��L���b�E�@W�,Rp�$]�8!߆����4���cƁ/�L�7�7�T��tW*�HU�`��e�2^4z��@�A��Av2�Cc'��zHC�F-7����Nv�s�K$���`2Tq�'U�ET,����:�n:/�D#��;23y�]*�}HQYz�`�ɪ�jK�&�|z[C#���@�Psl�;3�B+1)�`�2\o~FBu�q�]"�PI)!�v(E�[��!��@���9��K���1g>�-O�7����4�9c9��q]~�jy��)��2�ϵ%	pkC9���var �,�g ��4ڱj�Q�EV�DfX'��@��k�6R̔�dܞ�y��6���)n����<c�#�PL�H�["]� ��l6��/b*���/<�?_O�(Ŏ�8��vN���Fi��I��c��sk�.GPmɆ���^�<#�xh�Ҟ�L�Z�_9!�_���.�`?�"�p9]��)���0Ap�܏/�2�����>�
-eiHXP�J�,�
$���R�A�)4�C�T�)�eA"cD�R G�Zy���^P�֫��B�1��(*Uux��6 ��<�nq<��Ѳ䳅"fh
���D�&�_��U��X�1�H3����]�8��R��k������l|�ˤzq�������r�8'Xd6V    �/>w�(�d�@��@�S	F;i�-��حjs]&0���SԨ-j�1�wa5?T�#-Y�*D�8�7��8���� ����1�iL9�ABZo�z3$����It�	�/DN�W�ha�BhR+�i���&,qK�ǵ��W�N-�LCV,�ep���PSD���:�[��g�C� (�L�\ ��Cź�Q������P=9]N,��)���bb�rNV��)	lzT.'5�\M�5����|�`"鍨�y0#�3�ᗁÑ@���q��6vw�·�WH�_���RW�_aT�ҚX��}��#ÒSU�#�F���+`���eK"p1�̽�rI�w�t�j� )"K�RНB��t>~^��Y�ֽ^�x���0�̺v�z�e0Xk/�yԢ�k���c�v�CڦA��L�h!�{���6���@Rߜ��?�s�0"[�Y�(MK�v%��n�E��AfE�֨�`#B��0�[��+Rh���ۜcm	�d���v_�p�4fB��Pb��E�;)�p�֤�U��i����ʄG�G�Hh�� ��z��u?j�o���i?��I �}�N(2W��	���� *��F�����5h.)"dd?$�E-~�|I���aբ���כD�Xu�˧������J��N�vO�
��J����)R��'���L�����䤃C�q3���jQ�ƮX�ܢ���������G�:/�v}�E�p�2P�HY�'���j���C̂�C�A~-���ѫAK�M���PnpK��0"*�w��ޱ�y��K��ӑSQN!׬� qV��<;i��O�\rB��5�=�� �&����"�8�Ȋ���|��j|.�n긽~;��3������{ږa�Se�`�@WU��-K�ǀ�2f����T��!�����&��IY^��عU��_���ty� ����3}�%�jց���f+gf@@^��qM<�������u�Cݘr͈��L\Q���x��r���]�C�W��z7U�EG�4�5Ԝ ��B3�|��+Y�&��ʰ�+�]ښjQݬ�
\���;�_��^�W�zS����p"��Kep{.�"_�4[�%^=|�����&���p��B�|�yU�9��ڴf)6���9����Գ���q�1��UI��]��Ĳ�2��ml����臾`�l
��#z�����ZK��il�� �	�����Ĉ�`c�L
4	��	0�׿ҩ~4�ͻ��������$l�s	V���ȡ���S/
�����p �C_7}�k�HM�5|u��'�˓!ȀO.���$���YO�{ ��F,���R��xj^g�ս���K�g��J��Q��5Ǌ̖!h��^����&;�L!g��Y5��){F�������f�6��"�R�C�����5���r�� I#�a�,A�8oaw{�:��* �ۅ�Ƞ%�ʢ���w=ω*kSp�z�W��$��u��&��CUU�H�&5�wI�
��yÙԃF�����~{��l����V��~L���������h��s5hΫca�J��3���.INl^��R@�n�YD?\��|�Iw�u�(fY�j�4�7��\)�ivGq��=k<��!��`�әIri��HH�5O�~�o)]��{Yc��N��Eª/M���H�����5ҷe�L����Y~�"$�Й�9x���Ӌ*7S?z����A�B���x_�5!Yc�P:�\aU/�D��:��.t�ZVC��(|��(�OV�iD[/�[�7q�^?����K�~� <[xoE�SxM��V�4Z����*��� ���!����-���R���p#�ZԡKl����e�܇Z��O�H%��J65va;QC�]$�	0��<��@?�zF���y��+FS}�`�gzӅ��E�s�o
�E��#9 �7�(A����B��j/=��^��T����_V����&m�I5�{�ݟ�&���b�e�R���~��0��z�s
�p��M��2����S��~е�B������N�HUћHS��g�l ��%l�0�-�r�m�	����O�M�aX���Y;�Vi��ş��+wڦ�d�s���[t�+;�B�U��I�"c�f�&�M�g׉�D�D��X4S�1������[�;��D<�6h��X���6���>m
fHL�)s4 6�.��͎���>x��~nzk`��3_)�B��e<���a<�U�����>:I����,h�:��X�>�2�f<�k�p��Y�=.�S��h�۷�0�asD����ߺe�]R�?#������IùC|��`��\���LP(����j-��ؙnב���Iܸ?��$���2J�׾r�\��|=�'�<�#$���#�.;t �ՀPM!Ϟv/�K$p�C�`6>�In���F��5���G��D�?Ȇts	�1����Z2�s�����V�>.w��X(9i�ZE�����q)������2�Q�y7�k�d�����Jݍ����kL�ˎQ��¡��$�}`�4%��1�G9=�9Zۈ ��AD϶X���W��ԇIS�/_d�Oo�Oȧ�~A[`����꣪g�jAs�C�#�=A(�4 Q�x(
��j
D�����r5������wx��O�Tn:�?cI-lcQ�[�Kh�5D`�Y����P���z�F=���?�p�2�p�P�Y��F��M��K��|�+}�\�q[2�(:3)r��11��n��Б�czȒ�KBC"�C�8l���-5�������������o� @��ޱ�7���Ċ�tX�v���0%b-+�'A-�*���I�l�U�Zp0@@���b
�R�G����-9I��;c�ˆ̌oJ��UAy���v�0�Ĝ�#���{�Hc�\w�"�AƖ��|�rb��|TJ��ɩ�����&��45�p�b4R��u)�ءۅJ�b%����D_���A����j���S^Zމ�R�<�� Z��2�#tSS�t
��u�BR9��!�(g�PO<`�e@���T`���#ҳ ��N� ��8H�;=��x9||N�d��PՓ��^:�n��G�E��<����K�ߑ�8�>����@ʃ���=��/�Ǩ�D����Hh� Y��ƨ�Z�D�����	���Ĉ�D	:kC���&�2} p��)�D�&�����)���5��.˂�CWᯤ�=6-3����su�57��8Q�����h�꺪D�"���ML�����_��=�m�ίg����2	����K2���PTl��l�uV�:+/T����M$�%�D�Ջ�9�A�A@���^��4�$in��V�d�Y��/��)uu�i\���O�C�IFBa�9#X�`��,�%Bn`�%�W	Í�_�4����(�q3а�"w	���R�æ�	I=E��q�S�w��]�6���b�щ����󨄐
!e5}�dT3���zQB]��_m+�����<����b�I���~,WN� v*4� �]�2�=Փ�0e6��^�Jp>.�q4cVaaY,M�V,-gFb�m��L��/�6 ���o�kw��;��TDUp������4��X�J�/�B��zK�����_2�V�z���q03
7��eLN*���N��Aޣ�0,(I��lky!f�Th�92���(�D%0l��x(j" (k�(��pN�� ����;-�rz9�%oh��nL���|���TM��L����R��ۖc����O� �x�䇊�*zYBЃf} �ҋ":�WXm��2e#\}^1-�>颷:Q� e�C��Uy��I"��"�Ģш	d
�ӳhN&7��Cl��/���/7t�:�	^H9�)Ļ�����|����>����gܢ� 5�@#ʪ�72m������֗|e��:R$����R�ԩ�dj�q$[�i��O�)ĞbPw.���Ӂ�t���޳�t�N�
m�������tfhA���)gL����JzI^��yY#	u���� �)!�(4zg    ��3t����yc�䵨�Q66*ǐ1:�
{��7�K����<�&���!P4��F2�b�m��f����*�������'Z�u��[̒%d����a�6�Hv[&���U���i�B2��r`Y�i�A<��E�-������IBh��������h�$S��j ��4	��w��Y�~T4o)��LR<{&������,H3��<�Tfe5�(��	}M��n�.�s�/oM����Ӏ�R
m��4#�^�9�{��N��k�PL���t����fwY�jILc"Mx;�:�EȭN�%Y�:d�SF��h�Z�# p��d@L�P�vRl$��Avf9h�,���mk���XT��I��+%��a�7��@��C���TW�+Mbs��.��[�c��Jv2��}d��̢���x�� ��y�6�Z0~#���f�ԁ�`�.�mT��s�@��F�u�5wt�<Eb�2�cfZ�S��y�m����!)���u��U�˱7�1���J�e�b��+2��9�
q.L/����K2+������#0s�D�eb���*�P�(;4S�dL9�<���VF� ���h�Z����̨�$+Gw�����#����8���$������pb(�dT��z�3qZ|3�@�E�/�N?�h����p���l#�H�Ī�ckp�̌&�nv i>�I�u��
*BW�EbK�0C6�����9� SG+�y�#d����M�]�0�g��'PoN�B�NuE��ʑŘ����7��}g�t�l�=×Q��?�ӵ�r��(s��T�y�+���hi���Ayqe�!�/*4g�ԇ
���?D-�&�-�X4�W�D��9Z�$�ͦ~Kg*(mq��x<R3��<���d���P$Pp�y��Ђ�KG�$�������G�x $���&�6�`�������eK7�o����cQKY&M� 䞍�sQ�jHb��lޛSF̢W���S�5�=����=�I����@v�	1��~��5<;����Vō���hg�"G��N����-����gNk��"a��Ë�&��@Y�������S�+E���O���b0''�Y ���	���8�p���:ZF�P@���R���/D<Ԙ
��Ĺ;�z�|����@C�^��=\�(�8��D�4���^�u]{���1�22��ά�v��nX?f�n4v�C���1�����J�2�n?�����o��-��ƻ�"ʝ6|rw�I��#�-�Ts&h7���SRQ�.���x�s��r`�WؾN%�9z�S+�EN��{�\B&ڸ6U�������Nڃ���s��@o��8׮N�<�	���6�p>ҙ���!�(�z!8`�G?uhZ��$�V8���)n���#�����|ڃa54[�1f��S)�)��1W�\�1y�g���"�t��xPy��� ^6�|�-��%�rF� J��]�^�&��%�K�#�3�FsdX��F1sjj�I�84��P&?O��n���ޅ��ݫ"���\>j��m.yȆ�L
���]����.t��R������>X�X��B�5��r'�����H���D9��(o�igԇ؃�[I�.�q�n���� �:���,u�z�st]�HY�I:�5�|��L]��s�vƗ����@4)���Z7i�TC��	}�P�ĩ�ali�WZ�����:�y&'� ����i�D�)�$�3���<"+��fh0<�gh'�@����n����K��vA4U�ݦ�c��lD��������*=���v2����Cͧ��7��ܝ��N�)W�fa���?>N� #�:���@'&a)��Y�Q1�s ���Zu���B����ѷ�L�,�b�RNsW����*���V����8��XK�)3#T6�E�.A	Z��g��U���p�C3�L�Cy#�Y�hS�����r���#X��X�4�8�� M��D��U.�YV�r���x��l���.̓9r�����	]2������B��e�H_W�>�z�����<��f��|��N�L"GC��І06AMz����vF@�e���e��'FT�~~�����X>@���|+d&���d$!�iP�̏'X�W�.������������:B�[��h�z'���y���Kl�8�t��Y�ES�?~m����=��e�����BW�;��-��>��� �%�8Ȉ���ӸI��BW�^��][��-QA�/�����`@e�_HˇμI���/̛�	�GI�������v���T���elte:�_�[�Ǐ�zY��YQ�𭢈�K��z����A�hOv�r�Ŏ0�)G��[󖑭�(�xѨ�&����%�F��Y��Բ�/��B`�c�ͼ�v��dW�2�����qc�}���*[�vU���P��h~�ٲ�`H<vt�N�	�D�X2ǭ��/�����ޗۗ'ڬ/��H1crhdОS�d��Ƚpj�n�����L��M��8𫵮�c�(��P@�����O�'��C�[� ��͹�����o�?8��8��B�|��T�)��+[�)�����Zpyrn��L�	�t��h�?T� ���U��,�o{ K����	��:�~h�N�� ��<��>�H��:Bk$�ܷ�J�~�kk�$ 0-��x(�Z�
 d2�pCT���c�l�&�V��0:R�3��e ��샾E�<�,_��Mi��9�ʖ)o�~;y�ҳ�wIL��A��Wz�gH@�p��-�t�U�O2F;|��Eoݷ1䊭����kA�F:���S��c](�,fb����L�����K�
�Kшܓ�{P�����2���wT�m4Q>�y��t���w�V�V����(p���"
�~d�8/x��鿹�ċ�D/���{-�"�y�!,�6����[ 뭲ABY�6�k<4PZ��r�,��a9��� ����xc��1�OE�QI(�a�,,�G)Pv��J&�qэ��4��f/����dČ:�?���e�689����z2&��0�b��<T8jH�ݟ�`��5�hM��~�:9��`B9���*�c�J��K\��m�@�[�kP���}
�3f�2�}��Ϸ�gOT3�@l,�X+��O�7u[󗪟���x�ȁq�,Zi˺����J��c{	�g�#G�W3/�'r�7� �����,D�7��㯥KB'c��i���g�jF{� G-����Kt�E^l���ȃ%K���Jֺg�,:G��s�K�jj�=ݽ��ՠ�Ġt�(�	|�z̤o/?�O/���H�gp6.�*XD311T 	Cc)���
��?�3�&-)̰<qY�Y���)���<�A�Ƚ�wS��i���
I��N�(
�� �� \ �Ϲ#��LE(��C�,��Hܨ��?lB�������1uӟ/��S<�B��JfO ��B���<u�m��wLDT��!���@�"?����ێI�-����J��������`Gf���& �pp����~L{m3w���Ge��L9�Ȫts�m��.jf[�� RCwGS�����Ol�s�d
�ڤ֧>��P��=��C�L7 �ˑ�����Z��D�O��d�r�	bk):�v�[�6�<BA4P�����J�vx(�Ƒ��i��.�������_2��Z?��)E�xvTs�J��ڽ*�)��O�{���3��?�g���;)�l�?��kG�<�W���������:$-\��e�ՍskǢŜ�� ��Vw�L��k�æ�<�����6,�U���jS�}̆o���o�����A~�:ܰ��*8�Q��2����U)�)(:U�Op~[I�rpV�OWX�l���Q�>�5 -�è|���ph�;a���E��6(���:����۬:�t����^�Ma��S�G���G�mp�,í`�k���k#d�OE���;�&��.U������z,K��aP���G}���G}zi�YN�3Q?n�=���t��I�RjH��7��x���2�wc]!*P��3��RISzb�tWA�R"    f�z��!\�V9�M��C������2�<}|�jU��F@-�w�U ��þ@�|?L�� UM� ���{ �S�^�(z�X!��5�c,�~�v	B��PY>��i-�̚]�<�� N�#[���?|/TN!(,v�0=4�~�8lx�(Fn���wh�P��m��t��6m�c�6�.���g/�������g� I_��)(KUk�j����U�l���1��g��j0G��P06A��i�8�5͚�I;�^-s����Zt�hKb
�XU�������QX#����^#��)} �Z�R��酵 �1
S�b�&�᯴ �|x+�]X�����j��6�ȓ{�!��GV�W���*�|�u�'��T��H�~7*���<��ע��r�|����Vr6g2<�V0����V�Z0�;9l���|E�_����%Ā�e×��Tű���6��>��������#�K������0�X8�B���� �MC�\۶�?��tz-�1!Б��m��J��)�o��l�] ��x��߿2�P=[��ƾ����_S��=T��
l���b��J�&ȟ�6v�����%�������,:��� .E����le�g��! 9�9�&�,:�3��^=%v#Xg��7bG{\�ŝ�%�;�/�p����C_�R�V�l�	��q����� ��> �{H*Z<�N~Q"�y�f��iv,IRP�«:�P/����įT\{�:<z�
�s�UH�V'��K9H�S"�C`ikJ	j�A��84�&,Lk�$���*�o�	�}�fX̪���(���7��u��0j;��*5�_�+��e\��	�T�**����s����>_כ���s^��(}�AQ���PkB�k��u#���p�MQH�Er-$����#����a	>�U�/x��4N%5L �%`; F��ĀS)�m*���U���e��m��T��f����
���A��z��/���*1�:~?�p��C1//N�ؗ	���@�0��뉚5��%p��|�^X2�v�R(���|-���ˑ�i;J����@�	0kf=�Q��`8�2���8,eW�ep+?F�yrS���#�R��윭P��v--��T#f�
�`�g�ڟ��C�3r�)8R���<.��ðf�4�.�dT�U�Б�8�3 �?n	Z�F��	��Zx�.I���v��b�7p����~���Xh|�&�,��V�l���ҙ
3h��5HF�k�b(���m�_�uN ��#	�]�v8��C���eLBY"e���J.r��>�0k�#E���$���x9�~�V��4PJVe�`��m�6)6���B��������!���AZ��(X��Г3O��a%����ym�	��|�a�#�S����\ij�E"��Zt:ar'k���	V]5�i�'L5wQ�7�Vmj=(��P�z��)��j�R�7O�%#�'G�-�\^��������z8�rN��4}�$�"LP�Z��1+�!��x��R�
ëD+�;/eX��X��~U��/US���KЙÚ�8.���\'UA���遲�$�y��xʑ��p@���v�LZ�%�Q��@̵�R�� �#�$e��0쑣X*���9��x��R+�t�w��l�0�)�A�vmQe��V���x�Ii*<�!5���ݏK�A�̫�����ӿ(�~�O���a����׭~�\hm�K�䈋}8Hتϲ�c�v�;�c���#�Lh��`�0�=�Ψ��^�aZ��������u����/��J�hG��{����2���jj&�G(b7��WS^�yC�������i�Tn5�c:�vb�%ķ��X�|Z����H���E����)s�ԃn����T�����5{7�����dt�B$h�>N��dPA,i��2�đf�
GOڢi��V��w��;��)�0p(&�[h�p>:]�["4EH�;o+��iwf�5@�����V7��(��5�a�"��̨*�X�3�yb�ta-�ꕋ���1�}"�ʥ1�R�ki�'�܋ѻ}�Ԕ(6��/Q^�\�/,\葎�	tU���mK�V 49�etQp��h:�`t��Ƚ:���}Bk@���P@�1�Χ̬�]c�^�u�||9-���"��=��P�>M��bP�&6����v�U�о��e+hKz�u0��saZ����D�1�9�Q�e�����o%��X���VSLh�4+ Q�h����)��.���*kJ�S�"����t�����������ݞ����ף/��*,��	ȎY3>)��[��r�"�Rk�� ��,������TK�59:�0��	��C����n57�4��x�a0�D�VQ�W��F�%4\&n.����x�ua�	��-Q�ؼ���Vo�b���0�Q�ȝ���᪞r�N�p=w�iK��^9w�Y��o�|���;�àé���
�V�x � ���P�(�������'�NQ6�Eh|���O�~s��\��2�n�����8B�n�]�X�\��RQmijW8�*�2���G�:[�E:M���<�.�>�Y4}�%=�J��W�P;���/��nJ4�>�^>�߀_b�M�D����f�"�Z\��K���/�ƽ���{�����Ǻ���M�\��I�XT��.��)"�� XB{X��Ae����&>QNmj�=�f�1��bލ"�{.�F蕥� �����ʌ���1Q��6��8A�wpQǣ9���uIu9����l%Z4$�2dq8�G)I��I�%�s���\J'���.��I���|x>�^1�q%0�6�=� ��a,p,���M��!��aL���c��z���.��]~�4˵��g�����+�6}��p�K"��Ȓ�ZT�
zĭX��Ϛ���t���}w};���3��h�f=v��I�_��j�yl�
�*I)#z����gǡ� ���n������h�<��p��8<b�v<� SX$+6'.��)vvh(猸��q�\�c�8a���7�����k�R�E�m���>���D�e{���V�"BL��^S3rr(g��[~�"Z3*)U7���6�i%��{��IR]�9 O�;��m���PƊ�+��cZ����QƂY�k��K�=.�m(@U�-��n��_`Y���iLV&}QȀɋ�t���#zX�=w�w�J��z��]��^:����د�t1};%g@g(T]�Z�KYI\�#��AP#jz!��8��x(�{�((�a9p0�W��<T�L���m�o���@ag� ��C_�}j���_��@� �!�o�o�/�E�{�R0>.�n�uaT�١;��~M���}<���jN�� �g�ti��V�8 >=!Y2��my�{�ǴB�#�\7�]a�%|qL|��0�=@�M�����:S��7%fз}�gҾ������k���L`�~�����$�~0H�ʑ�)��=S�4�Z%�������wt��N�/{��7�yx)�.S�4`�B���.X�uF���������gx�f����q�F��	׌��/���d��Զ�;�[���������k�N�7�Z�V?��b��n
�wMƟ�H����;˺c�X�	χ��S+~�	���65g=����V�g�d(���J�K��{Q}r�`7�Cw�g��]2�8M�&*�l��� �''�a��[#=�F(�"��p�Q�?�ZG���}����@}#+���p2�{�RU��r�I��2�̜
�f0���[�Iӝ"h��.�p!����滑
����ǌ�=|��+�����Su���	6�*wL�Ҁ�b�B�_��PƓ�L���-�ۙ���m�ۃ��a��p�e4��%���(z ��X�����Ⱥ'PZX��RC{_�/W�;.&���v�����wķ)��}{�;f��R��m�J��J 5��eK��Ӗ^�-K 	�2l��֔V��� :���ߙ����.�����°���?��I,�%x�����j[�|y\B%��n����{�[A%Qš@���p��    �g�"T�P�c���g\��#&���!�����9��}����Y��8��yHy^��*U�MҊ����׉XV�����c��aT]��v0�*K:흎�g�	�o&\�!z*W���%�\�V�aw0��*g\��y�u[ӟ�x�N�2ŉ��P�����·�95�_T7?$���Ԟ�.���0�/]	�*m�t#�h��hx��]e���+���{�p1�/9?r�ʇ�&�O�}�]��]���ւ	N�PD�"+����}�ء��,�u�6��4H_@������� �v=�t�=��6*衄�h�	���Z ���&Z,����>�(Uy%6����t�'�q��Ӑ�Q������S%���ѿթ��G�j�.�j��E�`e<N��W�r��1�R��(}�5�f�jQ����:��$�P�p�^�o%�I�E�7x�ܹ!��W���l�� ͈}#ñ%�~��L�߳;Y��hȋp;}9 o���� m ��6�'�FR.[YႣdU{�t��!�aba
���lx���ݹ�Ȝ�X����`_�V�r����=�AE��<Q�&u��4��B2;c(
���`"�V��א¤
R�!�@��x�K���p};]s�XC棰�Z�s���K%S�TÅ){�x|78ϳvŦ��Ȗ���'�;}B5K@?�'��/t'>���p.��>i��E�D�$��@Bo���{z��ᘹ"�+-~(�%0�E��n��1�:�ԅPV}C�i�[�Bm�r��DB�p���8�$hZn/�{y�ÀX5�D�6X�{���,4fr��rH��Uz��8P�\��" �f���,/��
W��9\�wd.�>{i���)V���L͖;F��ɯ��cbu�'�J�M�t\i8��2Z4\(l�Lq2�]Z����*k�J :�C)���EcRE�;�yO즑2ޙF��������:���2�b�'�%�	@JS�,4���L��N ��Q���u)�R�,���5]k�>V�7����L����yM���u��x=���� �����B�~��Lw*�%#���\j���#�N��R���zR)]�L������H�ʊ��e Є�^-�?PQ�E鼯�#��ѡ��)��$�%*d�:B�]w1�݌A��ï�
���^�a��F[*�Cu�]���ԋ�������\�ZL<TMV4_�dkCgJ[���8�Ʀh1�'���3D�~�J�x�~~�MX����G��f��#�Ā>?˃����fՔ�\�v�v\��5��l�*p���������RT�W3�<D��n�-_�� ���u���sc ,�񂹠�eϛ.���pku��n��e�S�}�V�N_}7�W8<#���~^7�,�J�C(��֢��%�'<����n��`7���^�=����E#( �*?�5����^׶Q)����诇��O�k'�v�r ���Dv�ي��	_Е4Be�/-����g���K��6cAE������)�j���{Ja��§ca��K�% �~9�ƥ��%���0a��0����>��>�J쐒2��L��2$CR1��-6O�1T��T�,��;����v>��K��k;9������i]���iݝ��sT7mI!�;�-�3V3l��1{���w��Ÿ���2�M��ޓ��%�o?O�<�y<%5���2Bc��#�o/��m%��р���o�滚��5�J1z���P�R��L�$��YC�3*�÷��ײ;�!z�㦴��i�>})^��Y�h3s'z��۬�h�\�[_�4[+����5hY�B�V 2�r !8.��,�F��;+@��w^��̳A^���SF\�x�kA-��P��W��� Rټ8���8E���(0�c�S��م���@",cQ'%�|+�?@�Di�,y�Ǧߞ�[��se���I>��^�s��7+~оm�(�[��D�z���,&$�1-*��#�S>`o��>z���_��(}�N�+����a�S�� �.�\ZS���w�"Vp�	{t���������J,���x Y7�]2ՙ�]�aR������ϥ%�b�IG�����t��܏�Dl�6�CB��2���&�p%q�u��s�2T�{�$(:8Z*����-�M4G}��S�c�T�A�w~���x����I����^e�O���Aԉo���A?�P{�W	�#*���C��f[{9���d�3����ގ����k�)�QA��w��i�S�ot->x\�H��!|���M=a������I���W�o���iT+0"�ҟ��zV���`�]H��lY��V�|�qY�,�+\��p¯X�t�s�g�7e@� �+}Q*����w�[c��������{�S��[���I:��y��Ag�
R4����y<�����7�K��!�Rq�b���R&����g�_vFf3����}��~�_��U6&�}���I4bu�V����X/_㪵-�Y}U�����rz._��r�1�|ߴ��
R)]������w�W�\��iD�Q��?�Y���� ��-+���[$9â�c�!H��(�����_l�%
��P~���5i��?��w�'��-���l� ��u|	��Y���[+>�Ә��״�Oэu��$t���EWt���8|*��������kKpK������鰱+����4*]��B�Ѝ���5B���{�� �:n��3������`5�h$�%���9��x��d�e]�By"OEu�L�ξ����j K	OE`�p�d+; qg� ��)գ�CkI���������myqU�Ƿ]z�Y�sb�A���x���<M��q�O�,�3o�=�xdR��[Q a"�,8��ih-��u�M6*/�ݸ�f�N������~�߆�/+��B���w� �ԶŕY��g4ew%�]#�i�Ab�<��>�N-ÒZ��R��8��u����7���r;��c1ڻ�^&0e}'hd����:�����<���F@ƴN��:�Cw��%�O�=�[�5�d\i}O���t�v:�*� v���@kp>PB��SJ�l�-S[?��AL���^���-�7]`�Tg�I���.�
 )��B�DN�>lק����<�f��>O��@��B�	A��7oT㤏�=�r�Ϗ^E�X�ztx
!�X(���0��=�8VM���>���@ξ�p���c���N���������q���wǱ�����Up�T��rK-˵c?)���Wf��RϗB���U��^/FF{WqN�RoUm�@[��oQ��Mc&�����1y�k��~���
X%Ec����+Q?����r:�3�a��1��&����������-�p  .^\P���;�����\+B�i�3�&K�gf}�k1%��/�Y�uiv��`yqＩ��
�i%܉�G��O����qW��ڣ��.:�5�,g"��d7�P���r���t;���S�+{�5����]{���H��)�4����!%D;!�G�B" q�1Xh�IJ�-�+Rh���0kb���2��:\�� b���Lg>:`�1�>�7Y�dʇtw+Pi� 8��7�xײ;����J����r�U���U� a�����u���}
{��4Vx
U�!�d�>�v�/����n�$��!鴴���(���X��ˋ�K5��fz��M�B�d����p*�un(��� Q!�:U
���J4� E�@Y%f�Z
@�R���DO[߯�p���d}>=C�.1�>5��N�w!݃�Uq*W�B�/�l؏]S$�)�4�r s2���kQ)ej�������R)>�ރ��m��y�q�����e�ݬ�R3�$��g�>�x\yq�ޑ�.@���)�rT�?�}����Y��<�S�N(��w�4Y�4��b ���B=,ru��0 ��)�۞����m�+����Hp����fn�_�0���A�4� L�c�    ϱ-�v����뒘d��?�5�?Y8f�������m��;�|8�eZ�>�o�foA�j�qy� �@a����n�
��CG?WmU�E(@7�o<�,_}Ͳ`-J�ô,j#/�y��Q�|�xa������aFў��W�%}�B��
)m��	��+S*��6b��2���EH?,�w����\�<���y /��Hkp��}��D,��������R���8,�n��H�fZ
�z�rs���6Jp6���1m3�i���� �b��`�̐n��|@�{�iQ��_��o�|e(P����5g.}��NIBtU"�v�&��H&D����2�#�Y�˕���`V�B�kь�[}\�j���1$�)镅�*�9k�I�o��<)�E�pN�iÎ|'��}���@��aJw�;_��*�d��?��Z/�]p��j�hS��9(�$��$��;#�3��.���Jtw��j�~k"�2�V����b}��F9.vs�el�T�>א���{�viǺ�x/^��텰��X��G]����%����ma�8�
̼���5�8M5BK���O��e�� 6�>G`�rM�/[�i�­��g:�4q�9���a �j%�^��/�߅���;�	?V�J4���,�Aan�z�(�W�Sb���E�d���\�Xs̠<��+r2nl�z�i��z�Q�z��������{&[��ƒT�O�jS^��V����3_�y��B�9C�M֐:k��o��g��&�F㘑݈��ʔ=������(E} ���
�yI�I1!Ë�`��{���
.�HBEj�W�
�#�zZm��I�po��r�x{���#�`�5�H EIݜ�ѠY�J�ݠ9�rF�`�
��6����hY*{�h����͹sg߲V�te��邜��WrN�[�^���d�gn	��@��
o�_����J�P�}�u��qR���詃�jq�$�h�h\2 �H�K�P�aj73��J	��L�YM���_/����X����]��$B�#�+��r�]��`���1(ޮ�9��ݫ���C���`˫�ӯu^+p�f���ܢj�S�+2#��r��5I�����eD{���Q�΀�F�~�.p7!+QL�ί�Pbq���}Q]D���p��|�����0D��1�7>��j��y<]�0rIJ�!r�-gDf�4�� ;��`�L��k#4��$e�ŀ5��X>B�m<��_n�X�\k�K㙖�r��\�P9���xS@�U� �@�5U�һ�-�Rb�У���i	D�]5u�	�S%K��R��h!ә̼+�}�mt�˕�G������ק����Y���v1�h3��6��A15S,�	��r��X���:�D�`��Nʑ6�_��,xG����Ū�߻�6�ˌ���@.��m.H�Jt���zC�]F��)P���o�Y��>#Z�䃓�����`�J����w�����s���RK\�7+�b��7�Kx	�Va�4��h�.v��C5����\&U��p�8/�T�u����h[ݩY���DZ�@�5����FI��*Ϊ��j=hV�O1Ty�㥄�1^)k�ٛ,�l�,���� ��(��*W4��ۓ�*\�����]#e�F��s��Yr1`�|�U8�3\�d�xk�6n�>ô	���Ւ�F��\�$�p�yǾsG�X,�e�i}�ft�Z��R��I��f�\��7s�����y\�֏�!:gV�JGU��S�H>Rj�t�)-�K�6CIj��G��	e֢�TS�Y0]Z���}���Q�	'��ӌ^�rUUM	E\�t ݠ\��b�qL�7�N�m��LD�%yjE��m#2�)gk�f-˜���8�_N��{�	������~ł��Hj��7��.Zm�h�cW� x�p�F"i��ɫ��Ŝ�;,�<A_������y*<�����v��|Lj���W��xk��(ݹ�V2e�C�N,�gN�r]�2	��Ne�Q:E�'9KqAt�e �pgϗF.=����V��3p�<������\ec�T�MKѪ!�I(c��SBY�*�f׆����@G,�U�Iy����L��ߩ�k�D��N0# 	�ܔ�yTJ'�t�"*��
��#(�5�1�Sۖ	� 5���UH�a�Cq(�vp,n��h�Le���c��y TF��w��-o�#��.���3\C����a�fr��͇9�즕\�s�A��J|@<4���v���lb#k���V�����d3tkX��v�.����s�;��`�F���]S�s]���r#��*6��ZƆi��.�k��s�3{��'�+%w?(>pX�(|²����Z�DĞ������)F1H�b�ն
H���pt1x4^��`�	f��|߷�+�]�IC�}�4�ES�_)I��T��<:Y����PdE �(>R�x
nt+  ����iH�s��g*��П.�)?:���Fz݅��vc`�5 l���(�Z�����T_��R'�,�{��JՁ6�j��@�����z�|`�[�9&To%g�D*�$ԛn��
���a��Z:Q[�n}�[�=ٶ b�}�k����Q�Y@���s�4n�up:�{���f���`4�B9����y�d�[���uT�!�!@������ ޶.��n 3�o�H�BI�`�����N�`����km]-��]��\��-�,��XT�¸'I,:Tp�*B!��Dٻ)�ݠ�,�"��㷙ߵ� �Y��_H�>�<�Z�|����/���/�D@`7<�nn�'e�B�*�n��H[/�{NsǏ��7hjB�zwe ����R-�*���i)+b��gE��2��BD��
�S� �>#@��b9}����c����(�W� ��9��b��^�i�B,�"�;��C�alq՟"ȲU��&n�ȭ����p�`R����D�+�ss���?o��� ��A�C�"Vmi�}���j��N�COr���9�q�C�S�C�!� �M�=U*�' ]v$�l5�L1_�z1�PZ����v���8��X<Tb�NN!�>}��T2�_���ӛ�>oC1ʸb����RV]!��:��q������ ���i$�2x�|��7�m�؛b6�����+�Θ�*��^K�(��t�ö�{ƊO:c��]�a���Ah�UTx���ڣA�B�ݺ���g��O.��YJC )����tj��ʏE��b
����0w@%L�˰FdY��mѯ��>�n+�]��2������c�!�L�%�0B�Q��$K_���uau��0���c����-�l�Z�m�5-2&[�۝<Og�*n!� �<~�ŋ�q�?�]>{�5#��ƾ��dF^������������`e~jA'�:�rp>и�����*�C�8ta܋�*~?O�z����r�N.�5Z$q��������7�+x\�2P��Հ�!�ĝ�]��'�^mjӨ{˷o���vHК�?�a�c�I\�^2j�P3Q�ڄQ2�m6Z��;���t�u�XO���(�:�o��D��|����'}��m|��ݾ�8��/K4������=
��8��c�w%q����˛��EGئ��`���\�N�0`�"��t��F;kb&޶���2�tV#��X�N���vd^�h���i�b"d�ӥ�@Jӑ�:�����#��<E+�g?1^;]k~k�y/�pZ�i����~k�������4�����>�jپ�Qw�SӻR��~����7���-���1���&V�Mu��NgJ�����I�Ar�\�m�q�}9��	�r���Řl�J�ܪ�M��L�Ƿ~����w@�1�pF���C�@�+���6ߠYș�x�>�$Wŷ)�z:�П�)j��i��P{  ���8�O~>����P�$�C�D%�v���v�vk�����w8��Wh|=|��f�T���1�\��E���v*m0ro�Hv(o,`3�B�iW���_�^����!H��j���O�A&��
kcP�qI|�=�ٷ���f��H"�}��~V����D;��)�둇��ai�$۶$�rBZ%=ޡ    �N���?�.)f Pf��^Z��������kq�~�k��ђ(�ZŊ�<��ϩ�8��<�\�k��jֻڝ���,�x{=bk��cĺ����B�rn���ʏXD��@D���������`�^g�ꂩx�3�7\���Y�#-.j^�^��e�K�i�3�?����u ����C�>�R�t���-����x��ߑm��9<��5w�܂�&��K $�]�%�L-�u�����A�R� %�j�U��P~�<�(�5���(~?"�x��:��0�'� Eg������5����43�"7�'�m��c�#��XX8�v����yr���]�	���a]�e�#�M��� @	F���8��P�����NtV:(N�4�렠_��?�蠄-�?�&x-�:q�������5i�n�K�8�)�B_P8�B(:�1o�߀�P�������B��j�;C�f,-ŋ��7I���oND�������}��{�� lL�p�j��Y��-�F���JV�2z��,o;!�C\��d����t9������5�W}Մ������`���"q�p�%�<���m��$�ڴ�eӘ6|\�u�'ô��q>f�3�v�#���E��2��Y����0��M A�]���m��s75�D�+\���X�I@�rD��A�"g��S��_�����fã����Z����` �gd�UCvd�d�&ݔ-n��jȦ���������H�<nJ��n���ȯ��X�@�3Xc �,�K�5 L�Hj�aQt��P�mPS����4��~����	@��i���^F1��^������ṼG.?��R#/�����B��M}�b��{LD��a���5eH�7 ����P�۔9H8���3��1���� C�iS�������X.
�����/앞h�����F.���	q����bJ�;�!OLf�T�ZJۭ)�S�C��j�����8�}IwH2 ��O���>�W���wr��Hvg!�,��)��jN��'(�z��g� �sU�T���z�c�^��"���@�o�>~��U�ȝ�*��¿�Ј� E�Z�'��ձz,Ӱ5������'J�&Pn�N[c�>�4�7����A�m������
�6�D��.��R6�)X�(��EU���l�=�;�<�.�r�r�YBy�P�����'��a�����$i�;T$\A� �s�Q�/�EN�.W�r�n�T�q[��/�1�C���6���6�8�>�! Ky�4�� �����^Orj0҉=x8���/�P����s1���<��:�R��e_����9�����U��f��d��&�ތ�p
>��"�h�$#����2�\�3� NlP5*���u�����o9ٜ�fFD�$��ohz_�c�؊˗�u!��x�A�h�O4b?4`�Dh��{���8`g-F�/ܪ�7�����0��D�v`	8N���l���&�3ϯg1�����@���x�ej����{UE8]�y��:)wY�!�F�"O/��m�.q��r���ג&��Y���}t��,��s�U MU^��T�X��t#y%~���i%5�7��]��?��+2�[`�7,�f%a����8��Wz�
D$W��R�@��x`�zppaj�'��ʹ_0Y1���O�w
b����<��y{8Փ��U�R�r���H;Ջ�)���8��A�0�d�5o]�I�ۙ-��68�.�y^���}�����o�/��d��BPJu�ȥ/��,-x�ڪ������f�Q�(���r��	���t�8)�L3Sܛӥ����TZ-� %���	�U+��YmR.��-���r������R+	$��j'RN PF�8��7����L���롞}�y��%�vt���/{'���c' �p�����;�ѡ�Fm߻=�n���2B�dq@��Y"�ٱQQBO�U����EjU!��m�aTJ�A����u�=��h��=���Lr�oc�y}�{�}a��R�X�Ƀ0tcv���;�PbdLx�b��s��7��xX��td(��.1y	�Ǆ���2����'��2蓥k�d��%�~���\,f�s��b�.=��n*_�H���M��S=�O��j]jy'����7��χ����t�ܞ<�"�9� -y&��F���%�c����2F= D���O@�� s�
�@ՇGZQ��s�!��d��wg�����-nh�
��qP�5v�'J���} 
&s�+��������EK��,.�K�6�L��*ŝ�������Q�ଊ`���3�fQ �bp��$MD��
����\�A�s���<�s�JM#�����|b�Yb�!�1).�]y�dBЕ�sb�!���
�Y'眬У��1�����a�p
"��ڗNF#�KG�eO����oy�nW '�kc2�D_8`�V���R����>e�
�#u6.W�$o��K<4;�.�Z\���(#�M�����|�}�f�+2*�C��(S�ҕp� ׂ�KR���0���h'7��
F����CRl#�^�o]�eH4,.�ix{��.�p������(L{|'f�+�sv[�'M?v��gx�dXИD�����\���S�����6�*�ڐ*-JA����;�u4����f��>0���k^PH��T �\v��z��i~u�,�[�s��Dx�N���/ �6��%�c갩��"�{l�����S ��Ͽ���K/%��dH�g�-�Sƣ<'F��93�a�+%u��i�Ͱp�ըE,(;>�Mw��}�y���?�J�#��ہ����J�%�\��`���M�G�%�8.:x�X��2�Њ�zx��� �|(�fĳ����RB��e¤�8��ƭAc�K��/Hj6R LuY���AXc��i�A<�������x�����3B11=��H�@�P;0?�â�4�{<Q*�_�!{B�3Q�Vg��ngN�6-�� ER���T�C���gZ��pP��a��{����(z�ߍ@'��f�����(��S��m4�̸ET�6Ic�YS�����L+�Y���Zf9��8��1a�B �x��H�F����Q����ͬ�2!�u����f��.	b�`�����U�1^����Uo+���� �]���.���BC���_�?E�8m�����ɤ����o��V�ϖ_+��(�)�����6$��!v�,�y�	���ؠ��pt��6t�Ǭη���=[�c��''K����R����J�0�!m���ۃ�x�'�ǰ@����x*l���<�͌�|�WH�l��&;<(�^��FF�Nu�Ԃ��h�������2��2��3�2��I��K~�e�O��&�y��b,�-c7H)&��(�������� �xt��3��)�OrԻћ�����`kO���1��i�R��L��>'��?��ؿ�
�F~ez�>�92�r�\���Tmд�?�o�����}P����G���%���;ܱ(�`6O�І39�!V
�w��t���6,G�ٷ�Go�z��ֲ���'hO�ܣ�O�-�R�P��ʒ�D0Ed��e��3.��֊qx��׏Oh��2��r4��6��^�,�Fw�a��8��>�0OQ\�؛�yٛ�����ڰ����.uz]�eb4�����g��SKo]��(�`��f��IV:.����Y<�;�8ƙ����P6��a����H�iT�c���`��W�A�"��Ef���YwG���.��Y���Mcd�	��b�0�Ix�����Y�}�$a~"�}���z�I��� ?�N�ɕ�̗זJ�>���!�x��=�re�Id�>�!1=��)@Rk׉�:�3L����_}�	_�u��������/m� �ތ~ ��@􂽈0$��-P��C_Չ��i��/����(}�o�.�I_]))_�X�lE�F�^�OS70���w�0,�	�zS�A���F�CU�Yl�<%4r�&$�}�i��zCc    14S��!:��P�>�vD�gJ9�VVI1F�	t�(`hn��*R��v,o�_~����T�!�?)bҗ�PY�,[
4���-�$�������� �����ɰ~���Ѕ�յJ�Rk�D?K7k>u�@`'L<ߎ�Gg���\ ���.參p�are���o������tKD=�㎇!����4��?Q��n��K#]�2��#����"�����`,�JK�K@y?T�(��ij&`"z��F]-g|-o����eJ_��,���6\�I��E,��I�uA�*c�#S�C31��E�~bn�����3e�x9�΄5��`0��tH����'{I���X��9�4�g{��!Az�_'��^�g���v!�NK]�s��DPH��nh�q"�&א �P��}�r�}LX����C�I���>�_/��1~��	�O��­6�H�R4�}B�:��x���J���	m�N�rӭ0����+��>�\a��~�Z������F
������a�?�q.����t�0=��P_��K��q>��� ?N��.���Z���� 3cW�����G3CC��0`{7��}���� �D���ɏl�#,�%E8�D{z�����GC���m��z�����C����������KT��;ҽOY��vj}�pG�������S^P��
*�BzSzKUq(��M�T��rCit�L%��B>V࡚�?Y�B�	�e���]ā��ʋ������o�	2R��C�+������ˊу,W"R(���LW��M"����<
��1b�HF���C�I4f�	��1���Yn�e���Ίh*��^���0�8Gxk�g������{���eHe)U�<7�$ئ8�.�HK#晴P-�R/��p�!y&0�_@�����Z�g�Ύ�Û�� $���IcA�(��<�0
�����]���[��t?_�A�R8�!���$D �>�������]q����v>�^\i�5��� ����9M7� -��F�պ��7|Ԕ�6ŧ�J�_��u��JPx���F~>]�Be�ʿ���"����p�k��\��nJ٢�˖*��s�C��6��<�q:r���_f�c�
|൘���o�w�NKFCgqq�D�eC3+Ri3����y��C)��7���^�</�P�+�6ȭy�0�]ߎ�S������ݼ'�Z����(��:���RX�#�r�'�D�C���5��ח@��p[3b�:3D/�rH�olA�P����qD)����8k
��C)E��K���q`w@��+m=H&] H�|V�yjϸ1+�{"�r���G��#��]8_�-+���&���s�nе��ȕ���-_p�<Y���8K�KC_��j�ē��"KER���n���$W/���p6_���#�H�����'^�H�ĕi/��΢���9+K��||Yʏ*�{-ɽt��w��l)ޡ�p;^��k�0�S��!±���7k��&����(<��4���#䷟�FCԵ��hg:Vv3�!� N[,�?��)u�o�	6�Gj����w_j�����k��:����� ���vިdZ:�~V�=h�Ei�0Cm"��ĸ��zq�oT�rŸj9�>�4�� ]ٓ�^�.���U{M6�]�г��®����{�j�����#E�Zn]R�R9ײ�F����h���@��@'ѝ,�t�������X��Vܫ˒=ɍ�*؃	��jzN�fϖ��:�NnCg���ĵ�䴹� '���/F-�,�#��S�>}�r�gb�8PY�^ЍP-��X��9���~G�7
���Su\�5�	�1{کtW�V;5C�������R�0����T��|ۜ����P/@��7�~�����_��`�R�-�Ӕ�7КHI#�֌C��b]X�X�BY�C����9��)��M��z��Q\'�ln���I�����r<,Bx�:�hd�{K�Q�����$�1��3�2x�����z\k�m��YJun�o.��ɒ���-���4�=H?n��>V.�T��W[��I,A�4��	07�L�e�:�jpΥ�Ϲ���'6�o?K���b�n�
P05���qϤ�z3�s��)�68��VfD?�[���Po{@�r`��2�'��Q!�`�2]6#iӚ�9�� 0�s#�<��t\��zH�:O��:t���͔��Q[y�K�ϭ��)-��!r�^�ʀ��|=ځuF_�L��"��Z�����������o�������aO0��@,��]��}���n�\�t�]��N��+$먴��H������&f�ɡZ��<����(�c_!�Rg}G�����=�o���Sh��_o#�4w�
6����Q�@QY��7��C`�W �Z�+��� ��ޯC	'�����z�rvݢ����[R9����
�E���{�A���})"g�n������s:�JZ!�8����yOXW�hh���P�GO �8��K���_�B֋���d�u8[`-8�C�8��1���NEDhU�Olzf�o�Ꜳtqv!�|p���G�-�/�r%�U^k�D�vj��ߍ\��?=Pr��ghJ�Xc5���>���%;J.�ݪw(��a�A�~�62�C˭_5&�C� �pP$B .�"�Q_�����7�n��Z}�e�/��o��aM� P���`�`X�I�,��?W�%�%.é1���P�9����ȷ��C^�����|�>e.z�#C`^�)�b�G�����a�} �Gb����c�,�����s׏��Q�p��Y�t�e�M������L��m����Ùv�B+O®K�8��SK�� N�"f��p�Bf������?)��uu�I=P_��	2���T�#�����cԟE���n��(I�����qd�:�O{eහ.�V���J����P����v���>�ƼtO>_��6�PC�X�d�!BO1��6TkTs} �e�1r�p�ߡd�Ku��,��)a��UV��LnJį9a��	藻{��J��T��i��fU�i�Q�������#�;Cw�*N�p������h �<M[l92ZY�����_���ڃS�@+�p��$;Nw�q-��!�s����
.t�(�z�x9���jєW��,�,N��&n%�@�dD�e2y�x����B�Iq���L�����癛�<9��Yq�����V6m��כ��>v����#���vsx<��}P�q�f{>��_NK�Pj�ĕ֊P:	�1�6��<�fW�u�2��@�ΉV�S��,��ڔqƍ����sm�oo�����ז�����ORl�a�`6tJ.�ߠ�F��p:�Lcs�ܴY������K#n�흽e�SӝY˱��e@l.�7t뢯H��jx����8x��̸S*��fS������������q���R������`}<�(�5t�
]�[��g�[�T���`l	^�J�Z���kjMG���Vu�e\��۾&ǯ���R�Zm��N�ޔ&�}��M`��)g�]��
�͖� ���R�C^С��1��=����:��[��؀�HWQ�m/aIZ0n�Ǐ��P��Wa)���v.)��WI� &�6�5��X�P�P���)B��B�߂�L�]o�_'$QoK�e������P����KԺ��T�7Lh���N�)�dJx�5����/���Ͱ1W�w
��:A8�Hϖ���? /m�NS�d*���z)��W�܈�{
��a�W&*�ad�Ě�z��I��g������x{���G.�����v8����|�)0t=7*$�l1r��zn����Ѱ��n+#%�/��W-��c%�!�L��t |�)Wu�(/Z��]�4����7v��97��/G��>��h����!���b��߾�S~�=SV��$N�\�H�+���0������֮��� ��'f�Jˣ���f��|��Y����AY��].NZ�� ��,'�B#XJ��+�xT����    Qp�*�)o����w�>C���a{���+�9��E�z=O2t�]!o�qt�	Shn��~!a���s�6�f�o�^�8���e�GQ�'i�~+���u+Z˓�T/��'�j��"#�uF@AB@�Vvf2�t�:�Q�If���g+���z�¼jZ���׶Ȝ�~�Ly�����yj��}���;nL����Pd$'��)L�ϫ���9�:|��p9�h�����kM,le��;W�NF��g�^�� �8^��5�=V�ZڜڴJ@���EI�>4���}qx9\�Bj�4��x�[�R@���������j��x�E!�:����7���qY�����Y'��!�[�V�	j.�Pc��tJ��D�����P[�O�%��u�p��3����A��#���Z�s2+#��?��b���� ����E7����8�hPu���h�:#s1�	��4e|����b>U�Zp�|α1uV�\���f����;�C�Ѝ� �[������:�uY�S/�����u��)���T�-�)��su�[(�k�v�9��[�H3�x¼�S^1�`c͔L�*q���.��YA{r����,.�Ɏ���ʶ.��@�/��L�V�����ꞡ�᜔)���}!lϹ��_v�6בu�:{�ybێ�X�+B�0u�����d��BYLK�F.qsF�벇�#�{Pr:_ U�T,D_���`6FUMs�Z��e�q�ip��oY��v.����jd"�.A� 五���ѵb�k��O,�$�����������$��H=4�T7X���h:k*b#�F�|	�����2OI��/DMW� �D�Iz�a�ϋ`wo���}U������X����$��4 ;e(P>9����ׅ܅�+x�P9I��J��W�b�n;���~����7v��'?���^��r����c����KD��~*�㷜�R�D��I����a�9��쀴��<��{�B%���O�=j]�������*�C0q�ܤ2	��^<G���Z�*��;�P��u7!�n����_P�_��
x�9v���˴y0��c��ݦ` ���O�\)<4�D��n��k��L���J$9�o��6%���.e��g���:+a�z������)��a���B2	|'�Bh�e
�nZ�hv��k�7���K��,m6t�a��^�Q�t7_�,\�m	�
V��z�=R �;"�Z��s�-����)�[��=qy8�O���Y��r������󐅧�]%L�z����P*�|�;��;\�	�D�ו� 6���P��,;������#���0`f�����D�O�oϋ�Q��& ���g��z��2��BN(,�p��{ '�i��W��,�S���e�Rf`�1�i(��M��GU�@Y����'P1��g@��Xd�/�!Pb�&��-�&b�?S�sM�M�͌L�O�oWx"��N/G�y�Z��=��ڊ�&Wg�v#��`�^6S�R`WM��57�m�@Cu�f4p�����߿v!��>��%+��rt�c��ҟ��MuCwQ���/�sn��+�u�nj�ዌ�.���d��6a����	IpN����v��`v(J "�(|>!z�����JL���
�C��{y�TH'���,x���v���ϛF��������8@2�j��6�|x�m`�a�����Z7Zf��}e�i	�-C�0�;����t�un�?V`m�$jh�D*��x�F��ɬt����S�P�芡KQ���7���f�x�cJ�o�t�Q��8
E������v�p
�B�n9���D�Fk�ߣB1Ʈm�7�lL����e�{���җwn�_�}��}L�6Y�PE�>�#K�a2A�ͅq�L����Yg��-{y�3-�����CC?MS�ܸ}f�� ,���& -�m����$��E|����X2�?`�X����5��5���9��9@n����<B2z06�ۢ|m����^r#�: �A��?
~�ĭ��z`��:��;���_>x����G��Wf����k��Q�8��F � +&�\�o8x�d�R�dmo�5BW�1�s�
s�D�e�f��1����Y{l��g9D��o�Y%h�5�Y���	�Ju8sLZ�҄Z�D��T(��i��g��~�h���
���e�fU�7�4�� KV�a'���R��FWL]5c)KM�l���{� #j!W�E8]�y�t����0�4�`)�h�6´�N�ٵ,&XA�8b�_�C����F؁����Y�Ts,���;)�����ߜ��.��q�3����Tla���le�
Άh�$��sd�����k ���,����ر~�+K}{������wP��ӗ�y8=����$�����~�f5Qo0Q����H)���U��妑��'=%Pb�M��Z~hk��*<7�Bi �y*�·N��T�u=@�N���*"��y�"�XȦiT�(h9��E(�re�<���:��fט�~�LK��|���4a-��Ua@�N���+8k�ȅI:։�Z�ŨE�P7P�:Z�9(����fٴ$0�zef��l��7��]�����2HM�_��_G����3���C���u�S��Cw�Ţc�;7T�N9��`�pXT��a�ꌮU!t��Y�.Ao�H��?Q�A�����A&(*�6����$��\o��@TS��O�5(�����l�:��r�7z_/׏o�C���Qc_��տ_�4dE��Ƨݦ��_8P&�i�&.+@ �>��2�}KOxw�|��ZD�WmOmi{���U������'������`1�X�����H�	vMQެ�<������\��\ơ��r��#���(�,�.��E�wC�N�Qv2n�bo��C�M^;�)@� J# w���቎���z~�o��OO���f;�!$�(�����X��LI������N~�%|��طFTgy� �ń� ���0#�vL�׋��yF@d���Yw��ήp�E ;��m��a>���9s�~sI�#�k�X��3���2ޱ�]aZ��_��r`eL���h) �v�^"�aY�a��&�h;G��(�����q���b����>�q �&`�h��!�L{|,]�-C;҅�}�*�dfߍ���Bᣖx1�2��B�A��]�ຬ���d���#��|�z���Q`;j��r-����-2@%d�V0ǁ$���3�v�N=�cl�,����K�`tr��w�]3�����/78R���	X������3��v����%�e���#�b � D\���l�����[�=)��z}��o�~{�sy�`�zx�"�-�c*C��!��@�R���%p�a_��u�n�g�b�ŻN�|��%��6Ǐ�N����vxc��57�±�U^ ��5w.����q��6+֏\�q�X)���)�WZ����'Y����`��+}�P����~��K����:�*��J��Nˊk F��T���Q ����`��8G�>#���7\)�+ϒ����!*���z���{K)�g����X���C��HH#⡮m��	\��5�^�D��}ow|_T7�X�yT�͸H*�5P߅w��<Oq�a��:T��7�|�aN��Þ)ﯵ���qHX!���Uί�F��y��)��߮��a����}�n���:S��poL_9+[��і��=C�c2���O/H��.�&�5���zjg߳�kv�B�GQ��MC��8ۻ�"Ƨ�Vv�i����2t����T��J]YMDt��e�f9�������t�ƙ�ߨ��"�w||�B_$7�
�R���P��us��k]� Ex"TF���BL����:�&&샽�q�Ce܆�n���*�T���b�?`���{�QQ怇N����"p���3��������PL�.�D;V^�gY��"�������k�I�5��p匿�T�����u�u+�	�`�R�~��|��ƶ1j\���r��%Z� =��    ����j���W�8,��ls��& |����]���BS��kK�~����IѰnv��ɼ1�4�3����<M�J�8VSE����vŨ+ݥ,�9e���1�kM��t��Q�u)��S�~-�]u��.����1��q�u�)���Ln�n���K���p9>N�����qs�*��D�=k��w*N�Tܵ��+mW�7��@"6�<�]���+6%(��n`QE'soh�PJgA?����rT6�����ۀ�"MF���P �R`�uA/����BvB"�lBpu�2�I��#"�'��Kr3���ZH�O`����b���;���1��CF^�(���d��c�,�^ F�a{$��.6&Bt�<X��}!�5�C1�\�.7[� bخ�ۜ�������tާ����� %�z�ˋ��[��0�������5U�"��)(�h��p64Z%��,����8�[I�[���$�H�S.�h�Y2[����*2��rB�)��o�0�ڡ'�:)��d"�k�@�IJ�H�]��̔Q�t��K|���J��g!c�1��!�)�	�>��D�ԓ��(�mv�n���ɺF v�����.6��j�Zȉ���컳��=u��F������0.5WV�p���]�7-7�܂`&�@x��Ĵd���������ͤkᲙ�VEo�{�R��߮\�r�)t���1AOa��DZ}�sL0��rL9�cbp�|昘�*���V!'�`��d����P�fR����][��ǭ���ƕ�E�)�W8\��o�����<�)x�RDh�R���t� o�?�=�>i�-'%����='�f� �
�,��2�#�w	��V�_�5�lV�~|�N/��rx�*9��$Qt`���tPuh�.UMU����)��hx�ib��l�h=�W�ߢf���c��$S���L{����<���S��J�J֢�H ?e��!�4�:Q��6R���[ǧAC�0j��c�;��iD	ٶӡrU�Y�P"�]���Ck�Ɇ�4&+�'�UӘK�L�,�����Qڮ#E����0}{��m�2P�M@5Nq���Ѳwi��E������,i8lKS"�/\Uu㇒%�7���*�z�6�aX�i�s����Ǻ$|������	T��9ͼ�}�M����GwA�"$>A�,-u��6r͋_@>�a�����[���?@�x<}�N�ܘ��vp5F"_�R��B'@k�1r
e�IC�l7��27�8��Ta��q 0(c|^1����zX�0@Ӛ�8�qƦ��}@�ǯ_��_��f��u�I`��-�t�F蜚�>�SU�1��.f�UT�^x(�W�o�L%�ò���z�6��]���:=Cu��aZ�޾��:�����G��N�QanA������L�Ecۀ�([�O ti��1m��Dim�j0߸~9�_�mr=�;��3�x�E;{</�^+�U�k`
�����Xh���T��<_��+0�M�"���H�Δ}��k:0v�D��y��(5�8� u���[�ǽ��0�/g�br��Ep�.����I��PR��������Jq�׉�TY��Mv	�v��Y��%�Q��E0ӕu�T)ٜl�l ��Q���iOg�)}�m�W��D�re���>W>����f=y��e(=C�i~{��O��M����<�A��g��`W�{�CM
�$���8'vBO��,Kƹ#6o�B��,���>&ш���U�9�;r�v�d�/P�^����'��W"��q�4D�\W�zP�Z���P�
��Q�bP��4�N��]����8ax@+��fH��PL�w

q�ġ�@�b|8ގ�*�Tv/\����p�#w�w��
�*U��iS�Z��F(�*)��Py�Y�Tζ��x�Nd�x�N�d��X������W?���*n	U�N��ЁA�)��<�ῧ���i�vzh�顽qרL�	�E�{<c��9@&ww �n�0#dw��*5�`D���%7��k �>f囕�����ȳ,�m�!܎�0gR�t��5kℤ�g��o4�RV�M�P@�d9��k���'���L^�u[_\��֗]����p�\b�*�	��Z�s�:��M�����`<'�y�נ�ff0�`]��y|=\(18O��95n�>٧Y	�[�z�������vX����\��*���!��w��yr�V���[7~�='tk����� p�Ц�C�C����N���-���u��lR��H����؄l����Sw������q(/�1mE�.-t'{M��q)t���k���c��LH������/������T ��>E���կ*wR	L�h";�A������6��#�*�K��DA�����k�F�MAv����PW�MCg��˸XuI�Q�O�h'��:��Fő�g��{�����P'���y�������oޥ�(u������'=QVW] ����\`@8P)�skr��:zQ]�i�6�ҡbz"�(�<���B�m���.s��R�?�5tF�1li �}W�Ө�7�	Ի7�1�*��ۻ��LޱO�ƀ�j���' sP�? �l�WT:��V���"�y�UR7e��?,�BA�F;�	aH��E0ڙI~�y�* ��p%vHk�������[2��:�e����+��k5�u������r(�+X�xn�H�JuF��@W�4�j>�O��L!AB� e�yjҊ�H�J��w�`���Ｍ��u��y>��`��"�[�VJS�glq+�FUt&zl��}zV[ D!��'7Vp�_͙�h%���a�ĢeArX��<nq�C��(ȋ�Ɇ��:�}���[P��xs������C�D�b���ՓӔ�c'��#��i��-1���s�2� >+Ѐ��a3�A�2	���Y�	}/���"�j������wzo����������mvN��q?�GkH��_N�*�|A���?!ǩ�)k�G����^Ś�[Y*� �Gq1���R�pGH���`c����?�"�������{tM܈6�X\&z�G��0v3��U�@�*4���1�
���4�� 6���{�y��,|<���`bk�آ#(�^G�������o��ٴ�����'�8��tO���<O��7�����{nzy��_No?�I�����L���Q^�l��[���"�a��B_��H��X��d��� �����Y���GR$��A�ï�����/6�K���>�tW׌���1�,�K�HOL������UA4��O�K�:�H{M�n�����DW�c�#v{��	�Eō6h@����x)�hO��Bd�O0��+j�Wj��_�B��B�}��t�-����ux�U��;p���R�ӡK�饝�Be-�6����u� �����]�aʇ�8������Mk�	q�%-�ctʐt#y����a?M�s���Pā��0�f��H=5KJg ��hye6�Yd����,�gh�N6�8�M
��,f�	r�)߂�5(�ʯ��30�(?[������0^܅�]���6��w���"iy������hP�� W���lo+gj�0��<��;����'7�1S0����s@]́�kߎh��h_>�z�J��b�Е�I烇���r�vi��9�
t:]�a��y��gb<b�yKn��Ơ)��H+�I}���W/�P� �OPê��@�o��"��~�^��ŰԻ�B]�������z9Vr��0f�_W�_W�4 ��o~=��E.��u����(�7����h��f	�)?�A���nt���g[,Y�Ͷ�ڐpfZsȇz}v�;��[�-���<��X�h�p{����"�4�3��VK���#7̱�зȒ*}�eC\��lR�xEO��E��N�F>Dk���<;N=�2'\�a���^D�#N�����3	e[�8�؀n������0�D	A�w�o�U��Y�O�a�h�X�RB&�AZ͇\|��YU3<    �՞Of�>����ܭON���rbZ�J��訜e�\['��:��9��uR�����	�6�$�d�А7���B���M^�u9��/��=g{ȩ�� A�ò�z����工ҀN����q��|ʮl����~U^I�'�f_Q;�w׃�����|����:����_���{��8�%Kp����mG�a����G: ������}����劚��h��ʬ,:� SS��^`���P�>ց�c_�C����>��V����C�s�V(��~r��p�{�P�?_�e���2K����7g� |4n��-�.Jx���6w<����~y{��C��-�ak���h�uJ��m��}w�d����~�?.�<��Q�|��ܛ��`z�.l�"
�� �����oFH!�Pm�(K;�v�NL��0���O���I�d҃9_/�4Pc�MT�r/)&x_0�ص�!��.:0 �\ZX\��Z	!)��7b_��!6���u#1ڵ�=�ӻ��t �
J�T��#X4ĩe�m+?�J���g|h-�.��R�r�k�i��h$�F�p,�g�
��E����_�ŪjZN_U�tZy{*��^�1��#���
�I1j��j.�x��X닸:��
G����������C � Ә�g�넑}� 㞶��!�`�x. խ)[d�7�t�0B��٠��H���r��?�y*��'�[(Ҋ��Z���Gl����"�r��]Õ��%�*�KaK�����=��_�=�� :����@C>�Q��[���b���\"$0��,H��C��O*���8��@z�![H�(�j��q\q50�M��%A�����8�j�!��+���`��2�
�H��BW�HCYQC'�k�hx�l�/�^�%��w��"K��ƍE���)V?@tUPq�Z�?��o�1$�O��@����R��@�(g��f((<�@������8�5�t�O�99��[vH���z�C�jZ��d v�@�3(�� ��7|qB�R���Z�p�
���6%^0zW [�61z���"�G��C��h�.F����m#R8L�G�2.���**��Bj,��a��ca;9,�Fjj�x!�
���/Vڤz�F�;���:������.ا�4��xrk8�5e"�TEEt狆�rEq��~�^Nk�
c�qSsI�����UN�3��� ��F�LղL�/:��48y�Tf��̾���%�*|��?��,���Kp����~���Y��b�;��9k`L-U��b�\�Cq�F��/6�r̜}�V����-~���;�$�  ������R�1R�k[�
��=j #B=y��C�H6�U��=K���S�%*����4������V�U�J�**-�OTPz�W�J�'ꮃ��C���*�<i���j%�i�yZ��(<��GD�̀������Z:Ÿ͞<r����_R!��o�|�pmQ��R4OC]��a��
�a΂v�ȹpC�u8"3�r?�18������o���I:|zF�4t(�檠g�@*���x
�+���3�J�7eZ�X�������h�@�[��}�-�g���=��A����j � ҥfba�U�č�\c#+�1z�8�*[SYF!�R0#�t��^)}O�o�[: ��wF�-C�����%m�;�h�t%�RGa�4���V2���p��\�0)��a��n�4{�˕]��//��7��<��9�U�u�=$�i��=���� #���x�>⊓��(F�IPʷ��~�\����-���L��/0�\EVT���3�F���F�[L��m���0�2��/B��d�u#%b��Ce,tIJSP�P7APj����A��oN�M��T�"� ����$b	�EP�_���a"pM��@>�]z*�ZH�a�ek٢��ʳ\'��!�n���h@�6�_��]�~DVSD*�TW�dJ,���6�j�-]6U�Ȫ�B�
�����Q�!�a,rh���PC"���!vg�̮��1���i�_
��R�,m��PLհ+�bS�M�Tb�Z�I��S�j^˼D�jm'IA[���n��������ϴ��H��O�/��+�){��w@�PH72��F -&���"hS��tIuh�w	�]�7���yz_�b0�;�M�����ql�nsP8D��CM%����˜�l���U@��Aɠ'��#m�8��ҿhzv�I�ۭ��w��
�@n$�&ہŉ��ӵkz �X;̙�&�.N�V��P|��2�>Ks瞐��p��=�䞙a�>�f���+Qe��xu/ |����f
�&%�%��u��)^`ݡ��j�Z:OT��r]�Ԉ��F��fN�����c�>>���V��鯯k	�**%C�C���&���sކ	+�Y8�� �#�R�I#H�%�.����Yvő�E����ث]n+��j,S��n*�7�)3H��5@S�N�= ���0���~�1�NҾ�Cd?�ۅ'n��q!�=yA�����~��T�е�F���ɕKΰ�����pq�R1����%�ݛUE�d�7a�8#m0��8��Y9i��#��rl$�I�H�� ����D!�pH��F���gB��^��^PyX�.j$%9%�S��2o1ҩ�q�:_/�?1�;�A={�Og�	�'�����	�t�%�>�/�w�����2�T[I�Tlג�h��G|�O���ĮT���bt��G"��
z�M<J0Lk�Y�GJ���(����n������۸9Ů��7�ps�<�'��7�t�ޢ���^�>��Y�;�IgF>�apW)TH�Pa/x�D��
��;~�>��0\��kz�v2 ��C1F�}�Uמr�o��pL�Y�Q+���t������ï}� �����h��t�}z=݊��c�7����]�Y�VԈ���#F\d#6!�]Jw��٥�v8�3��[�ONv|`qz��R���L��_��v�n:E��3n�$��V���
@<�Af]��PiQ9p1<���w��|�H��C�5��ҾmR�O?Q����*�<��@�'(W�k�3�Do��u��� ��"������d�����]Ӱ"b&��;�	Px��s��.w�I^�z��ⷁ�,��fCE��T��YF*��"���d=����pPv�;1�����4��|p,��x|,���Y� Jk�:\Y����,��ʍ������ )8vr�c,��qc9/���?�pK#���VDp�i9S����j����ңg�W`�_~��e
VhoH�K�'��sѾ�F*~v�[��(��׆�g�Bl	�^=��U#�5�(�;Wm��I�7�
۾���Z5����2�Zup�9�� R��#�"|z�./���r^�]4����U��8�]�5�I�������m�Lђ�s���1KU��@+y��7��:5�I�F��#�S��X*t�m�G����b\X�~�+�?j$�U%���ej���[�9/�W 6��X�XZ�����(d�����%P93�M��R�v���s�	�t�j8��a�1�j$��1y�Q^�� ������!��p=-����-��fj�aaT��������������B#�(��د|%I�;�����>y�9����8��C���/)�9��g��W�ɧ����ʖ�Q��zk�w�������ó`��a��1��S=�;̴0�cb���6�f<��S�Y�Ѩ������ȩTG�S��Yɖ��h�)|���j,;  �(�&�2��T�P��ٝBs(���H�s��9䯥�F�`�v�(�2 y*�o*9�5��"LnX^[4�i{�P��R�Z�"�@?�[�����I{�ьx���k�S��Jv@��y
��/9��d 6^��&e��0��6��uv�r:Dw¬���>	�L[��,����5� ����� ɵ��轡)�E�	fG�f�o
�B+�I��^*�WH��9�u}�|�1�V�s�$�-��\������    �x|Xz�oc!0��/X���� ��4�d�b�.��0�������~?�槺��'tx6ן��[6��`-
�D���v}<�BN�h�P���#� |h����+�qF����(_����Ջ2����E(�Ɋ��� O.�h'Z��\k<'�sDٮ���ˏü1�;+�F��%�$�&Ge]d� Z8����_Hp�΂ a��9�4K�ಥp�;;,�9��7���������$y�)�U�y���许)��́��[Z���>P����p����B���)����ʃ�3�Н[�3@W�F@��ģ6��FPu��U{������a`��� L�F>�(���+�.>�%�y���F��ס$�r,<���~w�s�!�0��0��������WR�
0ڌe���Y��d�Y��˖��G1m�c�F GR/����~;}� [<U'�����腈�Z���`�0�"�b�CƏ�O�c�vz.�u-�k`��e�@ta��N�_�f�	�N`�_�%�p�Z��-����N,gy��Xn�5#�D��+�F�����5���̽�U�`ǝ��_G����K2�:�!!S.����-9�b+Dk�+���2<Mm�9�[`�U�:��ʞ�g���z��^P���O���_4�����[�-%�UM���Q�����u�- ~��b�.O9Sa�.�#�yr�m���g�M����(��[1��᪻���n���f���-�Z#tm�H��@c�tW^��7\�?v�'��0Ӎ��e���]� jo����xg󾕵Y8�Byd���+V{t�����t��wŇ;Hw�f���o}�{��D(|@��pM"KIu�%�B%i~�ht�$�-Bp�#�]9�Y`w
�š��P)�3m7��|�g�Ѐ�'����pz>�΃�>����)��T����~��Ʒ�ɥفN3�"�{h���l�쀶���Xj9Ƀ�9��q���N%:�K�[�
唫�"�kt'�Ձ�>7{���ƆV���@�k�(Yc�R�N�8X�����t:ؐU�W�l���[��U4&V �[�k���FNc� ��D��q�S`����@����q�O� $j��uB\��] .�s��+{���W	��RQ�Ǹ`,�� 2xxn��u���٥�^�#���<�^v�����Qv�z��Ƈx��q�_N��ȏ�����b��x#�|k>3��3=��z^=؜� �P� ��T���uC}�e�f�	_[L)s��V���S� ��NP�"��q�W���^G��wi,�h\�p�u�����A��o�f��C]��%t����~^O����q���q������ܴB��BqnM`��܊��C0�B|��I���ӣK���FB뭺F�s�֦v	������&٣������°ႆ�8�n�[
�	�õ��l-,=���K�g΍2�H�ۈ�P'h^�f�-�\�RIՂ	���k�
�����.��a� ���+:fP���+����n�LRH�c%<���)����.�XJr���G1c��a�<tu�M���_�{52���{���	J�m[*�O�K�:�u�B)6&g��<D�$́e}����1�]4��,Ϯ�s|�~J!���v�/�K�\
�*
p�v��=�X�7�_��W�|IS8xF��S!����Ӿ��G����Ã�%,���QI��g���c
�ˍ�˿dL�B�"�0�K�{�!�m��C:2|^ǀ��c45��y ='�Q,��D;Y�b�r�u�`� ���vی-�v�Q��먗)#�dT�2!��$�i9(]���	_ �;�;l�<S�E��q������^O�.�#B���g	VV�~bk�=��j �m�71h�9:/�
��z��J6+��2�X������ �T �����]U���#ڡTP�"Pz������h&Y���r$����F�P�zVQ�Dɲ�a�1O��c;a�������R0�0�D�J��!�Jrcat5bh&5��(�����GMA�l���f���f�M��c�����r~(�z�W.E���zZ�>ӓa��+�港Ԛ�>U8�H����)��|�7e���֟�)�J�?x���Kv;��Sw{��<�O���W�iV
�!��� ��g�.n[J��uI�Z"i7o�D�B��kn"Rҫ�k�E�-��>y~�s-��_r��4~�_�m:��L��z�Z����AĮ�6�q�iB̅&�7~�>ᒗ�� pAP����EQ͚�3�
����7�l��f��l)��������m^�q��!�,4�4��;� �@C	Y�?PRH�� ���m����۸u�v�|�>8y�^o�<X�j�J�	,T5��0 h�P��#�+G�e3��T�
%�|xtX1D˭���i<>�&����{���t�y�b�Ѷ3lD�w�\�� �8u�D���uq����m~�`V>w�� LIѠ��2���>D�6w�/��8D��᧔�g��{1G)7U�%9P;ybXU�N�8�V�j���Wþd�_�����Šګ�Oh'��;na�)�u ��3�U(#������x�t�Ԍy��cŒl��v�Vh+�f]Yimm�>P�"���#�5���u�J���&��R�xI���7lƣ2?r2@�/�_=�2�پM����˥�儳� 7p����n��.ٜ.�B���E-8�(H���W�_�%5O��-?l�P��q���v�*I�ߠ'
�BVPd8W�ģ����u+F+����?F;`��Ъ3P��ݶ�2���>�^7�!���3+ٕj�S����?��:����V�3ӭ�OQK!��*F&4�6���C)_9�[$B^e:���-�!-������ݘ�8#u'����ut^���BH�1OY�� ��{�@NV[ �A���4���\�9���q����$%P�.��׶�)��v��m�a4xbN�
v�@��FB-�u�

uy�_��5���Ā���!���s7��vw}v���q='[:ii�gH#^A� dy�Hl��� -=�2�[\��i��*7)^@�R�����j&���;W�:�R�ѳ�
1��������g��zl�C��寂�2@�&�9S���8�2pZ��wP�l�l�2�n̖eL��yf�4<��}�T����t���hQ�裭��#�M�����P�'�.�p�$�3�jV�2�L�nn�`W���ճ��_�Mw�u��n�Q9�Э�?Eb�:�+�ڍ�-��Sgd�0��Mԥ������+c������S��z�M��ˊx�B`�'�\��He�*qDVD{HΧ�C���"+�A�Y��pD���Z�؊B��v	,�b�5����e|����Ǿ_^.�1V��Vm���[
}m��b�7�<�hO5]�r�˄ z�� r�Y7�`�-}�~����݇e`p��Ԕqr�Ni�Y���Z�z4����q4h��8��-n^;��Bl�2�Q�q�ݬ3lʊ{�Y�+]���t�mp[���z��Q��1S���Cm"�N!�Ǒ>4�������� C��R�yD�v��ŭ`�c�2�!v���	�0R�{w�D '�ٰ���#�9欓�)o�n����6l��h1|��XCy(,&NH	�n�lCf�X�^}+�F�6t#K=�Hv� �����}莩OPDޕ�c�+R��aX��@��ܼB!?��6�@`�
9a�<�#K)(:�����	ᶎ�����6��f�/�  �OSiB񯲡NZ��cm��s�d���:��n����[n�У~��7%��]���������5R�$�1��cn��F�z1v^�>ҡ6�<�8�o{,�������7�����2�Sa\adeg:�6�S`?�IgڢݦP���;�t�)a����2�*�zч��0O�]�0��9������]*j�p1�C=�V4B�(Ys���9��X�AjD�Hw����Z��UgфA��i��~;_�X9���r��B�V�ER׵�ziH+V	K_*��Q[����%Y	�(Qj	5e���=Xt�D�z*    �Z]D�$$�oҠ0)�Asd��}���o�p�N5�����R#u����&,_��f�cp�@5��q���3�;��`ٶ�➕6�,��Γ��c�PЁ<^��ʘ�qfR!9�R*$c���
�f��Ȑz���I�:N�Z/�A�'E�t��s�<�TϺ���[�b��/(Zv�:���VI>��̼��Sp���1��Y�-���\�y�1�$�Ip��Z	�L�2Ԧ��3�V���ְB��uTv٘��0By0sGZ�'r �A�8��0�G�B#�i2�,�d)�mz�1U#�Z](���tVo��|`%�ieAR��U��Bpn�����|�|�N�.O��R��7_T��(M�}��^�s�6 ʅ�>(9��$�I�����N+�9`Q7����_=�H"�XB[sLISI!Qi�S`=d�s?u@��]	�:`Rk+k�?dr���`~�ł/1ê23*�R �w��r��f���y����b1sq2���8U����qI��>�?�z���	H!�����{ߵ���v~_|4������3���V�P�v׳�G����DJ�J@&�u �OR辧�	�a��"V~L��~�4������ժpOA����eo�E�&J���[-<H ����}8�`X�����D�c Ût>[���"=8�r�k���P��R\��1P�=97a���I���J@�оp���'_
�c:̑ζ ���^
l�p���Ԅm���J�O�V�^+R{�=�,� �B�Ƈj�L���2���3�a�L��D��t)�C	{�;���a6����;��_����G��4���|�Q���G�+J$�g�Gg
'����ɜ�ܣ�jN���5/��m��Z�*��J����߶��Ğ���L��C�W�0ϒI<�?t���?��q��9�'�<�ӟ�9ƭ�>��[�
����O���a�jM̵x�0Ӷ(��`	�# �[�j ��e����r���T�~P����y�~|p��/pcG�o�SF�/2�M_�M�U�k&+ )�|zd�5�@�V��@��%�I@�Md����]Ｙ��q��0��z��/ݔ���j�%L( )�Q�U@�]��AG����&�R�1�� �=����F��1���e�yX���eh�m�����2x����K�o/�Ե�;�ҍ�n��պ�r@�����F����7�����t3��)���^�d17���˕����	���-���{.���~`	ez��o���k�+N�D��Z�G��Zt~7�Ju(zq=C����X�U`��ԠW�e;�u	+�m���6��i+z����c} ��Y6��·h�lg�l�!�RTV:_ʺ�K����6�ڸ��m�6ST�1���H�"!�^�:�c�޶w��37!"-�A�����'���	�Q@	�^_� d���1I�L�^H�	]���*�J��%�B�~����pؔg�)���4��$C�,~���,d`�mqd���������ײw4��[8�8��%�'?I�v���2�,�&8��'!Y�I���%������\
�]3���5k��&��̼V��={�MfE)�`ع��/-���d䏽��)>�U8M���B[?Q1^�&|����E��^��,�~y���	\�� �L+#*��`L�ɣO[Z?-�����5�(=f%���7*��'�t�(��١;�����%���k�2U�d�c��	[���e�1�ʂV�=ǲHvT�Q�mO�Wx��i��SB��in�Ɠ�B	�e(�����pD'�p9��EV�V����z��y����x��R���Ak�A��`:ߥ+:��J��P-�Xzj��Lo����DF1mA�F�GLK�����9$Y:@�c�&
_!�1;xu��w4?�ؙ;H#ڣw�%l�G�
��f����#�B!/�M�������$�W(f>E��X���g䚀j>���ZsZ����p���_tռ_�U&�� :u�7�(��Mk_xx��^��>�]x�l�t�ni�&tpZ@�w�f�?�u�o���.���tt.��ԦklMhs8����:� CsY����FW.>��?W\09�����z?���g��`�(Mԅ����*����rI�:��f[oq�!ٛ�RxH���%T�"���Ǆ������R,@�#eY6���#�VRlBK �'Kcf`�k�[hiZ����0Јʦ����d)�:ی@tA��D�آ@�GF}R5}鴱�|�1�+����}��7�\O��F��q�]o4ߤN&	�n7F�r��+/Ē`Y1J�L�aZ,���v����[*Q����ܿ��.�.l�B�i}���P۔jC����|
d.�m ���;�8[���\fL�m���z��ީlA-<Ё�*U��ak�ףGY���PY���H6\�.McI�M��0�� JI��d���j>�����ނ�y����ǖ����
�)c5?����R-YT]|�m��Ţڪ��.�4e�FP�o�j�ߤC�I��z�e�a0�P}kkn�6�1���t,��I	�Cvm:z1ĹTS̗B\�S1�>i-�u�<�oî�N�[�Xˣg�����
��)��J�p}J�T�աhb���p}�� l��A�B��<o�czv�7�����/T�S�hpd�&�N�.\Ǻ%�ZC�Zĉ�=.Z�D<23�X�:�P�]bGmc����/-�僝�3lw�h�\�1�[BD��;%b�UiN�ȀY��q2 ��#�4����@�S�cړ��Au�����&A��W���(&����3Qm�����CU&g2}9�sJ��'�>e��
��i�ȱ�!�;1���޴�P{��gi���*�eg��gY��)�Y�=����XI�����yE���<�VE�0��������*��Z&��
����^XS��a�Ёـlo!��~�k�tMi{�w��xL�Yȷ�o��w,���]�0�{�G7 �����a��w���M^@�E0+�;ʷ��<U�x
�)��tl �GO�[ᔋF�L��.Zߋ���4������Z�[����t�� ݦ��1W��*P���1���'D�_w�'�J�f��UbU��mw���>;V�]��a��d� �r�|�?V<�֣����@o��О0�
%>��f��n�D͂���#qGKD����6��{ss�z��0Ʉ]ON^X����/=`[8'JɶI��`sV�P��a�P��)����C眻pJ�5@[��f�{.���F���|���������R@��m)[.��:�L�CU�*��b��e.�H �&��D)�`�.����Y7<�7s�q��x��:��}�&�^*�L��NI�s��@����G�|�e��z�$SD�WV@���J�u
;�|�.�W�����x	�v͆�T�	��3��f}]���G�43�كM����v������?T_�?�7.�1�٘A"��6.��o!��.T�Ro9�9z,��[eІ��LX8�G���#��s�(������G�J�c�P��Q��.8?	J��^��sِC�JBv}@��m��;���F�t|�]p������,�Ξ�� C����Y9�����ӧ��V���	��&	��u�2�ܔd�N�;��������Z hלin�$�"ی�xJ;܀��5�84�r�٤���)�L ��M	��T�͹���6�b�(��R�'����[�h-%��w� UŐZ�9Ӄ�e�E�Ě��׬�R:Hm�)�d~����;������\+u�j�%c��F�o��/-�Ua���3"S�Ç��I�&H��ށϋG���칦NM�Acv7q��²A��+?���L�c�o�z~�W��Ͽ×^�W?�
a�}[q��G����!�w�T� �⢚oip~Z�x��$�h6OY`ieKN�d�����N�$��b� ������6���k�8b��%g�2���j*@��dg���j;�֠Ii.�;�-c� ��j 9Q:̋U�g���
�    ?��/7c�3����s�E�:����� |�U;뤅�Z%-�&�Y' �
�O��h�FB�V��1��y��W�LyF/�b���z��z·���  h�uS��Cu`L�Y��ژ�r1�W�G��)���l���VKB�]/��C��+�>ϧP�Q-Tq�Ԑ6ۆ'�`�a3��,����Q�;*s��\��;*C��1��l����_��oX��BK����K�4 ��0V�����2�=T=�&C^X���%1ta�����,�n{�]ޑ�KJ�u�T�g_)f��H�0��$t���!X�V������0ՠ��G���P#�!������H-��Zzt�.���v�=���9l塖��᭱�k�[�~����J{�`³��R���
y�p����Z��'����`t�:��!��徱,���<r�A?$�ޣeyk�_l�i��61��gܹ�S�����Zfc�M�IPF_p�%m�:��h,�����������S,E;����&�及����/�ˊ����ˑ4ĝ�AD����狨�,/��s���L��z��&}g�8�'Ʃ-p��H��:�D@�|���>>c�$� ��QR�5�-�?���t�.�u\6B%껯.��f9���%G$�8:t"�D�3��L�CZ�yuny���N�SE9��0�.Z��5��J�³��Y9�ԺT*�����A�g�ނ{B�H�9^��ۖ�'A߃O��N�R�FG���y�&��T�t�-�t��5�j[:���ک	�0�⩶�Sm9�j�A��;��ɇ�ʭ�Z�3���Л�<v��I+��E[Y��A2�r�k������mU���P����6`ʜ�u��@��l��T"dR`4�[b5�/�5����&��؂E^ZYа�!����u:�_���� !ɋy��ij8M4�-&[�V�M�.bc�� �=�O��I�:��$�@�y�����gve��Q���ٶh��nZcuE���S�йW�)}� d!�u��q�l��o3��C4�K�=�w�*=��@	t�:�g�5�%�}���ץ����ع�=14��ѻdA?�7,�f�l$�y�2M��?��	T0`f�#*0���ݰ4�x�b���i6�KӲU�c����A�I�{u'���6p���/�:��|���>,�`�*R��:������4 �s`T��t�M�c�o���\�?W��[�o(ҁ�j+h��*;x�r:E!��6,�֔�#ec�\k����H^�1-��7I�sƧ���8/'�~�s��y�AϤEB���#{Y�><�-�" q*�C �Ay\Q����3�_X*��Vz�͜k
[0�Bf+Ze���]�/����6�pӬ��t�ϳ��D����ܰ뭠�Z@��t��NW�<�zlH|W�����Z�fp�j�ֵur<���hZS�u������!�c�f��'����/�̔Jх�(at�Pѡ��/�GD<��ɰ�#6LOW���D6����(�{��YUWQ�ҽw�Dw\e*���@�r�<Fm�T4t��	���$k觖��} P�{y�U` ���92B#�?al��X�����:VTk`�c$�5�����ϯ��7@]��v����NSp\+�l)4ת�8���i�q��"/��}o��q'�jR���Sf-��.�e�j��_�5�\W��
�$S7�KJ��Q�]f:Zy���VC_23P��ƙ��D��Tb/8��������ո^�?��yL���n;L$UG�aA)�R:<����,$V5 �L���-B�����0��s�����dɕ&^u�}۴�
�kd��~����*�;`(�������Ѓc���s��F�ߚDr���4-=_�Vj{dgʬΨƲ����ogJ���9����r�^*��UG�QH���m��8>0sua����D�����D�a~,��v�08�yVT�*ɖ
��eiˮ�D�o1��t�#�����@��P�a�	��V1~%��@�n�;|���R�s7�iX�oS�c_���shZ����褧�)"���g
z�ŧ�C= :�|$�:�A�Lzz�>\���[�ogP��w[�T։��̚B|$�IQNj�OQ �[VЌP��\-�V��������N��k}�����m�h�r���BP�X}��x�)��]�=���b���x�������/Gzĳ��aFx�S�I���{�zd:�����:��z�dBC-������F/�&�1��	�>2��kΩ���7hO�⹴�f�����n?--�y-������T� �nOYO�� DහX��՝훁�#�_SY;�3����)�輪�� h���"��*��X)�ހ���J=�JJ�Y��/pP�:P��{8V2QsM��,>|������߮W��з�̈́�y�o8�R�t=]hïzY'�	��?Oo�+~ck��/���������(�� ��2�11ALu�b3%�aw��i�u�6�gh�S�,]�0y�-�+C$��4�%��	Đ���P�?l�:T,�_-�͝��n�/hϢ`���C���� �L����z�b6�j?'	��K5���"(�jW���Ї|����l��ɧ�nG��%|�� ����@�G�xlx1��x���WE�1exW��� {�k�^����,�W=�S�WϾ�t�@�I��Ҟ¯-��h��XU#(��Ha���.�O*��_��_6d��u�Q���%��02���Zj����b"�@;�yUQ����}yh���R�̈����T����~�q#F)�/yd�� �졙'I����Y@����q~��fJ���=v�Ka��	�G�p��O�6�(EG�<R��Qx<�,�;l@?�	p(��&�jC��gX�J�Q�y�d&H:��͚=8�n,L@!�)�}T�l(c#�=UyOif���|��}�Ñ�NR��2�q:^=�<'��r0?��Ew���S;c�k@��*���P\�B�F^[��6Z�%����d Iq\y�����ް��f];eH��둪|Ha9���9���{�X�Ɗ���2��		R"�{O�g�P?\ =�'����>8L�A�K(4�Pt�z;���`m�c�&^�5a.3�����,�E��䈅f#���$)`��� 6���fOJ�I�e����'���+,�:���<0x:���jG,�RӚ$��=6y��aI�����MBaS1��8�I&`��1���0��f0����P��A�<ʻ�J��և�CXe�y�Q�Z�C���~2L$�x���H�)T�g���_U(]�T��$��|�;�W�2����=�2�k� �~* E�.��7�����m��� g�|���*}ij%U����&�i}����da[���M�g�h$!�Z݉��T�e�sR�dS���,��!�Ȳ|�Z��V2�``U
�\W�uv��-��M+������.���L>�˦�`�=�`Ҙ�j3F0!�DdxRp �Y"��SN�>�2+�^h_���p���o/���'�|\�[e0}�&ZYNе�J��S�Hi�nIn�U�딹f�1͊np�8ֶ��$�/ݧ�/�ڲ��4��Ų�k@�������m��Y�ճ+�|��;P���-4&�<�O�y�CX��~�+���[3��p�!5���1����@?;�����3-�b�	Y��G.�-�x{"�oJ ��Qt���-�`���L������499
3�WK���M�L2.,�L�F�J��q{�8��P臉V#b5�G�Y��t�D�-���,��D���tcM@���$�s�p�i���&na�a]���7��ߒ/��;�Z3��
�E��Q�C���f�u����Q,	��D�	�*�g��5}�6w�A?>0�|��ۓT���KdpRt�������c�D�����?�3�9��;Dk״'8��E6�4n�f�����_�K���;m�fx�g_ p>Q�V�
�L,�����A���偪�Ǹj��    �-Ar��Я�O�H��� ���l��M�g�d���Vj3�r�\��W1v�v�mzE�����7{�.'�K�s W�Z؈�X�y���$���r��M(^���Sѯ��]#����Txy��#�ʍs*o��a�d�m�mt�n]Qw�~��
'u�±9�"ǿd%��aF-dѬ�>�� �N����)�����ߟl)�K$Z�Fd=Ʊt�*J�XYX�B�,(��'5��y���9����"��>���ѷ�'���ܫИ���KJ���[4� rn�&ߠ,Z?`[�R?tK��J��*V~�H�#f�O��X����;������z���9���<�`�,� JL؉ο@Q� u@��=:��Qۂ��	"o��;�mMĵ)�Lc�k��D\(#�х0�e��_%�ZB��V��g����C�.� A���#J�P=�#E���`�r-L$��֛i�8�R������7JL������ I�@*Pɸ�\H�ĕ������E[�E_�0�����-H����|����#��wo��yv�C�r�a�\�`)��z~)�_;$�@u��l�@,����0ۆ��e��U�"-�?Q�:Z3��=�_���� U]�R��u� T�x:z~}O<��B[��V!}���+)f*�aX�(ٽ�b �V0�Q�/S����p)Y�by&�68�(����ʐ���}v�e׋i�h�y��"�]�E���t)Ńs+��$S7m_���*����?N
���|�;+~̧���.eH�+�M� Ō-jF����f�&h��@-Y��O�D�N��=n����o����������!�$��ͺ�2A	?v�ÃY�7hD-҉����b�u��U�	L��E��,�к�ܟae�Ի��w�;ƍ6�;��\a�G���;8G�
��m}�9��s��Ţ��Hy89�i���$�R5#TTR�鶟��9
�W�����������Ƥ��b��S(����C�����'�9��ʑz\s70�tK��y��5�!B��LJ�L�ϛ�����n�/�Q,\��-�۩)D�9*P��Ā�_4u'e��p9������d��K�)��8pI�žX��R,;㏗��<��d��ؐ����g�X��2���W;+���0����ө��iz!c�Ȃ��A� �jѱ/�������|���>&�y���DA��V�K���'�[��_��~f��A�cum��s�@�H14�N��>4�Zkه� Pdȕ��	���w��nm�����j����xM[�1�V~��t��q+8j����J@H�3��_{��[���@�0o?��R,�Y��޻�'��򰦤}Wpn������4�E��R`rP��ݢ�%�=&��a��J!=u,�Sק��Cb���W����UᇂŸ��z�+���Ѿ��p4�~���f<���@*[=IG��M��yWn�e���t	ny�8��z����&n,^V�X�g��"4I���2��瞒BV���5�[x�J�\�:�$7�S���X2�+p���/����u�b3�Ql���ga��-�ez�J�0Z����"�#��[�#l��{���w�*|
�؏w��hJ�H�p����^��[��)Aэ,����ġ���-(�vU��)Fg!�өW�5;C�w^��'1����~����zs�í������0��}����$�����,��]&*���:S�#�/̰�t�Zq��.+p�j
�Y�����~���8A®R]{B�#ē�\�b��-x��V�-�`yd&��R|�#.I �	D��k�����/���A�����@���鶽N��BDR�*�Z���@S@��S5�B���0*d;�ŀ�z���7P�lA Ӕ��n�` &���YX���#� q6 )�RY��/�a�J� ��P�w:쯗�[���]~����m9 j�HE�g�
t,{�u��[�:��
?�t� �O���Ϯ� 4�DP��^��)��mGވ�}�M��N��L���IA�<|�%tYH�y/�-����>~�-��B��]�(jF1�i�[�m��i-�o.\�n�lS�y�76u0�Ϊ�X�^aw0�@t���}�B���AQ$e=E`��AX0S�t-�4a�M��)9ɴ�>�h�X�*�e
}+>�Q1�`P����t�/�w�=a��d�Zi�e��Q*Ct�����=�
���7+����ּ|��_֢4訌w��v\ɱ�N6�)��3UL{�챤x����ќ0��9�P�<��P�����($ד3�/�B�z0!���]#�e���-R����*����c�
�3�]��T�P�a
PÎ2
|��h��Z��e��inG���>�4��s�}�~?��9ɥ���(nk�Z�IHK1
lLZ�2\��+�:
� I��� d��J�F��P�Nk	���,�c�x	ʴ���e�h9R�d�
�o��ab����Ic�6�R�5��q.�z��aX�,��?N]0�Z&��T�ה�U��-F�E���O�hb�V*EPN�฼��?$�@O�%�`{{TM��/��L���~�.4e9UI��vފqt����H�Bu�[�UF�ے�jP��lk��#�2���;�F��Ϥ��fλ�����:3�t4ցo���`�f�fY�����w�s�3��F����H1��yE�"�Z<(R������O��	��M���J�:�P��<���S�(YE�I��vRL�e�vf���i+6�iK�aش��BE-ݦu�ރ��v1 ���i��
���g��Đ����闰$��+��K9w�IƎ���_K����E:(_n˔ �MG��)Sjy���ў��nF<8�U5#\Z��{f�eD�
�%�j�j9_����30��9 �&U裰�������J�3��X ��ג�<�BR�C�r�ۊm�P�gs�!��1�x~J?�wg3h��C����6���7Љ�:z�Z�Pq
��G���8^2���(넉���YW�*Z"c#+�-
&۽�w��������M)` W�R���ʁ�ޒ��o�py�p;A7P� �G�/��|YJ�$h��4���1��j�n�"�����R#Ԗ���ց�ψQjk�׉r���^�n�b�u�����M%!?��>�|���{��Y"g���v�*?CoB��Ɲ#'�w�aQGQ\��IMIH�Az�Y�I����,	�px�_��~����P��;����;�,����g ���#�#8Ռb�u4y@��|�A�/��??\��ҵ�� =�Sѵ� �����:h�M�V��<)]�����h�r��PԓЁ���N��9S#�2�!���
�QϿO�i%p س�����SN-�~k�/KeG_��S�E�5��%[��b>|~ PRN�|E��iL]�M���+29聻�����.�n$��U�6Iޖ'b�h���0�޶�Fi`'X�|*ג,}��^�Q΁��N�����2��x1#���]i`������-' �����jS(nȳ�9�����Z��HA`�?>+�-���c���䩧Ʋn3�q�sT�.�݈t0#��� �N���`e��$Kخ'/�|r��ٹ�o�ll9��i�L:PJ�	{a�Mڷ�aj���4�s��=�@���Ck��U\ǌ�r>�V��e�_/��a�P��6��r�P��ZhTt��ʞzb���6̓�3���͌Dϐ�rnj��ᰜJ�p~;��c^�B�_N��@�8R��NI�k��~Mo�	Ȏ��!� �R�t��%qp����Zw�s�#�� ˸6�gz�V�z��wo Y1B �N�bƛU���,_'޲�X�)R@��hu��@���\���ʫ~K&���,z>�����jU����X��ы��F #�:�C5���	�ϖ�2���Q���F��t���o�O��?_;�O�&oG�<���L�V�I�n�e�	��*[y�Y������:0
ĸ�.����]w^c��o�����    =W�W�]�J���b�3@�0��^�fAﯠ�b8sJ�@1�	=JY����vP���kLm'��~�7����u�<n&."8�5���}>@�:���&�xOt��aq\@�-H����A��(�{�*LFԸeO�-@���7J$X������d�yd�y�����jx���@��G�@>��w��~��������H\5ۙ)~����� +c�v reg�
�Wg St�R��o��� ��!>�(6K�pɘ��v5���������1�����цՐF���Ѹ� �I�t�K�>�,�k������0Q�6����0�;�$t�(Z�k��]=y�yUs�R]��ǿ/R輟GP�lYݖn��%->���a �q���y�>Z�]o_���`� J���	�ϲO�l�w4���b[��ǐ��$=k�k��������Zj���%�� ���a����?�kcwt�����=�� �i6VR��݌�l����=�}_97~I����Ji�r@���Ov@#�_�@�k�M�n�$���+�-ح���O�/�9�� ����ǰur�Y�\��!k�7��ݫ��������h�v1�E��n��� Z���A�i���b��V���~تw�s��s��N?j���)/łV,	,�a�v�):� qBQ�9v��n����ԢW����`�	� �<,t�<��/�b9���TP.�t�N���Z�'Y�v��!>�u��xJx�g�e0j��55 �Z��A͂�وk�gƐ��;�g��<v*�8�l4�n9�$b�,F-P�VTvSe?�����ݷ� ��yk(\���U�ү{�#W���{��U�b��_�%|��z^j��	����"�((����l�{�����9�y����P����ke�G�@�ب'��V�����J[���zu��:�`�+H���Z<���0m{��js��2c�p�!)�_E�leh_ �X$뉘tSv@��~02��^ ^���$Y	8A���H�J˒�C�RpŽhm�b�@�Z�06-)ݺ>���j�g	�<Q ol�v)�~o7�47��] ǃ�	����p�?�	\T��.�`��@�ն9!=�2;	[��;��O��Ņ����;9c��w�A�N
n%��Gp*A'���-���R�bP2�`���>`�/�O�Y�	��݄@��/j��o�"����b��Mg���n���mGKLPAR�L+ؕ�XM`�U�#���/8���̩����(Z�|�*9�I��-s�ny��7��Ɩp(.P]L�aS���A�Gz�[Ե��Jַ!���dM��T7qEp�Ԕhv?��w0L� G-⇼_����%�Po��Y�qk�v{
�?4-�8�%ڰ`J>A�}�49�c���vj�A�><�=����������ӷd�~�M���'B�(w0�/f(
-�}A�NfQz�X�� �\�����}�%
�l�<O�Ńݣ���UesH�I=c�	�����b�3 ��+�E"rӘ�f�; I� u��0�k�h��I�w-a��|~�EXJ���ˤT������ 	�GpUna��*��T��"�γ���Ñ~��յ�a�8]��zz[���_CV�D�mh�$�*��h5/�%S�������E�\0a�zL�j�����9�a��-W��C�g~��6�y{;̰Ɇ%/�/-��E�@� �eR;eQ��rfL�"�g�ՁO�
'���4����+�lL��w���- zW_Ё�t@U��id��!��mPli�����"����@�5�5��_�e���yc5�{!@���j��P����F��e��kROai#7'!�%2�'������o:苚��U�>1j0DƄOʐ>�H��C\��t/���'�!Z���s��C\I����G�+��G>09�|4HC*���qAǪJ��,����'n#+��B@��=dE�wϠ2_�n��KSI@ӽ���o��T����vy_Ub���L�|�����u�-Sh��z²"8��GW�Ç���oQ Kקޝ�y���=�\�+�x�+Z<�Ոp�GϺ5��nK��_:�8 �3C�_���m$CP�S��#+��1$+TS(,�м"�נ�3]�&bu.����-*-j��M�>,dL�Y�� Gl�ێ�ᝮ[2x9kft�:t$p9|�J��������w��_�g��/�����yC��dZ�14?]�-Ӿ���ɭH���THEBAEk�� �fŇ��@������v�'�-m#6�1�p@��]�&"��T�.4o�VB�Ӏ��Z\P�W�(�H�A����R�TG�M���w|�뢀�mt;C!��v[��~y/A��h�8K/��u@�TV侙9�bU���<��	p��͡��� �����������k�U��/h�/%���
w��Ak��%�!�I�^KX��3�P�h�H�JC��!k���P`:��B����F��{�<�z��홬���UCx:� ,7��?��Pvظ��Aaޒ�<�λ����H�.��
t>��z#��d%^����U%��u��P��d��=N�����R���e	�Ӎ�5�&["-Ǣ-unWb[�Ho��7�n���zL�`�Mc ��,���5b, ډ���f��ی���������۪!��t����V7	���A2��^y`�a4�1g`0�9Ho�{.�}�J��;�3L��~<y��f*zkj�G/���Fa��H�FLU苖#�k��B4i7m��l��T��gLM�606�P��9������G֫��b[�L��R��i��gLTeSŶh��hIcXJ�O�A?5����6oq�x_���3��&��k������`��:��7 ��K��T&�����-���/�3i�y�q���[A`S����Q�����ML�p��˕�A@P9'���K'{���z @L�&/a"*%�.��E7Z&�J{j�%�}���yKWr/������8�Xo@�^�@�3�(��[�a��M�}Qb��� �qP��=�]�����=�0e{���2�yzG���F7������7DΏo/�}��Y�4G��S�^���U#���G�F�$.�xئ(ɗ�?<�{����B���񅘼$�����mɍ[,�L��O�OX�Ȳ�}]��=������g��H\%�FW�.��g��|#�#��`%�y���&]�|z�Q*�Y7���^.�OB�?��* T��3		fR�Ě��v�pȁ�Oڇ��ۇc��׷��?Ϸ���6��Qdf휢0b��b����<�Vl��Z��pc�А��
�����.E�e�n�����DΜ=9��00Z�6�����B��B��`h����t�����:�����)�6���+�\z��P)����w��Nvr|�YӤ&��8�a�-����h��<,EԷ:�bm��LR�H�'O��ik�c��3 A�
�[�P��i���bh�DTN�Yw�{NK�����^n���A�v����̱xa��mF4i�;��:Kڥ쌟����L���t��B�	�5�^�� k���%�ƁZ���|�Z�ih:O`��g,�����t�sI�>)�w� �k�w��C�3i�=�5��DO-���{/����R��-p&Xz�������x\����x{�dC?<D��u���p �(
�5�MI'�
c��n�g�
��� o�������m��������O�.���?�W;���eok}�8X=hu���m���������vP����r�B�S����񳃱��ʷ|�w�O��`���O����v%4yWK
rP�*hA��|�A�1~�O�l��#� �b����9��B�U-��E�v��6fS�w�]�f`X��h�jU�R���)XӭP�e�:�Z�3"�i�� ��ݤq�)��-cr��8?�Y�_y�]�����j��+��-�z��w��N��{��q\�E��]=ժuD���~�Ku��ÿzпe��n���������'
�oYp�    Og)�S�|�h*Gr�LД�X9�v�c�1� DC��y�����.�0+����X��T5FK`���-�}��9
���/VX�}�R`����>��W��X�P��G�ˏ�@�І?4Y�&f�a?�{���!4��bW��˯���T����U���T왔΂5]��� ܺs�ǀ+@������0��Z�q���
�]xg`3�cnԀ�}�b���12O�o����>������g�_X�ToЎܲs��Z������WQ�ats�x����?�[/Dz�2GU��Q�iUik7�nG�e4�N7=�ID�e�Z���]�
����=:�7\���_`��!�}�M*�
 �o�y�Ѓ.Ñ~,����QT�'�#�l���M�N���t�o66>�C�3z*�k�"�M9���9�l X-,i]co��1�2&(��A�:#�As~��$�����V��>r6�w���z4��I_j"�.�s�u���,ţNG���5��?���Zm]s/6�;�{}��$&�;��]oF��|���_,�<i�3g� ��^�c�գ�	
��0:���3����9�إ\���r���|���Y�����������o�
I�S�B����vo��B"�iG���v40�U�$� ��e����. �|4��y�`(_��Ɩ��q�W7��dA�k�(r���U,��b�!�8�}=�l@�#�\ly` Xh��.�9v:vz��ߚ����\;��J)ѩ�lV��,���=�ikM�td/7�hT�.b�!�G&5x#�7�m���Rݓؒ�I��2��Q�z_]N?o�n�I����
�Z�#�n�,h�� <-"�f��`�~vg&�l0<`�vn?��'��(S����v���LP�hY>�F+pC����ܑ%:����܅���2H[�Mv�u�;=?�{�ѱ����r���%�P�t���]����6�{||`����,��X��ʠl-C��������{$q��=��4V�Fe����S�<N��#|�+U��Ԣ-xcxw.SЎa]��>��.K��G
�iC,n�(��g^��=!Z߲f�^NU�=3�6�����t3�N���7
����n|h;�s��%���}�ux}T�ٿ����ߵuz�_�
Å���ִeIC8��s��,w !�
�]�^Ƙn�;��܏�~��c�e����0ǩ���5M^��zF(�����Ŏ��(�ԡ��� ��'y}���Q�?������[E��(�[�/���G�O��w���o�8�GH��;Dk�^���,�6�}PD7�s��u���O!<$!l�T6�A:�bR�҆w��7t������|$����S����p��iӔ����slSn�Z.��	 ���p���akv-�LG�Gws�#��~��SNu�
��Բ��pp��lN-��gk���^$�������5�i��|��Ō��7v=K��q� b�#}g��$��w�AT�%�p��&�<�%���O�gZ����������~��@�����[��\P��+��X�T�p��Fr�_�E1c��0nK���#X��̀��D.ɼqG`K�7����.��7���r�oP�ȿ�vy/(=ԣ�k�@i�
a-��Xd �̆+���@kB�z�ܒ�|.�^ҧ&��bU����ӯ���jc(guAN�r� Fm`pAƜ^��b�Ǹ�ya
���Lj��U�����M�m����({=Ĭ�w�I�@G	��E0d2��ܰ킂�?蕃�\3*ۧlR��_��꾉�ܵm��`>�`^i,~��r���op3��Ss��:`c�6D�U��8��@'J�X�0�B$����՚��!`��(��3��v���4"�ڒo�.�]:m���c�Қ\�<����/�����9wԘ]-��TO�А��6����UR?��XX[G �O��jx�cሤ��&��h��f�������1�X_	���oNTՠRN#H��(HηY4�4��	k���D�R ��v�~P��5W��5z1��ѝ��G�jZ!��MR����]�U@���*B?(�$�OVM�����ͣ�����-::X�ȲG2��ͫņcD�lw��4D����l��aglc:��/T_�^/�f�d���?��W�p���#�↝1��Y�*)�)�t��"}Z$�AR��r�T�=�:��g�(ˀ���S��N��x�-ac���5}�˂�������������mI�݉Z�:�(8y��	ƨ�>ыe1�Ea��P����V���s7�Z��91�̏��������5�\��^��Ekū:RÓML]`��U����n���&.��=���I @�Y����G6,�1������&$[Q�ӏS�ٵU��8[MG��k��M��%r|\�g�~8�؝�RE� oQ�`]ϵؖ��A#>�f�5����՘����uQBυ��������[�+�W9.��ێ�~?}\㖲��Æ�_�����=]5��lVi8�O?��뱙���'�ؚ�Җ�sY'*})��<�v�PR��8�Ln �3fPeq��CC���|�P���
�{���MzY�,�n��&�m�3�_ܺ�!�r<2U}��F?��tѤ��!�����#�{���Yv��=�s�EZ���K��l&��1.��eP�B9����2�Y>T�{�a
x��>�?�	���a�?fOM�v�� q��1{b��ו����PBa�X�%gML��쎓������S7>�Y8��������**��K"T���+z��I@����1ZS_(�UM��i{9�J��s�*M��%�-(�_��?Ŗ���)k2��]�����.��5<�:��x{��*&AR҃4�>t�)B	��������':?�Y�T�E|���(FX��~=$�-P�����s����a�K�qy�Պ"�N���/���N�o���xåR����3jۡQC�h�&=���D�]QxSJ�(���� �j��&.�Kp���>P�R���k�g������R�)2�hzPl�|M0�ғ���u�k�-�Q��τK���݊��RuB�#Q*��5ƃl���e]
ȣt�'�؅b��Rb�O(���Q	"���|T�2���#Ƈ�I���6� �a\f�Yd���b����L���Z�пG���2�7E0:�����n���Uh���R�:��e���Ж�U&EVlLձ�v���j��s<EY;�M�C^�sQ�\/�o������ץ��FI^������㶾����{�.�Z\��ߚRZ�!��gH6]���'� n ��|��S�-?�`�c!o(�e)[Z����}� K�I��IayU�7����ַ`0��M�Z�����br�J�����(��M�F���("�±������~_b��WYlYzż.ʘ�7�	�ye�j�����.t�M6������Q��=�[��)Lv=[`ԛ��C<(&J8`�d������� ��z�/4�s�@As?�a�9,��Y�`�[5L"����֖1��%�e�EI䙚�J��T����r���(I��Qgw�jg�w��4d3Ty��hb��F6��wʫx�
��N��+�+l�L,3Wzf�j�c�tj>�R�)"霠N��ï���PR����ņiЏc����%k����}v�d[���~[��de����g�	 ��b�?
B>y/MM���GSZg�%5.�yq9�>�P#�8������>]�O�� �H�3�R��S�W������4EϚ%�8t��meYSk��Z	��Nߠ�}���U�+�������B��V6���pz@�$O6%\#e�VH�B(�}n^��Q-�GM�������׉����R�u/��(�O[�*�����ǳn���
��H��(Y�m��@������C�y�rd�3���O�%n�be�Oo���� ʃ�K)*��Z�q�N1y�3�.<s�\�"���j��,�gƺ,j^����'�r?]����%�����G�     ��7}�j��Ԅ��	6ux �� �1�,�*x q�6��'���J3?����k�P����K_��r��~�	s){dؼ��i	��0��Uʦ�X�Ӄ��������rM��9�J��+��t��ܤ����I�G]Yl�`w��
p!��-׀kB��^������ s��"��_~��"��C��}��_Y�x�2DVm�	m=��-n�K
s-`��s�q���ƶ�E���+������|ix��K���N�%�*� �YPѶ���ˮ�D�e3�RE�b�B{hR��UYPh��JQr�r� ����0�/2��}�#����s-��C�d]ͯzz1ED��8�E��O� �x��k	�d�΂]#�j�ݝ����+˾	���W��Xx��׼NE�K�!������0sa����1����e�5�Kܖ:��(X�y��?�\4n{D?���mX"�|cP�G@����	��n�%���P�9'������r��@O�Yҕ��� �h	�y�؝��W"�%!��άV
����tL���l@8�~���G$�qN��n�?���3���ρ<�p1�＜߆����˖?k7F��c�����V�	�W�ty<=N�3����dR�8�1�rZW�
���|����3e���s2�H�b=��<9�e�N��FnܖӠ�h��Q'jA� reY�v�P%;;Ku��;&����orY��2�9Pv�7�g*�ܴ1I׾o*U|��ɞa`л�)J���*�J^{����ޟ����C{��ӿ�5tZ������cԍV ����n�O�F�<�6i\-�JQpyr�s��#5�� *��i��սI�I�%��<��)#���  ��O53D�Soz�������Zu���<�EUI1n����o�&��GJ�,nj:>:���b���5�A����@�hx蠺Q b�@���3~�e��R�,�f��������	!�E���PK��+�'�X1>��Z�E�����.+R9kK�I����Y�m{<�;�-񋦿a��zyR�CNP_ySXd�t��"��
�H�[��|�Q�fo(��!ܶ
�Y��'pΥ{��Z��X����ߓ�:X���Q�7�J��T���8y�����
K�R�Y�����	�>�Y;�v��7�P�Cnrk�O��F�"��a�I��,Q\Z�tX���7<]x���Io6ɡ�!�a�)��'�{���m��Z����
��~t�O�bY6���8%��Sh\?���-��P�1za[1�&3k���)0m�'�]���y����j瘟�O(�-@�h�Jj9 ����Ԃ���A��;�I���Ĵr�Dr�ݝ'U�7�=#�T���m]��W�T/�D��(��n�"Ju���Ȣ�V�A�aK�e	�w�B��_��doP�߾�Fy3LDt����ݲ��Ӓm@�wK/�my5�vt4�vW�"��©�m�f�jq����'*h�[�A~���<Po����(�9����P2�v��R�������l�Yg�e��e �ut[�����3 ܳ�2���Q`!L�L)p�L���ه��\�L�ǃK|+��2tbE�2���]����}Z��؉Y�?٫}�5�?�nQ�U�o��T�0"��ZS��zN\�j�Ñfڐ��X̚��)~��s��j�s�Q�'M�h�@?�+"���{sR�����	�D"�rbO ��M�]�m��ļ�J�@B9�f�x���S�"\RN%-dSZ�&X��������}�J�RF�"<�O-��KA�*t2�(BUxA��/(�:���v��$���J���l|�m��\��9��MZ�+h;}�`�M�f�؎��u(�Q�_VpCj�V2u�wf3�)&d��ȭ���)�𨋺��b\�����*���B�~���H۶d{�� ���e���0ٗ�{�T:D�"t),R┑����Poj����RV���z����5� kbx�P��u#8y�%CW�}� .����a԰�|Z��z4�w�8���:8� �y:�DZϼ����!��,T�8�e�MQ�'�3��餱����
��E����\�~ܞT����¶d����Z?�%D4F�������LV�}B;��e c�<Dƶ��NR[T'��Oh4zs隟���;�T�$}��U1�2�0]P��B"%���F�
u���?m8�R�x�7��\Ԍ�6��Q3��u��,Ŋp@j4�v�/��q_F�¸Mi�2�������42u��2�б�DP�����<��P��v �1��,D�i=A��3Xw�Ł*�ضc0�5Ma���xZ�!�
��s@}3d�bٜv�m�!��)x�II/iϧ�<��������\����(��M:e֫a+<>���R#���q����["��B�
�f�<G���hq��S4��{�)fz
^f�<���@ֻ�����01�&UY#B	M0�P8m�� F��j�S{��(�*�{�yc�nƴdL&p�	p9�[����8�a�F�NK&L:����Qk�^���Ddd��
k|�B,(���:�6�>}��s��4m\x�O;D�3{��1L��w�Z>V���	�܏�h���p�9F���̔�k�����=bR�GS�_���Y!�V�� �l�?��b����D�5����aw�Xg��!�J�5�#{��O�=)8�5=)M�^P[q&�ȳ�����O覭����N���`-q��\wt+"p���fڥ��qq���P���"�E��l�>*��k�m����USP��=^�y�$�᠂>P/23<� �Q�YQ;�{��vI�7I�*�D-�q5H��H�x(�`'�a�T�Ջ�����o/D���u��-L��r�x����i΅b�HQ�>�(�����Ҳ��`e�W�i0��%�dz����	:���q�|ʬ�`i�%���,P�FBi�H�epFzj�Y#�rQ��R�"q)"�]j�l	����V��+y�',���##[Îo��n�@��q��B���{��0kW;�WEe%XOY�z�-�̍��M�)7�װq�9����<;s�dV���Q�j4b�jv�	�c���yY�1aB�^d�$@�`ն���yo�-)��v�Tah��첐W_,�Nz{@�4���0l���6��S���	e����Ã���e �۔��(����:)����nw�M�
�V���Y�B;�^��Q�-;h�iЮ��8�Ff�cX��WK�wĢ�TB;�N[{&��Issd���	;�	Lm��3��c���xʬ
}yJ-$�;����s�Sm��չw�'���Ǘ+-�\�������j���uK*(��tkUF�r��pU
���q�(�$͝�(�fւ�,8�0閬�Q�H�G%*�g[r�����u:>���-��yѐѾ�gi3������^48sɎ��@�8��^��X�^/ׂ�K9(��e4�:��6��O�v4W����~��|B����h�pfIHP��vr�i�B�����f�)���20�{T����$-F�rȱB}/�NX:���Q���뗤?�̟�m~g�s���������E����	"����pt�"%޽����t�wN��~�/.E6���3�v��ћkd�)L�lU�����W��+���]����ŉ����F��0/�:1q��>2^��]���>�q�I�+�h��������M�L���d/���8s��Zh�[�z������Z�N��3�j�4p�C���K��������05Uk�S/�^�ɸ[n������冕ؐ�O����[���=�������MzWH�'����E���S�"����}�@���$�%:n�#��%D�K��އ��FḄ>+�'w���+ �ޣ��\s�Y�X�v����`0��{hіd�����gӂ�۷��_���4 x��3M,
h�&+��f=]Ը��CǼ6eѸ��� ����6LUiTyCڬk1��\y�E��W�"c�q���ʢ�o�����1����U����l:��A^���JN��rk    ��P�ve�%����䱶#��4�b���'o��MVN�<�q����rϐ�A�5��|�`�������)ꉾ�;',Mztx��'ھ�i:�ZL�#O��Xؽ��v?yъ]G	*���<i}�M����4R�l����ϼ��'k��u	fl�ս>~^���z���GMu��./v�@�.��f�δ"I����B�����(��k���ʣt�"4��%G�?�4�B����o����O�=\�w^b��`6g�$��w5O?��$��@_��Q��F��Ҁe�&��m�n�/����mT�I���FB����g��AHX���U-��,��^�>��(â��U}�!;��V{�{W�mޟ��U�~�44�3N��NW\L�� N�O~���s���E7��>	t6�W6��������]������������35_��s�귐����$}�-y��$�:���E:��,<yM�k<���Tz�ޮ�ZI��9����������Y.���3m�{&�G��̰��Aa��X5s�&��P��l< ��PT�CA��P����oH�'��(�� /̑l����bX�^��	9⡢,S�fC��@�0��]c��"���S)��q{�������og���Bjs%�6����k�k���g��L�/��G�K#�u����p|�;�.u?����=�8,���k��%0*�2+�C�Pva�P^��P�YkAMw��5l.
���֓���
���������WSo���,vk�;=\��?�G��`OE"�D[i����$�"�t4
,�yQQt��q�`ag��m؏CY�o����>�Xlq_.�?vS(��6���ͅo>Ј��`m$�Y4N��r��$��	Uq���d�m����-*�'�
^�{K)�>�ʓ���nz���!T�7D!��ga�!'��'vVѬ !0�bkE�Q��cq�rԽv�"���B3�ـ�Y����Y(hɫ�>W#�j���4��χ��At*�3P��CNd�D�h�� 7�MaIm6�t[�q�>�5��|��ޜS�_�Z����eL1�擌�m�}����]Au�\ wb�=��,�y���>�l�cׅ�*mT�7 �v��o\@_�>�Ts\�Q���fW
 ��DI_���DQ)�mRTiY`����y+E���Ѐ ˍ��<ƃ�#c(�,=��B��~���@Uk���
#�=��[��,�ˡ��L�jd$�%{:-#*`��ݛ��ke��J���`Y�e���l	0�w������:&Q��{�a�X��pD>'�����|�N�j.��k&��Vc0̡Mg2�f*$|ը��3]��t��#��<��<���bUn�`�- �k�B��u��w?eqp�#�ܧ{$91�������.#�4 Kuf��6L�0ν�BAŕbA�u!�@�C�[�p-�n~`���N�r�P���-2.���zD*1�b7"`����J��)�+��PyvRR��A�?)I�C1 
��Z�6�KN��Aq�f�z©�7c�h�IN+"��
�D���>ڶ�`������$�勲q���"n�b$�בx-6SG�mA&I�9y�>��������o��o���\J�5��>hx����7&�c�@I9���X����?�����iۛ��Ľ�����t4�~�,���&t7>ݨ���e46X��H�w����On"�jeJ�SP����d4�R�����%TJSB$�����Ko�N΀�!�Z哏�ˏ�LF%hd�[ơM��9���$��xϥ��'��tS��I�X~��!�j�\Z̎Ŧ��?�:Пpj�������u�v<-������7F���6����v��N

�s
U%W ��U����4���=W�B���R�ꗫ̲yC�E��U��V�k�,"S�9���-����~\�Хw}��1hB��m���l�gE���M�4G�D�kIz<Zδ�-�K�<A嗮t��'h	^X�-ӹ�~�6�k70��?���0i��os$2[*��(�hLs��mGp��@�����z��d�� ��v4���K��-�;�|{ɵ���s���	N��e�R�X��x�k���:yMF6�3�B�^1��Z��;�RvND����V[¤����  �����!#z�$�k��G��A��ٚܕmܮ���G�"��:4Om:����'k�o�O�E���7<N��0n�4u@Qe{�vu��+M��;��vWC[�5�>J�������S��� '�u)�$,y8��4�z��q�`0�A��U[�����%�?"�E�l�r"�a=�Oc�T�T�@� ߫�����ºG����\2Ӕ/<A.��u�7$4��F��Y^}�����=�䭁��2�~�D��d#:��Ƥ�>�V]����m�/r2 ҨL�6:a&lU{��dB�v�п����-gAPc��55R�ʲ\���n<3n^*wRe+9H�҄�&��yoFҦ��*ERɤ=[�n�&�ŕ�`7 �����0�Ea�����w�;���V�C��3+U���C�F�[?$�V!��Ϣdy1��G����wn
3O,� 4]���\�}.ԃc��L��Pꠚ):�ɾ�bk�|x�е����@1�w
D����a1!������h&��ns������_��,��3c�}����~��|�x����/�pu�JߞI/)ڥy#�IS{7k�	)XrP�Ȣ�J�9#>@{�}�/����/O��+���nE61��u&Y}[��W,[	�O=����u/��)R�rc�~Pl�-e��N�=�Pi<�Ȥ0�hmƬhGZf:37�.[Z/�qY1��R�@(,�1QL�;����9��l3ʁ��(m�ҙ�d��4u��H��@"NI�� � UC��5/����=L�8�����$�~��f�z�n!��O��ݞ�����[�yo�NĲCg|�N���ѧ�3��(:D?�V���l�J4���2s���G�<��e8JM�-8��u�F$�A���Ԏۼ_���&A ����4�[�2��crp3.�op�ջ���@8fs�������n��K��O�o�#�_hQ�~f�o �q��@d� �<�W� ̶�ɨ7RB��֠��'���MI�)��b�e�JST��W�6곓^�]�fg\�n�td��ԪFC��|=���Z�ޖ��:] u1�4�R������ e�Fk� R0`,b�b�M��d'z�f���$"�d�+�hD_�?��6������^�Y��£�"L�b'�5��RBG�FL;��6���y�hm�rݡ��k�t�PMR�5�[�papa�w:B@�2q�5IK���-���MP�I�:䘍�yHX���+{�����v��%zt%�iW�%��uLX����Ƥ��@i��\J)���0f�#��G�u��2���Ak!��X���3�P	5@-@FTڔ1S���3㡃�ume�쬊<ʠo߮�O٫���q�2Fo���Fo7Gv�������/������v*"����I9<�ow*���I�%��9Y:z�pZS"J�W`y�b�����<<2��'���s����V�~��0�\{	��_w�)��3U��)=�A��J����g�9�PG�|�����`�IP8<����D�P�fr���#I!�u��]\����0�!����Ċn���;"2������@]R\���T��� ~*<^�(;};��E��~�g����y��D/$K�����d���q��,̔�O�������< .47���D�!:.ק;����M�{�~����d|w���Mὧ�W��B�o
E��\�d�g�4�� Y����P֛(ѻT�=�r��i>-@j�~���NՀ��e�,�m��^�a��e�V��/�mx�%с��6��#�Q��/��Ⲷ�:g��}ñn}��S��:w�KF{�BaܽaRkX�T����w��ě�bf�� �F�t��﷧Ka;8��[(� ڰ7d(fS̷Ca û��/ƣyRػb�k�s�g����x�AT�Թv    �w�pL��e�^>n�m�ѱ
N�r&�yL=���WF�?k=�Nֲ ��BXL?�(���v-�'2�˿qi�$痔7s�}X4!(��.�h:U�k~��H����$Yx������h�mo��3���Ɵ��>�h��3ly3��M��'TO�ޑ�
B&M�ժ�n|_ u�V�4Y��ң�3���?I�^<�#�:�A��赺��P���#i��!}���Eҷ��oD%�M�Z�bS��b �!�V�M(4�T8� �.9�m����u�]�t�K_�|��Q����1����	��>��!��ޣ�魯(^�d~�!�*�f��Ϣ0�[\D�2����L[4rgb�Fj'JA���혍j?�+�M���.�e��R���5[�0a���ۂJa�IWE���#E��S��K�b(+j~�"�`|s�T8i5~ݞ�t�g���9��B�c#�����;�K��0k\94�g��4� �/:q�����/k�eY&Y��Z�9�������J�q�uy]Ӿ|�=�,��{�>]�"��	��a*�O�c'���ڤQu[	
@ªNM=4�a��p�\��WJ ������g�V��9���lCF=��ZUw��{����V�'�>x��vx�D�"��hb�o	pg��9&�����2=_1�ÝF0��}i������ړLI���O�[7?�R�]I��lP�|���_h����^#m��آ�ȼS��������Q<�p�ߍ�,kf�$%2��Z=�ovV�a����po�+���������b���yv"���NSg$���V@�+<t�Jc:Y�?@Z���S���.�n�5��@b��|��)EB��u��8�T�V&5\�{j� �d!�W	,�� ��(�5�&�+�j�Y�=���W+�Mi�٠�J����S
7u��)����:l-z��t�a=7�������{�R���[�l?ɫ	LW�~H�S�V���e��d1�l.�>T=����fK��N0��Ԛ�;v
�\����s�g�����j��@;�@ˬ��B4>��7K#�@M��ͷ0�E2d���\�h�W�z��	��ޘ��dl����-�Ҹ��d����4�����E��+<�$��1^s�E`l/=�] �x}[�>�����,4 �U�+DVf4��Cs�(<����֟���M�*w<��F�����>j���Ԍ��hնda��b��nU��(�i��a�(�G
����Ra#Z�ԣ���E�.?hC�P�������q7�� ��jx�TZ<�Nr۶'�P<�7G��J��`[�'��>C% h�E㪄4� �?�S���Z�a����@�U�� �z�,��7�UZ�~:	���ډ4���'^khΤ �Uҋ�����G���oaD�%R��i�S6�|��S<����Pd�=A]fp\q�1�F���782i!zx��b ���uG,_����VCIb� �]�=��S�Yc;Z�Ѳ�78�T��Ƀ���o��h�"`�z�5��	2Ɛ���R4��	ch�Kfg��"� �L�U tSI�_��Ly���}u4K���>y{�=�c�*��q&�1V�L���ȗr7�Z�`��. ���yR�ѫL4z2����t&�(2s�-i�G�tC1gqѸ����>�6���saC��+�����5��*�z7	`��s�A=*���@�*�t�K<�PuU@�A���]k��=/�׿��:[��@A���q����+v��|�0B	�;�a�k����w-�tf�c���s�[���~\�\yh/��-`�KW��PUF�U�pN��D���ĝ�(	�"9��C��j�5�"Ng�[q�f��q��Y����O�)�5��L���D��2Y�Z!"��MD���h�iSÐ��ퟧ��2��Ӛ�ح`�T���  �Ng��^�L�P	&G��&�)M����N�� �PyqR��m���C��1�\��P��-��Îk�}��P?.���%%Ϸ��o=��N��0m��i�ǵUf�f~�CgH�����?e:�Q��֩�u[�G7M2x�|N�p��I�ۺ%65���A#K[�}a��{��pb��쪖�B�>����`MD�Xʒ�Pψ}������J I��;��>|\�.9��,�
�;|._)�����IO��f�$��|�S����5��՞e����ݱ픩/��8�'VI�6�����!8"G��遂|�Sa�롪]Pc�h�C�XxİK���a����C�������0�汛�FV�F�a�|#���t�\�3� ��t��Ae���<V."4왺棲���B��ʑG �SӅC�`���ƧZ<�l�<�Һ�aeu�X[�M��Z]4em�%�C^k��Y��-{'C�����C�xi�Q%^�Jt���{욒/�*Q7U��д���P��l�9�)�sI��f����+�Bɾ	���b�hi]�)	�a����w*�0[)G���3y�={�[�視]�x��7ո���5�����@g��A0�rl;�_D!l�ز�0��ù�~�7�A���������8�1i���͇&��(�|�eX����G)����n�bzB�aK�������*������y����uhɉp�V������<�/�T��P�lP���c��4e��&�rb� �9�E#%�I�,;g�G�ۡ�6�h
�M�S���R]�B���v� �2�@)mS����Cm	(���G!�z��	);���OXwW�_^�i���7�J܋���K�`�(#�w�2(�Jϭ�V:���>b�l�燚��E�mI�sh�s����A'�jDm�oX��}���z})XZj/�� +q_p��Y	���8Ҭ��3��B]K����v������kCW�yh)�5���֩�q�6wB`@Z@��0��>�re��M� ��������]QJG0�Ź��?n_��}\��}�����7��ۭ( gt��r���
~��I�ڏ"U��Pz,C��)�R2kJl�%#'.���:uWާh}���K-L�v%}B	�5Ɂ����ղiTTs�=�d��C��P�G�3ʇ�g�	���T�L�_�Wp�W魉���|��g�+QŒ>zLs��^Hc.�@7uр"T�K���h�%�f��~�!������tK|��/?vnK��K������E4̰d��ƙ2~G[YI��g��|$
�.�DW�������˳��^�?`Єm�{������v1��ͦ�O���� 1��	��I9�fS��oTS8z-s��mL��R����,��JS�C�;�ᖐ��X�֖]�?L��R�qEj�]�x(0������C��T����u{~��}��x�dق��h�D�f)�C��UGi�QT F�G	@G�(���6E́���G��|���	r\گ'ؿT-��<7�K�B�[}��
a�Z�e8�X
C
�['c�Y��h��&"?�6*W-� ��Oy&U/���්��|+�M:$�==�>vÊ5��ս��Q�Q���y4~O���+�p��?����޷�l��:6N��-d�Ď?�^�h���)�P��Τ�GmCW��Ӏ�����1��dl���т�U��酇9�%�������t{�r��IQh`�a���E;d`�c�p���x�t���)a�5��4�8�iPB0���G�vm������JJ�r(��SP�,��}��Eҵ֦Y�$�|� v�D@����[F�/T�,P٠��ao�ok3j�MZj.�A+�/�4o�%9�A�L���wE��궷*�PbS��������IKP	���R
Fۢs\����B�<�0P�t�a���,��/Um�K�_#D����n23փ~n��4?JS�ƭ���a]�	<��t�=�za���K;{ti��'�H�н�Aʺ)K֨u�j=��x�^� ڪ��r.c��u���Æy9�0|]
��|u�塊�J�ڌ��]_�^�Nr�	c�D��G��    
P����-fLs�"D�������?o��f�s�(�T|�(a�.��G�(�J�G��Ӟ�K���^O��5�5ׁ㣛aD����j�Wʜ!8���x��ȏ���8Û�Ȯ�s��]h��%�µ_:]��'�G}L���k��"Ly���&�����8jE�[�8p.˲�1��8��N��� h�{&U4�Ud���ܒ�R�C��Ѝ>�?�,��X�u������ڑ���&(��'�~Iu�f���(�IXk���o֦�:��;:2�K8���ɒ����y�w5��[�Wq�L�n�E�}�K�
�d�=�Aۆ��&���aj���&e.��6$�8��s�0r�ub�"�Z�I@��k��1�^u����j����V��F?F:;.�����E�}�1;���tK5O���{����:+�̴a-&W��f7X ~w��'3���cOB^�7��\�+Q\F4AJ��~�§���C^���3fq�ZdN���� ��D���d��[�aޱ��[�Q�x�:��K���e����)��/
}.�T��@���6~�z�栒������{D�Y�p%֧����3t��:w��N�~��k��d�X*���MҘQ� �Y>?H�2d�/�S�|mֵ�朢1i��tJ~��Z�+�gSq�B_���>!
�;݃c�~p�E+V�Ou��ALy0Fc����ʘ��#$s�W�ݮsu�]Pz��|{���S�PBN{�$ @�hŤO_"u�6�����Mc1�����A%�4��Y�'��\B�[���:�:�^'1��o�]r�L"�����`�����~c*�>8�����ܵ+W���BFSY7�8�����\�����%V<]�?(T�v�<����G�{����j���	�\35�����Î�,�o���L��sh�A�<w V��{�J\�u[ FȐR�R� ���9�0�����{���uE�M�R!MC}~�5�Ky��5���ʠ@��|�~Ψ��y��Qo�TXJ(53	9�b&��&Yr��̉�d�`Vʆ��C-ldX�62f������4�����>��Y���+wJ t��P�p�Q5���V��e�'G]F��C�&oy;4�3�g�t`@������g�~�$͢��
�}T�[4��F{'Gp�l �A86d��uI��c��+�6r���Jq�a��@�n�a���^�f�TX��&�FņB��E�q�_α��I���MV�U� HͲ�ɚ���}���ɪj�?�z�}̒q��w��U��9�
���>�2-Q�Kp����ŏ*�.~%�n5����=,�G'h��aL�tCk��ݹn8"�}I1;�V�dV��J�E�)B�O�#��[\���8�eHE7��Aex`��e%�#u}r>����ː_l��`�����Ɩҡnzj���U𩰨��p�s:�~�����u:`F���(��E��v-��u���dƁ�!�SY���f���l�U'�Nz�Ԇ%N���T��r�H�r�#���uď+�/��R	,f#]q}���<�bJ�&�=q�4��b��4bL}�:�;�܍踖�V������E_V=N87TaG|BP��	�ڃ~x&��m��0�P�p�M�1�$ܲ�-��8��ˉ�L!�v�h(�Ɓ�%��c�����_����joT�š<��=�9"����`�᪕�B����1�KO ��	��m�S�?>)Q�&jT9*�at4s-��I��&��<�
ܿlMM�AJ> �B��$Q538�,s�ɷ-�'I�Jm`���u ��?�^�Tǎ[&�Z�)��cj+W8�����5���o�Ϛ����*�v��>�]`%�|`���p߭~�fn��-��J�"'�G�d�Vh�&�������	?u-aM�!d��15m`Q�i���r>A3D�%�ZJ��l=>��a> �j���s0J�"�_�[�N2������?�/�-3�KX'Nq���vS0���I1��� �O��ȍ�t,妊CST�E]8�c�CI�VnY�ͤ)�N�P^��KbB-H�U�b�|D�^�-ʧcY�E(jT����Av��Z�	���a���P���Xչz��7��#գ�;խ�_������x��oa�v@��Φ(�7��>2��c4�'�aF��%�4� ,� ����4��lzP�ߎA�s�s��/��JոU�b Ԡ��dP�NQ��u�1���~̖r<���|ɹ��q����	����Kp�'O.IY�|z�s���V��Jmб�_y6�חq1@��!K,�Fkp����%� *y��P�B�����e�&��m#�ֽQ�#����+�Y�aX(f�J�V)Q��Dh#V"�@��L�_Kڔ�3ʋž5}'ߔހB_8b�ce����3_���(�_�/>8/0��,W)��_��!p��f=s/(�#���T
�F�����'geՕ��C�of�N��wW����?� ����mI���ۤ��6f�q�rG��ԛmò���8���i�"5�]R�c�w
�l(�o�3��s�t��A��xì�eG'P	A���yph7��$�>A�<��WqA v������w#i#n��Fz{��T��Q[�g�i| ކC�F2��E���u�����Y��LHn��N<��&�ʻ΍2�y�����	����m�X{?+���G` �wp���1��`��p�w�"k,�~��N^�u�Q+��@T�HQ�R�J9�����6�v#Nz���95δF�pm�j��L��3�T����Faš�- !TLo(7ņ�����t�V^�[�섙��S�a=�٣�h�ǒs�<^�4�夬O@�����U��"�#Y\��������������2N��U;~D�ĻqF�9��,��TD�}�-���#�M�6�+�￶��2m|��9�J� A6
�L�YE{��AB
5��~]��!���	Z�ՠqA�6�8��^�Nzvb�2��+F������.ײ +ך�������Y���I.e��%A��k)�x�#�����Q�m�Y�/���@�}s�^�iX�5(/�K����u�2���X.�1�i
p����3ò��@?NM�8�w��'�V�h���o����`X���>{���d!,�X�VS"���s3��¤ox�%�^�O�B�Ձz��Sղ] ~��ƅ�^V��:�+�o��׭�$�3`�w.�pP~��H�i���$k����H�xSJ����:J՜����~6�OU��k"�Y�m��Y���Q���/tTM��}�v��`�%�k�%Kr#��MkEd�t:�*m�o��믿Z�S�2����n5���f��8*��~a���*�$�/Cu��\�T��z-[�?����p,�i�nF�_����>��+ir%^HL��(�ӱn^0|9Ck�$k"DH��>���B�_1�ů��4�����������{��{�,���Y�US�v�������DN֓`�6��V��apB��G�d�v2�d*oON���2Y`��@�FN
yO��B91z���'�T,�&X)�P��(%�5I�7^,�-��{����}hL��t�Qc����g��>���?�;�hQ�3R��7��n��D8�����)��\(om���P^�J�f���V���)�U.d�:[�7���9��R]�7o�"����T�Ũ���_�*Xf@�qlb�ra��N�:�oM,!T�	�;�0��/TJ�G��j,��2��#�B
�c-L��0 1\���0��{5�tf,�����0atMFE̳ͩ��1T� �zZ-��m>���q9��I�\b ;a��YSU�����v���	���{�AY��ڼ��A��()���S'����XYL9
�޷��!���e�K2N��Xin�9:e?O��n����k�h,6�C�Һ2E��l�I�j���ʳa����CL�Y�Re��߽==�y�`*�?TE��Q��5��5��:
�䶻#��(%A�5��\�B��J�Δ�X�N�X�����V`n+TA�7PۿB_�P	¶��    �0��q�[O���������u0u�8�B���Lwz��4CeQ:ˁ�2W�k��\�v����0�I;R��j�dK�+��)2fe��9+)��+�%d��C'�D0u�.�B(m�V�V�@I�I)�����(d������K_,�C�`�v��vDcmR��R�i�X���AXy38~����.&S��C1q1���q}��Ӳ��.�Cn;�+�&)� ��� `ʑ�Е��~�Z���P��'��{"*oL>�
kޥJ�p���}X�QnE��	W��⾁�;��!F��'MΞ\Z�w"uP�F<�����^��v��x�w���7E�>Y���Vb�����Y�����Ko��.¦���8�I`�pV٧������L�	�<�$i�!j<�y����������-R���y���@C���$�1<3�C��@#?��^�f6��1��i��3�6����Hv+8�����"�|�|�  ��LWCg����9����,mA{/�,%/A�<��YG�-uzwó�F�����@��9E��-�]��2��,��o�.T��U&���=�'��mG�&7���O6ޓ�ގ�Z{���;(�9z ���L(iXX��TK�ڙ\&P�Ә�U[��s��$�>�v�M�hUxQ֪}v�(��v'�)�=�:��0�r�$��cA>,]/m�X���gK��.���B��\(,à�t�_t:`:��*ԕr�"��`Ԫ�K��A焽���_g,��+n�ղ�O�e!�˹�������tn��+�̄��������C]������/RЂƛp��e�)kN�2KgU�_�x��<�K����[_��7՝��o ŶC �j�����}�_��Y����E��v|!�"(��Q3�sc��pBt�������h>�P�=ƶj��d	�Q�ղ�du$� ?������˭BK��Y]��e�[1u����N��4ij����=�ʠ�Q#�.�W�@���j^�����]bQ��U��U�Z'6�l� �Nr���b8���zS����:�b��d�|4��ۻQ�*�~�Eb��G��!e2��3Tb�)�RX�Z��uM����Ρ;�%��9�(k��]>�W3��*�-c:�N^��N���:
�P��l��{�?��/�o�����Na�������#䢑��ho����)��-~�����z��h�G�s�j�:4@	�ja��ݷ0�<)D.9�a�y��U�{��?f8,��-� Q1� �2y:���.���E��[��5�J��Rn�PID�͙�j]��N'�~��^Y�?�i��$�Y�G/����������P�K��pW�/�l�i�J(
�U#t�t��������{�����8x&����?Cڰ�x5�d� ]��^�~wrW�h�%e͚e���<�i�#�A��g]2a�f���*��k7c�=\}+Ɍ�DIy!��S���X�
���N,��\��- h4�sXi��PE|v�����g�,�\Ӌ�Tk�ad��/����B�|��?ą���a��З��0�Z��d�\���j���u�
&�Q8=�P�U�&#kxH3����Ǖ`�y߿Q9��p����(J{ G��QTN8D{�~�)z�9�PA�[,P��1��;:���?�e�d�X��Ik��5�x�L���QM��|�S����Z��t]D�Ju����f�d)!U���ȅ�Q~@Oe0��`��,s�z��>(�� nXf:�?]�RD�q[�9��W��ڛ�(���������;\�Kԁ0��i�R7底㙻8c��~���ŮvQ7��-t�K����x}��"��7�bf�[ĵo�.�ס��$�6�,���1j2�ۓ���-���g�'B�ݑR�ڣB�Rߤ��9\�Y���0U�C�*����	�]���<�C�~{y+������鵟�)[�:aq*�Ũz�H��WRF�4K�I.��e,y}�h�U��s��R�B;][��Vd!��� !�������PͲU�dD���Q���Xn��ӏ����2@�.k���<!.�O�|\�)���qyJ���4KP�d�vޯ��:�:�L͙:ld�6� 
��h� �j�%C�ێ�P�����SQ�z$���[����A+����ݫ�
�h�s.
v�P�- �;]O�-��FVMY�+W����q}��-( K;�p���u���)w4����b��|��N�QIc?�D_9GLkamg-�����ߝ�~����sQ��[gD����6c
�c,�T�P�7�h�?u����dS� �H��h����e6~�yWr* �����b�S�_�U���vy9��P+w�EYo
�u�F��L�y�5�.���c�K�^�¯�١�ް�?�5��7�>�W�aU�����P ������;�/4��Dl!�taҊq�t�@F U��,r�I�f.G{�v�n���2B�)����EaA0=Vz�2������~O��*{��N�@齟)��9E��e���G��+��h�X�^��E��Տ	���������Ȩ_�uo�^��o�?>V��E&R�������ϩR1��B�p/��_�J,�I�Q�5 �:W���^��=5��ś����H-�W%�5�<j�G�]��A�.c+v�$�C�j���C�N���%mE���pl����xY:�@:	��W=l�|���hQJ�9��p�|�7d�e��H��U���؟�b'ˣPB����`m}��OZQ�^����%�2M�(���6ww���h	�HY� �+��e[Ыkx/(�"ӆ���Ưx둂e�-����'6���zl@axi��i6���0��짾��r:����}%��×o[�A�eb�"�H��V_�D��	%7Q���[�<B?vK'�<!���� �h��������
�y�� �=$$3�9s�p��(<ᡸcd>�;�N����D�ߣVL���ɱ�_��e�$�~\����6�[�|��BǛ��:��Hq�Ut������}���&�y�^�z0}��mz�S{��v��˿.�n��x���@�=鰌�۾��IE�`���c��������y:���Dޥ��Q�&�GC�N��$vDw&]Wdᙬ\sAo �ه�JP8k}iOW r� �����M��l��Z(��J�e�^.�*Nى�Qܦ�g7Ȃ��ݲ&Z�5�S~�H�8@L�[ֱ.߲��e
�O���1+K��&���[�8���q�r�/N�=X���M2>��p��d� �_���֘PZJ��QG����a0W��U�
@�ۢU��kŢ�mP:"+Xx^�>�^?�:J��(��6/���ǔ�cfөR�*M>�)Sq.k&#���0����\�`�3��$h��h������y�t�\�d����	�Q�'���,��o�W&�@_0��yŘ!&qOdY8�^�ҦZ�+*��زU��\�3�m��ɞ4m t��k����=��R9ch�KH�m
.A"O����w�1�M�͸��ù��������fh#+Ɂ ��a�`����\AN>�Ґ��/C������jQ4�\VrS�<{'Ll�s��Ĳ���H˂2-B�{�O9����>������9��#ɲ���n9��e`���b�_�����*t�)g��S�Y)�x�V��0+��h�d��ΆXx�A���Til��	�� �UC��s���ި��@{����ѝEu�
���ැ�[���=�M�U(i:m�^�6̾���G3>�j���W�|y:�e�]�0j��# &�O��_��ĝ� �}���\�f���$�u��$�hb�4
V�">ò5�F��n�hhP������G��B2��4t��hi��]��ut�VP�h�3��ձΣ'��XR�ˁ�Nd?
�E��g��L��o(B�7���dщ/�89J�F%���ϴ:	��%�ʸ�j����Q��]�v�����#?�V� Жcco#\"k�b�k~�2}"��r �ꀀ�,y=l��d����E�4�qT宛xZtw�6�W8�    x(�$1�쮠�!�]2��\���ua�䣂M��HC�ݍ��+�����͇�T�\��Ȋ�uל��xP�b�k�TʘW�r���iS$e�����R��+�4Y-K����I*��D��m㆑�n��TW*��`Q�#ɹVTռ����.¸����BS-��X�U�����޾�^�c�|�9�25��A�D�΂7�t���B�?0��-@[�5$�P�3����&��������
���Z`A|�.S��o�2	�U�
�PD����z��D�z��>r*B���X�B�t׆�\��Sj����y+��!o�.x�u�6#�P,�2�P�J������cp��-���<��PP��G�Ij���c��T����J����¨nk����0�ta�0��Ϋ���̟_�Vc �㒜��*(�(j<+�����8�彁A��5c[�ޡv�=Թ���\L4�Jk@J��K���V� O�X3ٗ3��r�̞�;�oJ���� �'�C8�J���/Z��K#�-U��g(G�<a�@��R�
�W7*�ŔX��ZA�����CYF�bd��S������	�)pZ	���a�B�b����,Ԓ`/H��J0�xd�,a�F՗	E��P:�i�y�j��L�q�8�]���F�x��E[����*��1N*��8>�����؎�܌�8��\%�77���C�B��6襽0�����N�:�8lL\_R:��^
m�З�91�C4yK��@�^�o8t�VI���
圆ݍ
��Wj�f�p�P�Og�����gq�=����i���T����ikO�$�&H�{~߫��I�3�ۭ�7K67zġ�.\��/[�uDZ�|Gei�eW�f ��c��V
�QdY���j4��[�~�Q&�i�!�c�4���gO�8�u2)�<��&����6�N�1��j���꽳��g�@Lk�^��Xco;��s�n�J��9L/֒������/_�>���K�(����B�\����g��3�������̪GE��ΰ�z�9�L�}���]/�������� /o�[?����q���=��at;&(:��h�/yw�M7%/L�����^��+ն��=*G6$�Q�Hf�=f�"�4�]�Wz$bM뮷s ��7�H%	0wT�hFrR���b�Y�i*\���/����������y{��AzK������C�vB��ηRT��E��Q����	@��Q
Rי�\�cm؍-�p��3������4lnO�؃��M8�{]拊x�Z<ɠ6A��Ó��`���������O�=wd`�@%	��J����7��K���o'��29-E��Ⱦ�%5���˾Rҋ$����b�����_�uG�M��[��b���c!����;��#��H�M����\��.��m=@�]m����d���s�+����e�;�
�4XUƬ�u;WP�a��$���97S����o�n R�`E}z�Ķ�?I�ާ�BÄ;\[�n�Qr���O�4$;����_�bx�q���r���8�F�v���?R�/R��v;����T�2������k_��h�F��Ē8�ջK"Y����dJoם�a߅�z�_�?�T�����u���]:b���~F�#VlG��a6�[�#�i�x��\0&Z��,��m����q��������P�F�K�ٝI�`_V���D�|���C4'R�|�t�������Q�e�$=����u��" ��O��7m��
Y� �0M�.�su�]�h��w��A�}�~��%��!�����Ě7�neb�Fv�2����)}��.&'���>Lv�>�£K$Fp=}䥘�B.�!Z�6
RQ*d������"�a�T;���Mz{�l��u0)@�[!���2�-�����Be �-�8ĥh\��̠��-�Y�uܣ�@;d�k��O[����6�$i�^���v�|���	s��
���0P8����t_Ǒ�}(��K��-�(�[���֏���$e�i��&���֔�{�< Y�U�������.9�:�8Q9���Y	��G�4؜��z��)�S��u���^�۹٧�%��!�̒skJ>{�	�v��r���.���P�&��vmB�?^sr�n��j���2
����N	�zav�'�"���6ݠ��� ύ
�����HN��3�w�ѿF��J��q+�E�o{��W���wN���f, 8 WA�>��1�vd��oVQR&�����Ӷr����wy��W�a�N���u�{=��� �D� ��U�7߫���s6��Y��(����f���YG&F	�qΑ%y�op���79��6������`��qhR����眖������~�8!x��F�EY� ����ϯ	f�Ff���h��=��}D���D%�6�\��s(M�"T��HAy�Ԧ�a�*�����kB�3��.T���=]��%�H�5��DT��Yj�S$u���e|'�	m߇(���u�J%���m5�aL��u�>˅�הi&1N2��r��C��B�a	�S ����.ns�ۀR��#�%�̭v\lO觠k������e#�Xa��;���-�������v���(Vf�M���@��sA[��(n���L5��� ��C'�ԝ�2�0��� YK/�g�5N)��k�QQ5-CK/�K��U(_Fkӷ�*Us�M�q*�FCPN�~w	\�jQL�U'f�|�/O�V�qR�Q25SIՇLKX���}39�be�Hg�<$��P1��su���l������J�'�m�<@���e�-�m�m)4�FN�}k��]�'x�@�3��k��?F�Ŏ�޶ä�iOV��������o�z4��Y�G/b(X��\_tlP�D��	�[�+�.��s��	��5�Z�iGv�=�É�Ѷz�Kt���!+�!���Brd7lA��D?©��%����H�#3�{�Xivi��F���b2�����3���?�[d}����D6�S�
l�R��ŀ�y�X8�
uf����-Hd8'�N��fU����������s�A�W�vpƀP�pb渹E^��έp*��H�`�91&�>5[��D��j�S@9�r��#W�H��Lc��u�.����{7�Yq���40aY����P(rY�v�&�s����؟G�����r�����&P�=*]O��,+���� ]�?;z�*%�Y϶�-���X�����++W���½�t��*E |�`N
�g��f��3ݥ��u{�=�>߁T���s����l[����,	
U!��(
�����aq-yN"�pnN�p�?}$o ˯�v��5!�wb4�ؿ�N����-��+���d��M��.�(2�AY3Msٸ��=�!&4����\>~^?�w�㒍7�7����K:�ZglL���؄� �gl��8���z. �=.������pN��:��a�	z5�68H��ב�g<`g�R��	�+��v�zx�&��!qfn�c�FnF)t0�H�����<$�۟W�X�����Wͅi'���+�'h�ȥ$u��M0�/5�ʸ�/�^T���ó;Ϭ��'ݜ���͵�Ѵ�z��9��<��K���n���W
BYɻ���52G"�}���%���������c�5Ѿp쑰S�ш<��֠�2��Icf	ߨγ8���Р�E�I����}������[m86��1V:8��>)��mc����F���Q
G�� 
��#�It�F&�6c#G��$@p%r4(����t����e6k�z,l'��<��b�)j�{KZܸJ�݈����Ap���!	:ȹ(	�_Vŏ�p��d_>_��ii�Ls�������b��u�� ��^b��}��JH��p�j<T�(H�L�x�Do2&9�_��y�>�`�Q���!J�0�hy���R�`����[�Bo/�S{���["|nC�ŉ�ݞ�g�~��M�o����A"dR�t60	nq�ZH��p
[��Q�Q�EI<������/gp�5����R�j���� �
  ^?�����_����QvQ{�w��H��J�;�]7�(T_��tK� �:EoOQ�C2v;�#8�仆Qc�����|c2�{�Rs}��(.j�޹�MъԻ��)P\���k�Ҽ҂L����J�k�1�!IX��}X>܊u����a��Z�@�w�$�7֠��hu0a��73���}�O?)��G�D.pE��n(��^�����E����$�����e����*��If /��{�m�#󜤊����$��}�dC��1d�2-� ��/��c#T�$��Sb���s��b=S��Χ��)%2�iC�ە��`���F��ԅgJ�3��β)��Z�&N��+[���lzq~�o��~}~�~y}�J���r�+���dݓZybqڶJ1xy�e6-]�pT���}����R�ϳ#�:[ϕ�K������Q+��	!Y������I��~_: ��ߊ������IV�s8�(��fd�r�wMl�W���0k��Og�2�}�j�.��ȍ�����M�S���P�B�
�5 �&)��x�m����k�qM]�)u��.%�b"o�R ������!�R����@����)��4#��G� Mݷ��'۷���FNƲ�kZ������ ��O�Ct�,ĊB�����|�bQhg�#����"�Oy�n[G�E��҆��'�G����{��������.	�t�^q���4n�(6�R��g}�jXi�Ä��v����Q#4��������c9/J����'@ t��*�t��;h����Y5g��W;6�
Ѳ*�G�5.m/���&t��,ބ�,��zȺ�2���
0��	���PC��w��w
���t��f<Y%g�n�pK�Uߋ- `�;j�l%q�h��#��/�d��b�uM�4R4���hޮ�y�A6BZ�2q��S������4+�F�Pk��Y�;��=h���c��Z���ȵi��p�Ş������|�l�»bA �"�^5��n7X�<�[���*���n�o��h5�������Ə�U�/�Pq)z�����Y	TF�e��vY�)`��f��$#����҂�@6�LEr��,�be��fY2?N��³8��o~���l��Cِ�%���V�]�Q*Y��g�Iծ֣��Y�g��k��<�!�=#����1ڡ�7b����������M`-_(��Aw��BF�ңB5T�~�&gĞ1I`��=�aL���D�T(6&Y���e��rW�fF}�����w��m��)N%���B�A��q"c3�`���Ʞ|��(P��b�ܨ��gjI�Mt�bz�8R�l�)���40ߠ@���8���#�	U30ˤ;N��AV�Ei�a�r;y@pkE���Q��6�Z��x�Lt�Xx�y�-�E���zA�~ ������j��"%��aYB\Թt��fQ(��eSV�y��1!L�e�,*3��@�0���)
:/[l����EC�2Rud�ĥ�Yᮅ�RŐѸ�cg��H
C5#�ᢾ_|R�������l)@�Jh����*�y´��Vs"]F�ꪝx4��ܫ8G�I6S&�6U�M�pm�)�-��uMm6�>���~}������+mJ���J��\~\�B��?�_��pf_��v�+(��N�X/�[d�,�7�����hJ̸W�6�+*���m=����(��ׅ�������;Cx�uh^�!=����)���b���֔�/�y��Gr,�A�d���Cmj�n-��v�z�N��|���"�S�5$"Q��v��"��kWߴ¹��[t�lTr,�<d0H�m=�B�:S�Ya�u�e	�����}�ޠR���k�{wg�#�*󶡖�n�����Xy[w�G��Q�Ppf�\o��/q���1�nB4(|V;�����FR��_I���霎G��ݦb���Q�k�RôgFC����jzv%��n-k+ܬ�&��>�:���w����1>)f�E1��9��S��
HѰ�@�T���=���#�3���(g)�bpOњ���&o����3'$����	�_�w��B��ۅ��KA��%)�gII������JOx� �ހ`C�
HF�|��Ps�,�/��j�w�6����%n��{�힕i�OZ_Z	���x�u��d����^�8#�2=��H1+ق< pt���FXx���y���[hm�C���ؗ%x�������~Q��Q�'�/N\�,�E���@;�j�3QU;���^�_�鴥`����0��ݎ�Ey��}p��4���D�Y,tפ7\��g-���`�]*C/���=�tܯ? �R�`���Dv�K�w��÷!����.K'��Cה��(��(�P�\���X]u��pЯ6[�����W�t�|}���F��F!b揔F4�#��>7��q��V�!�v;��s^&�Lj��,�����y}�k?$���P��RАi�Ӯ�JD�� �'
�.| $#�v���T>�nP�P%rğ���"Őϝ��:D�r��V� ����=#J������ԟt��填V��钮]B�\6Zpy�b2Y ��� ��J��)��R��d�#%~h�ӟq���/SNUbiG��?yv��(�~�x�`���6�Ek���i�<�t�jY>+����L�*��#��ʯ�-Tă�-����������m��f,��V�r����,ڣ��l��_D��r��Gݘ�x�Ï�]Hc	�b�������?�1�O      V   |   x�3�L�O.�M�+)�O�/I�7202�70�7��w�����-�*r�+8AҺf��
��V�&V&&z�&��\FD���4SC=###KK�i�Mvs�k��������	ȴ=... I�=�      X   N   x�3�L�O.�M�+)���/��7202�70�7���-�*r�9A�f��
��V�&VF�z���FF�\1z\\\ B�      N     x�=�ɱ�0�3̔�p����t��><Sfl�Ħ����W��\!�d&/ᣋ��͕%KW�-[���b�
qk!|���)q���q�md3(��Q2���L+�J�ا>�r9�s��t��u}��f'�lb�ip�Kl�g`=���S0�5���ி�#�]�&6�g�2k�P��9]�͚"5Q�=��_��(�Z���<�X�5��4K�{kwK���c�q[^�A[�fg�S�g���:k{u֎꬝U�N6����g�?|Q>������xh�      T      x������ � �      R      x������ � �      F      x�ܽ˒#Iv%���
��q��Ks���"�'����M	Y"C�&k�U3��^�+�|A/�C���^U������9���a���x*��q.�V<|9<?0B��O�>Pn(���Jj�����O�#���n��NPB~9ƨ���۾�V�������w���~}<_�/����R7����?����3�%��?�/x��_7��[+��������z�L���ib6R?�5���O�usj�+�)x�<��Z�?���q�|�v��?��G�x����_��/{�V�ϩ�_����zx���<����qe#��o��T0A��?����*��|:���n����#����F8[����C�x�w�#|�����-�h�D!��B���vc$ ���P��AFR��jx�0�\���a3i��(%Blyxn�?R&�/[a8��r��x8O����V����ꄘ������z>U���
_��V���l{<��Y�b@T��Jh �>�B�f���>+��K����v|�t���=�Pm�����ot�����a{����{��6�����	?���͹d�����Y;u�Cx~�0�e$�e�����m�\��c}x?�/��k_z�z���?W���r���9������
�@�2�j�tMx.%��a�*����8_��w��M'v���~��������S��I��
��!* (b��)�A���zCH��#Ha�$�8�F)� ��-µ��ͮ��g_���? �����$�*n�)(8x᭡S�xC�q��b��'u�(��"'u\��֯�	} ��=��O��	�C���
 �7pB�[QZiRW'_�Jԕ��Z�������zF��8Z���=$-�6zi�C��0��}q`�7�����>�j*��'0\`O�W�� s��^ˉY��@�@�u@kWw?A	|te��w(�eFn��2C��:�8������ȉ~�ۿ��_��?�^%A�� �ehA�]!^�>�/��3O���g��������h�{�xj��<.B�/"��el��z��x�.�υf,#d�HJ�Th7 KəD؈���S/e.R� -���G���qwj^. �suz>��#j���@��C&Ø��_H�+<�֋O	s�SxĲv����Y
D*�u � ��g��qB �QJ�:�C&8N��Cr�-�='�Q)�́<� (�N�_.�m�o�V���6������m瓆�ۂ8�@s5��1o\"�-�| �$�}jI��P�2�{	fY�5��CN�w��r��2S�q���ǯil���62�|m^��S�
������]��MkG8�Z���=�hH�*�~Jw�oP�/���\��؜O%Rp����3e�s�Ž�O|;i�����#hrs~Oqi �����������x!go�h-�ܕ�;�~���o1��sABԹ&��_|�BbN���]��W�=�G�u!���H�E�s�@������TH[��Gj�����3c���ڱ�\���>8S�W� ROh-�u��?@f�Y�C��� ���=~��c�@1Z��U��������+J��+D��y�w9�D0�L��N�H� ���R�t؂K��a����0����x����B�,|��dQçu���t�����:�J�y"���\�t����n��!ns��|�P�����1j��D�;|��c��D�Q�L6�e�"�+�mN�F�V�a�� �y�� �d��Noۼ�	q'&iq����m��r[q��D)�Kd��4����F
��eiY}se@r�=@�t���f�����W,���"
�.\���N�[�[[�7H��7}� �9ߑ��J�OkC�����r\�-xʲ�g��T��7|Xch�������h���Y1��ٿ��a���$��XⱲ�)�y=.gB��5V��`<�?��%V�*�
,�k�� u^��V�����\��R���0��h.<��:
�%Q0N:܏�9v�1�ʘP�����`��3c�,��P�����`�M��O�r�=J-61���u�7g�X�n�P�R��J��,��2-���9o T�������,��WU�i �E��-�
3��ނ���+��U�������=��+8	�a���i�u�L����!<l�A��`���o���/�K+��-��q�΅'�h��.��Jn�Km�b��o�`���J��찼�V3_ȃ��O������.RNU�z9�]G|�3���Bß� F��d��*�����G�&�:V߮��~�dA�R	���ˠ���x߆$�35܀�#���mZh� d�X);�r��L�u� :
�� 	IӨ�V(�'����ru�~�����x���_!:��ߏ;�OM����("J䬵��b#ٸ�ym,�����PD<a��s�Q_���"'�6�J�l\�ǳ�'�]1,6캲\ ��:����y����B�QD���U��M�͛�b�3�r�mq���+�m`�#k&
5"'�yc���+�߫-�8��Q�*�@-D�~V�ѥ>�q.G~a؋x9�Ɖ�_���T����	���[���#���%���0�}�w��<��t�~��_� "E�s�����lB`��ӳvO`����Y�I�?X�P\�
�L�w��)ӗ���� N2*�J	�/Q.��`,7b��G0y���p�����ŶB�t ��wP�=(�����[u����j�o�c���qI.O�To�}�R���eQ���!Md\+ȦZBE��q������E�gMiw�W���1�>��"�|�DF�3��X%?�t�
(X�Hరȹr�;0�Ju
����.��������hl'na\�a����G�Uۅ`AaYV�n���KNڨ�o0~Cf��ZFAU�毴
�5��G�����$FR� L3H0��{X�
z�a1��-��	�}Փ�P/��P���'��A�w�a�.%sË��i$1�9���Z�����ൢ�3�dL@���'�+
�4?�i0M�&���a���U/���Z�@�v5:�0��c6Y�T<_�so��K�,�����h���c��I��0����p@"3�&p*Q�y�=�����v�{�0,�e�=bV��Q�$b�`���ޱmw۷�I�\)�B&�F� �����:	�+i͖�B舽V n�@4k��!Bo ��?y�0��t�jY�6��٭lE5|�6^?D��r�%�g�R��86q�*	C6,!���F0��q��@e�A�� �j'��*y0V��-�tB+CKz`f�1�j81Ѧ�[J@�ͥ�M��M��"V#w�6��x1����0R$�~���U��O��`:_S�ё�Sr_t�t#u �
�H�Z{0_(=]�>lu�6���n�{]T�I����{�얁�D��a��Ѝ̨�����J���[~2��֋���l��A�^/a���_��������`��d���k�Pb�ՁCuf���ɬ��>�k�����ZA�Ԁ �|�T�����2��gRrDoM��ƭ�.����J�h��T�Ζ4�x2���R۸��/��0L=dIx�h�:AܦN�Ȃ%�q�6.� �о�5B!�@���H��#ВӮ-d��Ah-$�>�ۅ������MunG)����p�Q:	����s�m�x��m_��5:�n3�h��I*?��%oELd]���q �l�0g����Շ�v�t|ƆB�����=Y�"7���,�	�v�Jd"�l/:JM�RMN���JFs��`	�|�D�$ z`���S��Яd��ܳ���bc���\����-|9�V\�rR���������=Ȱf�چ�Ts=�^K%��L;���5����������h.��+�>��T�c�{��E�3,�D���YYF�Y:�5��OXKۡUݣ�:    �=�T��˵��˺�ր��a��q�;O�Xn"�C��Тg]!h��$��$���kh�����0�b1�Q�6Wr�k�G���}���Q�k�&�v���L�G+2SC�4%��>]��;�_ ��M������#��.eS�n�.�g������#U�2캎M�R �v��ɼ�+	�0���ӿ4��v�s�[���M�4�O�wS_�����I��
�.o��Ƽ�;AA�!���ޞd+~�o(��(-~.�}���ׯUr�k��j\=WI7����o�o�B+챸���W`{ �B�( ��Ž��]�K��6�xoH�|5Ŧn�DD�CSg|?T�J�]���|	��gA�t<\�=��R�0�(q]
d���*����ui���W�1d�l�ƕI��:�#x����W����\�..�9�a?t�r���G �d���kr���>� -}�=s�Q�|���S=?�J�J��t+�1\X/�/n�w���[�v���.q�1��m��I��՟ r�D^g4�-X�����ܔ�ŀ�[�~:���sC��*�F1V/�p`��W����m��{!1|怞��C���_=�����aX�k.��ߝ�K$L����g��Keڹ�L?����h��Fbu�N]��!݀�M��$\�"u�F�߫w7���/�<p�?�
�����t�⠴��y�4��D?��3y:���n��W�*�%�������s}85`;ޥ�|�@ ��-$$���)���5,� �k�FN��=@Ȓ�}�1�Ig����������I<7�Cm��Q
Z��M]%@��,s��:�`%X1W�sX����$ �E�n����O;LgC��Pc(چ9��׬E��b��13����Xʿf�3���y�fs�����"�r�q�=�L��Gm\�FQ�ϩ��?n_̜6��M,_.�gn��	�`9"Y��ʂ[")�N���"W[R�j��-���2I��S+^O _W<o�V0<b�f*hn����4����v��%.�w��ʂ���#�����2������U�����vU��,��E�E���z#&���g�4G��]7[���v���f�S�^��\d��2؏�O�0q���ͥ��!���B��3���C8Ｍ�,Q�����١;�>�'�8w*���|6{��B����>�X�l3��P�e�ҒN�{X�)��Q�+fZ�����A��,��<���@�k���"�
�s��nG4{�0z9U�.������R���v	?��ץ���_8��NOP%���+u����-ƉL*�RU�������6f[�>�q� �\Wǽ��Zmo��Q,���u��hG�_��$v��6�י�ܶ$��փ'��>�,�~ oN���{��a.��(��qD�d��vL�O�[�1�΄�
~n���PmA���a��5��ޒ8Žo�0+�O����{k��"�Hm��r=.dA>6Ir.�܆aο�K/���07"2��ہ��x�1uD�K6����/��wU��x�\5���+����_��r21��nѨ�5a-GH�=9�˕�8�>�Ay��S�:�K�d��Xh)�K�\��g|_h�|7�����3�Ͽ�)p��.��e8vp�r��~S�,<��Z�sʦ����u�s�öbjt�
�U:Es^׿=7�x/F�8fa��H�M�R�o����W��PL�G:p�'f�������}�����\�e?|�r�R���!�&<;�ʆ=8�nN3Pe@KҦ-p�}A/}yCa8m!���������M��Wj$c��}Q���>��d�<�L��S~%�S�B?V��q�j�{������	bJ��C��@���� 2`��o���&���f�o���O�H�t��=`�ye�4�Y���⎏@�W,�ϸ%��E� q�_��x�'���b���{���-q��L����r�rԸ8xH�&0Z˂�E���*J?���ÃE�}�/���cNS�K�Yӆ-�9�/G�'�M�H]?��x�A��F�6#Ĳ�����S���!�o�Ա���ɟt	�p���h$�Q��8z�����n���~7�f�N4Ⱦ��lq]�ݍ�).�/��e S=dȿ��¬�
�V�9�)�|G[��u�:J�4{��׸R�-���fw�#�e�NU�\sَ٬�όqAbܰ��ſkՌw0<�dt5����=�����-�L��_�y
@<x
y#O����
;Y��$n�gE�ӕ�%ყ�R�`)��-&�&���O��7X�#}@(b�k:��F�+�$.0q�cer�g��~�N�����t|q.�rh�62��XZ��"y�߰�}�֌���5��NR����O�i"�C�.������;��h3��^�1��r�_�Y�����'�0�[J ��~}�>�}�":�"��Kx��QTWM�?�`9�C�6�S���{5�$&�}}�f�^b��W��+gt$�-b[��UW"ݪ|攡��P�M|�[�p��ό9v/m
v����3�`�E`9�Y�p�!H��F�|�[x�I�F�v�0�r)A/I���*XH�[;R��YV�����ǹ小ЏRH,9��R?�)d�8o#<�3`[���mr�d�{K����3�'�(��D��b�IW�Hw��8�F�Vv�Đx�2��$�y��ìY��7)��f��E��vX�g�4��u�NZx];
0s�����#� �q�_��^B�`�P���
C��&_z��9��04�6�>�y���"ش�Ã|W�"斚�W&�1�&)�w�\�M�s�+P��'7���F��	i�m�_��f���n�p gRp�uȸ��3�:��` 놅�=s��F�E�I؄0���*=�X,�\�z�t�6����i�>��Z��� U�'@��t��ݹQ�܀���0x�ܚJ�(bq�s٭�$�}�On����GZ���{��֫�����MK!���09�ǡ�� ��	�b2>�Խqk��h�F����,GZx⏌JF}��d2lg>�t	����&P���-Z���s�_�F�3\���������$W.3�Vݣ ���W�4���@� �_:��g�.�ohj�����e���@b���=yE`� ���D��PMu���䈷���e1(J��`_^x���Mـ�i �_�5�8��`M/ w/묾���R>��ͪ�X�:��%?��h�M>���_����KZ�SOmh/�k"gfp���m8�����KEY�d1i��f�wÙ�>P�{����^�z�hؓ0�ȯ��5����0Ԇه!�w�} 
�k�B���aF?r���21r�D0^Eϔǻ��'��u������� q/�tO�dRh��$���M�r�\��4.��kp7 ���:Rì��\~��l��R��Gr	HJв�`�!����#���j� ��F� �=^��oh���Z�C���q����Tm����D��:��B�9]+�S��nXSd�ײ��*"�}�3$ q{�K#����UߪáM����ss~ý}l�aa7g�ܳ:��:�e��w�l} 2�c��Oq���n�A����
ʓ�"f��th,���	���GYa�_F�!�=Ց���߻ϱi��Ę�	�aj�� �k��X<6�tǑ�[R����	��޽�7�Jb����� ��ac6Qpn'��l����������wƱ�[����L�q߫\ y$2��n.������Q�
�����G[d�w1�Ā2�-����/�<�d4`&J0[<ZY� �MB�3 �/�����f��5��[C�MȦ��y�A����wk���d�e�pK��t���"�~O��_*4/�W�l���d}��@<�|x�{`?��B�c	���>tǞ9�P�D��Eg�ht�l����N���|j�`I4g����}w��ks������XM]�M���Һ��IGA�O`\�I��V�ȫ]���	��=ˡa'�u>���m{����p;�=�_����g7�    �UqmM����+4]��[:C��!i�0>�"�8W�I���#��n0u��6FL9�|mW(n0�˨,n�f*r_����q,�m�a,��E:����ڂ�)5V�{�,�����uK�X��s~�r�ˉ"���<�+�;p����!�#����4it��[�Ң钦i)���4U�!
�!$)h~]�;�I�����U'�c���`����j��
��1�OFjiM���'e��x!pu���]�$����؞O%ҺjE�ȨR����}�nō��(	�¶���C���gJ�{w�|��l�8�|m�xh�q�@�{n�a/CD*��F`/�ؔ��!g��"n�H����̮`�C���M��C���m�!���H��=Հ�@�q��\�V��:�Q�& ٟ����O�������H� �g�5�X;NwB)X`�=<p<�rvo���h���Q�|�WY\&U8�ф��z���"��D�֨a��]���+x0>�r��ˤI��Bڹ���;Q��}Art�˞Z	�+ѡ�ng�����J�`�wq7�A<�g> ��,�c��|�O��T	�����@>���� X�'0�s����*��%G�2���
R۵.v����^�g���~2X�� �-8:�M-ݓ3卅%�[���L �x�i)�Dj8$�gL�u�Ɍ)�?��&Ζ"O��c��Vc���xVA>��n�TXÕĉ���Nf$�Ue$�h6�ܫ�V#`g�KQ UОŋϳx���MI����w<A����CTO!�c!>s�#i5m�ra;��\����>Pˮ��x�)�/�dHEH݊7���L�q��Z���r������@�M"[��Ce_�A�mp�7�tIÂ���x��$h�!�c�}~����R�>�#�Y���8%,�ҍ��1u�-A�-��?��Vl|�����W}s��ea�$�gI��]��2��@)Ǳ�g_�]��H�L$�C$����f][�h�{8V�<Fjx�Hn�iC�R�{��]2�#%�?X���@��µ���;����׮��|Z�A��r�ZS����1����q"bK��%We�X�%��ԁY��C�)q�ͮJ-�6x	����QӐw#[C��nh֘�hhD;��4��)�S+=����D IS)d������m��n�`����Yn�R	�k<��@�X����+2�1z*e�<s�fx�:��Q����lq��wǈ�����g �\�� E��-�Xڂf��+~�O����E��]���>�B�Z"�.�H
��dj;�ծڃ�+<�#!��,�@��i�Q�3>�FW�Fǘ�C}���X�����b�����0�겧�y$A�	QB��e([�Xl�>~�t��q�1��ub,�����ı�Țm?���&L��'Վ��"�#)�[�Έ�|�wF���k�YD���+���H'��ah�x � �߅JNr(Ì���ܕ���î�F�̔�;u�'!%�$�2��� �ńW+�E��bQ�9Wϐ�i��@���]���e���=�C�I��Q���|Y�r�nQ�p�qt��a[@O�Kl�ոH���h��ʞ�uO�L��L��w7�S�x,ZE+���\&ȕ�p`�t�q[E��}t[��x1<̻"VOvVO.�ߵL�#�gNE*,q,���S�D�I�'i���N�����9AH�mF�G/t`�$W�d�^�������Sot��>#��׿��_�������������/���������	��8o�d2���-}
�1�1r�EG���x�{=��b$G��<!� 60f��p9v��p�f 1�P^��f��Q�LȈ�]�wt	��=Ȗp�n��Q�g=�ճ'Z8%�P����"��SxO�SWB�������Pe��e�e�kq�9l� 9҄��=1�-)!�j��C`�$ $gΒ
z@��q0n{=��
�h8'�{z��"k�f8�h{�� ޼�ކ�b��6J�J|%	^
�_�fa�df��W��>�Ml7��|*.K(p��#�3yxT_xC����_�M��[�K���$d����)��}2��_x�O��[�D����8�b,ϟ�y�x��8��ݽ��h
/?ۭR�e/���;�͟/G<��g�z6m��`7���>�z(^�G�>��N ,�K(aR׉E��e�myUә�Vʺ]&��(Ʋ�j���2��&���:����خ0j�%6�$�RG����/���O�z���cg�c"B�aB�F���ap��.�]���m7���3��dqgr����Zf\yC��d���/[e2�S>v1N���S�$��Ӻ�т�I�z)N�5���#0��W���c�����C���)@� ?���@�踬�-Y��� f�Հ�m�����p�"\ɡ�)K����32ᆜ���6^�bw�l!b]�Jj�g5�H�JVk�3�bG�� !MG�b��~�7���I�.ŉ��F�Ab�8���]���!�#m�@�c��t�ȟ�
���U�u&k@s��r���p���<��r-���Zj����(�[�л����π����]�%����s3�*o{���F$��&v
��DA8g���*��{�R'%7N82��2��0�3Ӗ}��j�����0T3������ �h��Vi���~%�T���u5`t.��NW�5���e�Ь�އ��%x��H��X��;fJdV��D�`+�Xo���kX
x�p�{Q�)�`�)�h��|1�53��a$DJ*�=�c3�Q�y\�"����3>�����s$�ߗtoDy��8ʛI�.���f�T�:5Ewk��d�l!sJ��4�7Lc/8A~\X�����S�i	���g�3!Ϲ���Y��Zʄ��Y�'�Ԩs]T��_J�N�gWv�D[�F�=�pI(���a�#��:Nf .۾_���x�Q�I�I!+VmҖ,�(�d�ۃT��Q��ZJ�52ZH��u3oTo�͘��-5R·9�#K��ɓ_e�l�э4�P�W�����3$]�pf�%�z���k;`�A��A��Uq��K~�dSr*0�nEɤD���f���^�<W��ix���j �-�_����U�v�R*�UJ��0���	��:��a�ű�S  ���:X^�_Z51�"���8|~��K�d#ف��>A�-h�{Xn�B���O�Tsd�]�$^h띅��g�U����h��	�-*�!��Z�	��1~ǸQ��/�n�՛�ƒ��l+�ɳJI��퇖h�]ID����"�c֢w�d�0> ���]�B�mPF6�κIjYD��<�{nNch���7��ȵZܻ�PPN��a�<-B�N�0`E��`~�/[�]r��*�y��]��=ݫ��ƃ
��I�ig�czZ��ĵ����C�}���mLk5Z����3r������U���hH)�9��Rɕ=���=���Ǿ��yP��	۞�,�A���>Ɂ�{m!Z:��[cDnl�'�=9M���s��~�S�0<8v1��(6��_���]o��5��A�f.���O��7��n�=U� ��$��҄�'^�����w3��y�ă�ޥ�Zn�g�!C 9��?n���ipaSx9�	Y�S��)�[(�}m��3~n���I	�;��d���d��dcЫ�a�q���2�L������-��KC7�o��:��}�A�]j�6.#��m_>#|��0�{5t�Nƍ�v�(�c�k������Ѽ{P�{�Q�t�{�,��		��w�{�TEi����z˒�Zʼ��Dt�0�Ը�6���9h_�?k��KN��J��\t�$��I�G;kSՌ��5\�5���n��r�����  �����)���;�}"�����Z��P6�����Ҿ����J�.��ʶ��*!9��l�������8�Ts(�̃��2��;܆��x�J'a��"����D�@CbJ�'��&׻��/.P�dq׎7C_������AF��G�]�=������AlmJ�0V���!K���ay�_+,��	�? �X� XP��}��gOH�rwL$    j�ps�ʱ*[%�"-d2��x?U��� 	�����R+�*]����F
�eXy���+��S���U �2����)���T���Oh��`�w���?a��q*��T  ��}�dj_���2 ᶺKS �+"��
C��3���e4z��x�f��i�Қ�:ER"�r(%�)�-�u7�j&�-)��x�UQ����ej��A�ڰ_�{���=��G�^b���'��Bm����Z��̇u ��w;ߎ��թ��mՎM��#�@�/a��!�N6��YR�j_�A��
�k�]#$�*[�vO�Rx���)?�F�Dұ�lA��,� [��38�r
gݽ��w�+�;d��39�%
�3G��(Z %��<W��W�2Q������G>_��2�|�p�`-]TWۦmm{�)���w�|W,�Lj?JD�.K��������/�1OFi�쯎�rw�1ػ����D���dˎ���2�G���χRE�y�5e"�����s�`9�̱��`���_.í�A>	������h�F���D�+d�o�k�#q[���n� {�4���@��Z,ڣ�H� ��'}R2	ҮQ�s�P�������� �IP���<�X�n7<��.-c�P-�4�2g&���ŋ��� !޺}FV^E������I�(�-�bh��2�i�B�S-�$�P����8C𖔦��T���Pg���R���f�AW�Ocf�Q���p�+�*������,�A�`T�������&ˉQ����)݋"��l������\�$�Đ�WB��u��u.q�4{������Z�(�E����d��w���9�4mRq��|%)(/�s�"���v����0#Z�����3i�-ϱO��a7]zÔ�/�����É��C�N��Vʱ��JC
Ƹ]��\�т�=L�<���Bc"'+&uT�2�dLN��$]]jz����hOO ���b�m���*:�v⬣hf�:hk�T��"�+�%�q[iI7��ջ���z<��G��m�l�#��!?nA+ �80���u�^������]C�)���Dޘ���W�!4{�iz�<�;:��(c�UA�jb@yY��N+�#�J(��$��T����$��ˡrL��kS��V�/�s;I$%�H�4�ʀwEO*K�o��*ъ���G�����.��t &��J7�=�އ�P���#��<�����s<��@�* �� c�&�N��L�1�99[4ېM�?���P,)�	!�x�P����9�o�^�KS��u))��>���a?d^���;��B�=�N5`f�e^$,�`�qBΚ������ǲx>�FOnA$d�K;.d���O��ގЀM�8�RwqWo0�1�f|���X�D��t��SX�gRX���Υ�{�B�^�;�<sg�ViM�+�2�1����Z���2��۾�>�����c�mA�<?�6$Ǐ���ͩ�r9_.n�^	i �E�?f_�����#���E5�	�v�������Y�D)U��F���6��mcMҭ����^���6�
�>������d<LtƙN�u\�S��!n�ESV<��cib���A:ۜ��k�{��9>B��pv���K����]�Z�J�N���&ڒrx�_�H�M����d���
�U-ޱ:b�y;��&�%��{�UW�4Ry�J3�܍���Ф��2�UIJ���k� i�5�.K[:��-P��P�j���s�&��l���q[��%��q��� �ߔX��`qU�Z!e�����Ww��9S���B�V"\9�R[��t'i�NfY�t��4U��g�s:�rwԃ�ta`P�rs��HW�T�������h��`�?�?�y��iIҢ�ng����F��`���v��x���!��
�����{�	��d�rSL�����_ʴ�k��V�I閷!�cչЎ���`z�C����:�6��	_��h�d%��T�`��dz��*$�~K�X`Ħ׾�d�U[A��l9S�!�+H�-UB�o���^ۈW��;�8�e��3��8�hR��c�_??�ik�� ��fw�%���xM^�?"��c8��s�$�µ�-�3�=6�!ѡ�CꝄ,)�h��.]�SO����3�x�������x��G
A�۸�-��{�%b�pxzME}iS-_@Ϭ��wW�n^G_���E
2_������A9PM�~\>|��r���_dz����F��s���Ot#��r��p-�bN�r#ң�\�F������ɂ�x��zC�Z_c�;.�\��5��G2+�wx�n�8������n6F&T�����n��ݤ�95výp�Ot�Ju8f�����.��K@���o[�d*)�!ZaJ�Y���N�H�4�(gAG7A��" �Q���jf������o���R\��4�iY�3�Q0H`�\���&��$�r�sw���UA��p�ՔZI}��r�{�3L�h��|�TJ��j��3�Խ���'��9���n߂�Bގ)�L� �Η�����7c8zy=J���G#ﰲ��4e棯��=g��M$i�h�`$e�\F�(�mӶ�ÎR���\CW�	���[������On��s�'���	`�B�o8�n����]Q7:��ᘶ�dqM2:ӇI�K/ �� V{�ե��^i����{,=�y�R8y$�д��ɑ,7�WF�5T_!%hN g؏l�I�e�L��=<l]�ʹ�C�{>���L�~_9"�L�`ԡ=oq*#��2����{�E�G�R��9Q �YE��%���b�/G��o��; 7��Y	���_��V�|"�!�.����#��e�%̢�#)�����6dQl�K\�=�n��D��s�Z��!�lΥ���9�.YǓ_Lg�'c�<}c�XIo�TʣF�":��e��=��s`�o.�"�� ���#�3J���ߍC�5�d4�p�2Tc�ya��g�򦬭���έF?@�ī_���#=\0f��'c)��I[�&r� pk��b8���2d��BF��f�țčӑ�E ��؜����Cc7�yù��8$�ʂ���sU���>!�l÷���ok�O.�h邈�!�i�o�f���?��Ow�3QR?�$K�K��WȰ�'��饉���S%��x(??��*��T��T(��QQ3Mz˲�:�V�T������	~O�\�\I�,+H��i�L"��Og>q�UP�[�Ԏ���Ao~T��&Ky.7�������P:����VR-�êQ%�A Z��!7��4��j��g��,�Ff\�����c
	0�|%h��7���b���u��W]�#��_�nl7�޵��=c����ضۧ!�\k�j����p��`�
~�f9���$6��x�HH��&0N�����^���BI�" �uN�JjJ������!�]@L�+_��˄69���}�H�뾗SX�cV�@��e�֩4&1�油����34����{��%f�p$.�O���P��?I���wO�=�a�*��A��|��Ɖ^Q���L�s{���:��Q��F�[g�,����r�e�a7_���V�ؔ˸�l�s֧=a��	g������s���F���ʘ}Dp��2�}rCr<��j�!h_c����|9�7��H)_k��E`q����d�CHa
^TIq%Od(-������2��Eźl �Hq��ݚ��	�d[�x(�ORߤ4�FwY��7��!s]{l�`x�1��$q@x�Z��[�������eWT�2��~ҍ�TԧJ���I�U\Β�����H�]�l$o�めW�K��]	_ ��|<���Q#��j���������-;�6��q__ĩu����>�-ǧ\��Y>�?�Hg���;
)��g����>��/�ek��	�R���#P��e@H-��GI��W09�b8�t|w�{-�O��'���i|��u@{-�k˛�'q��%J�y[yE�Ƽ��8��A ɉ���ܞQXz}�ꄌC\x�W�S�UtN�x������#*�    ���ˠ�E�;c���sE����XT�h�c���8�M���1�&[\�Ժ�S?��9��lZ�Lf�a�ޟj	��+���v/pٍ�P\^�E�v�!�J���9~�@�L��P��"�YIԶ
� �g�����������`0!�6t2!r�s���]�8w�.w��Tk\f�M>�C:K�;
$RM�AYO_���(VP�����'�i���T�B�Aw�
4��Xг��[���(����l��6�����`t9W� ��}o�[���w���T��ґcr����X�qpjC�M�\A|�cp���~`�p�B��a�*�E߈	��l��F��T�W�n�|���K� ��%�?yP�Tn��3l�X��]QwC+���������������_�y�nd2Vr{��I�M��2�y���gn�H�L̂������#]|G����r�n8�/���?-b�"�7��i�rf�Z�a�&�zopWf�C\��0�����}oAQ,m�L�d/O�	���\%�i�[(z���	�;��8	Q���A�D��_6�uE��.�TI��O���8U�F%]�v}�J���9D���2)�z�'���K�R'�
�2
7S�V���Q�s���_j���O��oo$,W��T�#��F��]�P��Hw�R7��l��Yxi�{/;��9k�{�U�_/�;5�1k�
O�
/H�� ����10?�=�\k�� c�!(����V��� �ߑIGe��f8)x�W�%8ģJ�<�e��78v<5�eW� ��25�K�6m��u�~�3��+>�a�����}�Ǭ�x�GjLJ�(W���4�H��쏮�]3=	�Ԩ�\*H��VH�i�__Ʊ��>�%�}:�^�0�@�.�Goڶ�;���x����#�"����oۗBc�F�^?x�yM�O�F� ��fEv�)#{2{��?
d�CNU@���L>u�k<�%%���
p�d��荌]�J 3`���W�HW���	����*���Y>��if�!R��,Io���:x?p��+:��ݻv35�I�8N��$)M�UjL}��Ә�W(3�X��!RBdiE�9OC �����C �~�]O? ^��GJ����2�8.,��Y�d
�yn�����.iָ߬��-wT=L����I�\��v�`�bN�.� �3Na�뢐yf�A�3�TU��N�8$���!Ma�2UFѦ��A�O�S��?7�GP��r�'�\x�ޘ��.|�ĥJ��؁�*ѻQ"��ңz�u��QG+�ve�?�P�J2���4�w�n9��0�"��}�����͵����	ܨ�0�X�9�c~�dm�y�p�����F�Qc�Q� V�mJX�?x�~R�&	�rS!��j��TvS� ��@
[\!�C�npU4u���Q���(���h��zέ�h�$f���,jeEK�pd$���6��m�8���$���1	
Q$XW�Ӥ�D�I�f=�[�>�29���D�V��`��Gp��0�����F�e)η��]߸hh
>��b|r�r6������s�! F�&�[E��|�B���M٥$���5���K�<C�y�J<����Q�t9���V��c�v����u2��ʌFwq0�X�|a��݉�ָ,���E��v����Hc��/Or��Ҫ�D�T2!���K4��gR"tF��;�`u-R�}l�L�A�٫;N5*�KW�5+�j|o���x��E� ��]Ӄ/mv���c�%Q��*�6�z�O�=�݉@�9b���%ukE���>?29�>��?ġ���CΐڞZ�L\�0����"s������~�2dW�J�Q��g�]9u+b���S�A���e<E�x	���`�[�Ѭ%�|��7f�T[C�D]&s�@#�8�R�����KZ��_ ���Su8����!`�H��W�<ӂv�r}�[m�M���7��W
�Tt$+�9u��-~ê��ϴ��!��������I�5�%l$�A�E��c�%�
��7�Q���7Y5C�b�GsP��z�Ih��]𞷣b��L<�tZw�3G���*��leC�.H{�On&0dw	22Qe��ԇ�:�4�����I���kV�22%�r�m���2ŝ���/��5�~��%OQqȂEU�Fg���L�OB��I'՘��*��E�KD8SN�Gv�j��Q_
q�xp��nyI�oS 2:+I���i�s?�`�
�}|�]vei
1��
���e�fo'��n[1�o�vR�A4R^��"���Zy5Qؑ��:�=�pZu�)g �{VݪG;Ӡ)��9�,Lty`&:�?��g&���6w�O�¤Y8�eM���U���u�=�U��k7��5�Q��v�~I���Q%٘��<N�V�
xU�;T�a�KQ����J���U �QF:��Uڵ�I�&���-d���>�!��� V����3w�^0kx�7� �e\��
&����xb�t��\,<�SZ�D�|��:%5:�}Y��D ��zwq3]/Wז��sp������Z�P��ˆ��"�蔸�qOƝ��,�%A#����d}�/�W���nɣB�bc�KL
�b9X����LWfc!I<���$�ͬR<c��z��k����p�Ƨ�9hk8DrF�O�W0)�{E1��]A$�)AsGc h5��L��H��%��ˍ�� ��wZ�a-�0L_Rl}O����v��Q�L%Ϥ�3�a�Y����,_��ޟ��G���bQI2RL!������b�sDn�\�r44m�/i�1ub����r�(�f�d�g_�$�Zk�?Z2�6���,�"vҔ�!	���Z	g��A�@������I���Y���`�DlxQ��Թ d^���;UER{��$3S�Q<h �3m����Jp��{�~O��}�V��E&�2��K@�L���je�s�a�W/�s����]�������Daf�e�f�-#�t9Ƽ��6],Of���؀-��#3� H�x��/��G)���`�R�fW��cV����5p�1"��m<.��x}�Ԁ�	,��B����y07�S�$��ܹR�ܹ�<�,_͞}8֨)�a d }K�S�Ȕ ���V��� �{�9��l<��9����u�H>UϮ��R�h�lY�Q���~��]���'3������+Kj�[��.;���?���*CK.R�
J�K������$T��������z�X/}��m�ւ(H� ,�<�n2[PT?��#ۣ��d���;(f���L�\ ����n���eQ#Y�>|3�Qfnd��A�Y*["6�-�N1��R��,i����������R8-!�/H)U��47�p+�9.oa0�°:�)0�C�SI%L�ߧ���y�V��B��'ZNѢ�+ǩ%�[���Χ�$e	�Bk�A'>���,O�����O���DJmq(���A$� ��fт����P��"������
���R�p���2K��<�#F��؄`�eOe�R���3���Z�3碉�1�8F�ў�&J����� �$%�1eS�X3�����$UI�h�{Bpy��,�x��w�н�/�P�p�� �L�d��������5�g!G�]ZL�_��M���:¡�;�
8��QM�&�'G�^��/���Į����i*`����t R����FŮƔ�۩��j<]��'j�Dj�z�+٣ƥ�m���(�h��+�,z�
!+���Od��|���~����R���P��`s�-��+����`ɒX�Q1��4��#i�a�V�o8�;�
AA%$��5�_j����λ�m)�d������W�����F>���4_B!�OW�ј��(���L_iz5j����x¹xHg�\BZ�s��y�� 1�ܻ�@���1�����;�Ű�_��HV�����f����%���4{G'![�T!d��9}�.��L��� �F6Ln�Yr햀�$`�0���
��ZJBk�dQ6.��Q�&�&}�R�E7�=^L/�m��?"��Mp|��+zN0}�s�7M��'K��� YYܦ��E!�!��Pm{<�=     l>A ��_ a�@�$�t|t�II�B[]�]�y�Y��'nsQ�M�xr�:�dӓ���ٗ�=�z�d)v[Q7AX"�h�i.�Im-p���?�.�_Q��I��zo8Y�i��t����r��j���;u�(�T0�=��Ҩ7�A�' ��87�zX��˗#�<z�\�e\7�M�9�.9��x�*S�#�$P;	�<��	t70S(ε@���P�[�S��a�iln��7�%Չl��%����Q?��T�"8e�o$C T�7ڶ��}�P��� dc+@.:6O-�����-�JN�xyb	���.�Q�j�R�����0t�^�?9�M����/3� �?��<��&C�pc�i���$u%���}�&����~W��i?ct�ψEN���%��1���,	���C�25�^��� �N"��8�̙�賠��_I�D�S�=��qx�U4��=��0�j�Io9.�N6��}�ޱ��Óvn9\8$ZKTH���זYd���m����I!��4�v��s���|��ŧo��d���6�5�R
�f8ΐ��sj�g]l�Z��fH>���$Vl�}��O��ݎ�Y�ZAHs�1Ad��/�$?��~\��Q��&E��	�
 ��g&v��xbw�/��O��V��r~������J�&��3��k/��t��_[j�r	G��I�z�n�����w��hEc�H�?Z�u��d�q]����Xfop(%�g����[W�V��#�M�Jh�������5��ѱ'����x�J���Q��^�Ao'��.zr��eva:��� �U7q�&n�X�'nn~�Z
����CY2}}�.��ڿ��p�e�/�ƱĶ�#�+:.$Bk��&֛��^� r���A�BaY蔡s^`A!��Ȅ�e�5�x�B�rA<+��\�R2Q���؄a�,��&>�rgY�΃y��E�0�h�q��|�@�������1>�ྫྷQ%�~��fT)v�6���	c2D*TC�RZ�;��4�w�q��7Bɝ��T�l�T�b'�t����1k�ȶ�E�g����Д&���S\�.FN�6��Rs��J�h����	���Wk��DL�T4�2�bf��!@i���n�k6�h�î�&>H�=���5:/g"܀5��,ɨ�Ns�'�^m�=��4 �C�F�-J�"B7F�~����}"�I����������:c�ꏬ�k��"Y����21��)�[�!��,�,:����4��W�.��3~�����w��nM�~�:�\�
ua�?N��%˛w)��d��R0Z��V�͘�b���S�2`�P\�/�rɋ�c*F����b���<<f��rԏug�m(���WY^�W�� ë���{�����V�6���zۇ�]�l�;G r�s��˙���#w������>�wGq1s�`+��I֏dhBd�%�e+ptY2`��`O�:9KW�ֶp�����O��=ݦ����>I�x�f�2�����w\'L�wn�T���&<�>l���ђ��H�n~�h�� DJ��H��8�Ip��؁ e��ee�5��65'^�B��l��o?�)�v��H>�x��p�ȉ'�65G��ئ��I?F
Ǭ�t���!0�v��8Uw�\.�IQf���TN�+��dӰ���$b턧�g��Y���o�1HRu�����Bz��r������N��[�9h���XH&K�����������Ϊ��!J�Ps�1���z�iٻjվ>#�=HWH�[�vp��-�|		Qk�n������� X�3t,�b��Vަ�s2ͷ��!CK�!�r!(|�װ����`�O #	��^���� ��1:9r8w��N�.��8\�I���Lk��q�7V�b�ƒK?�^����}gP���2�߰o#���j��-�lʅm?�N����3���)l�e�����4�v��%�v��yu�G(�A��s�4��*���
�#������L<����sw�X�i����I�S�:L2X�����Q�Z[�
Wa��_��8�K�l�d��|�g���k�淅Q�@9yT�1!e�ᅾ}K?��O�/�; 1����jL&�H�§���C��d.�]3g[�����b���
�e���#��<5��zU����M��p9�i��%�XHc����J�sA��Y�+�3],D*����0�W"�țу�z(�B=��Qָ��Ll��]C]�o�3_����%<���)ۿ?��o�K��>����|=)J������)e�x�D��u�]�Vk���N.��	y�T?�F� U�������
����������/���������YIT6��p��.ց�w���:x�S��O7W�UQ]�H�<噙��z	���AX1�֗�?�i9%qRVY��8�qG,�k����xq�;�h?:�e��.r�v�t�U x��1��%��c��M�D�������t��@��?�Aic��y��H���OL#�*��������_J�]�����o0��G|��&|`�e��՛N����u�C4��u�0�M3'�h)7�/����K�uw�;GH���+r�� �Aߐ�С���.":ާn�
�Nlv����m��;T�Rb�I,BA�����{��\��3�E��wO���=n.����=_�S(!	ĩ�v�a�@��)����&!ܳ����SK�Aen�\�6�O�����w) )y��$1�&�!�]uD�;{�\����`�c�sׅ��[� �|A:Ǉ� vM:�Y�c��Ф?��ݬl�����-�]�Z�N\@��d"}2���)��
�y)WlӴ��#׀�6mT���OS7�i������W��{���uTV�����a�!�Hx��$:�Jb�gM�Q_g���8�Bϧ�2S�O�Vb���P��/��s�d�����2�)��FjLoҪ�Ξފ3y� fl������Ds��b�ȶ�ݫ���l J!�r�?�?u5����'�&`S�����ݒW������O�����٭�%Qs��!��StO  f�"o{Pڑ��%�nz>:�%���WȋDv�ox��sX%x:�w�ԕ��n�ݪ#�?Эb��@τ���%������o��Eӭ7Z�]!Hn!h��X������ߢv�4^��@��QF�ƅ�#�v~C�%$���/ ݯ���az>�)^��j�ɗ�݋�ڦ�6��ّ�/��\���y��������Wэ�D]	]�M̧U,E��଎��:z�"%�)��(d�V�8�>����],n��]�������C� ��ҵ�An&��`o<�^=f�՚�h.B/͍�\��:ʾ%	��Ś�2��=��L-Ej�3�nDز*�#q�F�&��oAt�ۡ�L��FD|�+���������V��s���7@4[�y��'j��1E�Ll8ow:�:i�X�̽\eS��k{��x}r��5��
;��p:&s�+\ֻ�K�T��]��A�@&;U��5�p�J�pǆ�i�n��2��#8�����45
[3,�h���:m��9D� �����U9�VfC'Y������W�]q
�4Yh�[�2ep'h��C�6US���Fx-��#{�C�Ai7�?�b5��NA-7at�d4�Ͽ������z�]��/�0����[�V��ȕ;C:3b�7��-�Oxx���9be�Rh~ɿ������=��}�&���T��2�{Xq[�an��"x��l��_�9�^*^�E�5����E�f�Mt� �{�0S�.�Ϸ�)'�A�T����E�Ȼ/��^=O�|Wbk[�A
���*��d�j��{��Q7G/R���L陛�8�A�*����>��QqC��6���^կi	�n�2G�����	Դct��.��.ҽ�E�s*�Vu!>;����<A412,/���A�ʳ��T��4���'<Ԗ�*�eJ��2�.�4@[M����I*[�.�./ȬI�)M f|��}�K/l����׷�mz��6=��^�������ug��_!$V[����V�с�Dm�w���zw��n ���]k��&s�=�3��    ����<G�9�U6o�Q��K�F��hWhA���|�H�j}~G+�`)a�0U2Co�_xK~G�!�Z��S��=,�;[8�c!|lz,htv������[��IJ͸�%�F�fD�[T�5��4%�kiܴ��� ���KG��-�	�e���6������86�����3�p�1$���*&g����`$����{��\g�$qA�Э�.�Z���m�'��0�&c��hTo�kT`Vl�����Z��[��wl,-\>��D�9�,J|�ߨ;�FQ�<KR����^1�-`q���"��Y���3D���a�:�/ ��c�m�B���>�V5��y�dL1=@��܆Zd�@`qy�by�9�(�H�gw!_
�<)(���~��?��Z�����b՘0}φ���ԣ%Sh�v�#��F���vכzWJní,H�4g���̽@8��O������&S	���k>[4����C@�0�$�<C��3K���9�1|Z�3ǜp�C�~��A���w�+�;�g��p�*2��I��j9�����툓W�[��s��,\*S]�C�&Ǿ��RT���6a���QǷV���M=<������5gI��,� m�\^Jsyi~��z@�v���$	��k*˃��4HI5F ?+%�<!{*,�1�]��އxYБ`-��P�\'�N�Rd�冖4�𳴕�5�}IF3�NSW�,�����ƌ-�l��P���S�: 5�Cr�VcW�Gp�:q�J�q�FQ�L��r��_�Y��\��p h.j��MR`e�8
��B� ��������S��L��C͊��c�'�!>h��3h��Ąp%���V��e̋Ut�K�]�#�!]�p�$�S�%�.�.�}3�t!EA���������)b8STjf\(�����BSM�S�/+^�p�]�6_�L��i�l�ty�_q"J3��KZ5�@�[b=�QK2������&�?D#g�\N�$�i��a��u�@Z�Z��5<��l�����]{����q���$z~?K�R:��S�s�K�V����^_y+%�
��W�N�&�{��(�p����),���!���&z�/}��3]�*ȸh��h)���#�6�����0�풯�����&������I5 v\�ӒHUT�7�\���MW@�?�`�D�Θ���-����VaUk(����@U����(xm���t�ϔ t6I��O�l�rp3%��:��̗6X���N���6׍�RS�:1*����~��E?6[f,;���v�J�#�l�8�Z��Û[V��e�!�/G�'�)mԅ��#��t�g��l8��T&ڝ��?_ �vp��%�@+�*B�j#�&���U�b��5u<�/��:��4<@� ߜl�/��`�q{uw��p�)^����g�V�9���"e�8RO��W1�kJ*ZTe����6��t�!'���j��<6��K��`9)�2[��D�h0G�d���!%<�?�H��^�r;
�5����iR�rw|�2�{r� ǹ١���J�����z���/�y�<����q,���B��J�/���豧�ٽ7"A㙛��Ľ|�z�a��ʸ�'�Zߏ�]H�J�X
Mq� �OL2PW~� b�dH>5|ܟ�_,�R���2h�? w�˾��u�n��@����lI�x�2Z5�&���MJ�R&Qta���ʮZ`EVM��~oJU�e/-d���A�*S����ri�'R�J�Z�'H�6��߈��R�t�Mw~���SN�����L
8!#!��p7?t��I"n(k���}�e�5m��.�����p��3ʁ�`AiI��z0.���|t���i��� iSJ�f����Mn���o�/xɠ�ﻊ_{�X�V5��`؆Tq�?�ӑށ'���6Uh	�� �|xT�>����80���撿���5��Yl�2��H �g������_Kۚ���u	-���?���K-mQ>@(�g=�x��S�a��4^�ā�(� ������N�7�!�\�����i dϧ��@�!�j��!��d@RR?�|&�d���K&t*�Gϩ�Sb�m��ȧ�D��l鮽�M��SO �̩��]� Շ�ǵ>ǩ�*9��[<<����:?6���&|c��g���k�qTՐ4��h;i��EÝ���\�Oٰ4��GT�/%]2'�%�QL)��.[�=�H����b���r�+ķ܀]�V��Z�L�F�0
�L���\+V�d����a���}�O��D�oǢ͐ؑ��~�{c����1}�<ĭ"�W�i���t�kNç��k�ё{6����'�T�������+fT�*yQ�Iė�-+�c��z��+�����.��5�r��@c�K�z_�s�^��[d�Qx@][Vo�s��T����^��n��9�He��'�J�v�����.���\����y5X(4���i�v��'MR��D^�y�gҨY��_/�k7ZW��+ πg�
JHj�J!!	�t��to�X=Z\�@�H��_�f�r�8298W�yY����I����=�p�|r����x�|��\���o�o��t�[$�s�V&�����2�b=_���� �d��o'��bWQ"�#ǱI.����-���h��L9[6j�=
����z��e��^�]��n��aZ4�#����x�'?�a2�jT��NQ}2��Lw>S���ơa��o�������� ����P���i����;��6�#�/�	�׊ܾ����<�Oz�%��m�i�f���#�=&�-���������������0�y��9���&�Ƿ���Gk��P�~���)���b���ᗽ�1 ��������k��F��p^��ִ���zrQ�(a�&a����>�4=Iӧ���~�s.ވ)����J���AH!��h�f�j�/t�Nk�(�Bent��%^K}�|���K�����'\k�ӆ����Dr,��T;LP�F韙���̺����l�A����e���ԟ�w��<| ������"Ddɐ��y[��rүn�P�l)\�R���ӂ5t������+�]�~�b���E��a����]��H�-�5���a��K"3�`�b�J��bD�o�t��_��N�,�C��ZU��a��n�� ��V�b�j����ӯ�:c3��?��՘ь��N��'"2��f� �g�����Ǡ;�Q�#��瘗U��!�-���zo&HcL�ja�PH�q�I��>ۺ\�*�|wS�_Y����v��[������w�r�$��P��影�
˄�<@ȴQL݄ň�nH�5��Cɵ��ʰß�O�fc���X���X�!�	3ؤ��՞'<�
�q����hHC�ӎWS����vVf�2��y�>��";<�_U@V=�N�Ù��j�XN��ڐ�p�2�ҵ�x6���J���v�\rG����
 ���t�<�42�N���M�y���O�lf����: � D�,FQo���;쒷�~�*�����l?$&��!s�tp8W(�RG�/�}����޵!?-�E�:�l��b%_\�E�;m��\AjefURQ��Vl��D�}�~�=~�:��}�z��q�!ˬ�헻�>�U��J�ml3&��cy��h ��Q������Cd��Bl���!�boaE�5�1{U/�Q�C��eu�e%yw)� �rʠ5�2g[H���K@q�3���;�$\��X*Yy��S�G>k8]�;�v���e���r|E��gU���G�v�<���`=�T���jp��nE&�iqf�ṁ3Rk�6�Y�P��lP��JB��Ǧ�oG��+�}�[��̴��<x�Ql�k�ߞ}$��B��&�3L�U=�g�����R�1�N>�9^�璲�'(#�t�%5�X�BW�\�I]��S��݆�Mdj��#��`?��\����x
�|�ruw�h��8��۝}և���ZS#IgV�`��x����_<�Na��t��i�YU�^v�K� h�hRJ���0MC��
��P3^���z\UD���FJ#��{�W��&��킴*�~    ���l��W�����7Dh�v��Vݦ4��_�)}�m}x�rV�]|eel�aU��4��Nf��VzШX��DW6�w�A�rDa�<���ʕ0Ba�v� ���s��v��z?��� E���V�ёB#q�mya��<�#̃M�2:���h΢\�јԾ1��fh!��ĕ;Jt������ǒ�Y�[��v��q�P]gƽL�ud�>���m�t�/�AR���k�jr}�Vl�궒�i[%�՜!%�h3��x_C��F���.@EOd������iæ�U7�,x�-�C���S.��'].?4�H"X�����U>�2VCŊ��U)���̐1厍�I�%�v�sf�ʸ��W7�d8z��<~��rg�wו��y���sA��F�q<���]x��AZ��>Q�V�,��TP�&��<� �\��0�!����%p桖�,ϳ��%��^�.ky���@�e!�8Tru�_�y��Ƹ|E�a���09�	CB7�
��*!8ա!hTǩ+&Ɛ�B��V�O�k �e��0�.t:g@rs�`+I���(��(w CK�`kn���t��r�oٰi���	D5���z�C͛$\z��!�_�@e��d'�s�B.>��1��XfP�g�c_����i���d1ee�\�\��_��95 �X�3��H��#��Cud�pT���'
@�D �����a�5s�K�\gi��������=���V�e{YV�K�/�F�$�n`����ZL,1�GFSAL0b]�X��V�!
�V:ڧ.|�1*b��2�3����I�-��&"�p"Dz)����hQU������C����ˏ��T[��C0}Tp�cK���ey���.�r��6��"}�h?N��8�A,�\�`5EuQ�h2]k���)��+�6x�T��>z���m^�qV�Uꕸ$�t� w\��Iڴ��M��'�b�KܮcƖ�;%&���X�k���򪑑�qTߛ�ߤA����1�Y9!����v��}�-�,J�-�o���c�>�/-,�eQ�x�vY�{ѓL,�L������vذ1j�&z�:�+�:'-�B��:z{�A&���U�F���BAfWj�ģ�����#��{v�6���(�Fsq�c��.�	��M�\ϧ=rh>�ܾlx;Opgw�ǿ�N����P�`�C�k�E�T�\�1sl���Z"WDC ����'\Ɔ�����\���jv��k��ӏ��=�~g�m=�
�3��{<\5A�����(�&�^��Q._5o� �W�/zj�^HB~�nP3�ux�ty��W"���\���䩑(1�Z����ܨ�kH�]�xS�0t��v*�e��"���|�-�yixK�l�)��ɑ3X�v��6�l��ٴ���;vPb~��Uա5鯰�Llf�p���u#���U����v�;$ఖ
}�H���0����jlV�q��]���.�l�6QC�OY[�Ntq�#�s��̼b��k��{R���PYH��z�3��0a�C��J��u
����?r�+L����4ؘ�ܭ"�=��2;@\d%Lh/�!�_�(M�����S�268�;���P$谢�T	K4r�#}y����>u6��ˀ�;��n�Otn��L|�ގsX5��ær��ߴ$��J�k�0;��0�,g1�
�Y+�楫l��W�����8��V\�Cud��0� 5a�{�w�g���J|���AV��9�#]�.�>�pc�Iۥ�C��e�������3�r��Z��5��P�w7
��~����[�z?e�-��3|]�u�6��g�iƊ�Ջ%B1�م���(�w��5s�K��$y��65�b"�x�b��Te�vr�0����� ߰B.�~�(j.���N���&N3�9��K�_�Z�a�؏_5�6g<ѥ�e�*��X���J�l�?�Al�xN��a8�cu�!k����8��<"�(ꌦ�X:��
�o���O��!k,x�¹D9S��B�]XUL\N��zȿ�C5�����~���n������(�q\]�xx���+'�?�I��3~4��3r/U�w#����hۆ��`�_�BqE8�.1�Oa���l�KMFl��EH���_X�(x�|���8�sCbݣ���?Ҡ���
�Y�"�	ϋ�x�E��[�2��ֲּz��/���}�_l��6z(h7�8��i|M�]�Dy��\x5��ڱ�b�P:k��-Ǌ� v~�9�ǯ��Cbi:\,<'�K挨0[�㔑�%] � ^눣D�F-;\б:C#�C��f@�Y7�<��𥁤 '7ؓ�F�b֚K+�Vx�k��.X�H��&��mt�kUt4g*Z»���7����;�zv9\~co5���L�[lߘ�ڪ��ĩ��w�����<���o������Mn4�&ส��	�-�V?7��ƷT��:���}��nO6'At��t(����~�t~dƕ��i�a�xK�5��<g�X�Td�`^jl�)f�E�C��n����ZC ��*��� �;�pw}$��w��N��V���R��L�ʏF���*��UG�P�?����;|8̠�/���G�^�	�߄��ʕ�q��sð�)!xDqO	�V�K�$�ݑ�D%�Wȇ3����
>Z=�Qr���b����k�W�$�!�Ժ���0#Dl�6(�P���(�Y����u��|%1��6[��j�����d����(>vh���R8Y��T�(�@'�mF1s���J�{\Ԫ\B�/�O$��=�Y;a�א� ��>^���%օ�]\Q�)��lm�m���	�}�bJ"m�{��Y��F�W���������lxȬ�i��'��&������5�9�]fB�]?P����ˡI���9�5�9����p9[d��,�]���;�Sa�̨r�]$���s�kU9�m�w�<5�~;ӂ�<&@�!k�f�ɭڇ��|V�lm�sz�O�d���/��to?�H��$MR�{�iYa��,�v	������4�I 4jh^Wb�5��O3��OH�
��q'#F��W8C�{�ٰ�~��pL�
mu߽�����@���[�BnW5��Ȩ"m�BbrC��q���HVЀ̮�#p�Ү�Ep�����;v	�b�ޘ�9������~)4E��u:čK����U�re�SC���c���҉6��q�/��)�_d���\ Y�A�VfL��ky�c�x�8�pB�IӃ�R9�%/���DT"��L����9�I��HY�R�KH0�Uy��}v�����5�ۨ����3TT�#m^���s�3I�s���f�-^D�Id��	��;¨c��r`۷�;j<�	���<��d���"�7V�����p.(��� b\�ɒGΨ@6�)ݚe��j�tC�	�#�8ag6J�Lt'�$&m�	���Q{��I���fa�3�6gL.pW�� %]5�x�M�j�͡0�x�eG�=�"L�d�Ɩv
�@q�qӼ��c5��+�3m���²����='��kipK��:ʦ����mm j�5�|ɼ����a���h����L�:+"�+��p�/�L#Q.�?3���l6JP{�1�)��2{d3��!iD=rW�bo?����L���o���\R#��y�_�����?h�?w� �ؕ�`9����7������������ޢq��q��d�#�����T�ڻþK�)T]�a�W�W�bʥq����?����Zn+3._�B��Z����b���7�߾7�dvs��7����.����}��ʎ!�:�`J��
��2����,Gv����^p�/�{o�kd�'�s#s�r�<x���ɹ52��v����KD�NL�����w�h�����v}	�I�6�4������&�R�zm�� ���[�3�Y��U�ws��/q?v���	9�������Ϭ�X��[膄�d��/@,l�<��ݿuCH���U��"�i8X�P�h9���|k�Ӝ�/�a�ō�Vn��V+z�S    ٵ� ��F��.�cL�#�W��#y�[�*�6X���x�P�+��O��C�I��K���e\ѱ0�*�m.E��\�U��^�����k��9��ȵ�b)�/�R�����Ǽ����O��HW�gKd�o�B_��qeQ⻂S]'z�J���B����J\�:��۹�:Am��R�ے��H�A?�w�[A/��"X��:���!�.�8�s:��t���%��6��� �v>|>�u�����Z�Npe]E��l7T%��٘�*LgTL�q�P�!ZA!���N���2%� G�,�}H2��{�9^��t�%&�x�_D���iD�P�����9�F�xt8���p��=�2��tC\����v|:��(^�
��p��>Gz� VHއ�ٍ���Q���D�s�%_����}��|�?K7�PD�X��=8[.������rV�gLq���q�ܮ
>�"?)�ܯ[�8>h��Wة�sU��p>�H2N�j�p�ɰЧ;�Ay2&2_T����gr�śg�Sj_~>�^�b�e�����_��SC1r��:$2Y�>�@�Ywb�i����Ry6^���"rm� )�-RK��0$5�h�ء��F�[��$ȸ��~��	�7f�&|W�I]�S>"-�Ț�YZ�Z&���1�a��G\�fa�%a
�(s�|�Gb%OVO�z�d^��U.�Js!�u���G��}��=��q��S��F��e�����ܜl�K�:wYC�\qc˽?�-n�u�B�N�����hS�Y ��_-<{�7\S�%�uL��s��y���0]�l��ʉba(�5ؿ����)^i�Id�&Y�ٔyL���S�ҼBv�V�`3]�j�R�P2�Sߊ�tE��1�3X`kҺ�sL�Z�e}j��g$/y�gs���FC��6�8�J�Z"	��Ϡ1�Ȏ�}���60^������0O�����}�E�_�o/�z�Z��������[���w�1�I��F��'%�[	��Fd�.��u�J�&:#]���KD�ɬ�[Y�cG����'?���������=�.�s�ꂽ0�/[�N��~��q������j���mԍĚ$M�}`�g�z�%)\ZV��?� $�=��IҴՆ��ī��<k��Q>7�w��w�RS�4#��(�x�rﾬ��^�����X�
k��^jܙ��0oK�aP=?��n���Ď��OA./V������)�Ɔ^U�T�A�L�2N�H+�H�^i��5j/�eBH>�ꄥ��v�*�h��[/�Ռ���tH|uI_/��jp��F2���d�G����ʖ�.H;삗�'�N�eG�j���%&U т�Zl!���U}#(��o-�o4�������F��ᠮ�s^�m�����m���O���0gG�屃$�f+ 2*�L^����]h�i�ĭ�(��0��[���0_����x:��a����9��B*�ˢrt�΄����:є��n�ō�j�iZ+)�����y#�?�岚�Ƨ�����C����X�!�-[o���D�Sw?�[�\�l��D��3����
��[�]�H�;���1��"(�.�y+L������L4߀��6��榃X=�~�,
�-�N�wnd+a#��ϱ�h�8Ϧ����G����J��}i	[����"���� ��[$��V@�	?C_�q��[�@Ư�/� ?�T������\�L��d�v��?^Y#����'3aH��+I���H8�5^Qg��b��k��˗�!��#&��ɡ��B|U�z�A�Je��2��M2߉�%b.&�*�	0�uW��-UX�;q��N7���n5nM_W��$��R�?vl�@�H�~ǝ�S.�M�.�6w^+tb��5P�#�]�~X�颚��4�`�VQ���Q�;mE�z����J*CT]ڏ!��$!���+����
+�kR���g�!da��x����9��]\�Vctb?���WqG�h��a7����m������k�duNԢn���c�z�.�����Kdm�x�u�x])'�M0x��'J<޶pOP�%'/s�ߛ�a�c���^	zŭE8�E7s8�	kqE&���?���\ΌmBl�A�	�sf
�q|����iwؽB�����X�~�%�E�)���]A�.Q�1��m�ؤ��З�����=~mNO�{�A|�\�6���l��]�+�@�Qv�p(�� �b|�L ��Do1@:��7e���m�]���ެ"I�"�}�z�d��I��tAt�~wl詇O�%��%���T��T(��@k���,�PI��ъ��τ�u�+'�I�m��w���Cv�p�J�f���`�*��|,ۂ������Rt��`{(�t�s�\^���R���
�>��ƕ�0�%Û��nHc)f�N��:c�E�ܜ[k��m����[]��Н�k 2��]��kGO��#�Y�?~Gl��d��g�,�*�+c@�����P`�o�Ij�CV�_��n)�`�	F�UI�]��# π������i1Y��+�� ��)D7Y�a�\/�F�B��f���I�k��q!s۽�ck��D7��mn��
�/�s^# ��8�E�3޵��5#��E��Q�&��{ҐpЀ!ؕ� �QP�g����kK�:���G_�G�MA��3��T����|a��o^��_vo���λ�#�]�L�Z��6����@�]�Y;]&���hC+/�R���KYn`��O���t�����NN�ޓJp�X~�y>�u�ټP`5`xs��R�g`���tW����\�\>"e�j"���q�L�Ɠ�Q�jvq�j=JR�)O^sq�U �/�랻�N�~���Hy]�~gޣb��9 �Yӣ��]%��u���<�Iǣ�؇Q`�����=9亥'M�Ո��������p[�YA�r�iVk!Q�����/s�M@I���{�J�wr��Q�&l|ɂH�ܝ,��>H���O����o{d&�~beQ��f^��Hǂ�%O��f&U7��9���+&�bR�� ���,.O�K��-8��Wl}w�rq~F�����G0����Ejd:b��7n���Qi)��jm�SR�&=6�<�Itg���a�h�/�[��]D;E�cHp�LY�'�x��}[Yf�UM�)f��#���)��h=a��Tj�b�����������8������V[�ȣs�_%.�GOK�3��/��:�Fr�F���6*���g�Q�z�D`̓c�Ӯ��ƓN�$z˝Ȼ$g]3R���|H7�w�a�^ل,dF�w���.��[�t|FWd���R����&>�����(4�Svk����Fy�QJ��8����wŇI�}5�p��~�����ҽe��.!Q3%mx?q�[Hi҈:yΈ�`������YD>6��[�N���� \�)~�8�������|,;��#��i.�6([9@F
=��&ʋ�t0ρEKAV.���M\x0_����
E�<!�r���L/����4��ᮻlp��ԏ�ǻ���}7��E@$"p}}i�$�n��?wp'd�se��U�Iܷ���8���FRI�^���ޝIŲ�T��N�/k�+�Z;��T�Gb=\ȷD��ͭ����������W��p�<5iʠt �f�E���������x�O��b�")yh"� >�="b�^3��XM;9m7g�Ƀ�ڗ���xI���Q>k��v�Ftg~���
dVc3��]�'�/8��eft��Z�O�Yx��p@x����N�f���2��\��U5�I��?Z���/���-�����O�6��r�JgRM/eآ˫�̺ⵜ�s�;�2��������u����_BX`��R�z����1���\���3H�4�=\����aϙ�����*�\�Y)p%1�0�U"����G�+�J�!U�5o��Ìă�n�l&�$��~Ib�sW�0.��#�.���+xĽATrx��)�";g��ܖ��W�ϳ��c��U�ϝ ������Sp�0�����7U��D��"AR�e3���,7L��12߸��";����>������[    ���F�XM���}ԡ�Pb6*���������_����f�DcY�Y�m��^P�[�Rf�:��5Ѯ��Y�ÏuݓE��CV����U�<�r�̀*���6�yŒq^t?������\�X�=�o�����^ %WQ�+Ss�q�X�p�'{���R��|n���{�����mgaV���������L��,"�%��������.��٦Iߺ,��ZT�\D�1m����eh����|�!%D5!�vw|� �/�	������`� k��V�ڙNK�S�+����teڛ�1�5u���~�����n�n�}�LHP_������OeU[�eS��YuF�(�F�	T��k���|�aЖ�(\���t�'-���vS���}���h>Nh��=��PH��Y�g�%��.[�f���s�z��aD����*�P�ؔ��@��3�t�^�`��V��65����o4]Ùq�G-����Q�H��ɩ��z/7�"������yZ�+���ޥT+�XT��dK�B��1
zAފ�u��_	����[a�����R��T�v88�Z:��t��쨎E*+h���[+�7��_	UQ9���4�p��`Q:���-�No������dZ�tΔ��2��R��Qq��C���/܉�n�Ӹ۫�pu������ek�+��g�M�Ӫ=͖q���EȊԶb��7���Q�!���ˉDH�y\���W�I�v�f��W^������Ϫ;ALpi'O�\B֮��U�����W��3��?k��*��cYc	�RJ��bK�ͬy¬�М��z�Y��"2	wUf�JNˆ#X�J��Yݨ�!g�drj97�K{�j~ú1�~����(_����X�	�,#�o5̛lXr�O���(7���(�������S�`ÿQB�^.D�?5�'ڼC�2�^[��ù:��uF/�T�ch�s��H}l�ܸ<EF����_�_��~$ؙ@�o<��� �?艏`����;Ⳝ�\H+=�&�C�����(�&QbL��{:��։�d��ݖy�S�9)�b�6^��պ&�ʜ�7҇��mĬh�U�0������J;��,��t�.�0�#��h�=a �.w�H��D��.�DUUIT��h�N��n����l\"�*����BiEMY�7�:}�	��h�J���)�D���E�1]E��UP�r���e�\���T�
��
�qc?�"��W���ZT�X�t���p���Ӎ_�5�y	qk3Ϩ�ؤ�-�Pt�E���n#4> "��n�YhaT)Q���	x[#�l(�/�������K�������;˒�5휲k�%���:+\�3�؊Ѓ��^4�ela���؜��׮��PA�eO�,�3vl��=Ai�q���^	��L%w.����_���V�s�kW�w�ÖhO�Y�5�5��QeQo�&mu�U|�5���e������������J4��̒��"EƔa�V:+1*�+�b�v��S���u�l�'J!-!,Ճ�$��g[�(��1M��\8e����ٜ��ɮ���4u�������8��JYǜ+.�["��()��v\��J)-�j�%�޷»�9
38|
���NF"�%o��`e��p�����8�;������o�-��~y<`�	�uo� ]O�F�,��a�>����������a���-�UD�0<�x���T�=l���Ko5C{��X䔞�*P)�I�< �xw�7��!H{��B�s�'��[�~����p�$�T���ֿ�r< �o��o4�|:���<�_�=�L�N-'������]���<-h�։(�������R'��9�f᱿��I�E�]��C��4��XT<�Q%����H�`�܎��yݟ�z�!�a��a:��]��s����(nMyy%���Ze�B��m�#�V���U��������~v�q��c�:���I0�������9��k��"�/�����0�<;A_Z�m���:�JB���u%|٨��݀�zM�&s��g�>���>��WM��%�����C燵���«�|�1������t:�_d��Ls6�Ҏ���̏K������.!����(n�Ar9we{N����}��-�zH���������t��TJ�VG�Wc�R�#�nv�����m�������������٢�a�l��juC������v�����"[H��NR�qO-��B(�f��z��J.��kJ�`�Ex㹕�I��e�VA��j�)���n7Q��{��o�pa��%$�<uc���'�Ӭ��4��/�ظ92"��.!g�6�;����^L��˼�7t*�N8�`�n6�>�D���h����)�I�t�=�9��"������ ��HƔG��5�2L�����p����]�ja`�.��,|��h��P9��(ҝv`�@�4�&�bt �сd��`��/�t�i}@$ ��0Z:ΌC��e��MW���<1\�+�ce�b�3]t2�<g�q�B���e�6w�~��-��mgDE�R�H�ʨ��w-�e'�V�G�sM ���	�Q��_B��^��D:ɤ��*�Xt����U�(f\�*���Ջ!P��\3֪���II6��QX�����b�W8�+ �|�V/'�c�M,���:��D7"nSȭ��W����k�r�o��u�Jz��2E�M(�pp�uM�v���$�)h�#|4j'׉�A�*������J��u��R���gV+$^)�u�z3�|�X�������cw3v���&G�1�]-H����M����`�[x/��R5}��!V�tjl��r���J�����LQ/X2��*r&Hed%1�+d�C۽����
Z�L�!�S�;QM���*2���L�m����UIR {�=~ŷ1��w0z�o����L��F�L�v7�����g�ba�װ�h9!5���n�4�a���6����.zD4�;å�x�ʻ@�M�"q�l`��*g�(����M�mb��KH�UҶʿ���^C�p�|Y��%ē���F��{s�ň�7�z����L�5.��Zp6Y�@H��>�­p��ř`>d��$�`��x��O�S'F<��)�l.ԁu���i��9�<�g�ґ>��P�y�	AL_e?$=1���_����͛����sM*��<�@E�["�B���}`@ſ�j��ո�x�*;^Q��'���pȞ�`$��ՑPnw?OҖ�o#A(W��Y,�#�b�?'�9&��,dWr�]�#�/���l}�������>���;�|�F�����RQ1v;9B��`Zn"�j��X�kV��&.�M��o�މ)�VA$�홤*Ӷ�����5~7�Q�Ζb��@p�x��-������yO�����z.$��f��K���/PUco���Ӫ��8����tNo2[��pYƀ�l��t|
;��g͢,WH}��y�`����tB�6��:��`g�������3��+�sO69�s���r0��+m`4;�B௣���&�YZ�
*Y���V�ʙR�zW�x:l[�:��v
:�p��,U�#�?1�����&�ųF5+�4[��Pö4�%U�N��p������q|`e9���Yk<�"o��N6��J�g����w�q܊d�5���4��D4u���']#Y� �D��^={�БkX���W���7@T�P4؊B]�k��g{��%�`����#1&q�UF$�Ov��Y��T6wc�7�Q�_�"2p�������ɮ�DkM��#��Rx���T��e��/���:��W�!�떖+��4�h@�S3�I&�S��"�,n�Z�e,�֐�C�ˎq�&������TX�ޭ�<	����f�9��m_k'2DK����Bݗ���W�x^�L�6��<o�n�zK%�2o���9ҙ�zE���$���	�)
�p�h���|5���ӑ�W�^H~��i��Y�S�!ҾB�bA5G��Uf�MQrS�����.W�[j�u�5�J<W'���F��Q=���>��=mzCu�J>�    ����|Ѯ�.��C�~.�A^���ߑgY��r��MC���z�e��%x�TaZ����XB����0�"��oR��V�o`�*��|v�V.k�(?mI�"�Vaե���FN�kJ���Zl��d���4�R�)��&��q�dRT���T����hA��J�]�Z�����6ݶZ�>7�p(]c6=蝙\�,5[�U\۠U,[�G�'6��X��ʳ��/���m�����xo^�MƩ�u\Y_��'m���˴v7&L�J�
t���ZIT��.�/���v�2��t����Xp}��k
p�����:z�2C��^��9����^&Ô@V�BeB�| �����y�W���/��(�-�y�r!���:�Rˋj�f�rg��~��H�,�r������Ю���27�R�ެũ		�Hq����5�#J�Bxxޅ���QUT@�㫺>��Ʌd�s	�x��k�MX�[�u〖M~��͠l8d+�UlyY��w�k���X�gr.�@�`=���������� ��ґ��
���45�4�X]|�Vdj�4�^��m����d��#iŤ�q.UY���S�;�l�}���zŌǾYM�6p8ˣf9���b�������cA���9�8��L �®��kAI�H�e����2t����yn�J�A~��FEM��sA��f"�^i�L���3�FmpH���i�����o^���Z�"����U��P6�D���9~2:�nd�2L�j��k�;�wAJ��a�S�+�n8��[������:.�fm�/v�Op��x�bk�q�Q��Qvh~�?~o;��!�k�0�Ë���l��{.E1�p��rn�ձ��UwΌ�O��H�uLKn/C�����G�����ݺ50$&eQ�k��&�Z���pI�c/��	���H��Ŕ��6e��� Ef���b]NW���G�Gs���Y˙Pc�l�V]��X_I$�!�ӭ[mk�,�r�
Y��#�Wv$�@}GRIT��UI+r�
�&NN�O�I�`i;(!�~8���BHg���m�?|����27����Y��CB������V��S҃{y�P�Ԙ��Y�3���L������	.U
���������B�4������N��ۼ/& 7�L /6M�������7e����V�l���]�·�j�=��;:$�UA�f9\^�ŝ�-��$1�h�߰� �m�-�TA��9�����4�c<}�ˡ80V����� ���n>��Q���)v��Fʵ�]��;�E�枆���ȕ��ݸ�s6I0��ZM��Z6$䫄]���z�h�Y��U�����h]�ى�q����~#-���9�r5|Gp�Bۭ �C}W�{]����s���y�d�� ��މ˪���þ�����m����BV�)$c/�D䀇�}����T�cL�n�LJ-�s�D\؍*��J�y��w���O;8�[�����s%Epx�I�CM�c��wҍ�u�Ϭ^��C���Q��I�KMH��Zc���LU�H������0c�]ZQa����My|$2:�u��3�:����0�t|ٝ�ǔ�IC<F���9t�ޘ����zw������9� �Z�� �F:~��������JƠ>CH�lQ�:�t[��q~�VԽ����ó�ro�Pǚzt�$j����#6܉�����B"	�KT��"��~����9�W�dze�uH��`<y=�Z��P�@u��U5n�"���ͻ�j��n�$P�8�p���S/�YN۴:�W��>=ŵ����T�U⑨���un���y�̚��~��D�u��߿S(n�x�Q�4&����7�ѓM���q�VA$����t�d1�y�$�����;���w��Êh孽��ڢ��T>�h��n&Fm�Z��/���!`�ϖ[q����4n��&s)=�]MV{);ܸ���:���B�JͲ���R# e��~�)$���i{Cq����N��,i��(y��τ+��>�(x����������A�������l��|�h���s�ҮZ8_���Ѥ*6<o�#5�{�<g�Ei&/��#���_&�D4*m����Pgϲ�|*�x��bb�!��#�:�H�?�r>�d͈������JG:�Hx����4h�����eh�$s\;��2�4�7Dj�ə͑ZH���i�ct����.]B�el�JG�Z��q��$�v�u"���V.���\⦄(���6n��%�09\S��-;�-iyM�����vQ"�ܙʱ���7��� ���7�|O�M�6Ep��D��*A=98Z	kH�,�ɍ�,�e��r1$dO�a5�f&k�>29|��y9��c���[���b��+�é�"Z+�8�;��Q�В��&Q�p#�#l\���;P+	L�����ݝ�����0E�h0�n� G�W�`s�9?�v&"�/���V	9���t�xg�]s�	z���$��Np���ݟRZw2x�d������gr�J�j�3�mJ2�����B��2���N%د��k�������ڍQ�7R^��P78F��㉖�B�b�*�'ה;H��Du=�~="CuM���F��x���l�;H.ߪ��5��nG	�W�U�q��=��@~ؼ>�����?<}�F���Z���S�A��({>��O;����ާ�<������p�_@�����8&^���S�"s�D�Q��M0Qs�'Y�R�R���_�R�/�:	��(ݦ9��=k-C�ħ#7HE��"��q���n(:��W��DT����Lk��� �E�����A3q<���`3n�ab3��K��{����o���L༵ZC�Z�Z�	ci�\܃�,%�&��&�xŖ|+�OH���T�?����2��I�9m%w(��%�G�0�J�"��j4ڃ1�������%����:C�6`��Ў�ͲR.��2؈�+r9p-���A�S��B��e��E�6_�6l��O="��)-J줹�z��̣�p.c8I�jhu�%��-������(�Is�^o�m!}��}9��2��mŮG$�,��QW�#�C5�gQ��q�rP�wL!�dU^ؓ���t+R�b<�o����I~N��,"P����n�pBAº��+.-kUNS66lRڍ�S�s�+gV㤃���T#��*�F��Zk��'j���7�T�Q��+Xd	�ywk����k��ֵ�K���P�_�b)j�03���GJ���`>��/���"3n״#���J:�;�(#�逝�q��c�n��O����I��9�i_�*�w�k�����Ad����+n��Q鲠`bT��sQ���.^c�,��v�3����1�Jn��E��p��R*ǃ����L{�p,x�lX�AZj�O�%C��
f���鈤R]�ڣT�G���l��t�A��6�I�m���)�z�>x(m0ww>_�*ƊE�������5���Q���

$����-��s5�TY��ޠO��2�I�󐆜dgg��� ��˧��;?�op�p�����?x����6e����*Cٶ�M$(v,AO�?���B�R
��'|���;�����w䖪���l_h nAؖ�ZS�ju�M@!K\7���*���	�TR��0cc����^�=Y����[�ȑ��Bb�$������k��;q�\�$p(�f�l>�����å4��
�Q���z/Rd+��to�����#WA�u��UPշ,0ЉL7m_���w�Y;��A(�_��:�\;�:&����}�,uq�̱J.�����mpl�YZK��ߜ�ϊB*�f�����HdS˅��,����V5'Ӫl�_�>�ewؿ$`J�i�ش
m�x�i.5b���(����F��ѮI�(,$,�����y�\�͏V�#�����	��0U��[�F�S'��F����*���@�����j�PY{�n�|�\����Z�w�X+\ש���u�xW�Ĝ��/��6g��-����#����jl8Ht�*���    ��M]d�M
*NX�����1;�G^�~�8��:>�l��a�VL)�]MI�.�������k�w�"�	<>ݙwΥTdA'�[4s�g� k�b����ZZ�'�����V��U��`/g�p���E�$˶+#��#�b�R��F\���^�7���p�,x��\�oڼ�[+'�˛S�N�o"�q�N�1,#G��ﭭ�l���xl^�����a��<8塮�̈rN9����|�H�N'Y��͏��ub���2�T��4%S����=j���P�1%�\r�Z�W�$ؽ??~��2��jTHh�����B����9ǋ�o��y�F
s?�p��릧z��������`jT�����d��cS��N�!G�*�|ŅK�_����6P���x�hC-kx�������3�qD��aJ�<g1���P��r�n�����7����VD�8�,*����]�8���o:�YrOv���#�dǔ��)	��ν�S��7S8�ݢ�|J[����k�i�,	��9�9�R��ܥz��Ɩ�V�j���6wM�J*ck��3����e��g��,fWl43D�]�����`+�zr}���^�o��cU�D.뮳��lf�nV����Ȉ��fl}'/
�V�6�9��|���梎�>��t����u�ơ˗��췚}~���8-�o��
MZn�L���f��A�Iѐ���("�(;@�
��H{��%�Z����e��	'h8is9/|>�Z�.�*e��e�o�lA��r_�Krj>�_���
����	���Mˮ\^0���>��`3����k������6|�:��[��y���_T4���F���ǵg�D��Y*�[��E�F��iQ��I�k,1��2wOj%�Ng'�ӛ0n�#�(�i��P2;nv���G��!�����&3x��Tw��h:���V�]��Jd���%K�k��s��I��X߿`W	���|y�nW��pS+ڗf�*�-��&�Aɬ�֤r��e�WH>�4}������h���� ���@���
��u����������Ć7r�X�cr�k	�@U��R�͐1�x�cb7���_�@��;KC�E�I7�I��=5,4��f��w��h�e0�r
��s�H�R�d��7[?p�ӧ$A�p�A�Pѵ^O���DeYS���$�ڜ�bUϩ�Z��Y�Ž;ӊw�3�J;���4���[��5ۂ<6��8��~�uˈ7hbB�#�+�b*�\����jK�GO�y��~X�4�?�v��J���b�|�?�'�q��
6D2,/�C�����"q�*(H߸��>�o0oǗ�W
ܨH�h�G\>��u�P�*��끙���ں�j�5��=���Q3��	�#?��æG�>KW�����W�3r���%$v�B��i ����hA��>�yͻ�.���ކt]W�(1��6��:+;��ձ~�؞?NMK`�[~%q��_JgTY��}`���� ^*��dk��B0(׻�h�uļ[6 6���\`�����v{��d�bx�)i`PI��4+��S,
�X���Ч��*������>I#��¢V8P�W��|E��f��w���_���ŝ�_��W[_�s�@$.�����������9�:�N0�K{ܜzܴz둡x����&[l�o����p����A0����7������' ���g�+������]��pa�H��bh�w��x��lV��&}�I��i��-`XO�	�X)�������jGHVdsÍ\] zȂ��Pl�x��ݙrl�"x��XKq/gS]	��Huwۀ����C�q��,QD��r^�.伉���ZOO1Zl��!��I� �F�)�c8���6��p?����G������ _��Ƭj�a��#)�-�<nŮ5�Q�6 ��-w���_������yA����8����2�.]c�n�n@`u�U+�@��I�a�13�!8�b�b�+���*�z|�13�k�NŽ�!�_R�"�i������AC�g������g�Q�D�����,dl�����%9��B(�3�@7g���+�<��ó�׉c7�:iL���"���w[|�ze����$WPfV��}�ɴ?�2y 帏���Ϸ�17�3%=�nŴ�Bi���ZPT{-���C�����8zJ48�_�K��x)�.i���,>�K3[���3��$���S˭���հX�a��y�x_��$�uis%cO�
T��j[��@�k}�݁D4Z�T���z�
�c�x��y��?��=�]�V1}u&����� z8�ȯxO��WA����CC��Ǫ,�5h'����6���F�jTX���H;[�[*��A5�"Oq��X�!9�kV�'�rT���L�7Fg�3cr���%� �{�S�%�����{��V�����#-SJB�2�;2o*`��js�	h�f�"Q��ɍY��K
�E�WT�j����+�A��oM�R(����V�}c��Q�'(�S�|��O�4c��R���b����N��w(~�BWk\�����q�U�d.�r̍ƙ����/�o@Z(+]m:�~P�?���lU���i\�Q���5�վ&3%F �(��[=c���C���W�];N���� O���o;$B��qUu}�?)]M�t���0}��QbtX���Ób3ņ{�q2#�)Ӡ������i9�ވ�r�t)�cd�!4�H�[����%d�H2��S�)�+�=H�T����2k����,&� ĥ�S5�LN��錐�G��}�>��BI��l>%lڃ+�����f�]�lBJ��fj��>S��<~
������:B�F�Q������ٟ��)׌'Za��0��$�+F�5��Kc�:����$�|7c-^3�����Ō��7v)�z,c��q3ڪ��>`��X�j�+�L=�=w�R=���J���pُjyKNՃ�����SCh0���	+*2�3mP���=�ͦ�!h���϶9g6�H즤2��~$�3�uv�ҵ��;��y&�p�w*�t��(g2�~X���x�Z=3�{�(�z� lH���2�������e����4��#��h�@Qvc*��R[F�J%��W�/,���i�\Y<Xi9��'P������)��o�e�4��9@f�PS_71e0��n�����}����F�!"�3���"��[JW��#��?�LG�h�����V�LFZy�Bq���#�Gjj�nY�x��@��Ǒ������O���_!T^i�)�W�Ɂ��u3ڑ�����)������z/��e��ih-p���8B�b]�y/�RT���/�ǿa7��G%9��i�.���:��a3~d6$��)̽vt:)�=�e��/s8���8���QA��v[�K~Of�`0c����l��&��?�2���m?����jud�g+� �G���&&��`��-���lي���}y�GZ�m%E;�LX���B?Rx^x��H�F�����:@Xg�2���~XM�a���U�����X۽������5�G�,�BZ���`f?�fX��/P�v�!˟�^(Ϫ.��g��M�����|��z�2&!�|�	�@�������\J���b��x�����!2��������;ԹC:ģ���Z� �u�Ze�:g�z�!8n�|�s�����
��/��(�,�]��ݵD_�p�n�
OfL���*���51*|k��	�o�FHz����N��Fkݷ���M��mISb�q���kPf ���fY󊣦.�'����&d�Y@�G�z
�8 7<�����۪nlѢ=�$�����WZJ�{��6kI��ĈU�X�/�m}oo��L�#�%�?q�pr�H��������x����w޸p9�Mo���l��9���'�y]}z�/�א�w��zl�Ǉ�u��_p;Nc�
����j���j���U���tLC�%}֒�lI�$�`�1�܈kb=9����g[^��M-x}/�ev����/\kȟy    ɂt܁\'ˀ�׮��ǒg�/��*���=�.�R�9�����18��ŴEƑ5n)��O�n���n}f��#�f��o\�m�O��¥�`MX����{��+F����v��vFĢ�m�M����%9W����L�`�M����jit��+6��%��+ǃ��iɳ�g�BG��j���ſ6^��X������X�an�J;���Ȃ����c�=�E��~�;6���*;�!�+Y����b<WYlUo����l��d�����p���y֔!���m ����U�k���l��t�6��7��é��'��&�썼�{>M�d��|�Y�(ܱ1�y���;��gx���|(�k]6С
�v%F�+�TFTP(��c���'�9��Έ�B�R$>����lw��X�I/��f�M���޹�M�j��o}Aϵ��s��O��O�<��y��l��?����.i�4=��*�jޮ��Gt4=l�*�l+�ɓI#�*9
)z��e�"�\z�w�m4�{�I�"�M8L���.���!L�7�^��&��ɻ?�[��ؕ
�vc�����I���wr	M����<����|+|,�����:c���������<���|�"��p/�/څ�H�ЅܽB"W���a�Ɣ��R����LZ��#k�
�S�x�Z�Q�!t�R�4��B��dJ���ʸU`��Cl�X:��H4�?U�
,�FԳ	�I8ק6n~�����Q����qI�p<���!C�@>u�2y�gE��BKp�n|���CFu����t�n שּ�e�ߍ�~9L�Rӛ��$D(pu���x���{h�~23��f�F��Kx8a;%<����9��-���^��Z��Ǒn�%ӾgJp����[^�:����:�����Č���j�Gh����ˑ4Ӱ]R-i��ȿ�1���!��5Sʊ퐯�C���ؐ�&4�L5O�<Z�g �)�*B��ĸ'H��k���e��c�<߯��C���*��#P�0F\�!4j�5/n�8n�EU����"�{[��#u�������K���p�:�A�^^�#�ͨ��\ Wti�~U!MH�����B����?�4Ni-yy�/�$4W���I�5y���sh4k!-0��\��ދ(�N�&uBh�1�|���:~���:wa/R�A�5n���Pd����pDq	O:~����Q�M�6�T��V��A)Dd�̝
�p��-�m�궐�W�M��E���4d���v���K���T�Hg 6��iv=mQ5�tf��D�(��A�����H�2̀�[j7̀Gk��e�.��J`kf����M���}��C�P��9�P�n*Z�j@����,7�̀�y"��͇M��k��p	������=�v�g�WZl�BOT��"d�4B�.z��zE�$���Bi���,�Sf���u-7� ���v�B�HA	�lq&�N��_e�~�$c����(��d:�{!��}���㕖���5oJ�B�N������L\~\�ڭ�;'��D�4+�Jr�d+�����������F��P���#��Fi�u6������M<n<�S.g��2�ݸ�Ra�r>�?!f�y�Gp�@{�2�-*W�PJ�x%�UӘ�$^&��s��]"�<��W:',���<®��8�F�:p�V���XDQL5�+O�xa&8�\��'�.�"��dTD���J����?}�6$l<�:���!:YW-�ݓڻz��0���h0$�ȡ�l`�(�h-��i��#��1�t[��5��Rc!	��XZYR�Y�B~�Oܾw��f�F����C�S���;vgp�8�I:���!U_�;�8s3,S��U�~�?��_��N��!�b
����N�6Դ,�1k3�Fd\͘ ]A-�tC�xʷ�'�27�Xs3�̙�����r���2�jx@���9Āx'�4���x2<�x�{3~L:�fԅ$�
��O��/�em��|�a��n���2=ϔ�ᜅ�t��j��I�͘����^�7Zͯ����;bW(���W�5� O-DhmME��i��W?�_{m�^�K�a�Ҋ�/(�B
�6Z�%�fMi��2M����ٿan�D�da*P x�N�Ps����5����6m�p"��.�f�|��R�O�������=�S'DJU���
.X{���.hr�,�P �\Y�BDH��D�v�7RciP=�}��"=	IP�~����9�{x �ƙu���8��I�B�ݑ�&�i�7�O5�̧�nQ��[#(ɉ�枽����.�F^�g�Z^fQ��Wa�r��|)|�x�����<#=D�m���J̏�+��X�9���R[�>���X�Օh��Q�.:��>�'{��N�/�/���喀�<�_._�����<|j+�Ow�ۯə]���8��m�N��F���rf(8��|�5CM,&$��f���1���M#�U]�I��t��"vd��~;2�d��w��Cjo��UE�7br�wհp�v"7#�񐵐��5�oҲ���2�\pX]�l�֢������|R��|����t���;�2YtP�U��i�����&��S ��D�9d�)Xҵ�!�́P}w8���H��E��U9�7�#Q��ܮYlG�<�m�D:�iU;o)��6�ʁ�O��o�ǫ��VdZ�Dz����a��2������h���W���lCJR|P�j��[?�g���=>������=*���Gm9+	���܀;�뼚���|8�G�|<>�Ǿõ����7�2p�B�rͮ��`/yn��U�޷���p��� ?��eU�؉b���g���L�����'��2G�}��s���;ǉ!�C���ՠ1{]���%	�[�'�ω�io����u���m��4�q�F�)4�Z�$g���{���xA�뚮��aB�J��Y�!U 7O�s.����7�3��n|Ug���Q�x�2.�+�^��:�3��EY�_ �5N@�h��`P]�FGM��ª���Q�����{\$'fB�K��B��f�wn��A?��k��ڛ
�Z�m:b��9�%�BXo����-Y�j]�e�s�U/�;��E���Ѽx�Q��OGn�m�4�!UJ�.��M��J����K�G �u�l?����	R	�aTQ��N\�b�4�^ϟtOF�dKM��J����Pk�߷͏a;�+�Ї�O��*�{���JY�YΈ����Q�#K�3�����%?��sQO�
y8��5�Q�3r���yW5�q�u��s�w��G��R��a�˻�yn҈�DD�[�N�V8C�$>)[sb��G#��8�Ј`E�#V# =�������}������:n ˤ��â�춬�?}4��Mj���]�X���p�$��\;\<n�}�ʛY�Q��l��](�B:<N�X&�`���2,h�B~@��5��E���qv�=���n1�^Ӕ�.�j.�]|��xV�Bw�ڛ LU2<q�DE���K���[Ժ�|�2r����\̊�N�ri��B����<nv�)�O@�I�D	������ -������{�d7H}�z�
��������J!�Ԓ9;͍˷sB7
�FQAE�*����Ek�~;`D��ǘ�|�UN�gX�[(TjrQ�]�Leo��4$�"���+�gj��5Wo���o5C:�)(�%d�5ۅë	��.�/�����(�l�k(x�Y`ծM���O�L�������;���zT�t��NϨ�_D�Ă�g�p��5Q8���<JTz�B"����q<(� ������]߰���� }ᝇP\TZ�v����F��(�.�?f�Ĥ�4�9��[�ʬ�$r��U��������[������y�,W�+F��+����]%�x��U��6�k�� x_�A��v��k���O�P�\W!>�j�?Cx��_�����\U#����vn�sj�����r�*u�$Ԋ��G<��u�ߍ�<E��Ѹ����gjUcE����0�������Ss�z|��;&=���L��m���Urg�Q�`):u�rq�j��_�ޠH��gd��<�A�^3�!.���ǚ���ΐ���W�Q۰l+�u0f6�!�    +��R����V�K�t6�+��-
�\��ً�	��r:?퇵� �鼁쨊��>稈�D+�*�Q'�r���و+A���E�D��}� ^J�V�פ�-�Lx_�T���/T��L�j�4��ൺ�K����n��qViѻ�uH��Г��n{j��Fd�Z�n��s�Ū����]D���������h��΁�b�r��K����໡$�z�*5��>w�P^ه��*�j��z\Z)�ۂe1ʴM����t���y����f�X᥷f��z�iE[>���T]�}� �$��w�3����#2����OX�	3�����3����ũZ��:���\������T2��N򪖁�v�]�[�bI߂$�4kvvH"��#���p������.��80��ĻV�{2��N���SU&*]��J�ҕ��{0��r6���r�L���CnG���� �þ��P��
��aw�~�}�P*X�|"P�9�C�Y9�Z�P��YF4X��'��,�f뉊��_G�X���7���t%-���i�;��>������Z̟]�:g���E�6��~�ǒL@�q�,�Z�8�U	�5�RVӚV�������o��/��?�hT1z��{Q��3|a�2%ER��_��F�����ͅ� E(�k޾;�sb ���z<R���v�5C����)௾�C~|�芫w���r��˕���9������{W���`h�]�ǥ�P\$��ᴃ��P�u`������������`$��OPMD�@���O#�i���kd!�Y��t~>�
C�q���aCQȴ�B%S�|` D�_=���ϨJ�����۷�
���ƴ���\N8O���$ڤT��f7�#h��28�����ܸg�'|�p��|���GK�@��:	�MU@�%��5;'E�ΨQ�XKq ��׵Ց�(�D��%�I$ˊ�2����[��9�-g���������D����F���_�~C�Ex�:��q�T���j��,�^���w�-F2�1�k�+>
]i8��a�=5�X�l6�+�F���]����9��`�B�e� e�J��%g�aq2�R�� ��L���"pu�շ��|~�k�IA�i�1�ڼ�m
�nic䃑��ks���	�J�H!F�YK^�b����B�AX��y~:~���0F��
��a���lY��d:Y$�� -���f�Z�U�*6Od+�����M$��,l*���:ݕn&sE�[�����݊=4��޶�cN���`�.?e�CxjE�!KM��1N��2Ҧϣ��ͥL�B�{��oc*�3j:�GPu�h%�W�(�(紐�];Y?�2�,�~�e6��z�3��������R����g4~DȎS����U��6f�q��FZ�S)�8��xv3�l����\1Rx�������|��|,��Q�e�x�N�+5!Νi�f��\S6�r���N�����"�˱ݏ�����9��5B]?O���+��@�Gl�ʧp6��a&+�va���ݐHr�bi_�#�*�Ї��R��x��[�l���O}�r���H����EpW8�1il�u���z������52���=�c��obr�4/����\��BO5���b�+?�x(��CB"/,���QJCd��oҀ̵r5˙�1��Fڹ�U�-<y%�M�?f��LYgq,]�;¡��U��rWb���V�V"�1����_��8�R^�ts$3��mq�	52,i.�5��E���G��$��h��`��<O��7��,��zFBy�lAg-�ko�?�*�-ﶍ�cH��~��k��B�ZDl�(+���58
�G/�=JMu���!�+�^'�`���2�W���~qwo:�/!�Q8���zy�"��<�
����r��P��]��B:f�����p�U�Hs�5s�����}f�H��y$�aKF�O�m�8Bq���I����H��b^�K�.�_L^����=���s�`^-�N��e	��4Q=>~C�{2LY��+��M�;��5Gc�K�%I8zZO�ziu|7�������y���3�:�6��-�"��+���V8Zo7���6)ɳS�v�~�pZ��c�[=���G;���)�4����<��R�xmI^�0�X��Ŋ��:K$�tQ�جzv|h�r $�(w�%S�����&u����9���SZD�R."7�ϓ�B�Jʶ�l��8���"�^z#��m��?��pR���%Cb_�h��,&�ϧ�$�B�;xD�~8I&���P.5�O{���=q�� %��Tp^j���A��PQ	�#B��T�/��+8ؤa�T��ZJv�3-���Q�Kk�*9~�O�z�A����vz����VUX�t�QZpg6�=LQ��+xK�X@M��)D���
B���e&�~�S`rL0<�ENPW�sԗ�����55er}F�G�f"}�ܷb�5��ߛ�7T`
! ʈp>�v�5v�o�-�%T�7���:Dj#�� c<Zh�!af�`���A�Ӟ!<�D2�yHς8��E���@˜�8a�`���D=����ݱH!"$P�T|B�)�M�I�,�ɵ��f��5�8�X�})�~m��c�Ȗ���Vh�*��I[�\�!���,w=��$���Ő�)�W�%G�I��w?�.�#2D��!�d𶡪J�~%[��Pw%�����Au�^�E�b�Pd��yE������ ��(B�J�pB춠�d1��j��-Ƴs#�ٛ��x�a�a�V]�F���l��A��(p���x�~"�9����I���s�@F�rZ����_�?���K�Ʊ(��,�ƍ�����X*����v��xj�Q~��HБ���J�u�;��G���)��~�5���?!̣#CnW�c
jQ���ޒ,)Ғ���EoH��(ؑ����1��A�i�"�DY�E֤١�6t��c��⁗�Y�e*�£��y0ܚ �'��ק��Y��?p�[������,��O�R��펮����X8 S(�����cǷ�v^tԭ�%0���2�@�� �>�Ǉ[M'������Cf*g+�l~AT����\c�lU�ϯMJ��di�x8?�æ�[!>pF�P�ҿաC�i��iSD;z��f�
�/�J;�ǻ���4Z�ӕ��Yc�Ů��b�V�=q�x�dh:=ld�Ӆ�$����o��@���������������������/3;�6���}�8�Ω��iC���L[(ɢ�4�^(�G0[3Q�3�(���N��i�M�lb4��s�h��9_	=Z�W⎖���\�Z�}�9�h ܩ4�s���wW�$ٲCe����`�~�Q@*��u2�:ӥ�0�8����W�0�/����{���#<�=���\��3���Q��s��B=���/�p�pGN̘E�q���l�<�|�Y�Wi��FU���Ie%�1�R�WT��\�l�ll��uY��Vsh��x�'�a��R[Y5���/sW�7,t��-cr�BTQ����מc"����0�E_`��h���/���f4��o�n�9��pr����@ʚH�����e�Q���ZU�z>�u� ���������fU�����T�a�����iZ}�#���n��W,�����js�C�".!zTTxH_!=y��s�7�I�V�8ݤf��,��?;!���ƫ�x-�{,��q� �֋��K�����%�!_�m����R>�s�յ�[��Zy�\��#��;��B�տ��ݏ�߸���T�:G{M�Ut2�'e��W �{ڌ���]��4���S�x�0F�̞�1��d�T�'Ьx�l4���oTw�*b�A �m��m���M�cV�$ݴ�I���w��|@��v��]�?��� �M��l�5iR���qn��}�"���<vR�Z0�.w���ڳ����	��5�ĩ���0x�"��"#R��1L�[`�/���^w>_�s��{d�0j�1%��*�����<AvA��������GW8��X%��`�!�ͫ��U_-znk��x���=U�%���.@ ^ɹ~b��    ҴӸ74������(c��@��VV��>�t����ߢ㣭b�aRW�������qw��}��}
b��T �e���`&H�����c��Jm|�3e�g�P�J�Vt����T��GU��$�RA�=������#&cRH��נqjڅ2�Ԕ�l�2��fS<�K!L"@��u"�Er*�a����j.���#�q4�?�S�^j�(�Y��1S�Y����8��Z�H�~�T����K蠲F�B�r������;:)�3�@=>	[b�e3��6#m�}���8Pr�]=��l=�*2iC�s7�0�y���ה�>g��lܥ��snK�a�]�H��m�\��s��}DbR�y�#�x�� 8\�p$V���϶��XM�S�Q�,�r-Eb6��}�T��B����C�J��K���㗨�
�n@��5�{�� 򬔶{m~?6�q�B�^w=�$�+�u�b1�\�]*��*w�Q3�J�y�F1\��(���@��rV4R�b�l��B����&��>)
�[~�e����l�Q'e<��o�w*��vd���)�d�YPSѶ�=��{dS��{��{n�&�����C�(T��U#�oT�4����+ �4F�� �8\��
�T�>�Xr:�L�|�%�P�<H��D�)�c�Ͽ�Lv�����)L,��q?�HF�F��YD2��)ղ-�r��h6�	ݿd2���=��[w��"1 ?@�8:ln���0��l�_��.��z�af�&��*��	c�]��SX`8[�&�JT��i�zI�o'_Zٝ/p��4��ws��N�يB�ЛO�b[iםM���F9��v��i:[�+Ї}��槏�nB-���(u�Aw1�2ꃗ��!�z����H�P�%�)� ��bi�@�n�|eu�m���<��[{($2�{���{��d�Ȟ8�?�fO��t�
�﫴}P�殶u�'�-�m7����R���؂��o�&�<�� a;�1 ���r�eN���T�$)+,�7V�龳.����v��&H�p�e�"����ǀl��2�����9�@� ��<49+�,5�~���@ݕ���Xۧ�����Q�3Ք���M�����V�)'�/]��z�B����3��O��ԇ�O����lz����X�;��x�!�J����+qŹ}���
cE�B��H��2)�M���X�I�#Xv7�}���-K�,d���ZjT�.@����3��F���Jր'!(�1nQȍ<��{N�6��$�$�� �.��2�r3W�r��(pt��ӭ�����r<�q�K)m�춫ɗ�,����c���+���ߖ�
�Ј7]R��n��@�_'�,��z����q�Z&���nT���ʇ��=���L�#�[��H����Q4ߩ��|;7a"n)tⰡ�Tʹ%��Bu�(c=�>�<��ږ�2ܡ�J6�p-������?:B$P�Z%�O[�D0&O����?X�tz1%�����_���A�*}Tzߍƿ="�~;c.ǳ�<,<��5�%p�0��ZQ:.mE÷�c�n�+���TIR(o^>�o�$s�5�3cȀ^�	�z|r��B�����gp5D���D�8�Q]�3,�W,��*WY���
� ��OҵgwV��:Y�1o�!�����ַ�iz�os��zW�>[Y	���m���/�|�<�X��>��:�^O©n1d��@6l
�oG�L��|�*��k�c�%�,��X0*]\(�����Plm�X�������3����E�O��e���61 ��5�d�,Ÿ���W�D�}��p3b7b7���3aٖ�@Q����r"^�"�+/!��`f7��r�����.o�����Ŷ��\�bj�b*Z�fUn��[̧�rh*p�T��5�UZ����i��U�����,�]zջ�+(���л$�Z̬ZL�9�m���[L��/�+pXk�p+���"�ݧ._~�XV��z#�	���3N ��_�Mm�#��MS��\"&�0\���s���v�57=nz��`�7���욾Nnr��x��%������m`�{���ۅA�*t��<��s���3�0�����(d�lw�&�T����N��)��jg�>~��G�<v��� ����D����w�ԏ;��
�Զ�|^�}�,nC=6��^xzj��H��H/��72Y�p%���Ȭ|��˒����]�g���%n���g��@���r{�����=�WL�'��;������E����rql;���B�őh�[���Q6��Q�&�4��G�R�\*5mr��R,�K��v��Ǆ��S`�<g����i}ZP���?��x�|��zP�6���A���Oj{Hi{��$�g3��l:	c_6	czp�[�	rSo5�O�O���U˴K��J�"����ZwoIuǹyWfL�õ��{J�{��X��>~�Ȅ.R%&&��o��N�85�@���Dߓ�X0�>Z�I���]���	���08D����T�Iv �����Pi��|���%���� <�K}�+,4*L��X[�ƺ������Ox�p`�-
���&.9flb���= �n�K�'�t얅S� <�y�yoi��tz>�[�B��n�5ı=��Z�RB����Q�B��B�'���u�*��~F����)0r���z�=�[+F���ʗ����{��׭��j�w�i��K2Ӌ-rFl����(���G/�SsQ��!�������'ď���͆�F�a_�n��=����� �:���S�ec���1N���5�����y2z��>��pXL���*��Q�l��8`r�g}�r
k �t*y�K�%`�l�&��4�B���x����S�欝�(��'��K��9��In��!���&�_!I*���PqX��p�2PZ��p�,F��atr0��R;��NZT�_7ȓ:[�D�4c�wΊf3,�[�C�Ba�ɻ6��]�=��T���(�~%�kɄ�^��D�(S��ņ�Ys���Y����ic&���� F�?/+�O��+��+�ʢ`9.����ԾH�Z.t��,y�Ar���*I@t:�@��볎F�P[ǹ���GW�4oƛ�jN�d��<��X}8%��-U�>*ha�c�;�䔒be��ĠF~��h%p˼���5�&��6bL��.�,���r��u�<�����Qӻ�T���Ft��"�a�����;'��1��Ys����s��_���e�|��E����RhK�}E`�q�N25��~�y3���<�j�U�~j���**�ݏa��S�1�A���T�IR�&�?����/�����N�9 +��ՍkJ���!z>6?����vb�U�V�u2y��^;���y�`�1HiLڥcU@?�X�K0�,:T���,���	I�2����U4�j\�pTNJ��������UˣV��M�rw�[����	���zN�-oګb�v��J�ii�&I�`��Z�b�z �U��d�|?��,13�\��#on��]�MkY|�e���n����v�Ō	N�!�[��7PA�zO`o`�p}uV)�TY�1���f)Df���-�3��p�=���@�@���hACPw�[�}��g'
-:
x�� r�țr��tB�ֶ�Y�=����<��SKs�ȥ��.Wp��F�v2"r!�).�tIY�+����H�@	��5�Zm�p<k���$!p�Q�)���ʮ��z�K��k�صLFy�$��;�A�F(����i�.���U:�K[)��������Vؼ'֧0 G��E"uj�@��N�b��p��Y?�����RYjUEm�m�df�t�A����ӹ��#��f,Oݤ`� ���e5=I4���4P�8�o�y�3���L���?��J@Ruq�!�3�~O�/��ɻ)�i�jV��l4��~X��p��I�"q_����3��Ksyܡ�j�"/�����N?���ݡ9>}0�f"��1У[������p�=X�v���\&@\�O�|�jl>%d�%7�����mJ&��=R�!�    Rp���c� ���Á����p�y��=Pz�L~{�!�U��XŦ�`�f+Vn l��#��:�}�� JטQ��O����V=��^�P������n�<�m�l����Q�T���6h��m�6�D���,|ۇ��%/�����̈ʍ �_� �[$�^N���+[2R��)��:h�Z a]��ϱ�M�+ʤ���}�\�X�i0�n�z:��V��ܼF<=+�"�B��
E�-����X���R��qL����e��Ao�?����2ʞm���!��O��?}A<{�.;���i��Z���0QO�ԷZ��G
ئV,A�>5�T��¬0q"ת�!���)�y���e	ܴ��e���奁��v�Z���)Ϝ��h#}HU�lv��U�n�0 ����e�����L��Ek]q�7q9��wӧ��k#��e#!�K�r���a�{ٝ���t�~N�X'8�^��
��� �>��JN�x*;y`^�u�5+��邚%��V��d4*�3�5\�8n������}z����[�2�Zl��@�8@�z @N�T.B;�d���.�Mä���^О2���5�H�=�f���4���j��6tG�`�U�
Uf��y�����Ǟ�[��Z���>E�7G=v��Ь��4Z���p�c2&��Qi�dU��s�2��@�kYc9�ŭ�_��`�b��/B�ϲ��;����M�Z�K���a��}�@�B1BR�P<@�_�0ƻ ��2���sk�\�ge~eDi�L||�6Щ9u�j���.^�sQ�Q%UB-h-�6�&{V[b�ɮ݅yQ������,K�Zw:2l̑m�4���e2
z�2����Uq�g4�.75� fe� HVLub�6��'�>�@���
�U��N�6zlw	�4���;�7]���U'Y��Apk�螟×KJ˽R�*hwО�ft�Ŏ��� �2F��a�J�w�a@�F�u��')l�HU:�R�G�	R�
���T�V����x�⏠��z�D�!*�������_k�aIp��Ũ����>�TR���j��V����O�杘�d���.R�:�\�lմw]�%��O��g������'h�X4��m�4|�>�8c
��o�]��ɜ$p�A1�
)td��2��z�p3���{�]��asʌ/�r�g�D��*Ȍ�ǻ\�'�͔��)Y��'g���BBO�����Y�tM���
f#��G���u�*rx�W�k�����"U }ӧ����1[�\��Ϙ���!z�z5���ۖ�;����{�*n�?�ʰ����!�[��1
�FۨUBY4}�:N�ʵ���O��k�CJ�֢䱉 }�OyHS���ɧE����r�H�8k6S6[��"<R=�2�yX����.U�*0��r��v+5�b�JV�k]�*�{<����O����y�G}r�@��E7�H�>l�V�k��0d�1zi�bU,��P|�#7̃�bڴ����?T����)�Ӈ	Omb�S5�y���Ql��1w!ꄬ���X˯z�r�5PGm���ƭÖ��Y.��c��r�����
]C@�@��%o���C֝}蚻��C��xx�.�8�9Z����A��~Ӛ�\�c���>�~U��G��	p�A�����x6Ae�.$�h�ϧ�pa���AJ"Y�wTn����Aq���-Z��zZ���x��Po�㳾V�s�xkkp��@$�.�3uW����(/�O���Ƚ��&ˍ^`����8I�?��v�y;4�:�Q7�QLw��kDj/LGj?�ٯ�Ql�Y
�5D˫�y�=Q�8�[.f�4JkL��s��l;��7 �с��C�)�oY��$�����$��A�AU�̈٘�<��M�f�ALV>��>ɲU��`L�����sD�RD-��J�$`�C97ɦa�4b~;�?A����\��_�!o��_M�u��֟j��88#�I��j�#;�����H���v��W���ۤ��r�k2N����*�J���� ��ƫ�u$��sĪ���.� ^NqGֳ�KM����+2FP��N�mr>���?�e�����@Ћ�!X�i�h5`��H� ׇ7�:�X��G؊J��1δ����m.�}&GI�3V)���R�U����V����5.��`�
s������nI�Χr�,au��YS��L�d��p�b���f?�n�Dk�C�|s�1�.���T�A'���g�S��°������y����894 ǧJ���R2������Jyc۽I����:�-�zbM��S�^�W���%�W�µ��j�5Tr�vkD\׼U�B�ˏK��t��`�b��6��:@/��ݧ._|��9������X��ز���>Ok��/�c��c�w�?�Ѩ�0����u�v�w;��vｚ� K����#ZX'���PGD"�Yf)*�x1r�Q�����
\9L�J����Ӽ��׬�eYs3MS<qd�qȘ����|I�������C���gYW�ޱ��YJ�65�CPPɵKPDgt���|i:z$Ћ�W �ԚbeER!D [����M���w(RbA��̦�ŷ7��*3����y���3�T�	e��%��Y?w�<���3c�-g~����A���wH��`�~�j��
�]u'�4#7�A�	(���ilx�>>I%�X��$�R/��Ĭc�1W��&��th�B�.rd��7���U�Ͷiڲx�c����y�aM'3��Q�/��]�f#�mw0�$9���t�53�-�LNa��� �lO}#�ϰ��v*�T�7x�{����ls]@� +�49_dJ��m�~\������4)d��)H�/����Tx�p�S�x��<=c=��ZZ����G��x�T��X�QtW[��ڽ���.�Œ2�:Q��-�����F�6%��t;���K�I7eC����R�u�ڰh��S'�;?�kB�(����m/�t��Sn�z]���>�h2�50�7�������^���3&�@4Zb	 ��%�*��]T]=w7Yb%c�Z�U�ۆAi|Qv8�-J$vh"ZS�T9Gu�n� ��HGU��ސ�g��}L�D�l�
��Z�pVR��[+��~t����  ����h�^��:���4Y��L��0���7�mtv�ќ9Վ<�mw8А1NR��;?[W�~/�<ɝ6��d��8����h%�>/�����ǿ�����?���Y�|+���T�x�̥��������up�8�V��r�b8�~9����Ͳ�������O������<��O�5����Y#ʣp|���j��6�msdf��"c�*�e�������º�H��yzo��I�-Hd&���@k{���(J��%�0�ㇻv�f��_�ùy9P�P)�_J�U���D�b僚iˤ��՗n[+3^ۋO<<a��b�@�9K��?�4��@`>�^6�o ��޺E×[�+�+�ӕ����ī��"�\#�#�(T�ow�T�KS5H����Mo�<{�*�v��X�8Ʋ��\���(�j�b[c:�2p�۪�*�}�F�L�循f��"i͙n9#�E嶐����}W��#�q����u�$h*�����z����u7:���S�^H�WU��n�o�j5=������K�ܚѤ��&��v'M�;4�iUŉ3`9dꙺ����F�cb-r�X���>�v�K�争/XK@36�U��z�^�g)��ĤdSa��*sA|�堖9��)a��^_��U.Џ�k��J�k/e�1U$�"����P;��*g���~�Nb1-,m�K���pF��9��Q��I�B5$�e����N������Ă~�j���em���oo/["�v�>'��(�}�����%R��A�;��t韈e��D$�/��� �a���sj�j��t�U҇��N��^��M4>��y&��D{|����rvY�Ņ+�A�*`�����PGN�E����^���~:�ߩ;���D�4�D���w��.~�0=q9���l����i��}����\�	��<��]J��b�q�$�c��X���z}�^{0�ٌ:1#å�m=�ը��;̋�o�������l��
xa-��e�����CX���w��A-�t    3.?��Pje�}�?aD�q$b����Ð7�T�L� y�:�uK��b;�m�	���f1=����;)��1øj0T|E�����#^2�DUIY��Y�����=~���'��^q���<*�@�i6���Ry<��>�����|%�d�Hł�4V�	[�d�L�R*�������֤I8�ӵ��I���yrsW��㎪�����W�H�7�Η�4��I��B���w,�W��i� �T-k5_eqR.�����V5ʖ/Q����x>����TV��ωĆ<�X���6n�� `���������aq_�|n��5vV�4g�[��s��F�g��5�9������y#�J��&�K�D�dߣ8���cz�KrG)�y��aٽ�S�=+��5!�خ�\Z�Niҍ�e �(�Gڷ��%�C�MJ�ӕgm�lE2,el&��H=��1��50i���WIƤ���Z���8�6����ii���[��Q�*�$E2�5ճ�켦�9cӊM�� ��0V��QύqN���9-�x�և 2�T�U�UM�|�@�:喛�R��:�s��y���@�m+�zhHwO/1�u��*��PⰊg[A(�1C��q����l�0:�؝|��{���v=F��{-����g5�����<ԙu�,�N��6�eo���_f�3�R�Q�|�֪���JtE�#8�߯.�r�����A�l�}B*LW+�\Ҳ$/�1���da�c�0��6��L����S����&�*�b�Q���������VKrV]Q��i
�|H���'�����z�k"�ُ���PQߢK])��-�I�h��w�Я����
�aS�Ŕ}0�K���.�r%9�|n��������O�r�--��9��폴LAz���o�P�o�����gʸ;��=/$'��`/��e��93�+��A�>��#���=�����N���J	��jE�`{א0�� $Ng�MU/��z4I���L�>UfRr}#�f�E��t_σ��塷*�������ն7h�fbL�U\VWlxQ>$����4k��ڱ��=���o^���f]��x����g��G�e������k~X��~��.j�D���s���۹����t �Q�j�־x!�I�p��<����R���	�f�-Ո�>^ٞC�gP2[�pȯ��.���nD%!�q(%U�&8~א'���&��N� ��R����9�Z"��I�l�X� z��v�9#�*��u���,�f� {�Ժ��)��u�S��R���/5��E�q��yw�,8��l�jɁp�29��ER���S����n���'�^����nz~h���|�#��,�5�EX��Fܣ*�=�q�ۍЧ�,�L&3�v�f�A��ݵ�s��o���L_���u`�A�S!�o�A��,����Ŋf>�:�gX�se_���b߄�j�h���fm 1	;*Q����0�D�ѡ�~QǍtҾ~�j�R����u��~Al������ɡ�_�~��ARAW�g���Z<�9o�l����6ݸd�A����$�3�+վ�î�&u�$Է�B�0|[���E��u%��<�_�oZ������t����������)�r�ۥC���8B8��@���"�Y;��*�R+s_�
>��Ց�� &��*��(`%5�{��)�L�ѫ��ⓤ?ƃQ�8L�
O�������Ӗ|�u�,Nj	�n[e�7�x�|n�kPo���Y��N3�AK)��b���ȹ{���ҵP�1� �V�
�`��ƍ�
g�S��Љ��U.�I���>�����㝣2���ss��$$��z��+���^=ќ?L����,�-���͂.-8��8� �j�w'��(PAc)�ڲ���?x�q��-�6=N3�kR��C �ԅi��!3���A�����Q�*�ʒ�m�,x�T^3����2�0��	\%&�<{����!&p���NT ʥ�nz���J��G8�FKuܝ���G+�j��(c�o���tP��k{��o�����n@;[F�1�{;�.
�
�o��-6���8�[\�n���,��q�w�/BT�fQ���w�1?.�����2.�r<ϩ�dZR�z�Q�Z魤I_5We����}���1h>aR^v+Пq������i>i<&ڶpj��D��|Eڬg&��@��hԗ^��;��-�w�O�&Y�T�*����'��� {��T����$J���ʌ�Ӂ�)h$'7Ҋ���h��F�%��t��^�ۤ{�|r�ě�n+�W�߷x���o�.4!=C
u��2,��AM΂z�+orɠ�d���m$�\�h�J�W-�W/�o��^�j�l�����#*��Dӓ�"�F��n�\�v��ن���[�[�o��z�L4��i�qbi�/�*s�ğx)w��U-&�#`���r̫E��`q�{9a��vy==�.����`���� ���������>�o��'x9p��l�%$��UZ�,FÖ�`�������Ef�:����u��i���υ>���~����N�q��7������)^�����KEv���~�%�9�����A���J�Y�90�Qw+UQ��y�_�����������+���}Pn+�Dʜ�t�Nr�������{��+��ȘwLx���j��5��1�A��c2I_5����$]�J���<���d��ݹ���������ܖZ%��*nnWi���Bb08�
ęL�-�X��?j�a��x�Q�J����}|C������s��*8fK㆖Lq�a�"&��ty\�_V�w^��\�j�q�S�ް:����1��#�3� (���öM��K�0�01ɝ>���W�Ӊ��0�X9�g�eXI��3[u�U.5n)�5U�"�f��_�J�r=�F�F��k� �猈WV@�ŗs@���@fŃ�i�,	)�s49D/aR��d�6�RR�&�$,�#�iy����1-�<��e7�4L��Bgͤ
_����73��_%X4w�l�(�]i��IX�0��=���A}��],Q�Z�r���Yw����<4T+6̉_��^!a��o�>B|E��2D[�y�tK������.��l�-h�8�m�2�w�J3����n����<� ��}s�PF��� @Tk��>C��\��
L��-��YqY*xJ�tk�mٖ
���F�����Ӷ �ַN�Q�U�1�s\�خ%��+�x�/�+���}�؄J�܄5��<j�n�u[���J[*1����}+=�W��q4��g.�g+4�D�L��s� �B
�i�B���.���+���� ��R���jf��PR��a�Մ�wr^LӁ�@�X0���;wӾs���*��+���' Z-��z��r������� U:U���Ƶ�8`��]y��iZ�e�:��ˠgQTk�?�&�3E�۫��M�s&ܲ~��.���7���氣�tƯz��(��00�(��*��<��(���3ր�/�3�s�a����f���2�+�����<��^H��gܩΠ�uz�!X����R�/�YV�b�tV��-����r��9T�V��
%��lF	�H��1��<k8�N���(1ܪ��[{y:��H�DN �cj꓉�80��-�����հ�@g7�!�t1f��3��Q|���	���;M�3�k6��l~`K2.�S�).2�Wl�._�)ȅ������@*|Vdm�a������L#Vļ �SM�ś>��}���F�=]A)���ז3��,��2`)��w��x}t����5C�pG�.ddآ�2�����0��T��0[��q)�j�W��s��ϔ��Q_C�����;�;���C���$_�9߻	X'�S��<�r�*���T�S��ol���@��1�s��D��4��v%�r�������^��Ox5͒�� 3��=RgÄ���wm0WO�[Ω�O���m�}����Z��-��Ȑ��-nL����Z-�AZx{��^�T��5j�&�c�(}Z�в��ം��R�}�-ðqP�@S����O��4�WF5��˜��nQ��    ��\����Esm��2/oTl�8w�#�v�o�٠J��f���~~�@�ZH㺮]�o��\�mӒy�X��4	v��j���5d���Up��̄[[+�kB�"jާ���0c�U�ϧ	� S
05�ܺ��M��fe5Ɏ�����q��	�D��x-Z��t�[����Mû���'SR�~�ܣ�}�)��ǲ̚u�Ƌ�]���dW�dڱX[\v���k �>AW����[+��pSq�'�8Wj�ç��M�-��MRK9@�� �@�_�a	ŀz��}'�ټ����v����pT��k%��پA�k'�!m���t[>P�zl��\	Y'�j�ѽ���-c?PӃ<�Y%�m�h>�R��q�
V-�n}���"��_�c��t�M�(LT�	�<VY�����������aY{��6�U��!^z���M`��?�fr qLS���e�ՐU���ͧW��ͤ�u!�4���qP�;���[ w���|���gK�o&�F�*H9�	-�}�b9"R1��|F`.��آ��
F�9o1����N&���a]m:�"�=���o��Eő�g*�lV�sl�j���VwD ��C򰫊 [�_���L�@n��靺l43u8-�f8�-����	���+KP�A�V%�2V���y�=�B2�6���}�;<C���E�ş.O�mzT
zh�#�7�n�A�u����K��Ӑ�=��>*�����W��F�p�q=7�S���Vp�Db�KjR@ӬE����r �|HW�f��@�n��d���[�p��SaH6mi%�u�m�Ŗ��<� h>�����*Љ���E����'3�g뺵�`�����$�Nf�����*��S�Vz�s4'R���f�:��B^�q��Y	m�7�[��[⚓9��_2#f��3��f��+���A�%�B��г�o'u��o?�������W�#��X������0���f���W���&�Yg۲��+$�����$jR5(��T
Qhɘ��8˗=�����[�����j�ǠG������4T�mt\l�V��ox2]��=�~BlKR�dl���B��5��_O�%��kH�d�N��~�`����Ȳl!4!��k:sZ�l>6�_��������Z"*>;O_�T����,!W^ �^<[��U6�Ɨ�7�۪!U�;�Ҥ��|�� �L�+`�y�K���5������B&R�mj5�()���hn�o�S��O��}���mjQMnL��ɝ��)����	'��N�	z\rAXA�����~��Q����l$��/�|���_��J(g��Q!�?��x�_�E\k3z�3��<K �����D0F�tBSwGo�B,@�0o�^gļ-�k�G�OA��:>���S�p-l���RI�|�>�h��#uI{Ń�q'����E�x�#����=$��d@U=E�;F�,�]��V4}�pH����y�1�-(Q���E�w:	*ׁpG��;��ft��b߀lԆ���pM`ր��G��@���6
z
�r�f����M�����5<�� ��%���Ł����r־s�I����o�kX�__��;#~��'U�#� �K���k�j[.�~�������D��-ɼ��0�S��I>8ّ�.o����۹�d�^�̬;�Z|�1٪Dn���}o�O��ԆfOc@d��Z�O���_��@g�l���8�t�U"��Vv���˻g�D
���)�-#��:|u?R�]�'�Y�z�,hnD�� @��+��u���ل���E2�Fu&��"AV�������c�B�;�*��}`�쬶���&n�$��������"n����p��m#�B�9+��ڍ=�2S%��[d�?���E��JY�CZ}�Qe���.{�3�ʭ!o��w��&�".�3��E�hq���O.r���/�c�7�3O�xQ��?��{��X_$a��[$w�O��'�k��W��&���l���ZhP]��_1���r�
�|�z�8�Ajx��v�l˴�_ݏ�~\�(�(�Gn%6����Hw�*.�C�dqf��4�w��U��sJ.!�MUzť$}ڶ#曱�O��~R#��D���������h{�8g��Q��E�CJΠ�׏���� �i��WN�(�=���_�Ş�Fպ�8|���E���t/��f��7����J�|� ��t)3
?Шد֩rR�BC���;02�������J��V�[!���}�h)�g��r�m;q��m�;5��؎�,E^NA����8r~��t8�m:�D�V ���=O2?�-/f���߽|n�e�Ԅ�1EH�l���l�����n���ɷ���o��O���/�������ӿ���������Rr��2��� �[����~M�8�x:�wȧ��B)֏Q�O��n�OgE�L����-h��W*���^� Ћ5���^��&T�f��671�|�@F��R����M����ҧ��9�
��o�������ܽ�U����l~t�[əOq��H@_؛�D<��M���8g����H���\�P��9[����
@����w(�n���ht�q\�3���75*1����Ș��6'Kl��]v���^w��p,�K�QP�
��dĲ��;��9`�����X?x�b~�Wjw+ڹ/��@���k$�=�_:��.��:t�{qߊ}Ta��ɸ�������0?ns��e?�T�g�Q�{�m^��=��-��k.p��ʉ�>�/�b�lo��X�R�\xi,N�P)]�����Z�Ca��G)���Q�4W<���� |�,Ӯ'x�e�0"M<��I��l���V~���,���Կ<��Za0�giϙ�������PП�%�������`Q��rt����.�眼&��Cs�^1�¬��?�b����s顥�EQE7/�xV1����;\��_�q�5,F�+K�O�#=�����pF�M�K����+s��۱<*��]�!�kM�K~[�uM�k�.]��Ad�2j���_J\�h<�}���U�aH��~��������)���#6��������SH\�aG�1��˟ӯL��\gTp?@M����O�3#-���W���zF�u�BQ�%y�p��Zݰ��J��6m�=����A���69��>�����E	���� N5"�Or���]�AN��o���eV��l�t:ʩ�P�K��B���{��z�9诪�P0p�_�b�W\?�]�Yg%��U�@�W�!=��k'D�۩�`�מ��FU�W��9�[,�Jwzsqo�������b9�g_��<�}�T�x�|��p>ȜX���s:W�nil����TA�p�}�q(�����R^��D"���r#^"�h.���p
�,$�ܕ����Q��o�\�Vg�S���%�8��y�d�0nkQ�=����}8**�~���7ZJ�����}��Z2�ʥN��#�i�1&+��s�y;b3z
�����^�:��Xg�7+��)YJ�����O�\hN�1��Y�R-��Ukɭm0����g�m�;0UH2~��%6�R���`L�D�y"� @q�L�x��3��hb1�q�e�L�c�;�u�Ig���XE7�� &����~O���h�Ϲ�����g��)��=�z�j/�����k�E*V�S�R1y��+�,�5�vx�X��d��Z���"��q���&@[!)q���,��&�|&M ����S�x��`;n����L({��H)�G�  B9[1�~��"̲�=���/���jE�����ӏS��,cQ��<Yӱ7�$xI��P��V3�����	8���|�x�9��b�W�Vs廢����YLx��Xj��8(&�r�4f>a��^��s7%���GC�;+�� ����j��Q�i�g����_�������]��`����f:k���i�ȿL*��p5�/�3�À�c��!* ^��;�A�DH��0ˀH�M���OS��H(��s'��,�NV�5�0��w�7|�$ �tZp� Զ�VX��V�A!Qb�KC�
�Mm�    ������yߦSD��qG�	`i7���u6ό%ۨA��0MǗjBЀ���rx�@;R,	�T���OG���sE-�G�K�~.�$�W�3��Ҭ<S:g�hF��8t
嘨Id����#�/�B���<��t)��G���ߝ^�ۢ��j�TW�j�t�\���.n8 �=����k{���k�
8 � )�EЇ�.C�ӧXZ�z�'�m������I��kz��),K�R5�HGu5�T�Q���{x��R��T1"���~I<�_��
�7����a�0p�ڛ�����ZpMj�?��<����v�S�}_фc(��eB���|����r���.c��>N��Y�lu���|`���z^\�RE����҄#�Ƿ��d�[#lMP�IN݃�%a~�FT�̀<��Ń%�C�`������!������'˼��xr�g%Dk�s�_P�i�&� /���[�Y�"�j�/�������=��k�+�E����^|:f[�X��l��	:-yE ���͸��ŘF/��co���'l��w��(^�wT���H�q(<�z\��qƸA�v����uB�{�0̨.��(�����;I58F��p�X��Sl�Lh�'������1��p�`��Yy�r����gSM���e���x|��i�w V9�w�iG�ź���I� a]T�FP<�r�����媒�'�?�^',7g"W��Zg\QX������z.�첽n�m�9k�އ#]d
�B8<�8��@����Ꭿyz�F�E\5nͭZ�V���{)ڦ�8�����}�P����Ր��b�4�^<��HB�0� �Z%j������	�F�����]�İF�Lm<Ҩ H]p<,�7ێ�sp�x�qJ� ���]yY5R(�j2W{Z��� �T�PES\Ň�p�l�ޭd�Qk_3�M�\������<,����Sqy%W� xe�{nȕm+?tS�;+ɫj6X#��"�}��Y��r)`6-7�5�M������8��/:�0����f��z���6z�h���T�B�j��۩�J�ʱ�}�]"�|�+t*���(+��e�-�J�gНh-���E A�h��`�>C�Y�n��a�vN��a@Y��:!�|��z�[��X���Kf�jq{ŭv*G��گ�GM�n�Ymz�yE�C��6�$��+��߇�Qf�F��	x�WA/-!|*;*�v����4Ľ�� '҂\xUr����hT�on�6��#r'}8s��`��g�CX�L6'
m���k�~瘰Ϋ*�L�0z��)A�N���~�E�I�̀4[�m?m �5��s�b�)i��miGM:��������,e����y*�;zʏ-�G�p�Y6�Z{�D�o�-��\����������3��!���#�@�"�J�����2qe���ʶ;Ɯ��1*L7�p��hF�,���ϟ���l賓}`��H��ʎ�3�R��=n��O]�{h��^�J7dY\��֔� h*{�4YJ�&�0�,Ǭv��=�;9z��Jb��y��گ�5��A�m��������53�%��C]a�1ɑ� ��qK�ǚ0� &ۃI�8~�����_s|nu�I�,%	e�v�crk[*�q�1��ߎ$�0�:k���Gi�#dM�Sb������F <P���9?�_�4�>�|�*!�LV�3��=�F�t��o�BqD�fI�M�w��Q��?���ۛS,�P�h�� Ua�_���?M�5߆�I�o:.����0��sC1��7��uH9ͯ3�)bӓ�(Dg�G��0��|8���@��1��t&���v�O/_���H���r����⫽%��:q��.Bd E�٩��`r����"{Vd� b��뇊5k�7�q��g��8E@�[P%���/C+�(�W{�s܃{�UJW���{]�ơOt���e�b��I"�5S�mu�Bju�܂k�od����JIfX�!���u]��}30Yݬ՝[��a�S� �,m{X���ZpX��<P�	IY��ِ�u�I)�D�U��b����US5T9�G�7��# ԾT�b��W�P% al:x��b������bc+�z�x��x�J�p(���U=��,{�����B|E��C��=�P�9�uq��b��Z�}��`ɭ�OZԾ��`�o7��@�;Å�&���uoT-���j�N����9��i�1���� Y��U�6v!o{i�vo��xȮwN�cX�~2tB�����V��o,Z�Xn�i����O/
��Ww�[��}W��;���P��R��X�T��C�LK>7�m�g�
[�/�=�t��,o���<���.�K	0rY���D�L�C�_|���2�_+��g���|��!�?~�q,�P�Ѫ���Gp��J��8�t<�LO�b�Z:/�	
�=]��nO�Iy9l�T��QY����~>Ȥ���v��֓�Fs����e�Հ�!c<���V�Ɣ\Fx/Й��
+�"�����3Ỵ�f+/�ӨNUݦ������2Q�G����`�)ᵠ�&L�o`�����	���e�Ѻ� 7��(Vޔ^gC&�����x~O.�ϲRh�f���*ݯ�~�`	�A�3	W�q����"X���`U�nh��&c[^yY�A
��L��xw��tq1���5t1�����*�VS�t�JK�CTT�)�U=��6���~)�N"�e���k!tc4Ӥ
�׊f�rN�Ѐ~>SGa���RW�޺2m �u �d���?��\�Y6��	b��(<�f���a���;� ��[��KC�yGf��{��3�
�|bc�G���<D���n����Q��y��j�N�(D`�taP�-�Z��gZ���@� ��AҴ�H;F˶��5��5�9���k�Oh���LL�=�)i�LӅe�	�-%�T:'F�"���u��3(��v|~�\�0�t&]�}XG�F�e[�:�����&��|Ȁ<�?�ݚ6��3NF�����:�����u����U+PE����Nڲ�/P��1���B��i{X˹T�I��v�r�#������Kе�SAv8���=s�՜y��m��7]?\�{���y�u�h:�9�E�1[�?@���Z����-�c�cIU!��4T�ya�B��Ax�Dr:b�L�^g����u��������%��|F>m'�B)�
,8�Te*����+�y�`��B$P�!�ҟ�u�����t�3�ejY����ݿ����1���*B읥_��<�d�����x�?��#,%����P"���p��dQ��)}1�m�{����RVm��J����b�=��x��lcU�>=���f�(ب�O��R����ʹ���������d���(�[�t�(�ꂩ�����O=��4�c$�6-dO�VU��I;J�%J��7�,�iq8\�nT�c\��g���#��:�Bx����f͛�b\/���[�-�V}�2�m�M?��%�F�������P�z��E4W�����W�U.�gێI<�ќb����:Y��\'��uƟ���������=�[�?�&O�KN������G�� u{�v/5A�_�T����2-hH	�*�׎������[�E#�3 o8�)t�Y���Mn,�vY�_��};,�w﹖�B|lM��~���iC%�E�j� ��Ւ��/��&c����-\�ŷ��ezKQ�B�od9)��{s�a�F %t5s�s�3"fDJo;��1#�b̈/>��V[����
�uNV�k�>u���|mKx�s���+h
�V���4t!��Ra}%)��~�'�sGYť�F��"k�_Re�[A:?N�lQ����7hPKo7|h1k|���l��hD�~>f[��˺�dc��IB/�N�ΐ�%7��(��F3u�,�t���0��������Y��Q��+%��c�Y�Ubn	w
�<�u��N<6�P�I��p<�b�(����o�o�6�P�؉(��ʠ�3�0�_��e_{ڟ�c=��a$��Cs/�Z�v��I]hs,L�BZ+l�*�uY<��e!L_�4�]T�{����6Kt�E8oX����6���b�\6ٻf��ri&|�:�HK�SIQl�"�    ��ﭜd��CF�GG���FST�x�h,]��n�^�iя�Po�|0�D�G�� ��B��,װi��X���4��NGr���ԓ�ʰ�� �T�������Պ[�	-)1?~�KĖ�p������t�6рm�
s#*<8�
p����#��
��ɂ{��9��;S������G�E��m��v�g�"?l�9S)\�I��ζdt*�<Rc��4����~x�±(�\���d��]�[>A�؇��3���\:?sN����y��Y�+�.��� �[`�E��Ke���Ef"�N���<��ܤ���[[�h����^�Z���H��,PTSo�c�Z�"?�d�Shh%n1�j��/^�� '�&���\���O!ϳ��'��Z��7�  A^Om��*�l�~N��̧w�^w��n���\�q���ZM�������p+�Q�uh"�-�`k��r+��{/����D5�k6CMKŦ��-����g�=w��;�R��d���w��^��Y��~��MdL��6�a
���e��
Tf반�7r��#��8	m뵞?U`DdU`F
�Z���A�-��di�dxkB����u���6(�
!�����[⶞�~蘔�9,�Pk�5��}�}�;�Njd]�h3۱�A%f�h�
bY���@b{y�鹃 �bd66��m��k�	��hqƞ\�aXˬc�Ng)���~��?KhlY� �w�?��b�e:��:u20�H���ұ���b����S8J���gj�"b�|�We�k���g�V���l���ܼ�c�<�[�~f��.��z�-�u:��8���s�#(l�������RK]���̪|*��R9�.`,A�RlK&�Wt����_>\�_c2��{)ų����x�`%�V���R��c�Pr����E|j�x�6���:��H�gU�)0��Å�����w�,���3�j��k�=�X�"��{'��{���B@�������w��$�`3l)�5���]���x�+��;F����qK���O,��v<}<�#� �����nD�aX�'�P{��,��'�n[O��?��Ģ��T�q�V	3
tw�L1�J�4O�9�1���9�4��,P�d�n,&v[�V��f9�k	�S��u^��g.�ֶoz�'*k9E��}r�h�&/"s5����'���x�!4E_�W�T�x�w��i"�Er�q*����,�>��S�cX�T3�ݤ˟=Y-rOV�=�^՜�F��ٲi��C=<k�۵�	^q]1��7��uғ˩���.U��ĪSl(�� 1q�7�j�boY����Cyܦ`@��B-���v�^�n� �茯�tSp�6��ŕ���ޮ��Y �+��v��:�:�̈Ɋ�~@TaQ�� ��A��Ќݞ�Siϱ�]v�ipO�&[�:AUh�4��dFzu��+��TtL-�)�P?S��H�,?���`�����Y��j��g�x�¥\b6�����_���|�Z�2�A�8�qfbdK^�^����ȬՒ.7$��+?�e�OuK�hf08�%��Rw_�^�.lW���c��W�YU���C�2dk���N�����' ۮ,�"�T�x8��K}���E蚙I��Ϧ�J
d�߂qG�p�u]W�i��r�>�/33�}C8^��m�Zv,�Wힻk�}s��6RU���u��zU�fw�"lk,��C��oPenX	�ڵP����@ֳ�R������XіK�+(R·��e��u�U˙M&�.XH�Q,X���% )��3Z�T0�{�u��<��(޻�I��N����9&[�!����=�Qj�.Q��<�[j<�p��d�8��0�<6��ME�:�Qك-�&�|Z��8�^GH�q�f���Z�1,Uu�M�_G�l��X�Q5U�'u>5�}tg���l�h�cTl����S�o3x �[����B�B��b�G���:�y��C�M���#��ǎ[b��+W@����龭'ƥ?G#G������2��QsNa���ц(V�hj9݌.3Q��S�AǔxG]���/#��W�Z�4��k���B��Ev��3[��>�/�Mr裿!���ڹ"_n��~��c��������vd:S�����ȶ<H
9��r��a���zI(��#��K�Yuγ�k�03)���-F�w�{G�R��a�CB��A=d4[��Y��*#1ʞ�����u�oM��cR����t5��l۱���Fx�V��ݵ�

�ex�el�l${���D�a��(^�s
x�v��p��p�).��8����̒�@��^���?���l*��X������X%�6�6Vlj�%uțXx6��"caS	cN�T&,/3�?�C/:�Y�D|�^Q�Ua?F
�(�V(}�e�
S�_"X���)�D����p!v/�3�ϧW�U ��8`�*�aJ��1��X	����g3[kr[f�dG������#��9?�HTT)��A�%������I��S�����r�O�3���*��	�AG;qTU1�N�a�R-ҺI��f�U2�e�	�+�?d��1"�_Qi/(R֭�|�He�����y�=�X@n�w;�å|���j�<�J�z���� ��y�9�q�k���a]���k;׭['��S��lT��Z�z!ȶ�lA����v���R�i�zۘ3|�J�v��Yz5*[��HR&5��[��Z�8���|@y娣v���ۮ#o}yeҽD��)��،I`�i�p�:�x�|�a/�­��d@JOu6�|��fE�I	+`3ń��d����f���lT�������ʊ�kP��T���
��b27b��VZ�k�8i�h����5�=d|��0�d��ca2'���t���X��@��,;cqہ���:�r��ۻ�+�^�m�xy��f��%��v��c�m�8��� g�7��˝�Z�kx��I6h�$;@���34x۬�w^qf��b|�J"�����R7,�F6��Qf$�F+8�",WRZ�*�I��Ӏ��c[U����am�/�/��;�>�M�h@ꐅ]3 ��t��w���B�UJs*�j�~c�Y����hiM�no1�����|o�������6�Θ�)��iu�h�_��]�sm/%&�ԧ$�Q�!�f������ӏx=թ�����iy-��>��L|c�x$:csri�Ǹ�|H|�&�]�ECe�w�P&��ޢ�Nc�S�T�Ka�Q𫭓g3��b�%�������a�w5��UFn�f,8�/9���N9H!���vp�z#C?�Z�5��sػ��������d��u��.��c![J�1W�������6K�"�a(�ab+��Y���֯c�闧�����ż�z���������P��7?�-C�9E��|�:k]�AO�J��S�۲�]�@�E��vήG)��K}g���1K'�"@�U;�����Up������p��m�"�-N@y�'�
���I5��Z�W�X�9�3�ҌC[�]�m_w��o��/��1dY)̉�����9aͱt�Q*�-�C��ɩ��LD�*xc����-3T<�K�b^�x����x�.Rn�I�)�ٜG�|aOqh\�.�J}i>���֤�_樇�K�!EI-���R�����ּ=~����%Z�	�˭��\�l����~����~9�:I�G*����G-Լ�;��=�v,��P暊16�h���fO����F����ij��U�I�K��%=��M܌�\#x<>�Zu��-8��%�Cf���|��zW�P���7���TM+��E�m��?Q��
�u3y�%�+zjBn�V(�}��k���1U(�<Dqh��L�'�(�n�N��!�PJF+Z�Zny�j�e��?���䑭$ZNI�>����biKg!�eg!N�6.�!y�s�83"�a�Xl��);�ܑs���t�I!��U���\������~:�h�0��A	n����,�p� %� �l(���0 �&o��YJZ�,�(I�?q�̚�S����)�ԺCJsn޾I[jI �W�rkDY�Ȣ�>1�f��U��    �I@W��V8�;�Ӫ����&�Ii�3�<��e������>6/�O�h�f��@Ӊl��r���W���nԎO�.�����,0�U��(��ԍ��fo7�C���gQ�)�cq�����m�2�᷸�AQ��En2��&rK���$�q�����O��>�~�������h7V!ɥ�
#LWV�n\	�O���m*�e&�iyW�"����h�2��I���53$W#y�mm%k��*g-,c>U���|�_U�V�����6�W.[�����6`�S�S(�϶[k����W��,��M� �c,O֔�"�/�5�܋���LF���?�+@�=Sq� į\��"�4�����-
�5�`���X%FϿw���� �]�%��,�Rh�5ڒ���k�l7}��.6R��3������ƜWC��=��
�k#�Q^�P=�fץ���Sݽ�Afaf�5�n������[2�DH��NEV�WP�>2a�j���E���]�C�a7��O��_es"ٺ�@�� ĉZ8���./4�u��;�p_��7�8'׳ӧ��۠ͯ��^�����֕%����ꤶ�oo�U�'���$?���9tMЮ��sv��U0����^��ȹyڽ��Q����)+Y�:%����,+����J�� �m'��LqV�MrEU@4�#W
~IPŉK�N �'�ت�GҶS��n��VE�����=hm��4l)>
�C��O]	���5Ȗ�Aʜ���T��+�n���M�5���u��T��ٌ��+�0ҩl������� �m��_(�h d=�z%ӕϧ���m��8���|FRQim�B�>p��<�x�B�%&d��#�[����� j_P̑@����Ä�/@j%�L��#e��K{9f��S��%o����[��-��^Ŏ��=ƹ�#�Z[RC���hH����6͍�X%S��f@�K�<��ڰ�	Dd�f�<����rF?TS�ћ71D��T�s�괧)KW�A�\Q��+�ѥ���m�ЎC�Ζ��2�.��q��0|H��t�xa��I�Fy���K."v4�����-E�2Yӕ�p���[�jM����\w�D�D�zN�2D)`o�!JuȚ���GJ� l���f)b04��(���F��|=�LD�_���cH����R�`���ȇ���I��b�ȹ1�W�E\+Q��7x���+2k������q�K���dR{	�O-%�Qgˬ-:�-5	eab��A�����>CA�8��%���;���d�RIH�y_>ߔH)�����ͤ��Y�N��#���{��ZI)�%����a�����~î�zK�A���'��qG����Lފe���>k�("�c0[=���J1��JC��jH�9� Z^a�� a?;X�s�Ts|�����v�������/�z����?����?�����.\��˞�?mj���heU�F�r�ӍڬM3�	�>�Z\-f�@�pQGboS7���˙.%XK!�X�����Q��H[���q�ۢ��ҧ���*j�,=4>%�X��^ްx��!��; -�@�U��I�%`�5:	��bi?���R״��h��Y���F����#��SՔ�+�j��9��h�MGr�g�ow�eQ�g��.���m��Pv�;�4��II�s���1m/Gd��t���ɒ��&܏� �����|K.��\?Q�����`��0f�>'+�,�v�5D!�����f* d�a��M�M��C>�W���DK@����5���h�|��HpU��\�௚��j"����k���j�ǧ�O��c�?���:�HI���OQ3��� /��{]z�+�& �"k��l� �Ԟ�<�΁U+�б�iK�g^?��<��"k1���/f��&2��P�Zu˭)FM�v����9N�쨭L}D�kG!�GQxW�C�ADz��t��<dˁ�)�J�ՠ����c�r�j�j˵�~��5.Z�/�ZF�ى�)UR�dy����+����!li٣�Ӟ3�+c�6ɓ�^L�iBx����Q7;ǡ�4$�~k�;����m��L4�60;_���.M�΅4e����T��O�6�5������D�6������o?�G������
��\��j�� T��y?��۞]���o����t��ߗ��-��h�������G����j�ɕ�����/��������JJ��+�%h���=��ꋼ�5dn�`E�X�PM0���h��+5F�R{t�ÅU�ͥ9�m��9�m�����PH�6�����4��h��ZvmUa���ߛ��+E᧗=���d^*���I;rdoD�Wv��k5a�(g71��������9��>�S[��@0z����݂FqjFVH�W�P�4�P�� ���-��"a����^> z�o�C-�H%x�+����3X�qG���|8ncK]|^�i?H��i�@;�Jĕ�Q|Y��P�I���:׉�Y�ҕV�����χS����͹�M�}8ӖW�E�x���N��H�������9�wi� B9獍G�F8�U�1��y0\q}�|iv2�#���S���ڨJ }��rvq=6ἆ� ��i���Η�S(�m�?S���	�����>��mC�����l-q^I�>_8�\��>:Zq�z�\9�(����n<��aF��G[�i,n��w���u�錵��ABB/�b�Q��}զ��v8܅z���,�I��v�nSW����F��)%�I��g,�\�p�a+���e�t��`5�����f妪�	_w�3����L���)	I&j��"��[��f�Fyϻ�6�K$&�rĺxh�샴k*WR�R����S5z��mE�o��-|�p]D	A<���9s4Y�-\ӯ��K�N�&L�Y�� �Ec8�I��o4�l� ��o�f�v-����My�ʚL֘,/��vkz����uǨe^Q�%xU���:(�:;%i�J�NZ�հ�@|]��G�8쨤��"!��Bj˼�����7U����5orv��T�<�Y�ʥP��ě��\��/�hr?0�Gۄs�¡�GF'�`�u�K�`j�l���~$����t�ʥR��q];Ųr�7�SM8�p	�#��� {)PN25|]���A�£�>kz�粹ӵ����v�쥭��x�i��s�Da�Njj	��IU�6��yU�{�镓9�E�O�uD���i��)[;��EӨ�X�����?-�ͫ��$l߆n=(u��d�0�Jհ�i�=k��Z�aD� Xo�I3% ��䥨��ש��p����	.<�y^��j��se-A�X���I=T �(�yY�OV��-�ڿ����D��e��7�6�0q�t��9<ڧ)B�|FS1���0�Kl��d�YP`SoFݘ�:Gݲu3��KRC�Ŗ�{�e�c��_����h,�jM��
d�Z��1��5�㭋w�r�L��n��+�@��m�i��g�t�o!�G)%�X.��%M��g1뺫���fC�s62��*�ǳa���:������y��OC8�jE���/t�t�����>�?[nb������=����u�����V�� ��^��Y�ۑ�!S�����i�U�^�o<R�,�C[�Z/�+^��b��#������{t��+��ѼЇ
Bq�ʾ%�\��|�[N�g<k���ڐ;6쯪c��Wӈg2���w<���J�l�:�=���
�M�0 ������f���P}��B���<u���3��ZPJ���B}�/���.���в�h�0��y������ �=��7!n�`��`SW@G������%�m�gN�d���%y�瑘���E����D�X� rDB ѐ4�,����8=������a2��3q��
o\��f'���!��@��N�
�zk�k���v��M�S��qp��,"�tg������[��:p�'%,�5�@6�Rx��ȦV�M�����x���6��vظ`��Vqt���J!Xܞ���hl��d�L/���q�ܝ7���u����q<�Æ[���h�� R  T�<`�	7��7*k@��CKu�H9В�uV�ל��e��Ac���Y�*N�ι~TZ�怮I`(�ޒȖ̦�[�n����v�Џ���y[
�j�b��x�l����#Dh���,��zR��d�BHWO�i]|�.7?Ld|���b���كs����@z��p̉\*&ߡ�ԇ^�?�M}�'�2�D��D-���g��:1U���U��6l]�k��_�Y抾�ӈ��������@��v�X����T	V�*g��k��Z�_|9l���V��򲖳�Jߜ��]����"SH=a��-}J��(x�F����N65�ՊB��e^&Ӊ�s���k���R�:����u8˗j�;���Цq��7��6���Z���zTc���"����V,I3j(o?��n��n��l!�r1ϲ�4�7�qȏ{�Vm�'���*�}[�WT=sgcC��ؓW�{2�
c�A�ȳX?p0FO���*	�I� Jp��c�rmί~�r�q{�L���Nb�Pғ"�|�����W.��C)����$?tx��e�԰��D�/\W��|�x�[d|'��.(du���v��ѕn�=�Q!�Z��Isv��2�Kw�/�тr���r�Jf\�0b*^.�SᒕnǊG]%�J�.���*�r\|���7 J&d��rS��ωT�<3@N��.�a�q<���f2���k�i��u,����c<e�{�)�[ 4'k�),�F���4��CCF~펫��l�K^�euI�}��x���6�: R鎧nס8��X�j�
�{�NU��,kZ�Xeg���A��w*��{q�{�!��'�6�����1�jŔL�P�����9H��y��J_%�N����Y3����!�K��	����am�|���?�oP;��*q���-:��S��\��{�F��Om�.[��*T9�������k�_Xdڪi8�:����K��%/K��ɡ�������Zq�N"L~�FЙ�;#?3����u��E�z&"?T���8:�p��3U~�����%�W,g��R�� V1D��%RQ� S�.k��$/�/+�C�[���OΞ^o��^��~�G1���et�T8tE��Moj��ߧчvG�1���ؔ���eЂӃq��DA�q��儲<v�:�t�	�ߨ���~���U���������Q���q��9g�1�(�Ux6�l��\6�A-)^�>�M*����I��Y��C��]iO�؄�N�R��m|Z0T� K��,��$��E�V����*k�W��$�C����P
����'��j���kL�����A���^�C��.�O<!�:�f�wT��#�ף9�(�;��<�_�+�ܔ����2�JrG��<���ɬӼ�TM��O)�S
`���ߛ�+��r��E�Q��j9���l�C�9f�t+(`����׹��A�P��$�)/\!ˑ�2V} 7��/��?MU�{���`,_r��$�1���]�Kl���(�(VOz�X�2����.�*-��b�[��uLh�jK�<�]��������"W���{x�MRk$-*:h��eFz���d�PRg$[�lO�@+��G�$���/����幣K      P   �  x��V]o�H}ƿ���v��3��H�
ƭ�6�F�Jh�=	
����� v��ö��m,k���{΅h�˱n��`�m�,������ͳ�<�Q�w��+\	�Tx3�����s��#�3�[P[.��1J����L����2��B��`���V�:�a�,v#O�#�ر� T]�R
Ԣ�Vw�ԆˉNm��^�N߭��i�n�8/�*v�2��,m�2x���{��Ӟ�rG<xcx
�~H��޽������gkéN��O��W��E*��<����L&�ďE����é:���s?o�ˏ����� �z�����%U�������'�{�=��{Q)z��Ѯn�mm��b��W����HHZ@��RW��H=�Mkr�t�x�x>ԌP��T�xJ�]�n�i�p��ŵNȉ��s.Sw]W_2���c�.U�F�H|,��L���e�d�"/T<nX�����mצCC�K�Yh�VF�)pr��`��l��T��Gt���l�I�|{��[>E���Ny=bj���k>߮}�#��ژ�XYd�M��P��]o�<���F\d_����*�UY���=���v �3C�>����6�!��O&�� +�\\�|4��&jB,PB��C9/(���v1��7�d�D�ȱ�3���f��݃l�>
D�;�Qpmts�a'�(�6�3X���[J�V��W��ǣ��_(��g�\��_-�u���&��M۔$?��x��i���(X��柲||����vc�L �p�c�l�U�]]T�E(8��/,��<��D��9�m/�c�Rܵ��xQl:}Xb�m�eX���K�b�rZl�F,����L�2�k���K�	�R#)$�P�r�TE�K���
��C4��ϓ(y���o��^��e[RT�̟N��΅Nvȏ�<S]� !6���5�&�U�/�3��WR������R�Q��������7Q      ^      x������ � �      H      x������ � �      \      x������ � �      d      x������ � �      b      x������ � �      `      x������ � �      Z   �  x�}ZKr��\C����E�#�8!�
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
������pm�����oΓ��D��A� � ��.�A�凕{���#�u�,><ރ4k�� -�3��A�|q��=��u��V:��v�_��W�3,�3�8Ǭ$���tp�s�Z��1�G8Ǽ��������1���-|��5���	�V�E�������=�[��U�k%"y��:Y�Hf�Dܻ��JDҰ`%�4��*	�xM�N�y!C6yfS�f�~�?ߧW�Nk��gBa�Ik�I�j�I�j�Ym��9�?0Ts,�`����H-|z��ϔV��v������e9+n0��L�}Ҙ�i�y�7��� .�WM������F��F�Lx�g~�dvB��Ub(��/��d������d���#.x�� 06�d��qE�h4Ə�`g4F��2�\]�B%v������===�K@�E      D   )  x���MK�@����W�\�������MěZ��j)��5b+4z*��n,H��B%���>�d���`2����V�a�x� ��Z5�t�n���ꪈ�v��)2
3��8��]N�\��_�9�}DI���w�Q�B��4�3^^��r���~��t;-��z�N��Ygs���&)hk�4���?�V����U7J�#N���#2v+��:�=	���� �h]�����"�,����s�ٴ��C7�p�6���ԥ,¯�!��"��v�SP�㇧�I~sw�8������M��ד�ٳβ�|.�      2   �   x�e�Kn� ���0U`2��.� pS*�)��fN_'�m6�������cIPB��)L���(¥�9Q]`lN͘�*�²�X0�v�&2n��x�	E�B�����_ڲ��{�S�*�;�j� es�:.!Ց���p�eGX�p<��kÖL�x�y��v��{��i旹�r�%�'E�bM�L��ܒ��,�c��k %����ӬS�P ��C|"c��"�M�� ��v�� ��$�      0   �  x����n�8��ӧ���"��y��Q3^8��v��>�RR�:���E4�wD�����M��m{��zB���~����������$��g�O!^��^�_�� i&th�n���sH��ZEH�!�|��#!$�OS�4֤0՞�G�=�R4h�2�z��{���JhJ�=�np��)Y�X'l���~�k?�n~�r��dt�ܞ3�s(J�*��J�qh��~|R*	har� ��a:���w����r��X��H�4�S�>5��m����_���_S߱_kZ
��,F�Əp�_����s�ki.D֒����aK,ƹ_�T�����x�_մ4g�B�RE��Z����rq��H&��"#�2��歞"���������u�����.C��Q���ۢ�9��\��d8��ǴUE���e�s��c�M˚�eZ�9�k{���Q*�"g��y�g�Q湅P��C��#eX��f��<=��i�.��d�Ȝo�"�2s�������Γ��Xe�ȡHn�%<op��9�� 7�����:�AL�.4=ҵA�4�y�)�|��v66�'S��-��� �E�%t��k�bҐ[]��s^��v.w�B��z �56W`ޛPh{O;�-0��#�6a���i�:�Aazo�:��7�V�<4�x�}��Ջ|�PF$�P���xkC�����8��:��]C�9T\��� E�^���b*ީ�My;W!TD�3Z���HI�6`�}�'��I����)7��Ɨ����vW�b*�1���������!��Sp�)~#��|kC2M/Y<�{O)nM�՛	5
y�泋��zɔ6@�e��=mD���{����)�����x�1y+կd�W9Py���5�߻�1��9��&��P�yh��w{�Rk��4�My�S{˵ͳT���?ަ��F8�^�>Sńhn�%��v�Ҁ�M*�*�C{C��c��5��T~��5\ܓ�%y�p�#�W����ZD�      e   u  x����n�0�s���ٟ����*F�؀�^�4�!i�����)z��H#�4��_�86�8|���0�r�l��Wc��P�Y"��H�T�,~U�r���(���j/h
{y���ow�L�}JNK��<9�Q����V��ǥ'�eJ[��j���,�_�u�]D���]ѩ�s��#KO(�������m�����P�����s8�)��zl2K�%����aq�Ҙ*��;K�:T���1����P8�"�-~�~� �A����n��� �X�Z�pә���������[Ĭ��>�Ǐ�ӎ�5����dkY�eO;~Wݬ5�5�z��tW]<.�	�I>��m��Ad������v��O����j��8�     