# Generated by Django 3.2.4 on 2021-12-22 14:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('EmployeeApp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Users',
            fields=[
                ('UserId', models.AutoField(primary_key=True, serialize=False)),
                ('UserName', models.CharField(max_length=500)),
                ('Password', models.CharField(max_length=500)),
            ],
        ),
    ]
