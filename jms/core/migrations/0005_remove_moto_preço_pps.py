# Generated by Django 2.2.7 on 2020-04-08 00:21

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0004_auto_20200407_2110'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='moto',
            name='Preço_PPS',
        ),
    ]
