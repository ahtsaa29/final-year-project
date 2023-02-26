# Generated by Django 4.1.5 on 2023-02-26 10:38

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ("userdetails", "0004_alter_application_user"),
    ]

    operations = [
        migrations.RenameField(
            model_name="application",
            old_name="user",
            new_name="applicaant",
        ),
        migrations.AddField(
            model_name="payroll",
            name="payee",
            field=models.ForeignKey(
                default=1,
                on_delete=django.db.models.deletion.CASCADE,
                to=settings.AUTH_USER_MODEL,
            ),
            preserve_default=False,
        ),
    ]
