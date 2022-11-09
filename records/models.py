# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Address(models.Model):
    street = models.CharField(max_length=50)
    city = models.CharField(max_length=50)
    country = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'address'


class Admits(models.Model):
    visit = models.OneToOneField('Visit', models.DO_NOTHING, primary_key=True)
    ward_number = models.ForeignKey('Ward', models.DO_NOTHING, db_column='ward_number')
    admit_date = models.DateField()
    admit_time = models.TimeField()
    discharge_date = models.DateField(blank=True, null=True)
    discharge_time = models.TimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'admits'
        unique_together = (('visit', 'ward_number'),)


class Appointment(models.Model):
    appointment_date = models.DateField()
    appointment_time = models.TimeField()
    doctor = models.ForeignKey('Doctor', models.DO_NOTHING)
    visit_type = models.ForeignKey('VisitType', models.DO_NOTHING, db_column='visit_type')
    status = models.CharField(max_length=50)
    notes = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'appointment'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Department(models.Model):
    name = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'department'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Doctor(models.Model):
    first_name = models.CharField(max_length=50)
    middle_name = models.CharField(max_length=50, blank=True, null=True)
    last_name = models.CharField(max_length=50)
    phone_number = models.DecimalField(max_digits=10, decimal_places=0)
    date_of_birth = models.DateField()
    gender = models.CharField(max_length=20)
    license_no = models.CharField(max_length=20)
    address = models.ForeignKey(Address, models.DO_NOTHING)
    department = models.ForeignKey(Department, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'doctor'


class ExpertIn(models.Model):
    doctor = models.OneToOneField(Doctor, models.DO_NOTHING, primary_key=True)
    expertise = models.ForeignKey('Expertise', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'expert_in'
        unique_together = (('doctor', 'expertise'),)


class Expertise(models.Model):
    area_of_expertise = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'expertise'


class LaboratoryTest(models.Model):
    name = models.CharField(max_length=50)
    description = models.TextField()
    address = models.ForeignKey(Address, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'laboratory_test'


class Medication(models.Model):
    name = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'medication'


class Patient(models.Model):
    first_name = models.CharField(max_length=50)
    middle_name = models.CharField(max_length=50, blank=True, null=True)
    last_name = models.CharField(max_length=50)
    phone_number = models.DecimalField(max_digits=10, decimal_places=0)
    date_of_birth = models.DateField()
    gender = models.CharField(max_length=20)
    address = models.ForeignKey(Address, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'patient'


class PerformsLabTest(models.Model):
    visit = models.OneToOneField('Visit', models.DO_NOTHING, primary_key=True)
    laboratory_test = models.ForeignKey(LaboratoryTest, models.DO_NOTHING)
    perform_by_date = models.DateField()
    test_results = models.CharField(max_length=50, blank=True, null=True)
    performed_on = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'performs_lab_test'
        unique_together = (('visit', 'laboratory_test'),)


class Prescribes(models.Model):
    visit = models.OneToOneField('Visit', models.DO_NOTHING, primary_key=True)
    medication = models.ForeignKey(Medication, models.DO_NOTHING)
    daily_dose = models.CharField(max_length=50)
    number_of_days = models.DecimalField(max_digits=4, decimal_places=0, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'prescribes'
        unique_together = (('visit', 'medication'),)


class TimeSlot(models.Model):
    time_slot_date = models.DateField()
    start_time = models.TimeField()
    end_time = models.TimeField()

    class Meta:
        managed = False
        db_table = 'time_slot'


class Visit(models.Model):
    diagnosis = models.CharField(max_length=255)
    status = models.CharField(max_length=50)
    visit_type = models.ForeignKey('VisitType', models.DO_NOTHING)
    visit_date = models.DateField()
    visit_time = models.TimeField()
    notes = models.TextField(blank=True, null=True)
    patient = models.ForeignKey(Patient, models.DO_NOTHING)
    doctor = models.ForeignKey(Doctor, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'visit'


class VisitType(models.Model):
    name = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'visit_type'


class Ward(models.Model):
    ward_number = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)
    number_of_beds = models.DecimalField(max_digits=5, decimal_places=0, blank=True, null=True)
    department = models.ForeignKey(Department, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'ward'


class WorksOn(models.Model):
    doctor = models.OneToOneField(Doctor, models.DO_NOTHING, primary_key=True)
    time_slot = models.ForeignKey(TimeSlot, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'works_on'
        unique_together = (('doctor', 'time_slot'),)
