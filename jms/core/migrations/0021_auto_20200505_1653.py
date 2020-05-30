# Generated by Django 2.2.7 on 2020-05-05 19:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0020_auto_20200505_1650'),
    ]

    operations = [
        migrations.CreateModel(
            name='TotalMensalMoto2019',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cidade', models.CharField(max_length=20, verbose_name='Cidade')),
                ('mes', models.IntegerField(verbose_name='Mês')),
                ('qtd', models.IntegerField(verbose_name='Quantidade')),
            ],
        ),
        migrations.DeleteModel(
            name='TotalMesalMoto2019',
        ),
    ]
