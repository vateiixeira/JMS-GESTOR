# Generated by Django 2.2.7 on 2020-04-08 00:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0005_remove_moto_preço_pps'),
    ]

    operations = [
        migrations.AlterField(
            model_name='moto',
            name='CPF_CNPJ_Cliente',
            field=models.CharField(max_length=100),
        ),
    ]
