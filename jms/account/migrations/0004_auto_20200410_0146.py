# Generated by Django 2.2.7 on 2020-04-10 04:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0003_auto_20200410_0049'),
    ]

    operations = [
        migrations.AlterField(
            model_name='planejadouser',
            name='planejado_cota',
            field=models.IntegerField(verbose_name='Planjeado cota'),
        ),
    ]
