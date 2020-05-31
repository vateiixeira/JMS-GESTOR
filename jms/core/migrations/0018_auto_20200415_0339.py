# Generated by Django 2.2.7 on 2020-04-15 06:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0017_metacotacidade_metamotocidade'),
    ]

    operations = [
        migrations.CreateModel(
            name='DocumentCota',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('document', models.FileField(upload_to='documents/cota/%Y/%m/%d/')),
                ('uploaded_at', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='DocumentMoto',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('document', models.FileField(upload_to='documents/moto/%Y/%m/%d/')),
                ('uploaded_at', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.AlterModelOptions(
            name='motoperfil',
            options={'verbose_name': 'Perfil Moto', 'verbose_name_plural': 'Perfis Motos'},
        ),
    ]