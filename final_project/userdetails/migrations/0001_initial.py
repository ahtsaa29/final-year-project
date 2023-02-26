# Generated by Django 4.1.5 on 2023-02-26 09:49

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="ApplicationType",
            fields=[
                ("issue_id", models.AutoField(primary_key=True, serialize=False)),
                ("name", models.CharField(max_length=25)),
            ],
        ),
        migrations.CreateModel(
            name="Company",
            fields=[
                ("company_id", models.AutoField(primary_key=True, serialize=False)),
                ("name", models.CharField(max_length=50)),
                ("phone", models.BigIntegerField()),
                ("email", models.EmailField(max_length=254)),
                ("address", models.CharField(max_length=100)),
                ("logo", models.ImageField(null=True, upload_to="uploads/logo")),
                ("pan_no", models.BigIntegerField()),
                (
                    "added_date",
                    models.DateTimeField(default=datetime.datetime.now, editable=False),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Designation",
            fields=[
                ("designation_id", models.AutoField(primary_key=True, serialize=False)),
                ("name", models.CharField(max_length=25, unique=True)),
                (
                    "salary",
                    models.DecimalField(decimal_places=2, default=0, max_digits=8),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Payroll",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                (
                    "salary",
                    models.DecimalField(decimal_places=2, default=0, max_digits=8),
                ),
                ("gross_salary", models.DecimalField(decimal_places=2, max_digits=8)),
                ("tax_percent", models.DecimalField(decimal_places=2, max_digits=8)),
                ("tax_amount", models.DecimalField(decimal_places=2, max_digits=8)),
                ("overtime", models.DecimalField(decimal_places=2, max_digits=8)),
                ("allowance", models.DecimalField(decimal_places=2, max_digits=8)),
                (
                    "bonus",
                    models.DecimalField(decimal_places=2, default=0, max_digits=8),
                ),
                ("medical_claim", models.DecimalField(decimal_places=2, max_digits=8)),
                ("net_salary", models.FloatField()),
                (
                    "updated_at",
                    models.DateTimeField(default=datetime.datetime.now, editable=False),
                ),
                (
                    "designation",
                    models.ForeignKey(
                        default=None,
                        on_delete=django.db.models.deletion.CASCADE,
                        to="userdetails.designation",
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Application",
            fields=[
                ("application_id", models.AutoField(primary_key=True, serialize=False)),
                ("title", models.CharField(max_length=25)),
                ("reason", models.TextField()),
                (
                    "date",
                    models.DateTimeField(default=datetime.datetime.now, editable=False),
                ),
                ("for_days", models.IntegerField()),
                (
                    "apply_for",
                    models.ForeignKey(
                        default=None,
                        on_delete=django.db.models.deletion.CASCADE,
                        to="userdetails.applicationtype",
                    ),
                ),
            ],
        ),
    ]
