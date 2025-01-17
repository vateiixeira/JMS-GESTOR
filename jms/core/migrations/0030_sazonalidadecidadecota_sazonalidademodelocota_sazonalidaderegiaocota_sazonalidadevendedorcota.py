# Generated by Django 2.2.7 on 2020-07-26 12:16

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0029_sazonalidademodelo_regiao'),
    ]

    operations = [
        migrations.CreateModel(
            name='SazonalidadeRegiaoCota',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('regiao', models.CharField(choices=[('JNB', 'JNB'), ('SFC', 'SFC'), ('JNR', 'JNR'), ('OUTROS', 'OUTROS')], max_length=100, verbose_name='Região')),
                ('mes', models.IntegerField(verbose_name='Mês')),
                ('percentual', models.FloatField(verbose_name='Porcentual')),
                ('vl_total_anual', models.IntegerField(verbose_name='Valor total no ano')),
                ('ano_base', models.IntegerField(verbose_name='Ano Base')),
            ],
        ),
        migrations.CreateModel(
            name='SazonalidadeVendedorCota',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('vendedor_nome', models.CharField(max_length=250, verbose_name='Nome')),
                ('vendedor_cpf', models.CharField(max_length=100, verbose_name='CPF')),
                ('mes', models.IntegerField(verbose_name='Mês')),
                ('percentual', models.FloatField(verbose_name='Porcentual')),
                ('vl_total_anual', models.IntegerField(verbose_name='Valor total no ano')),
                ('ano_base', models.IntegerField(verbose_name='Ano Base')),
            ],
        ),
        migrations.CreateModel(
            name='SazonalidadeModeloCota',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('regiao', models.CharField(choices=[('JNB', 'JNB'), ('SFC', 'SFC'), ('JNR', 'JNR'), ('OUTROS', 'OUTROS')], max_length=100, verbose_name='Região')),
                ('mes', models.IntegerField(verbose_name='Mês')),
                ('percentual', models.FloatField(verbose_name='Porcentual')),
                ('vl_total_anual', models.IntegerField(verbose_name='Valor total no ano')),
                ('ano_base', models.IntegerField(verbose_name='Ano Base')),
                ('modelo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.MotoPerfil')),
            ],
        ),
        migrations.CreateModel(
            name='SazonalidadeCidadeCota',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('mes', models.IntegerField(verbose_name='Mês')),
                ('percentual', models.FloatField(verbose_name='Porcentual')),
                ('vl_total_anual', models.IntegerField(verbose_name='Valor total no ano')),
                ('ano_base', models.IntegerField(verbose_name='Ano Base')),
                ('cidade', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.Cidade')),
            ],
        ),
    ]
