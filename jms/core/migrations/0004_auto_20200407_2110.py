# Generated by Django 2.2.7 on 2020-04-08 00:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_auto_20200407_2104'),
    ]

    operations = [
        migrations.AlterField(
            model_name='moto',
            name='Custo_Medio',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=7),
        ),
        migrations.AlterField(
            model_name='moto',
            name='Margem',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=7),
        ),
        migrations.AlterField(
            model_name='moto',
            name='Margem_Porcentagem',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=7),
        ),
        migrations.AlterField(
            model_name='moto',
            name='Valor_Tabela',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=7),
        ),
        migrations.AlterField(
            model_name='moto',
            name='Valor_da_Nota',
            field=models.DecimalField(decimal_places=2, default=0, max_digits=7),
        ),
    ]
