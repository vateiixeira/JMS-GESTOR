# Generated by Django 2.2.7 on 2020-04-10 04:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0011_auto_20200410_0049'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cidade',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome', models.CharField(max_length=100, verbose_name='Cidade')),
                ('regiao', models.CharField(choices=[('JNB', 'JNB'), ('SFC', 'SFC'), ('JNR', 'JNR')], max_length=100, verbose_name='Regiao')),
            ],
        ),
    ]
