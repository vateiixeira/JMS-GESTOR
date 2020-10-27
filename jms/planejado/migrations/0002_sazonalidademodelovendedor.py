# Generated by Django 2.2.7 on 2020-06-23 05:22

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0029_sazonalidademodelo_regiao'),
        ('planejado', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='SazonalidadeModeloVendedor',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('vendedor_nome', models.CharField(max_length=250, verbose_name='Nome')),
                ('vendedor_cpf', models.CharField(max_length=100, verbose_name='CPF')),
                ('mes', models.IntegerField(verbose_name='Mês')),
                ('percentual', models.FloatField(verbose_name='Porcentual')),
                ('vl_total_anual', models.IntegerField(verbose_name='Valor total no ano')),
                ('ano_base', models.IntegerField(verbose_name='Ano Base')),
                ('modelo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.MotoPerfil')),
            ],
        ),
    ]