from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(Address)
admin.site.register(Department)
admin.site.register(Expertise)
admin.site.register(VisitType)
admin.site.register(Ward)
admin.site.register(TimeSlot)
admin.site.register(Doctor)
admin.site.register(Patient)
admin.site.register(LaboratoryTest)
admin.site.register(Medication)
admin.site.register(ExpertIn)
admin.site.register(WorksOn)
admin.site.register(Visit)
admin.site.register(PerformsLabTest)
admin.site.register(Prescribes)
admin.site.register(Admits)
admin.site.register(Appointment)

