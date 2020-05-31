# Generated by Django 2.2.7 on 2020-04-12 06:53

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0004_auto_20200410_0146'),
        ('core', '0013_equipe'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='cidade',
            options={'verbose_name': 'Cidade', 'verbose_name_plural': 'Cidades'},
        ),
        migrations.AlterModelOptions(
            name='equipe',
            options={'verbose_name': 'Equipe', 'verbose_name_plural': 'Equipes'},
        ),
        migrations.AddField(
            model_name='equipe',
            name='perfil',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='account.Perfil'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='equipe',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='usuario', to=settings.AUTH_USER_MODEL),
        ),
    ]