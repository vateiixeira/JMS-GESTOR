# Generated by Django 2.2.7 on 2020-07-07 16:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('metas', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='cidademodelo',
            old_name='abr',
            new_name='aplicado_abr',
        ),
        migrations.RenameField(
            model_name='cidademodelo',
            old_name='ago',
            new_name='aplicado_ago',
        ),
        migrations.RenameField(
            model_name='cidademodelo',
            old_name='ano',
            new_name='aplicado_ano',
        ),
        migrations.RenameField(
            model_name='cidademodelo',
            old_name='dez',
            new_name='aplicado_dez',
        ),
        migrations.RenameField(
            model_name='cidademodelo',
            old_name='fev',
            new_name='aplicado_fev',
        ),
        migrations.RenameField(
            model_name='cidademodelo',
            old_name='jan',
            new_name='aplicado_jan',
        ),
        migrations.RenameField(
            model_name='cidademodelo',
            old_name='jul',
            new_name='aplicado_jul',
        ),
        migrations.RenameField(
            model_name='cidademodelo',
            old_name='jun',
            new_name='aplicado_jun',
        ),
        migrations.RenameField(
            model_name='cidademodelo',
            old_name='mai',
            new_name='aplicado_mai',
        ),
        migrations.RenameField(
            model_name='cidademodelo',
            old_name='mar',
            new_name='aplicado_mar',
        ),
        migrations.RenameField(
            model_name='cidademodelo',
            old_name='nov',
            new_name='aplicado_nov',
        ),
        migrations.RenameField(
            model_name='cidademodelo',
            old_name='out',
            new_name='aplicado_out',
        ),
        migrations.RenameField(
            model_name='cidademodelo',
            old_name='sete',
            new_name='aplicado_sete',
        ),
        migrations.RenameField(
            model_name='vendedormodelo',
            old_name='abr',
            new_name='aplicado_abr',
        ),
        migrations.RenameField(
            model_name='vendedormodelo',
            old_name='ago',
            new_name='aplicado_ago',
        ),
        migrations.RenameField(
            model_name='vendedormodelo',
            old_name='dez',
            new_name='aplicado_ano',
        ),
        migrations.RenameField(
            model_name='vendedormodelo',
            old_name='fev',
            new_name='aplicado_dez',
        ),
        migrations.RenameField(
            model_name='vendedormodelo',
            old_name='jan',
            new_name='aplicado_fev',
        ),
        migrations.RenameField(
            model_name='vendedormodelo',
            old_name='jul',
            new_name='aplicado_jan',
        ),
        migrations.RenameField(
            model_name='vendedormodelo',
            old_name='jun',
            new_name='aplicado_jul',
        ),
        migrations.RenameField(
            model_name='vendedormodelo',
            old_name='mai',
            new_name='aplicado_jun',
        ),
        migrations.RenameField(
            model_name='vendedormodelo',
            old_name='mar',
            new_name='aplicado_mai',
        ),
        migrations.RenameField(
            model_name='vendedormodelo',
            old_name='nov',
            new_name='aplicado_mar',
        ),
        migrations.RenameField(
            model_name='vendedormodelo',
            old_name='out',
            new_name='aplicado_nov',
        ),
        migrations.RenameField(
            model_name='vendedormodelo',
            old_name='sete',
            new_name='aplicado_out',
        ),
        migrations.AddField(
            model_name='cidademodelo',
            name='previsto_abr',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='cidademodelo',
            name='previsto_ago',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='cidademodelo',
            name='previsto_dez',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='cidademodelo',
            name='previsto_fev',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='cidademodelo',
            name='previsto_jan',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='cidademodelo',
            name='previsto_jul',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='cidademodelo',
            name='previsto_jun',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='cidademodelo',
            name='previsto_mai',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='cidademodelo',
            name='previsto_mar',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='cidademodelo',
            name='previsto_nov',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='cidademodelo',
            name='previsto_out',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='cidademodelo',
            name='previsto_sete',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='vendedormodelo',
            name='aplicado_sete',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='vendedormodelo',
            name='previsto_abr',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='vendedormodelo',
            name='previsto_ago',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='vendedormodelo',
            name='previsto_dez',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='vendedormodelo',
            name='previsto_fev',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='vendedormodelo',
            name='previsto_jan',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='vendedormodelo',
            name='previsto_jul',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='vendedormodelo',
            name='previsto_jun',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='vendedormodelo',
            name='previsto_mai',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='vendedormodelo',
            name='previsto_mar',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='vendedormodelo',
            name='previsto_nov',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='vendedormodelo',
            name='previsto_out',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='vendedormodelo',
            name='previsto_sete',
            field=models.IntegerField(null=True),
        ),
    ]