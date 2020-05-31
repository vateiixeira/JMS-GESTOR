# Generated by Django 2.2.7 on 2020-04-14 22:54

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0016_auto_20200412_0434'),
    ]

    operations = [
        migrations.CreateModel(
            name='MetaMotoCidade',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ano', models.IntegerField(verbose_name='Ano')),
                ('mes', models.IntegerField(verbose_name='Mes')),
                ('meta', models.IntegerField(verbose_name='Meta moto')),
                ('cidade', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.Cidade')),
                ('modelo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.MotoPerfil')),
            ],
            options={
                'verbose_name': 'Meta Moto Cidade',
                'verbose_name_plural': 'Meta Moto Cidades',
            },
        ),
        migrations.CreateModel(
            name='MetaCotaCidade',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ano', models.IntegerField(verbose_name='Ano')),
                ('mes', models.IntegerField(verbose_name='Mes')),
                ('meta', models.IntegerField(verbose_name='Meta cota')),
                ('cidade', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.Cidade')),
                ('modelo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='core.MotoPerfil')),
            ],
            options={
                'verbose_name': 'Meta Cota Cidade',
                'verbose_name_plural': 'Meta Cota Cidades',
            },
        ),
    ]