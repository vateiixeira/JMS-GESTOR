# Generated by Django 2.2.7 on 2020-04-08 16:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0006_auto_20200407_2125'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cota',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Cpf_Vendedor', models.CharField(max_length=100)),
                ('Nome_Vendedor', models.CharField(max_length=100)),
                ('Data_da_Venda', models.DateField()),
                ('Prazo', models.IntegerField()),
                ('Tipo_contrato', models.CharField(max_length=100)),
                ('Modelo', models.CharField(max_length=100)),
                ('Status', models.CharField(max_length=100)),
                ('Cliente', models.CharField(max_length=100)),
                ('Municipio', models.CharField(max_length=100)),
                ('Telefone', models.CharField(max_length=100, null=True)),
                ('Celular', models.CharField(max_length=100, null=True)),
                ('Ponto_de_Venda', models.CharField(max_length=100, null=True)),
                ('Parcela', models.DecimalField(decimal_places=2, default=0, max_digits=7)),
                ('Data_de_Vencimento', models.DateField()),
                ('Grupo', models.IntegerField()),
                ('Cota', models.IntegerField()),
                ('R', models.IntegerField()),
                ('D', models.IntegerField()),
                ('Credito', models.IntegerField()),
                ('Data_da_Contemplacao', models.DateField()),
                ('Tipo_de_Contemplacao', models.CharField(max_length=100, null=True)),
                ('Efetuou_Negociacao', models.CharField(max_length=100, null=True)),
                ('Proposta', models.IntegerField()),
                ('Digito_da_Proposta', models.IntegerField()),
                ('Vl_total_amortizado', models.DecimalField(decimal_places=2, default=0, max_digits=7)),
                ('Vl_Quitacao', models.DecimalField(decimal_places=2, default=0, max_digits=7)),
                ('Plano', models.CharField(max_length=100, null=True)),
                ('Porcentagem_Amortizado', models.DecimalField(decimal_places=6, default=0, max_digits=8)),
                ('Porcentagem_Mensal', models.DecimalField(decimal_places=6, default=0, max_digits=8)),
                ('Qtd_Parcelas', models.IntegerField()),
                ('Seguro_de_Vida', models.CharField(max_length=100, null=True)),
            ],
        ),
        migrations.RenameField(
            model_name='moto',
            old_name='CPF_CNPJ_Cliente',
            new_name='Cpf_Cnpj_Cliente',
        ),
    ]
